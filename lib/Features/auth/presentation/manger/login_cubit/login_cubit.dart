import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviebox/Features/auth/data/errors/auth_failure.dart';
import 'package:moviebox/Features/auth/data/models/user_model.dart';
import 'package:moviebox/Features/auth/data/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(LoginInitial());

  final AuthRepo _authRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final user = await _authRepo.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess(user: user));
    } catch (e) {
      if (e is AuthFailure) {
        emit(LoginFailure(error: e.errMessage));
      } else {
        emit(LoginFailure(error: 'Something went wrong. Please try again.'));
      }
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      final user = await _authRepo.signInWithGoogle();
      emit(LoginSuccess(user: user));
    } catch (e) {
      if (e is AuthFailure) {
        emit(LoginFailure(error: e.errMessage));
      } else {
        emit(LoginFailure(error: 'Something went wrong. Please try again.'));
      }
    }
  }
}
