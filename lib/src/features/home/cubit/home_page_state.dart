part of 'home_page_cubit.dart';

@immutable
class HomePageState {
  const HomePageState();

  List<Object?> get props => throw UnimplementedError();
}

class HomePageInitial extends HomePageState {}

class NavigateToAuth extends HomePageState {}

class IsLoadingState extends HomePageState {}

class UpdateIndex extends HomePageState {
  final int index;

  const UpdateIndex(this.index);

  @override
  List<Object?> get props => [index];
}
