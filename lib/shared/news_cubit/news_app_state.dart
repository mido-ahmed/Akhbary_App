part of 'news_app_cubit.dart';

@immutable
abstract class NewsAppState {}

class NewsAppInitial extends NewsAppState {}

class NewsAppBottomNav extends NewsAppState {}

class NewsAppThemeModeChangedSuccessfully extends NewsAppState {}

class NewsAppGetBusinessDataSuccessfully extends NewsAppState {}
class NewsAppGetBusinessDataError extends NewsAppState {
  final String error;

  NewsAppGetBusinessDataError(this.error);
}
class NewsAppGetBusinessDataLoading extends NewsAppState {}

class NewsAppGetSportDataError extends NewsAppState {
  final String error;

  NewsAppGetSportDataError(this.error);
}
class NewsAppGetSportDataLoading extends NewsAppState {}
class NewsAppGetSportDataSuccessfully extends NewsAppState {}

class NewsAppGetScienceDataSuccessfully extends NewsAppState {}
class NewsAppGetScienceDataLoading extends NewsAppState {}
class NewsAppGetScienceDataError extends NewsAppState {
  final String error;

  NewsAppGetScienceDataError(this.error);
}

class NewsAppGetSearchDataSuccessfully extends NewsAppState {}
class NewsAppGetSearchDataLoading extends NewsAppState {}
class NewsAppGetSearchDataError extends NewsAppState {
  final String error;

  NewsAppGetSearchDataError(this.error);
}