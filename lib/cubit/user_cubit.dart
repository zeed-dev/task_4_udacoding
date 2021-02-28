import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farm_house/models/models.dart';
import 'package:farm_house/services/services.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserFailedLoaded(result.message));
    }
  }

  Future<void> signUp(String name, String email, String password) async {
    ApiReturnValue<int> result =
        await UserServices.signUp(name, email, password);

    if (result.value != null) {
      emit(UserSignUp(result.value));
    } else {
      emit(UserFailedLoaded(result.message));
    }
  }

  Future<void> signOut(String email) async {
    ApiReturnValue<int> result = await UserServices.signOut(email);

    if (result.value != null) {
      emit(UserInitial());
    } else {
      emit(UserFailedLoaded(result.message));
    }
  }
}
