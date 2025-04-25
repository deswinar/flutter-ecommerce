// lib/features/home/presentation/cubit/home_state.dart

part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ProductUiModel> products;
  final List<CategoryUiModel> categories;

  HomeLoaded({
    required this.products,
    required this.categories,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
