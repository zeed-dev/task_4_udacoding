part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoaded extends NewsState {
  final List<News> news;

  NewsLoaded(this.news);

  @override
  List<Object> get props => [news];
}

class NewsFailedLoaded extends NewsState {
  final String message;

  NewsFailedLoaded(this.message);

  @override
  List<Object> get props => [message];
}
