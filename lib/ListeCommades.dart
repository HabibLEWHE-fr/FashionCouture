import 'package:fashiontailor/ChoisirClient.dart';
import 'package:fashiontailor/DetailsCommandes.dart';
import 'package:fashiontailor/ModifierClient.dart';
import 'package:fashiontailor/Parametres.dart';
import 'package:fashiontailor/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListeCommandes extends StatefulWidget {
  @override
  _ListeCommandesState createState() => _ListeCommandesState();
}

class Constants {
  static const String Parametres = 'Paramètres';
  static const String Quitter = 'Quitter';

  static const List<String> choices = <String>[
    Parametres,
    Quitter
  ];
}

class DesignListe {
  //
  String nomClient = '';
  String avatarCLient = '';
  String numTelClient = '';

  DesignListe({this.nomClient, this.avatarCLient, this.numTelClient});
}

class _ListeCommandesState extends State<ListeCommandes> {
  List<DesignListe> listeDesClients = [
    DesignListe(
        nomClient: 'LEWHE Habib',
        avatarCLient: 'image4.jpg',
        numTelClient: '61951451'),
    DesignListe(
        nomClient: 'HOUNSINOU Abed',
        avatarCLient: 'image2.jpg',
        numTelClient: '66552341'),
    DesignListe(
        nomClient: 'TOSSOU Cyriaque',
        avatarCLient: 'image1.jpg',
        numTelClient: '61951451'),
    DesignListe(
        nomClient: 'ADANHOU Happy',
        avatarCLient: 'image3.jpg',
        numTelClient: '66552341'),
    DesignListe(
        nomClient: 'BONOU Constant',
        avatarCLient: 'image2.jpg',
        numTelClient: '61951451'),
    DesignListe(
        nomClient: 'JAMES Rodriguez',
        avatarCLient: 'image4.jpg',
        numTelClient: '66552341'),
  ];

  Widget listeCommande() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listeDesClients.length,
      itemBuilder: (context, index) {
        DesignListe item = listeDesClients[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
          child: Dismissible(
            key: ValueKey(item),
            background: Container(
              child: IconSlideAction(
                icon: Icons.delete,
                caption: 'Supprimer',
                color: Colors.redAccent,
              ),
              color: Colors.red,
            ),
            onDismissed: (direction){
              setState(() {
                listeDesClients.removeAt(index);
              });

              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('${item.nomClient} supprimé'),
                action: SnackBarAction(
                  label: 'Annulé',
                  onPressed: () {
                    setState(() {
                      listeDesClients.insert(index, item);
                    });
                  },
                ),
              ));
            },
            child: Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(DetailsCommandes.tagDetailsCommandes);
                },
                title: Text(listeDesClients[index].nomClient),
                subtitle: Text(listeDesClients[index].numTelClient),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/${listeDesClients[index].avatarCLient}'),
                  radius: 25,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void ChoiceAction(String choice) {
      if(choice == 'Paramètres'){
        Navigator.push(context, MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) => Parametres()
        )
        );
      }
      else if(choice == 'Quitter'){
        Navigator.of(context).pop();
      }
    }

    //Appbar
    final appbarListClient = AppBar(
      title: Text('Commandes'),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: null),
        PopupMenuButton<String>(
          onSelected: ChoiceAction,
          itemBuilder: (BuildContext context) {
            return Constants.choices.map((String choices) {
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 25.0, right: 10.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(ChoisirClient.tagChoisirClient);
          },
        ),
      ),
    );
  }
}
