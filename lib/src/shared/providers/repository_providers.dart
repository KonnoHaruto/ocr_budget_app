import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../features/budget/data/budget_repository.dart';
import '../../features/budget/data/transaction_repository.dart';
import '../../features/budget/data/category_repository.dart';
import '../../features/budget/data/spending_analysis_repository.dart';
import '../../features/budget/data/repositories/budget_repository_impl.dart';
import '../../features/budget/data/repositories/transaction_repository_impl.dart';
import '../../features/budget/data/repositories/category_repository_impl.dart';
import '../../features/budget/data/repositories/spending_analysis_repository_impl.dart';
import '../../features/budget/data/datasources/local/budget_local_data_source.dart';
import '../../features/budget/data/datasources/local/transaction_local_data_source.dart';
import '../../features/budget/data/datasources/local/category_local_data_source.dart';
import '../../features/budget/data/datasources/local/spending_analysis_local_data_source.dart';
import '../../features/budget/data/datasources/remote/budget_remote_data_source.dart';
import '../../features/budget/data/datasources/remote/transaction_remote_data_source.dart';
import '../../features/budget/data/datasources/remote/category_remote_data_source.dart';
import '../../features/budget/data/datasources/remote/spending_analysis_remote_data_source.dart';

// Firebase providers
final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// Local data source providers
final budgetLocalDataSourceProvider = Provider<BudgetLocalDataSource>((ref) {
  return BudgetLocalDataSource();
});

final transactionLocalDataSourceProvider = Provider<TransactionLocalDataSource>((ref) {
  return TransactionLocalDataSource();
});

final categoryLocalDataSourceProvider = Provider<CategoryLocalDataSource>((ref) {
  return CategoryLocalDataSource();
});

final spendingAnalysisLocalDataSourceProvider = Provider<SpendingAnalysisLocalDataSource>((ref) {
  return SpendingAnalysisLocalDataSource();
});

// Remote data source providers
final budgetRemoteDataSourceProvider = Provider<BudgetRemoteDataSource>((ref) {
  return BudgetRemoteDataSource(
    ref.watch(firebaseFirestoreProvider),
    ref.watch(firebaseAuthProvider),
  );
});

final transactionRemoteDataSourceProvider = Provider<TransactionRemoteDataSource>((ref) {
  return TransactionRemoteDataSource(
    ref.watch(firebaseFirestoreProvider),
    ref.watch(firebaseAuthProvider),
  );
});

final categoryRemoteDataSourceProvider = Provider<CategoryRemoteDataSource>((ref) {
  return CategoryRemoteDataSource(
    ref.watch(firebaseFirestoreProvider),
    ref.watch(firebaseAuthProvider),
  );
});

final spendingAnalysisRemoteDataSourceProvider = Provider<SpendingAnalysisRemoteDataSource>((ref) {
  return SpendingAnalysisRemoteDataSource(
    ref.watch(firebaseFirestoreProvider),
    ref.watch(firebaseAuthProvider),
  );
});

// Repository providers
final budgetRepositoryProvider = Provider<BudgetRepository>((ref) {
  return BudgetRepositoryImpl(
    ref.watch(budgetLocalDataSourceProvider),
    ref.watch(budgetRemoteDataSourceProvider),
  );
});

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepositoryImpl(
    ref.watch(transactionLocalDataSourceProvider),
    ref.watch(transactionRemoteDataSourceProvider),
  );
});

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepositoryImpl(
    ref.watch(categoryLocalDataSourceProvider),
    ref.watch(categoryRemoteDataSourceProvider),
  );
});

final spendingAnalysisRepositoryProvider = Provider<SpendingAnalysisRepository>((ref) {
  return SpendingAnalysisRepositoryImpl(
    ref.watch(spendingAnalysisLocalDataSourceProvider),
    ref.watch(spendingAnalysisRemoteDataSourceProvider),
  );
});