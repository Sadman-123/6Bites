import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomeWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.sizeOf(context).width;
    var mdh=MediaQuery.sizeOf(context).height;
    return Scaffold(
        body: Row(
          children: [
            Expanded(
                child: Container(
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      child: Center(
                        child: Text("LOGO",style: TextStyle(fontSize: 33),),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                      child: Container(
                        child: Column(
                          children: [
                            ListTile(title: Text("Home"),leading: FaIcon(FontAwesomeIcons.house,color: Color(0xFF88a5bc)),onTap: (){},),
                            Divider(),
                            ListTile(title: Text("Favourites"),leading: FaIcon(FontAwesomeIcons.heart,color: Color(0xFF88a5bc)),onTap: (){},),
                            Divider(),
                            ListTile(title: Text("Billing"),leading: FaIcon(FontAwesomeIcons.filePen,color: Color(0xFF88a5bc)),onTap: (){},),
                            Divider(),
                            ListTile(title: Text("About Us"),leading: FaIcon(FontAwesomeIcons.info,color: Color(0xFF88a5bc)),onTap: (){},),
                          ],
                        )
                        ),
                      )
                ],
              ),
            )),
            Expanded(
                flex: 4,
                child: Container(
                  color: Colors.yellow,
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF029c55),
          shape: CircleBorder(),
          onPressed: () {},
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ));
  }
}
