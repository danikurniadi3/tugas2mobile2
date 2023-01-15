import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dchat/data/models/kontak_model.dart';
import 'package:dchat/domain/use_cases/fetch_kontak_use_case.dart';
import 'package:stream_transform/stream_transform.dart';

part 'kontak_event.dart';
part 'kontak_state.dart';

/// Duration of time that used for [debounce] process.
const _duration = Duration(milliseconds: 300);

/// [debounce] used to handle event changes with a certain duration.
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class KontakBloc extends Bloc<KontakEvent, KontakState> {
  KontakBloc({required this.fetchKontakUseCase})
      : super(ProductInitialState()) {
    on<KontakFetchEvent>(_fetch, transformer: debounce(_duration));
  }

  final FetchKontakUseCase fetchKontakUseCase;

  /// This method is used as a listener fetch event.
  ///
  /// Return [KontakFetchEvent] with [List<KontakModel>] data.
  /// Throw a [KontakErrorState] along with the error message, if there is an error while retrieving list Kontak data.
  void _fetch(KontakFetchEvent event, Emitter<KontakState> emit) async {
    emit(KontakLoadingState());
    try {
      final listKontak = await fetchKontakUseCase.call();
      emit(KontakFetchedState(listKontak: listKontak));
    } catch (error) {
      emit(KontakErrorState(message: error.toString()));
    }
  }
}
