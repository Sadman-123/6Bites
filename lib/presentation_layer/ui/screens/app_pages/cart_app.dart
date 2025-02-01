import 'package:flutter/material.dart';
class CartApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
        title: Text('My Cart',style: TextStyle(color: Colors.black,fontSize: mdw*0.054),),

      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: mdh*0.18,
              ),
              Container(
                child: Image.asset('assets/stickers/menu_card.png',width: mdw*0.25,),
              ),
              SizedBox(
                height: mdh*0.05,
              ),
              Container(
                child: Text("You haven't add to cart yet!",style: TextStyle(color: Color(0xFF9b9b9d),fontSize: mdw*0.045),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}