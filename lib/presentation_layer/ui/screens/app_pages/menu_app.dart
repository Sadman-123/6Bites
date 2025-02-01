import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MenuApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: mdh*0.18,
        backgroundColor: Color(0xFF029c55),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: mdw*0.1,
              backgroundImage: AssetImage('assets/stickers/man.png'),
            ),
            SizedBox(width: mdw*0.045,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Guest User',style: TextStyle(fontSize: mdw*0.055,fontWeight: FontWeight.bold,color: Color(0xFFf5fff3)),),
                SizedBox(
                  height: mdh*0.006,
                ),
                Text('Login to view all the features',style: TextStyle(fontSize: mdw*0.0385,color: Color(0xFFf5fff3)),),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFE0F2F1),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoListSection(
                    backgroundColor: Color(0xFFE0F2F1),
                    header: Text('General',style: TextStyle(fontSize: mdw*0.05,fontWeight: FontWeight.bold,color: Colors.black),),
                    children: [
                     ListTile(
                       title: Text('Profile'),
                       leading: FaIcon(FontAwesomeIcons.user),
                     ),
                      ListTile(
                        title: Text('Address'),
                        leading: FaIcon(FontAwesomeIcons.map),
                      ),
                      ListTile(
                        title: Text('Language'),
                        leading: FaIcon(FontAwesomeIcons.language),
                      ),
                      ListTile(
                        title: Text('Currency'),
                        leading: FaIcon(FontAwesomeIcons.dollarSign),
                      ),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoListSection(
                  backgroundColor: Color(0xFFE0F2F1),
                  header: Text('Promotional Activity',style: TextStyle(fontSize: mdw*0.05,fontWeight: FontWeight.bold,color: Colors.black),),
                  children: [
                    ListTile(
                      title: Text('Coupons'),
                      leading: FaIcon(FontAwesomeIcons.ticketAlt),
                    ),
                    ListTile(
                      title: Text('Loyal Points'),
                      leading: FaIcon(FontAwesomeIcons.gift),
                    ),
                    ListTile(
                      title: Text('My Wallet'),
                      leading: FaIcon(FontAwesomeIcons.wallet),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoListSection(
                  backgroundColor: Color(0xFFE0F2F1),
                  header: Text('Earnings',style: TextStyle(fontSize: mdw*0.05,fontWeight: FontWeight.bold,color: Colors.black),),
                  children: [
                    ListTile(
                      title: Text('Refer & Earn'),
                      leading: FaIcon(FontAwesomeIcons.userFriends),
                    ),
                    ListTile(
                      title: Text('Join as a Delivery Man'),
                      leading: FaIcon(FontAwesomeIcons.userTie),
                    ),
                    ListTile(
                      title: Text('Open Restaurant'),
                      leading: FaIcon(FontAwesomeIcons.utensils),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoListSection(
                  backgroundColor: Color(0xFFE0F2F1),
                  header: Text('Help & Support',style: TextStyle(fontSize: mdw*0.05,fontWeight: FontWeight.bold,color: Colors.black),),
                  children: [
                    ListTile(
                      title: Text("Live Chat"),
                      leading: FaIcon(FontAwesomeIcons.commentDots),
                    ),
                    ListTile(
                      title: Text("Help & Support"),
                      leading: FaIcon(FontAwesomeIcons.questionCircle),
                    ),
                    ListTile(
                      title: Text("Privacy Policy"),
                      leading: FaIcon(FontAwesomeIcons.userShield),
                    ),
                    ListTile(
                      title: Text("Refund Policy"),
                      leading: FaIcon(FontAwesomeIcons.handHoldingUsd),
                    ),
                    ListTile(
                      title: Text("Cancellation Policy"),
                      leading: FaIcon(FontAwesomeIcons.ban),
                    ),
                    ListTile(
                      title: Text("Shipping Policy"),
                      leading: FaIcon(FontAwesomeIcons.shippingFast),
                    ),

                  ],
                ),
              ),
            ],
          ),
          ),
      ),
    );
  }
}