import 'package:fashiontailor/ModelesHomme.dart';
import 'package:flutter/material.dart';

class SousCategorieHomme extends StatefulWidget {

  static String tagHomme = 'tagHomme';
  static String tagFemme = 'tagFemme';
  static String tagEnfants = 'tagEnfants';
  static String tagCouples = 'tagCouples';

  String title;
  Widget mylist;
  int sousCategorie;

  SousCategorieHomme(this.title);

  @override
  _SousCategorieHommeState createState() => _SousCategorieHommeState();
}

class _SousCategorieHommeState extends State<SousCategorieHomme> {

  //
  List<DesignModel> modele;

  Widget myListView (){
    return ListView.builder(
      itemCount: modele.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: ListTile(
              onTap: (){
                Navigator.of(context).pushNamed(AlbumGidView.albumGridTag);
              },
              title: Text(modele[index].nomModele),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${modele[index].imageModele}'),
                radius: 25,
              ),
              trailing: Icon(
                Icons.arrow_right,
                size: 30,
                color: Colors.blue,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    //Appbar
    final appbar1 = AppBar(
      title: Text(widget.title),
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

    //FinAppbar
      if(widget.title == 'Homme'){
        modele = [
          DesignModel(nomModele: 'Tenues locales', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Tenues locales', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Tenues locales', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Tenues locales', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Tenues locales', imageModele: 'image1.jpg'),
        ];
      }else if(widget.title == 'Femme'){
        modele = [
          DesignModel(nomModele: 'Tenues traditionnelles', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Robes', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Boubou', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Tenues locales', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Tenues locales', imageModele: 'image1.jpg'),
        ];
      }else if(widget.title == 'Couples'){
        modele = [
          DesignModel(nomModele: 'Tenues traditionnelles', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Robes', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Boubou', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Tenues locales', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Tenues locales', imageModele: 'image1.jpg'),
        ];
      }else{
        modele = [
          DesignModel(nomModele: 'Boumba', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Pantalon', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Boubou', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Tenues locales', imageModele: 'image1.jpg'),
          DesignModel(nomModele: 'Tenues locales', imageModele: 'image1.jpg'),
        ];
      }

    return Scaffold(
      appBar: appbar1,
      body: myListView(),
    );
  }
}


class DesignModel{
  //
  String nomModele = '';
  String imageModele = '';

  DesignModel({ this.nomModele, this.imageModele});

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
  print ('Working');
}
