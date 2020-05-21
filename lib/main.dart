import 'package:fashiontailor/AccueilPage.dart';
import 'package:fashiontailor/ChoisirClient.dart';
import 'package:fashiontailor/ConnexionPage.dart';
import 'package:fashiontailor/CreationClient.dart';
import 'package:fashiontailor/CreationCommande.dart';
import 'package:fashiontailor/DetailsCommandes.dart';
import 'package:fashiontailor/DonneesClients.dart';
import 'package:fashiontailor/Home.dart';
import 'package:fashiontailor/InscriptionPage_1.dart';
import 'package:fashiontailor/InscriptionPage_2.dart';
import 'package:fashiontailor/ModelesHomme.dart';
import 'package:fashiontailor/ModifierClient.dart';
import 'package:fashiontailor/Parametres.dart';
import 'package:fashiontailor/ProfilePage.dart';
import 'package:fashiontailor/SousCategorie_Homme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FashionTailor());
}

class FashionTailor extends StatelessWidget {
  //
  final routes = <String, WidgetBuilder>{
    Inscription_1.tag: (context) => Inscription_1(),
    Inscription_2.tag: (context) => Inscription_2(),
    Homepage.tag: (context) => Homepage(),
    Connexion.tag: (context) => Connexion(),
    Accueil.tag: (context) => Accueil(),
    SousCategorieHomme.tagHomme: (context) => SousCategorieHomme('Hommes'),
    SousCategorieHomme.tagFemme: (context) => SousCategorieHomme('Femmes'),
    SousCategorieHomme.tagEnfants: (context) => SousCategorieHomme('Enfants'),
    SousCategorieHomme.tagCouples: (context) => SousCategorieHomme('Couples'),
    AlbumGidView.albumGridTag: (context) => AlbumGidView(),
    CreerClient.tagCreerClient: (context) => CreerClient(),
    CreerCommande.tagCreerCommande: (context) => CreerCommande(),
    ModifierClient.tagModifierClient: (context) => ModifierClient(),
    ChoisirClient.tagChoisirClient: (context) => ChoisirClient(),
    DetailsClients.tagDetailClient: (context) => DetailsClients(),
    DetailsCommandes.tagDetailsCommandes: (context) => DetailsCommandes(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Accueil(),
      routes: routes,
    );
  }
}

