import 'package:flutter/material.dart';
import '../../models/loginusermodel.dart';
import 'user_info.dart';
import 'package:provider/provider.dart';
import '../../services/loginservice.dart';
class ProfileHeader extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    LoginService loginService = Provider.of<LoginService>(context, listen: false);
    LoginUserModel? userModel = loginService.loggedInUserModel;
    String userImg = userModel != null ? userModel.photoUrl! : '';
    String userName = userModel != null ? userModel.displayName! : '';
    String userEmail = userModel != null ? userModel.email! : '';

    final title = Text(
      'PERFIL',
      style: TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 35.0
      ),
    );

    return Container(
      margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              title
            ],
          ),
          UserInfo(userImg, userName ,userEmail),
        ],
      ),
    );
  }

}