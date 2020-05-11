import 'dart:io';

import 'package:flutter/material.dart';
 import 'package:image_picker/image_picker.dart';

class Catalogue extends StatefulWidget {
  @override
  _CatalogueState createState() => _CatalogueState();
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

class _CatalogueState extends State<Catalogue> {

  File imageFile;

  _prendrePhoto() async{
    var photo = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = photo;
    });
    Navigator.of(context).pop();
  }

  _ouvrirGallery() async{
    var photo = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = photo;
    });
    Navigator.of(context).pop();
  }


  Future<void> _showChoiceDialog(BuildContext context) async {
    return await showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        title: Text(
          'Ajouter un modèle',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text(
                  'Prendre une photo',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: (){
                  _prendrePhoto();
                },
              ),
              SizedBox(height: 15.0,),
              GestureDetector(
                child: Text(
                  'Ouvrir la Gallery',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: (){
                  _ouvrirGallery();
                },
              ),
              SizedBox(height: 15.0,),
              GestureDetector(
                child: Text(
                  'Annuler',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _decideImageView(){
    if(imageFile == null){
      return Center(child: Text("Pas de modeles ajoutés !",
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.red
      ),
      ));
    }else{
      return Center(child: Image.file(imageFile,width: 600,height: 550,));
    }
  }

  @override
  Widget build(BuildContext context) {

    final appbarCatalogue = AppBar(
      title: Text('Catalogue'),
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
        ),
      ],
    );

    return Scaffold(
      appBar: appbarCatalogue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _decideImageView()
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25.0, right: 10.0),
        child: FloatingActionButton(
          onPressed: (){
            return _showChoiceDialog(context);
          },
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}
