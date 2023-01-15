part of 'kontak_bloc.dart';

abstract class KontakState extends Equatable {
  const KontakState();

  @override
  List<Object?> get props => [];
}

/// The state where [KontakState] has fetched [List<ProductModel>].
class KontakFetchedState extends KontakState {
  const KontakFetchedState({required this.listKontak});

  final List<KontakModel> listKontak;

  @override
  List<Object?> get props => [listKontak];
}

/// The state where [KontakState] is initializing the state.
class ProductInitialState extends KontakState {}

/// The state where [KontakState] is loading data.
class KontakLoadingState extends KontakState {}

/// The state where [KontakState] has loaded [KontakModel].
class KontakLoadedState extends KontakState {
  const KontakLoadedState({this.kontak});

  final KontakModel? kontak;

  @override
  List<Object> get props => [kontak!];
}

/// The state where [KontakState] has an error including and error message.
class KontakErrorState extends KontakState {
  const KontakErrorState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
