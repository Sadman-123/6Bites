import 'package:flutter/material.dart';
import 'package:sixbites/presentation_layer/styles/app_colors.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/custom_button.dart';
class OrderApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
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
                      decoration: Input_decor(mdw, "Order ID", Icons.shopping_cart),
                    ),
                    SizedBox(
                      height: mdh*0.02,
                    ),
                    TextField(
                      decoration: Input_decor(mdw, "Phone Number", Icons.phone),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mdh*0.035,
              ),
              CustomButton(mdw, mdh, "Track Order")
            ],
          ),
        ),
      ),
    );
  }
  InputDecoration Input_decor(double mdw,String hint,IconData icon)
  {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      hintStyle: TextStyle(color: Color(0xFF9b9b9d),fontSize: mdw*0.040),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color:AppColors.primaryColor,width: 2),
      ),
    );
  }
}