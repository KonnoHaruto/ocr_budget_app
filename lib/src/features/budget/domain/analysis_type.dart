enum AnalysisType {
  monthly,
  weekly,
  categoryBreakdown,
  spendingTrend,
  budgetRecommendation;

  String get displayName {
    switch (this) {
      case AnalysisType.monthly:
        return 'Monthly Analysis';
      case AnalysisType.weekly:
        return 'Weekly Analysis';
      case AnalysisType.categoryBreakdown:
        return 'Category Breakdown';
      case AnalysisType.spendingTrend:
        return 'Spending Trend';
      case AnalysisType.budgetRecommendation:
        return 'Budget Recommendation';
    }
  }
}