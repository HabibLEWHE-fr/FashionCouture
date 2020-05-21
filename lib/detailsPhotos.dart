import 'package:flutter/material.dart';

class DetailsPhotos extends StatefulWidget {
  @override
  _DetailsPhotosState createState() => _DetailsPhotosState();
}

class _DetailsPhotosState extends State<DetailsPhotos> {

  //Appbar
  final appbar = AppBar(
    title: Text('Tenue Hommes'),
  );
  //Fin Appbar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/image1.jpg'),
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              child: Icon(
                Icons.close
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}
