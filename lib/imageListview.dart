import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Boxdecoration.dart';

class ImageListViwe extends StatelessWidget {
  const ImageListViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 30,),
              BoxDecorationWidget(
                imagepath: 'a1.jpg',
              ),
              SizedBox(height: 30,),
              BoxDecorationWidget(
                imagepath: 'a2.jpg',
              ),
              SizedBox(height: 30,),
              BoxDecorationWidget(
                imagepath: 'aljalali_fort.jpeg',
              ),
              SizedBox(height: 30,),
              BoxDecorationWidget(
                imagepath: 'oman_invest_easy-scaled.jpg',
              ),
              SizedBox(height: 30,),

            ],
          ),
        ),
      ),
    );
  }
}
