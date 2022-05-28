import 'package:coffeeappui/utils/coffee_names.dart';
import 'package:coffeeappui/utils/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //user tapped functions
  final List coffeeType = [
    // [coffee type, selectedStatus]

    [
      'Capucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Brown Coffee',
      false,
    ],
    [
      'Matcha',
      false,
    ],
  ];

  void coffeeSelectionTap(int index) {
    setState(() {
      //coffeeType[index][1] = true;

      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }

      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
      ),
      body: Column(
        children: [
          //Text Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find The Best Coffee For You",
              style: GoogleFonts.bebasNeue(fontSize: 60),
            ),
          ),
          SizedBox(height: 25),

          //SearchBar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search What kind of Coffee You Love',
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
              ),
            ),
          ),

          SizedBox(
            height: 25,
          ),

          //Horizontal ListView of CoffeeTypes
          Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeTypes(
                        coffeeType: coffeeType[index][0],
                        isSelected: coffeeType[index][1],
                        onTap: () {
                          coffeeSelectionTap(index);
                        });
                  })),

          // Horizontal ListView of Coffee Tiles

          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: 'assets/latte.jpeg',
                coffeeName: 'Latte',
                coffeePrice: '4.20',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/c1.jpeg',
                coffeeName: 'Brown Coffee',
                coffeePrice: '5.65',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/milk.jpeg',
                coffeeName: 'Matcha',
                coffeePrice: '6.75',
              ),
            ],
          ))
        ],
      ),
    );
  }
}
