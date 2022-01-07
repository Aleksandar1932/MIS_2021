import 'package:exercise_3/common/memory_store.dart';
import 'package:exercise_3/model/dto/user_dto.dart';
import 'package:exercise_3/model/user.dart';
import 'package:exercise_3/service/auth_service.dart';

class SimpleAuthService extends BaseAuthService {
  static final SimpleAuthService _instance = SimpleAuthService._internal();
  factory SimpleAuthService() => _instance;
  SimpleAuthService._internal();

  User? _currentUser;

  @override
  User? getCurrentUser() {
    return _currentUser;
  }

  @override
  User signIn(UserDto userDto) {
    User user = User(identifier: userDto.identifier);
    _currentUser = user;
    return user;
  }

  @override
  void signOut() {
    _currentUser = null;
  }
}
