import 'package:fashiontailor/CreationCommande.dart';
import 'package:fashiontailor/ProfilePage.dart';
import 'package:flutter/material.dart';

class ChoisirClient extends StatefulWidget {

  static String tagChoisirClient = 'tagChoisirClient';

  @override
  _ChoisirClientState createState() => _ChoisirClientState();
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
    DesignListe(nomClient: 'Pantalon', avatarCLient: 'image4.jpg', numTelClient: '66552341'),
    DesignListe(nomClient: 'Boubou', avatarCLient: 'image1.jpg', numTelClient: '96752431'),
    DesignListe(nomClient: 'Tenues locales', avatarCLient: 'image3.jpg', numTelClient: '98672267'),
    DesignListe(nomClient: 'Tenues locales', avatarCLient: 'image2.jpg', numTelClient: '65241451'),
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
      title: Text('Choisir un client'),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: null
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
