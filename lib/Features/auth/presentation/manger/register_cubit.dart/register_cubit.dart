import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviebox/Features/auth/data/models/user_model.dart';
import 'package:moviebox/Features/auth/data/repos/auth_repo.dart';
import 'package:moviebox/core/errors/auth_failure.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepo) : super(RegisterInitial());

  final AuthRepo _authRepo;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      final user = await _authRepo.registerWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );
      emit(RegisterSuccess(user: user));
    } catch (e) {
      if (e is AuthFailure) {
        emit(RegisterFailure(error: e.errMessage));
      } else {
        emit(RegisterFailure(error: 'Something went wrong. Please try again.'));
      }
    }
  }
}
