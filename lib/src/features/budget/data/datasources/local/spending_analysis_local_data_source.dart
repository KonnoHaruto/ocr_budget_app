import 'package:hive_flutter/hive_flutter.dart';
import '../../../domain/spending_analysis.dart';
import '../../../domain/analysis_type.dart';

class SpendingAnalysisLocalDataSource {
  static const String _boxName = 'spending_analysis_box';
  
  late Box<Map<dynamic, dynamic>> _box;
  
  Future<void> init() async {
    _box = await Hive.openBox<Map<dynamic, dynamic>>(_boxName);
  }
  
  Future<SpendingAnalysis?> getAnalysis(
    AnalysisType type,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final key = _generateKey(type, startDate, endDate);
    final analysisMap = _box.get(key);
    if (analysisMap == null) return null;
    
    return SpendingAnalysis.fromJson(Map<String, dynamic>.from(analysisMap));
  }
  
  Future<void> saveAnalysis(SpendingAnalysis analysis) async {
    final key = _generateKey(analysis.type, analysis.startDate, analysis.endDate);
    await _box.put(key, analysis.toJson());
  }
  
  Future<List<SpendingAnalysis>> getRecentAnalyses({int limit = 10}) async {
    final analysisMaps = _box.values.toList();
    final analyses = analysisMaps
        .map((map) => SpendingAnalysis.fromJson(Map<String, dynamic>.from(map)))
        .toList();
    
    analyses.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return analyses.take(limit).toList();
  }
  
  Future<void> deleteOldAnalyses(DateTime cutoffDate) async {
    final analysisMaps = _box.values.toList();
    final analyses = analysisMaps
        .map((map) => SpendingAnalysis.fromJson(Map<String, dynamic>.from(map)))
        .toList();
    
    for (final analysis in analyses) {
      if (analysis.createdAt.isBefore(cutoffDate)) {
        final key = _generateKey(analysis.type, analysis.startDate, analysis.endDate);
        await _box.delete(key);
      }
    }
  }
  
  Stream<List<SpendingAnalysis>> watchAnalyses() {
    return _box.watch().map((event) {
      final analysisMaps = _box.values.toList();
      return analysisMaps
          .map((map) => SpendingAnalysis.fromJson(Map<String, dynamic>.from(map)))
          .toList();
    });
  }
  
  String _generateKey(AnalysisType type, DateTime startDate, DateTime endDate) {
    return '${type.name}_${startDate.millisecondsSinceEpoch}_${endDate.millisecondsSinceEpoch}';
  }
}