import 'package:flutter/material.dart';
import 'package:test2/databaseHelper.dart'; // Ensure this import path matches your project structure
import 'Boxdecoration.dart';
import 'Castle.dart'; // Ensure this import path matches your project structure

class MyTextScreen extends StatefulWidget {
  const MyTextScreen({Key? key});

  @override
  State<MyTextScreen> createState() => _MyTextScreenState();
}

class _MyTextScreenState extends State<MyTextScreen> {
  List<Castle> castleList = [];

  @override
  void initState() {
    super.initState();
    DatabaseHelper.readData((List<Castle> castleList) {
      setState(() {
        this.castleList = castleList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Castles List'),
      ),
      body: castleList.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show a loading indicator while the data is being fetched
          : ListView.builder(
        itemCount: castleList.length,
        itemBuilder: (context, index) {
          Castle castle = castleList[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BoxDecorationWidget(imagepath: '${castle.castleData?.image ?? ''}',),

                  SizedBox(height: 8),
                  Text(
                    castle.castleData?.name ?? 'No Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Place: ${castle.castleData?.place ?? 'Unknown'}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Price: \$${castle.castleData?.price?.toStringAsFixed(2) ?? '0.00'}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
