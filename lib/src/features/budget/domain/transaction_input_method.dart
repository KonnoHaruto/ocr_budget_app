enum TransactionInputMethod {
  ocr,
  manual;

  String get displayName {
    switch (this) {
      case TransactionInputMethod.ocr:
        return 'OCR';
      case TransactionInputMethod.manual:
        return 'Manual';
    }
  }
}