import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
Widget WebRestaurantCard(double mdw,double mdh,String logo,String name,String address,String reviews_comments_count,String rating)
{
  return Container(
    height: mdh * 0.136,
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: mdw*0.7,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Container(
              width: mdw * 0.19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                logo,
                width: mdw * 0.22,),
            ),
          ),
        ),
        Expanded(flex: 4, child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$name",style: TextStyle(color: Color(0xFF030a45),
                  fontSize: mdw * 0.0131,
                  fontWeight: FontWeight.w600),maxLines: 1, overflow: TextOverflow.ellipsis),
              Text("$address",style: TextStyle(
                  color: Color(0xFFafafae)),maxLines: 2,overflow: TextOverflow.ellipsis,),
              SizedBox(height: mdh*0.008,),
              Container(
                child: Row(
                  children: [
                    Container(
                      child: RatingBarIndicator(
                        rating: double.parse(rating),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Color(0xFF22a96b),
                        ),
                        itemCount: 5,
                        itemSize: 14.0,
                        direction: Axis.horizontal,
                      ),
                    ),
                    Text("(${reviews_comments_count})",style: TextStyle(
                        color: Color(0xFFafafae)),)
                  ],
                ),
              )
            ],
          ),
        ),),
        Container(
          height: double.infinity,
          child: Icon(Icons.favorite_border),
        ),
      ],
    ),
  );
}