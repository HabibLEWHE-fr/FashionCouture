import 'package:fashiontailor/CreationClient.dart';
import 'package:fashiontailor/DonneesClients.dart';
import 'package:fashiontailor/ModifierClient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListeClients extends StatefulWidget {

  ListeClients(): super();

  @override
  _ListeClientsState createState() => _ListeClientsState();
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


class _ListeClientsState extends State<ListeClients> {


   List<DesignListe> listeDesClients;

   @override
   void initState() {
     super.initState();
     listeDesClients = List();
     addClients();

   }

   addClients(){
     listeDesClients.add(DesignListe(nomClient: 'Robes pagnes', avatarCLient: 'image1.jpg', numTelClient: '61951451'));
     listeDesClients.add(DesignListe(nomClient: 'Danchiki', avatarCLient: 'image4.jpg', numTelClient: '66552341'));
     listeDesClients.add(DesignListe(nomClient: 'Boubou', avatarCLient: 'image2.jpg', numTelClient: '96752431'));
     listeDesClients.add(DesignListe(nomClient: 'Tenues locales', avatarCLient: 'image3.jpg', numTelClient: '98672267'));
     listeDesClients.add(DesignListe(nomClient: 'Tenues africaines', avatarCLient: 'image2.jpg', numTelClient: '65241451'));
     listeDesClients.add(DesignListe(nomClient: 'Bazin', avatarCLient: 'image1.jpg', numTelClient: '65241451'));
   }

   Future<Null> getRefresh() async {
    await Future.delayed(Duration(seconds: 3));
  }

   void _showChoiceDialog(BuildContext context) {
      showDialog(context: context,builder: (BuildContext context){
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
                   'Nouvelle commande',
                   style: TextStyle(fontSize: 18),
                 ),
                 onTap: (){
                    Navigator.of(context).pushNamed(ModifierClient.tagModifierClient);
                 },
               ),
             ],
           ),
         ),
       );
     });
      Navigator.of(context).pop();
   }

  Widget listeclient (){
    return RefreshIndicator(
      onRefresh: getRefresh,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: listeDesClients.length,
        itemBuilder: (context,int  index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Slidable(
              key: ValueKey(listeDesClients[index]),
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: <Widget>[
                IconSlideAction(
                  icon: Icons.delete,
                  caption: 'Supprimer',
                  color: Colors.redAccent,
                )
              ],
              dismissal: SlidableDismissal(
                child: SlidableDrawerDismissal(),
                onDismissed: (direction) {
                  setState(() {
                    listeDesClients.removeAt(index);
                  });

                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('${listeDesClients[index].nomClient} supprimé'),
                    action: SnackBarAction(
                      label: 'Annulé',
                      onPressed: (){
                        setState(() {
                          listeDesClients.insert(index, listeDesClients[index]);
                        });
                      },
                    ),
                  ));
                },
              ),
              child: Card(
                elevation: 1.0,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                ),
                child: ListTile(
                  onLongPress: (){
                    return _showChoiceDialog(context);
                  },
                  onTap: () => Navigator.of(context).pushNamed(DetailsClients.tagDetailClient),
                  title: Text(listeDesClients[index].nomClient),
                  subtitle: Text(listeDesClients[index].numTelClient),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${listeDesClients[index].avatarCLient}'),
                    radius: 25,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    //Appbar
    final appbarListClient = AppBar(
      title: Text('Clients'),
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
      body: Wrap(
        children:<Widget>[
         listeclient(),
       ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pushNamed(CreerClient.tagCreerClient);
        },
      ),
    );
  }


}