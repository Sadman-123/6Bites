import 'package:flutter/material.dart';
class OrderApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Orders',style: TextStyle(color: Colors.black,fontSize: mdw*0.054),),

      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: mdh*0.12,
              ),
              Container(
                width: mdw*0.75,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Order ID",
                        prefixIcon: Icon(Icons.shopping_cart),
                        hintStyle: TextStyle(color: Color(0xFF9b9b9d),fontSize: mdw*0.040),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFF029c55),width: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mdh*0.02,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Phone number",
                        hintStyle: TextStyle(color: Color(0xFF9b9b9d),fontSize: mdw*0.040),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xFF029c55),width: 2),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mdh*0.035,
              ),
              Container(
                width: mdw*0.75,
                height: mdh*0.06,
                decoration: BoxDecoration(
                  color: Color(0xFF029c55),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text("Track Order",style: TextStyle(color: Color(0xFFfdfeff),fontSize: mdw*0.049,fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}