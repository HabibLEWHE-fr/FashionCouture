import 'package:flutter/material.dart';

class DetailsPhotos extends StatefulWidget {
  @override
  _DetailsPhotosState createState() => _DetailsPhotosState();
}

class Constants{
  static const String MonCompte = 'Mon compte';
  static const String Parametres = 'Paramètres';
  static const String Partager = 'Partager';
  static const String Apropos = 'A propos';
  static const String Quitter = 'Quitter';

  static const List<String> choices = <String> [
    MonCompte,Parametres, Partager, Apropos, Quitter
  ];
}


void ChoiceAction(String choice){
  //print ('Working');
  if(choice == 'Mon compte'){
    print('je veux manger');
  }
}

class _DetailsPhotosState extends State<DetailsPhotos> {

  //Appbar
  final appbar = AppBar(
    title: Text('E-Couture'),
    actions: <Widget>[
      PopupMenuButton <String>(
        onSelected: ChoiceAction,
        itemBuilder: (BuildContext context){
          return Constants.choices.map((String choices){
            return PopupMenuItem<String>(
              value: choices,
              child: Text(choices),
            );
          }).toList();
        },
      )
    ],
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
