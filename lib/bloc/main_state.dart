part of 'main_bloc.dart';

sealed class MainState {}

final class MainInitial extends MainState {}

final class DataLoading extends MainState {}

final class SuccessLoaded extends MainState {
  final List<Model> data;

  SuccessLoaded(this.data);
}

final class ErrorState extends MainState {
  final String message;

  ErrorState(this.message);
}