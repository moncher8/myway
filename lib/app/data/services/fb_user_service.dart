import 'package:get/get.dart';

import '../models/fb_user_model.dart';

class FbUserService extends GetxService{
  bool _initialized = false;
  FbUser? _fbUser;
  FbUser get fbUser => _fbUser!;

  bool get initialized => _initialized;

  void clear(){
    _fbUser = null;
    _initialized = false;
  }

  set fbUser(FbUser fbUser) {
    _initialized = true;
    _fbUser = fbUser;
  }
}