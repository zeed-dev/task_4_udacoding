part of 'farm_cubit.dart';

abstract class FarmState extends Equatable {
  const FarmState();

  @override
  List<Object> get props => [];
}

class FarmInitial extends FarmState {
  @override
  List<Object> get props => [];
}

class FarmLoaded extends FarmState {
  final List<Farm> farm;
  FarmLoaded(this.farm);

  @override
  List<Object> get props => [farm];
}

class FarmFailedLoaded extends FarmState {
  final String message;
  FarmFailedLoaded(this.message);

  @override
  List<Object> get props => [message];
}
