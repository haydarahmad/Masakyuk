import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masakyuk/data.dart';
import 'package:masakyuk/detailscreen.dart';


class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var body = GridView.builder(
        shrinkWrap: false,
        itemCount: makananList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(resep: makananList[index])));
              },
              child: Card(
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Hero(
                            tag: 'pp',
                            child: Image.network(makananList[index].imageUrls,
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          makananList[index].namaMakanan,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
    return Scaffold(
      body: body,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Explore',
              style: GoogleFonts.lato(
            color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
    );
  }
}
