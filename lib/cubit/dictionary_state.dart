part of 'dictionary_cubit.dart';

abstract class DictionaryState extends Equatable {
  const DictionaryState();
}

class DictionaryInitial extends DictionaryState {
  @override
  List<Object> get props => [];
}

class DictionaryLoaded extends DictionaryState {
  final List<Dictionary> dictionary;
  DictionaryLoaded({this.dictionary});

  @override
  List<Object> get props => [dictionary];
}

class DictionaryFailedLoaded extends DictionaryState {
  final String message;
  DictionaryFailedLoaded({this.message});

  @override
  List<Object> get props => [message];
}

class DictionaryLoadedAll extends DictionaryState {
  final List<Dictionary> dictionary;
  DictionaryLoadedAll({this.dictionary});

  @override
  List<Object> get props => [dictionary];
}
