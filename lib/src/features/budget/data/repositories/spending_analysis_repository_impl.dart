import '../spending_analysis_repository.dart';
import '../datasources/local/spending_analysis_local_data_source.dart';
import '../datasources/remote/spending_analysis_remote_data_source.dart';
import '../../domain/spending_analysis.dart';
import '../../domain/analysis_type.dart';

class SpendingAnalysisRepositoryImpl implements SpendingAnalysisRepository {
  final SpendingAnalysisLocalDataSource _localDataSource;
  final SpendingAnalysisRemoteDataSource _remoteDataSource;
  
  SpendingAnalysisRepositoryImpl(this._localDataSource, this._remoteDataSource);
  
  @override
  Future<SpendingAnalysis?> getAnalysis(
    AnalysisType type,
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      // Try local first for fast access
      final localAnalysis = await _localDataSource.getAnalysis(type, startDate, endDate);
      if (localAnalysis != null) {
        return localAnalysis;
      }
      
      // Fallback to remote
      final remoteAnalysis = await _remoteDataSource.getAnalysis(type, startDate, endDate);
      if (remoteAnalysis != null) {
        // Cache locally
        await _localDataSource.saveAnalysis(remoteAnalysis);
        return remoteAnalysis;
      }
      
      return null;
    } catch (e) {
      // If remote fails, return local data
      return await _localDataSource.getAnalysis(type, startDate, endDate);
    }
  }
  
  @override
  Future<void> saveAnalysis(SpendingAnalysis analysis) async {
    // Save locally first for immediate access
    await _localDataSource.saveAnalysis(analysis);
    
    try {
      // Sync to remote
      await _remoteDataSource.saveAnalysis(analysis);
    } catch (e) {
      // Log error but don't fail the operation
    }
  }
  
  @override
  Future<List<SpendingAnalysis>> getRecentAnalyses({int limit = 10}) async {
    try {
      // Try local first
      final localAnalyses = await _localDataSource.getRecentAnalyses(limit: limit);
      if (localAnalyses.isNotEmpty) {
        return localAnalyses;
      }
      
      // Fallback to remote
      final remoteAnalyses = await _remoteDataSource.getRecentAnalyses(limit: limit);
      
      // Cache locally
      for (final analysis in remoteAnalyses) {
        await _localDataSource.saveAnalysis(analysis);
      }
      
      return remoteAnalyses;
    } catch (e) {
      return await _localDataSource.getRecentAnalyses(limit: limit);
    }
  }
  
  @override
  Future<void> deleteOldAnalyses(DateTime cutoffDate) async {
    await _localDataSource.deleteOldAnalyses(cutoffDate);
    
    try {
      await _remoteDataSource.deleteOldAnalyses(cutoffDate);
    } catch (e) {
      // Log error but don't fail the operation
    }
  }
  
  @override
  Stream<List<SpendingAnalysis>> watchAnalyses() {
    // Return local stream for immediate updates
    return _localDataSource.watchAnalyses();
  }
}