import 'dart:io';

import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UsersService.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/repository/UsersRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class UsersRepositoryImple  implements UsersRepository{
 
  UsersService usersService;

  UsersRepositoryImple(this.usersService);
 
  @override
  Future<Resource<User>> update(int id, User user, File? image) {
    if(image == null){
      return usersService.update(id, user);
    }else{
      return usersService.updateImage(id, user,image);
    }
  }


}