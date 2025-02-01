import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sixbites/presentation_layer/styles/app_colors.dart';
class MenuApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var mdw=MediaQuery.of(context).size.width;
    var mdh=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: mdh*0.18,
        backgroundColor: AppColors.primaryColor,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoListSection(
                  backgroundColor: AppColors.CategoryBackground,
                  header: Text('General',style: CategoryTitle(mdw),),
                  children: [
                    _ListItem('Profile', FontAwesomeIcons.user),
                    _ListItem('Address', FontAwesomeIcons.map),
                    _ListItem('Language', FontAwesomeIcons.language),
                    _ListItem('Currency', FontAwesomeIcons.dollarSign),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoListSection(
                  backgroundColor: AppColors.CategoryBackground,
                  header: Text('Promotional Activity',style: CategoryTitle(mdw),),
                  children: [
                    _ListItem('Coupons', FontAwesomeIcons.ticketAlt),
                    _ListItem('Loyal Points', FontAwesomeIcons.gift),
                    _ListItem('My Wallet', FontAwesomeIcons.wallet),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoListSection(
                  backgroundColor: AppColors.CategoryBackground,
                  header: Text('Earnings',style: CategoryTitle(mdw),),
                  children: [
                    _ListItem('Refer & Earn', FontAwesomeIcons.userFriends),
                    _ListItem('Join as a Delivery Man', FontAwesomeIcons.userTie),
                    _ListItem('Open Restaurant', FontAwesomeIcons.utensils),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoListSection(
                  backgroundColor: AppColors.CategoryBackground,
                  header: Text('Help & Support',style: CategoryTitle(mdw),),
                  children: [
                    _ListItem('Live Chat', FontAwesomeIcons.commentDots),
                    _ListItem('Help & Support', FontAwesomeIcons.questionCircle),
                    _ListItem('Privacy Policy', FontAwesomeIcons.userShield),
                    _ListItem('Refund Policy', FontAwesomeIcons.handHoldingUsd),
                    _ListItem('Cancellation Policy', FontAwesomeIcons.ban),
                  ],
                ),
              ),
            ],
          ),
          ),
      ),
    );
  }
  ListTile _ListItem(String title, IconData icon) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
    );
  }
  TextStyle CategoryTitle(double mdw)
  {
    return TextStyle(fontSize: mdw*0.05,fontWeight: FontWeight.bold,color: AppColors.secondaryColor);
  }
}