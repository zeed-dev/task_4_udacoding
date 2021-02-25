import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farm_house/models/models.dart';
import 'package:farm_house/services/services.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> getNews() async {
    ApiReturnValue<List<News>> result = await NewsServices.getNews();
    if (result.value != null) {
      emit(NewsLoaded(result.value));
    } else {
      emit(NewsFailedLoaded(result.message));
    }
  }
}
