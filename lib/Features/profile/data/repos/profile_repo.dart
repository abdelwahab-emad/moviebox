import 'package:moviebox/core/networking/api_result.dart';

abstract class ProfileRepo {
  String getCurrentEmail();

  String getCurrentName();

  Future<ApiResult<void>> updateName(String name);
  
  Future<ApiResult<void>> updatePassword(String newPassword);
}
