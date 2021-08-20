import 'package:flutter/material.dart';
import '../helpers/appcolors.dart';
import '../screens/perfil/perfil_futbol.dart';
import '../screens/categorias.dart';
import '../screens/camera/galleryscreen.dart';
class CategoryBottomBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.2),
              offset: Offset.zero)
        ]),
        height: 50,
        padding: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: Material(
                color: Colors.white,
                child: IconButton(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  icon: Icon(Icons.list, color: AppColors.MAIN_COLOR),
                  onPressed: () {
                    Navigator.push(
                      context, 
                    MaterialPageRoute(builder:(context)=> Categorias())
                    );
                  },
                ),
              ),
            ),
            ClipOval(
              child: Material(
                color: Colors.white,
                child: IconButton(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  icon: Icon(Icons.person, color: AppColors.MAIN_COLOR),
                  onPressed: () {
                    Navigator.push(
                      context, 
                    MaterialPageRoute(builder:(context)=> PerfilFutbol())
                    );
                  },
                ),
              ),
            ),
            ClipOval(
              child: Material(
                color: Colors.white,
                child: IconButton(
                  splashColor: Colors.grey[100],
                  highlightColor: Colors.grey[100],
                  icon: Icon(Icons.favorite, color: AppColors.MAIN_COLOR),
                  onPressed: () {
                      Navigator.push(
                      context, 
                    MaterialPageRoute(builder:(context)=> GalleryScreen())
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}