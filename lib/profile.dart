import 'package:flutter/material.dart';
import 'package:masakyuk/data.dart';

import 'detailscreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children:[
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Container(
              height: 40,
              child: Text(
                "Profile",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
          height:115,
          width: 115,
          child: Stack(
          fit: StackFit.expand,
          children:[
           CircleAvatar(
            backgroundImage: AssetImage("lib/component/Images/Avatar.jpeg")
            )
            ], 
        ),
    ),
    Padding(
      padding: const EdgeInsets.only(top:15),
      child: Text(
        "Fattan Haydar Ahmad",
        style: TextStyle(fontSize: 20),
        ),
    ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 48.0,
                      width: 100.0,
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.telegram),
                          SizedBox(height: 8.0),
                          Text("Haydar",)
                        ],
                      ),
                    ),
                    Container(
                      height: 48.0,
                      width: 100.0,
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.facebook),
                          SizedBox(height: 8.0),
                          Text("ahmad")
                        ],
                      ),
                    ),
                    Container(
                      height: 48.0,
                      width: 100.0,
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.email),
                          SizedBox(height: 8.0),
                          Text("haydar")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    Padding(
      padding: const EdgeInsets.only(top:40,right: 250),
      child: Text(
        "Your recipes:",
        style: TextStyle(fontSize: 20),
        ),
    ),
         Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index, ){
                    final Resep resep = makananList[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(resep: resep,))),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                                  
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 70,
                                    child: Image.network(resep.imageUrls, fit: BoxFit.cover, ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(resep.namaMakanan, style: const TextStyle(fontSize: 18, color: Colors.black),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ) 
        ]),
      )
    );
  }
}