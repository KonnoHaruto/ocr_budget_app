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

// Local data source providers with async initialization
final budgetLocalDataSourceProvider = FutureProvider<BudgetLocalDataSource>((ref) async {
  final dataSource = BudgetLocalDataSource();
  await dataSource.init();
  return dataSource;
});

final transactionLocalDataSourceProvider = FutureProvider<TransactionLocalDataSource>((ref) async {
  final dataSource = TransactionLocalDataSource();
  await dataSource.init();
  return dataSource;
});

final categoryLocalDataSourceProvider = FutureProvider<CategoryLocalDataSource>((ref) async {
  final dataSource = CategoryLocalDataSource();
  await dataSource.init();
  return dataSource;
});

final spendingAnalysisLocalDataSourceProvider = FutureProvider<SpendingAnalysisLocalDataSource>((ref) async {
  final dataSource = SpendingAnalysisLocalDataSource();
  await dataSource.init();
  return dataSource;
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

// Repository providers with async initialization
final budgetRepositoryProvider = FutureProvider<BudgetRepository>((ref) async {
  return BudgetRepositoryImpl(
    await ref.watch(budgetLocalDataSourceProvider.future),
    ref.watch(budgetRemoteDataSourceProvider),
  );
});

final transactionRepositoryProvider = FutureProvider<TransactionRepository>((ref) async {
  return TransactionRepositoryImpl(
    await ref.watch(transactionLocalDataSourceProvider.future),
    ref.watch(transactionRemoteDataSourceProvider),
  );
});

final categoryRepositoryProvider = FutureProvider<CategoryRepository>((ref) async {
  return CategoryRepositoryImpl(
    await ref.watch(categoryLocalDataSourceProvider.future),
    ref.watch(categoryRemoteDataSourceProvider),
  );
});

final spendingAnalysisRepositoryProvider = FutureProvider<SpendingAnalysisRepository>((ref) async {
  return SpendingAnalysisRepositoryImpl(
    await ref.watch(spendingAnalysisLocalDataSourceProvider.future),
    ref.watch(spendingAnalysisRemoteDataSourceProvider),
  );
});