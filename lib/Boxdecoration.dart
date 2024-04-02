import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxDecorationWidget extends StatefulWidget {
  final String imagepath;

  const BoxDecorationWidget({Key? key, required this.imagepath}) : super(key: key);

  @override
  State<BoxDecorationWidget> createState() => _BoxDecorationState();
}

class _BoxDecorationState extends State<BoxDecorationWidget> {
  @override
  Widget build(BuildContext context) {
    final String imagepath = widget.imagepath;
    return Container(
      height: 200,
      width: 0.8 * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.amber,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('image/$imagepath'), // Corrected image path
        ),
        border: Border.all(width: 6, color: Colors.lightBlueAccent),
        boxShadow: const [
          BoxShadow(
            color: Colors.deepOrange,
            blurRadius: 4,
            spreadRadius: 4.5,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
    );
  }
}
