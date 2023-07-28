import 'package:bloc/bloc.dart';
import 'package:dvh_flutter_application/common/exception.dart';
import 'package:dvh_flutter_application/data/Content.dart';
import 'package:dvh_flutter_application/data/repo/content_repository.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IContentRepository contetntRepository;
  HomeBloc({required this.contetntRepository}) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStarted || event is HomeRefresh) {
        try {
          emit(HomeLoading());
          final latestVideos =
              await contetntRepository.getAll(ContentSort.latestVideos);
          final latestPodcasts =
              await contetntRepository.getAll(ContentSort.latestPodcasts);
          final latestSourcecode =
              await contetntRepository.getAll(ContentSort.latestSourcecode);

          emit(HomeSuccess(
              latestVideos: latestVideos,
              latestPodcasts: latestPodcasts,
              latestSourcecode: latestSourcecode));
        } catch (e) {
          emit(HomeError(exception: e is AppException ? e : AppException()));
        }
      }
    });
  }
}
