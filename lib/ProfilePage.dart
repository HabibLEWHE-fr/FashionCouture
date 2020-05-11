import 'package:flutter/material.dart';

class ProfileCouturier extends StatefulWidget {
  @override
  _ProfileCouturierState createState() => _ProfileCouturierState();
}

class _ProfileCouturierState extends State<ProfileCouturier> {
  @override
  Widget build(BuildContext context) {

    final appbarProfile = AppBar(
      title: Text('Mon compte'),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: null
        ),
      ],
      leading:
      IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );

    return Scaffold(
      appBar: appbarProfile,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/image2.jpg'),
                radius: 50.0,
              ),
            ),
            Divider(
              height: 80.0,
              color: Colors.black87,
            ),
            Text(
              'Nom et Prenom',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 7.0,),
            Text(
              'LEWHE Habib',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue[300],
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              'Spécialité',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 7.0,),
            Text(
              'Styliste',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue[300],
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              'Type de couturier',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 7.0,),
            Text(
              'Couturier Homme',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue[300],
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              'Téléphone',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 7.0,),
            Text(
              '61951451',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue[300],
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              'Adresse',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 7.0,),
            Text(
              'Ekpe Marina Pk10',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlue[300],
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
