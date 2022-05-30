
import 'package:flutter/material.dart';
import 'package:masakyuk/favorite.dart';
import 'package:masakyuk/data.dart';
import 'package:masakyuk/detailscreen.dart';
import 'package:masakyuk/profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     List<Resep> resep = makananList;
    return const BottomNavi();
  }
}

class BottomNavi extends StatefulWidget {
  const BottomNavi({ Key? key }) : super(key: key);

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {

  int currentIndex = 0;
  final List <Widget> body =[
    const HomePage(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.orange),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        onTap: ontap,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.orange,
        items: [
        const BottomNavigationBarItem(
         icon: const Icon(Icons.home,),
         label: "Home",
         ),
         const BottomNavigationBarItem(
         icon: Icon(Icons.fastfood,),
         label: 'favorite',
         ),
         const BottomNavigationBarItem(
         icon: Icon(Icons.food_bank_outlined),
         label: 'Profile',
         ),
        ],
      ),
      );
  }

  void ontap(int index){
    setState(() {
      currentIndex = index;
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Resep> resep = makananList;

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Masakyuk'),
        backgroundColor: const Color.fromARGB(235, 245, 135, 51),
      ),
      body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(resep: makananList[0],))),
                child: Stack(
                  children: [
                    Hero(
                      tag: 'pp',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(resep[0].imageUrls, fit: BoxFit.cover, )
                        ),
                    ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromARGB(255, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                    const Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text("Garlic Butter Shrimp", style: TextStyle(fontSize: 24, color: Colors.white),)),
                  ]
                ),
              ),
              Container(
              child: const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                  'Popular Recipe',
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
                  itemCount: makananList.length,
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
           ],
        ),
      ),                
      ),
    );
  }
}

