class ReceiptParser {
  static ReceiptData parseReceiptText(String ocrText) {
    final lines = ocrText.split('\n').map((line) => line.trim()).where((line) => line.isNotEmpty).toList();
    
    final totalAmount = _extractTotalAmount(lines);
    final items = _extractItems(lines);
    final storeName = _extractStoreName(lines);
    
    return ReceiptData(
      totalAmount: totalAmount,
      items: items,
      storeName: storeName,
      rawText: ocrText,
    );
  }
  
  static double? _extractTotalAmount(List<String> lines) {
    // 合計金額のキーワードパターン（優先度順）
    final totalKeywords = [
      r'合計.*?([0-9,]+)',
      r'計.*?([0-9,]+)',
      r'total.*?([0-9,]+)',
      r'小計.*?([0-9,]+)',
      r'お会計.*?([0-9,]+)',
      r'tax.*?([0-9,]+)',
      r'taxinc.*?([0-9,]+)',
      r'(\d{1,3}(?:,\d{3})+)(?=\s*円|\s*¥|\s*$)',
      r'¥\s*([0-9,]+)',
      r'([0-9,]+)\s*円',
    ];
    
    // 逆順で検索（レシートの下部から）
    for (int i = lines.length - 1; i >= 0; i--) {
      final line = lines[i].toLowerCase();
      
      for (final pattern in totalKeywords) {
        final regex = RegExp(pattern, caseSensitive: false);
        final match = regex.firstMatch(line);
        
        if (match != null) {
          final amountStr = match.group(1) ?? match.group(0);
          final amount = _parseAmount(amountStr);
          
          // 合理的な金額範囲をチェック（10円〜100万円）
          if (amount != null && amount >= 10 && amount <= 1000000) {
            return amount;
          }
        }
      }
    }
    
    // キーワードが見つからない場合、最大の数値を探す
    return _findLargestAmount(lines);
  }
  
  static double? _findLargestAmount(List<String> lines) {
    double? maxAmount;
    
    for (final line in lines) {
      final amounts = _extractAllAmounts(line);
      for (final amount in amounts) {
        if (amount >= 100 && amount <= 1000000) {
          if (maxAmount == null || amount > maxAmount) {
            maxAmount = amount;
          }
        }
      }
    }
    
    return maxAmount;
  }
  
  static List<double> _extractAllAmounts(String text) {
    final amounts = <double>[];
    final patterns = [
      r'([0-9,]+)(?:\s*円|\s*¥)',
      r'¥\s*([0-9,]+)',
      r'\b(\d{1,3}(?:,\d{3})+)\b',
      r'\b(\d{3,})\b',
    ];
    
    for (final pattern in patterns) {
      final regex = RegExp(pattern);
      final matches = regex.allMatches(text);
      
      for (final match in matches) {
        final amountStr = match.group(1);
        final amount = _parseAmount(amountStr);
        if (amount != null) {
          amounts.add(amount);
        }
      }
    }
    
    return amounts;
  }
  
  static double? _parseAmount(String? amountStr) {
    if (amountStr == null) return null;
    
    // カンマを除去して数値に変換
    final cleanStr = amountStr.replaceAll(',', '').replaceAll('¥', '').trim();
    return double.tryParse(cleanStr);
  }
  
  static List<String> _extractItems(List<String> lines) {
    final items = <String>[];
    
    for (final line in lines) {
      // アイテム行のパターン（商品名＋価格）
      if (_looksLikeItemLine(line)) {
        final itemName = _extractItemName(line);
        if (itemName.isNotEmpty && itemName.length >= 2) {
          items.add(itemName);
        }
      }
    }
    
    return items.take(10).toList(); // 最大10アイテム
  }
  
  static bool _looksLikeItemLine(String line) {
    // 金額を含む行で、かつアイテム名らしいパターン
    final hasAmount = RegExp(r'[0-9,]+').hasMatch(line);
    final hasItemPattern = RegExp(r'[ひらがなカタカナ漢字a-zA-Z]').hasMatch(line);
    
    // 除外パターン
    final excludePatterns = [
      r'合計|計|total|小計|税|tax|割引|discount|領収|receipt|ありがとう|thank',
      r'^\d+$', // 数字のみ
      r'^\d{4}/\d{2}/\d{2}', // 日付
      r'^\d{2}:\d{2}', // 時刻
    ];
    
    for (final pattern in excludePatterns) {
      if (RegExp(pattern, caseSensitive: false).hasMatch(line)) {
        return false;
      }
    }
    
    return hasAmount && hasItemPattern && line.length >= 3;
  }
  
  static String _extractItemName(String line) {
    // 金額部分を除去してアイテム名を抽出
    String itemName = line;
    
    // 末尾の金額パターンを除去
    itemName = itemName.replaceAll(RegExp(r'\s*[0-9,]+\s*円?\s*$'), '');
    itemName = itemName.replaceAll(RegExp(r'\s*¥\s*[0-9,]+\s*$'), '');
    itemName = itemName.replaceAll(RegExp(r'\s+[0-9,]+\s*$'), '');
    
    return itemName.trim();
  }
  
  static String? _extractStoreName(List<String> lines) {
    // 最初の数行から店名を推定
    for (int i = 0; i < lines.length && i < 5; i++) {
      final line = lines[i];
      
      // 店名らしいパターン
      if (line.length >= 2 && line.length <= 30) {
        // 数字や記号が少なく、文字が多い行
        final hasLetters = RegExp(r'[ひらがなカタカナ漢字a-zA-Z]').hasMatch(line);
        final hasMainlyNumbers = RegExp(r'^\d+[/-]\d+').hasMatch(line);
        
        if (hasLetters && !hasMainlyNumbers) {
          return line.trim();
        }
      }
    }
    
    return null;
  }
}

class ReceiptData {
  final double? totalAmount;
  final List<String> items;
  final String? storeName;
  final String rawText;
  
  const ReceiptData({
    this.totalAmount,
    this.items = const [],
    this.storeName,
    required this.rawText,
  });
}