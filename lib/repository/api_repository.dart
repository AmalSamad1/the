import 'dart:async';
import 'package:meta/meta.dart';

import 'package:the/repository/repository.dart';

import '../model/model.dart';

class ApiRepository {
  final ApiFactory apiFactory;
  ApiRepository({ this.apiFactory}):assert(apiFactory != null);
  Future<PersonalNew> getProfile(String id) async {
    return apiFactory.getPersonal(id);
  }
}