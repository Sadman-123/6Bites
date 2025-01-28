import 'package:flutter/material.dart';
import 'package:sixbites/presentation_layer/ui/Diy_components/home_related/custom_navbar.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.sizeOf(context).width;
    var mdh=MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Text("Hello");
        },
      ),
      bottomNavigationBar: CustomNavbar(mdw: mdw, mdh: mdh),
    );
  }
}