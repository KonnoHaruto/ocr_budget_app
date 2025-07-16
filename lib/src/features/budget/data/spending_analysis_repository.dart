import '../domain/spending_analysis.dart';
import '../domain/analysis_type.dart';

abstract class SpendingAnalysisRepository {
  /// Get spending analysis by type and date range
  Future<SpendingAnalysis?> getAnalysis(
    AnalysisType type,
    DateTime startDate,
    DateTime endDate,
  );
  
  /// Save spending analysis
  Future<void> saveAnalysis(SpendingAnalysis analysis);
  
  /// Get recent analyses
  Future<List<SpendingAnalysis>> getRecentAnalyses({int limit = 10});
  
  /// Delete old analyses (cleanup)
  Future<void> deleteOldAnalyses(DateTime cutoffDate);
  
  /// Stream of analyses
  Stream<List<SpendingAnalysis>> watchAnalyses();
}