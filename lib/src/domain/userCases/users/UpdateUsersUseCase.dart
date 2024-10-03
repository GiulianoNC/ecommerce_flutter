import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/repository/UsersRepository.dart';

class UpdateUsersUseCase {

  UsersRepository usersRepository;

  UpdateUsersUseCase(this.usersRepository);

  run(int id, User user, File? file,) => usersRepository.update(id, user, file);

}