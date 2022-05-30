import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:masakyuk/data.dart';
import 'package:masakyuk/homescreen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  
  PanelController _panelController = PanelController();

  void toggleUpPanel() => _panelController.isPanelOpen ? _panelController.close() : _panelController.open();
  final Resep resep;
  DetailScreen({ Key? key, required this.resep }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        controller: _panelController,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        minHeight: MediaQuery.of(context).size.height * 0.67,
        body: Stack(
          children: [
            Hero(
              tag: "pp", 
              child: ClipRRect(
                child: Image.network(resep.imageUrls, fit: BoxFit.cover,)
              ),
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context), 
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                  ),
                  FavoriteButton()
                ],
              ),
            )
          ],
        ),
        panelBuilder: (controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: toggleUpPanel,
                    child: Center(
                      child: Container(
                        width: 30,
                        height: 6,
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ),
                  Container(child: Text(resep.namaMakanan,style: GoogleFonts.sourceSansPro(fontSize:30,color: Colors.black))),
                  SizedBox(height: 8),
                  Container(child: Text('Bahan :', style: GoogleFonts.lato(fontSize:20,color: Colors.black))),
                  SizedBox(height: 8,),
                  Container(child: Text(resep.resep, style: GoogleFonts.lato(fontSize: 18, color: Colors.black))),
                  SizedBox(height: 8,),
                  Container(child: Text('Cara Memasak:', style: GoogleFonts.lato(fontSize: 20, color: Colors.black))),
                  SizedBox(height: 8,),
                  Container(child: Text(resep.cara, style: GoogleFonts.lato(fontSize: 18, color: Colors.black))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}
 
 
class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
 
 
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}


