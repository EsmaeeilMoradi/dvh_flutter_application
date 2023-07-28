part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final AppException exception;
  const HomeError({required this.exception});

  @override
  List<Object> get props => [exception];
}

class HomeSuccess extends HomeState {
  final List<ContentEntity> latestVideos;
  final List<ContentEntity> latestPodcasts;
  final List<ContentEntity> latestSourcecode;

  const HomeSuccess(
      {required this.latestVideos,
      required this.latestPodcasts,
      required this.latestSourcecode});
}
