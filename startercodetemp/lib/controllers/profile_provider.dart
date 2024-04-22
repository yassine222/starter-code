import 'package:flutter/material.dart';

import 'package:startercodetemp/models/response/auth/profile_model.dart';
import 'package:startercodetemp/services/helpers/auth_helper.dart';

class ProfileNotifier extends ChangeNotifier {
  Future<ProfileRes>? profile;
  getProfile() async {
    profile = AuthHelper.getProfile();
  }
}
