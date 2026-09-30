import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviebox/Features/profile/data/repos/profile_repo.dart';
import 'package:moviebox/core/networking/api_result.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  final ProfileRepo _profileRepo;

  String get currentEmail => _profileRepo.getCurrentEmail();
  String get currentName => _profileRepo.getCurrentName();

  Future<void> updateName(String name) async {
    emit(ProfileLoading());
    final result = await _profileRepo.updateName(name);

    switch (result) {
      case Success():
        emit(ProfileUpdateSuccess(message: 'Name updated successfully'));
      case Failure(message: final message):
        emit(ProfileFailure(error: message));
    }
  }

  Future<void> updatePassword(String password) async {
    emit(ProfileLoading());
    final result = await _profileRepo.updatePassword(password);

    switch (result) {
      case Success():
        emit(ProfileUpdateSuccess(message: 'Password updated successfully'));
      case Failure(message: final message):
        emit(ProfileFailure(error: message));
    }
  }
}