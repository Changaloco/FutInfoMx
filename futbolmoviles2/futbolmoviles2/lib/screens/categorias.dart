import 'package:flutter/material.dart';
import '../helpers/utils.dart';
import '../models/category.dart';
import '../widgets/IconFont.dart';
import '../widgets/categorybottombar.dart';
import '../services/loginservice.dart';
import '../models/loginusermodel.dart';
import 'package:provider/provider.dart';
import 'standings/tablaliga.dart';
// ignore: must_be_immutable
class Categorias extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();
  @override
  Widget build(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    LoginUserModel? userModel = loginService.loggedInUserModel;
    String userImg = userModel != null ? userModel.photoUrl! : '';
    // ignore: unused_local_variable
    String userName = userModel != null ? userModel.displayName! : '';
    // ignore: unused_local_variable
    String userEmail = userModel != null ? userModel.email! : '';
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
            title: Center(child:IconFont(color: Colors.black, size: 40)),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(10),
                  child: ClipOval(child: Image.network(userImg)))
            ]),
        body: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text('Ligas',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontSize: 20)),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                      context, 
                    MaterialPageRoute(builder:(context)=> TableScreen(code: categories[index].leaguetag))
                    );
                          },
                          child: Container(
                              margin: EdgeInsets.all(20),
                              height: 150,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/imgs/' +
                                                categories[index].imgName +
                                                '.png',
                                            fit: BoxFit.cover,
                                          ))),
                                  Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Colors.black.withOpacity(0.7),
                                                  Colors.transparent
                                                ])),
                                      )),
                                  Positioned(
                                      bottom: 0,
                                      child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Row(children: [
                                            ClipOval(
                                              child: Container(
                                                  color:
                                                      categories[index].color,
                                                  padding: EdgeInsets.all(10),
                                                  child: IconFont(
                                                      color: Colors.white,
                                                      size: 30)),
                                            ),
                                            SizedBox(height: 10),
                                            Text(categories[index].name,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25))
                                          ])))
                                ],
                              )));
                    }))
          ]),
          Positioned(bottom: 0, right: 0, left: 0, child: CategoryBottomBar())
        ]));
  }
}
