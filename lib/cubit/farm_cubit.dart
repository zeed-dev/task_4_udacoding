import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farm_house/models/models.dart';
import 'package:farm_house/services/services.dart';

part 'farm_state.dart';

class FarmCubit extends Cubit<FarmState> {
  FarmCubit() : super(FarmInitial());

  Future<void> getFarm() async {
    ApiReturnValue<List<Farm>> result = await FarmServices.getFarm();
    if (result.value != null) {
      emit(FarmLoaded(result.value));
    } else {
      emit(FarmFailedLoaded(result.message));
    }
  }
}
