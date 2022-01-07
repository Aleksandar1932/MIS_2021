import 'package:exercise_3/model/dto/user_dto.dart';
import 'package:exercise_3/model/user.dart';

abstract class BaseAuthService {
  User signIn(UserDto userDto);
  void signOut();
  User? getCurrentUser();
}