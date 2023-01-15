part of 'kontak_bloc.dart';

/// Abstract class to accommodate Kontak event conditions.
abstract class KontakEvent extends Equatable {
  const KontakEvent();

  @override
  List<Object> get props => [];
}

/// Event when [KontakEvent] detects a change in city name.
class KontakFetchEvent extends KontakEvent {
  const KontakFetchEvent();

  @override
  List<Object> get props => [];
}
