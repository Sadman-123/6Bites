import 'package:flutter/material.dart';
class FavouriteApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Favourite',style: TextStyle(color: Colors.black,fontSize: mdw*0.054),),

      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: mdh*0.1,
              ),
              Container(
                child: Image.asset('assets/stickers/user.png',width: mdw*0.25,),
              ),
              SizedBox(
                height: mdh*0.05,
              ),
              Container(
                child: Text('Sorry!',style: TextStyle(color: Color(0xFF029c55),fontSize: mdw*0.06),),
              ),
              Container(
                child: Text("You are not logged in",style: TextStyle(color: Color(0xFF9b9b9d),fontSize: mdw*0.045),),
              ),
              SizedBox(
                height: mdh*0.065,
              ),
              Container(
                width: mdw*0.75,
                height: mdh*0.06,
                decoration: BoxDecoration(
                  color: Color(0xFF029c55),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("Login to Continue",style: TextStyle(color: Color(0xFFfdfeff),fontSize: mdw*0.049,fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}