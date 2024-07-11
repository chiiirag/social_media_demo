part of 'auth_cubit.dart';

@immutable
class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class AuthenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthLoginTab extends AuthenticationState {
  final int tabIndex;

  const AuthLoginTab({required this.tabIndex});

  @override
  List<Object?> get props => [tabIndex];
}

class AuthRegisterTab extends AuthenticationState {
  final int tabIndex;

  const AuthRegisterTab({required this.tabIndex});

  @override
  List<Object?> get props => [tabIndex];
}

class NavigateToHome extends AuthenticationState {}

class LoadingState extends AuthenticationState {}
