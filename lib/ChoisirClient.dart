import 'package:fashiontailor/CreationCommande.dart';
import 'package:flutter/material.dart';

class ChoisirClient extends StatefulWidget {

  static String tagChoisirClient = 'tagChoisirClient';

  @override
  _ChoisirClientState createState() => _ChoisirClientState();
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

class DesignListe{
  //
  String nomClient = '';
  String avatarCLient = '';
  String numTelClient = '';

  DesignListe({ this.nomClient, this.avatarCLient, this.numTelClient});

}


class _ChoisirClientState extends State<ChoisirClient> {

  List<DesignListe> listeDesClients = [

    DesignListe(nomClient: 'Boumba', avatarCLient: 'image1.jpg', numTelClient: '61951451'),
    DesignListe(nomClient: 'Pantalon', avatarCLient: 'image1.jpg', numTelClient: '66552341'),
    DesignListe(nomClient: 'Boubou', avatarCLient: 'image1.jpg', numTelClient: '96752431'),
    DesignListe(nomClient: 'Tenues locales', avatarCLient: 'image1.jpg', numTelClient: '98672267'),
    DesignListe(nomClient: 'Tenues locales', avatarCLient: 'image1.jpg', numTelClient: '65241451'),
  ];

  Widget listeclient (){
    return ListView.builder(
      itemCount: listeDesClients.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
              /*side: BorderSide(
                    color: Colors.blue
                )*/
            ),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) => CreerCommande()
                  )
                );
              },
              title: Text(listeDesClients[index].nomClient+'\n'+listeDesClients[index].numTelClient),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${listeDesClients[index].avatarCLient}'),
                radius: 25,
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
    final appbarListClient = AppBar(
      title: Text('Choisir un client'),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: null
        ),
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
    //Fin Appbar

    return Scaffold(
      appBar: appbarListClient,
      body: listeclient(),
    );
  }
}
