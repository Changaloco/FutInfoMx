import 'package:flutter/material.dart';
import '../services/loginservice.dart';
import '../models/loginusermodel.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UserProfileHeader extends StatelessWidget {

  bool? showProfilePic;

  UserProfileHeader({
    this.showProfilePic
  });

  @override
  Widget build(BuildContext context) {

    return Consumer<LoginService>(
      builder: (context, loginService, child) {
        LoginUserModel? userModel = loginService.loggedInUserModel;

        String? imgPath = userModel != null ? userModel.photoUrl : '';
        
        return this.showProfilePic! && imgPath!.length > 0 ? 
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(10),
            child: ClipOval(
              child: Image.network(imgPath)
            )
          ): SizedBox(width: 40, height: 40);
      },
    );
  }
}