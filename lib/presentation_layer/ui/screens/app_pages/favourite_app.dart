import 'package:flutter/material.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/custom_button.dart';
class FavouriteApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
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
              CustomButton(mdw, mdh, "Login to Continue"),
            ],
          ),
        ),
      ),
    );
  }
}