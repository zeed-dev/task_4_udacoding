import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farm_house/models/models.dart';
import 'package:farm_house/services/services.dart';

part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  DictionaryCubit() : super(DictionaryInitial());

  Future<void> getDataLimit() async {
    ApiReturnValue<List<Dictionary>> result =
        await DictionaryServices.getDataLimit();

    if (result.value != null) {
      emit(DictionaryLoaded(dictionary: result.value));
    } else {
      emit(DictionaryFailedLoaded(message: result.message));
    }
  }
}
