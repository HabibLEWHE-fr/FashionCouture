import 'package:fashiontailor/ChoisirClient.dart';
import 'package:fashiontailor/DetailsCommandes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListeCommandes extends StatefulWidget {
  @override
  _ListeCommandesState createState() => _ListeCommandesState();
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

class _ListeCommandesState extends State<ListeCommandes> {

  List<DesignListe> listeDesClients = [

    DesignListe(nomClient: 'LEWHE Habib', avatarCLient: 'image4.jpg', numTelClient: '61951451'),
    DesignListe(nomClient: 'HOUNSINOU Abed', avatarCLient: 'image2.jpg', numTelClient: '66552341'),
    DesignListe(nomClient: 'TOSSOU Cyriaque', avatarCLient: 'image1.jpg', numTelClient: '61951451'),
    DesignListe(nomClient: 'ADANHOU Happy', avatarCLient: 'image3.jpg', numTelClient: '66552341'),
    DesignListe(nomClient: 'BONOU Constant', avatarCLient: 'image2.jpg', numTelClient: '61951451'),
    DesignListe(nomClient: 'JAMES Rodriguez', avatarCLient: 'image4.jpg', numTelClient: '66552341'),
  ];

  Widget listeCommande (){
    return ListView.builder(
      itemCount: listeDesClients.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
          child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            child: ListTile(
              onTap: (){
                Navigator.of(context).pushNamed(DetailsCommandes.tagDetailsCommandes);
              },
              title: Text(listeDesClients[index].nomClient),
              subtitle: Text(listeDesClients[index].numTelClient),
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
      title: Text('Commandes'),
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
      body: listeCommande(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pushNamed(ChoisirClient.tagChoisirClient);
        },
      ),
    );
  }
}
