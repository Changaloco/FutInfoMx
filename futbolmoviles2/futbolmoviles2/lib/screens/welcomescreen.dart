import 'package:flutter/material.dart';
import 'package:futbolmoviles2/widgets/IconFont.dart';
import 'categorias.dart';
import 'package:provider/provider.dart';
import '../services/loginservice.dart';
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginService loginService = Provider.of<LoginService>(context,listen:false);
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
         children:[
            Positioned.fill(
            child: Opacity(
              opacity:0.3,
              child: Image.asset(
                'assets/imgs/wallpaper1.jpg',
                fit: BoxFit.cover
                ),
            )
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: ClipOval(
                  child:Container(
                    width:180,
                    height:180,
                    color:Color(0xFF29B6F6),
                    alignment: Alignment.center,
                    child: IconFont(
                      size:130,
                      color:Colors.white,
                      
                    )
                  ) ,
                  )
                )
                ,
                  SizedBox(height:50),
              Text("Bienvenido",
              textAlign: TextAlign.center,
              style:TextStyle(
                fontFamily:"Montserrat",
                color:Colors.white,
                fontWeight:FontWeight.bold,
                fontSize: 40
              )),
              SizedBox(height:30),
              Text("La mejor. \nInformacion de futbol",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color:Colors.white,
                fontFamily: "Montserrat",
                )
              ),
              SizedBox(height:30),
              // ignore: deprecated_member_use
              SizedBox(height:80),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () async { 
                  bool success = await loginService.signInWithGoogle();

                  if(success){
                    Navigator.push(
                      context, 
                    MaterialPageRoute(builder:(context)=> Categorias())
                    );
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                color: Color(0xFF29B6F6),
                padding: EdgeInsets.all(25),
                child: Text("Iniciar Sesion",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
                )
              )
              
              ],
            )
          )
         ]
        )
      )
    );
  }
 
  
}