import 'package:flutter/material.dart';
import 'package:masakyuk/data.dart';
import 'package:masakyuk/detailscreen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Resep> resep = makananList;
    return  Scaffold(
      body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
              child: const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  'Favorite',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),     
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index, ){
                    final Resep resep = makananList[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(resep: resep,))),
                      child: Hero(
                        tag: 'pp',
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
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(resep.namaMakanan, style: TextStyle(fontSize: 18, color: Colors.black),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                ),
              )               
           ],
        ),
      ),                
      ),
    );
  }
}
