import 'package:flutter/material.dart';
class AdaptiveHelper extends StatelessWidget{
  final Widget App;
  final Widget Web;
  const AdaptiveHelper({super.key, required this.App, required this.Web});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth>=720)
          {
            return Web;
          }
        else{
          return App;
        }
      },
    );
  }
}