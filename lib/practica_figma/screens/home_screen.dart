import 'package:flutter/material.dart';
import 'package:flutter_application_1/practica_figma/views/filter_button_group.dart';
import 'package:flutter_application_1/practica_figma/views/place_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ////////////////////////////////////////////////////////////////////////////////////
            // Data
            Padding(
              padding: const EdgeInsets.only(left: 26, top: 34, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi, David 👋",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Montserrat",
                      color: const Color.fromRGBO(47, 47, 47, 1),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 75,
                    width: 75,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/PracticaFigma/avatar/avatar1.png")
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9, left: 26),
              child: Text(
                "Explore the world",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Inter",
                  color: const Color.fromRGBO(136, 136, 136, 1),
                  letterSpacing: 0.5,
                ),
              ),
            ),
            ////////////////////////////////////////////////////////////////////////////////////
            // Search Bar
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, top: 38),
              child: SizedBox(
                height: 58,
                child: TextField(
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: const Color.fromRGBO(136, 136, 136, 1),
                  ),
                  decoration: InputDecoration(
                    hintText: "Search places",
                    hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      color: const Color.fromRGBO(136, 136, 136, 1),
                    ),
                    contentPadding: EdgeInsets.only(left: 31),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 26),
                          child: Image.asset("assets/PracticaFigma/icons/line_icon.png", width: 32),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.23),
                          child: Image.asset(
                            "assets/PracticaFigma/icons/filter_icon.png",
                            width: 24,
                            height: 21.77,
                          ),
                        ),
                      ],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(210, 210, 210, 1),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(210, 210, 210, 1),
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            ////////////////////////////////////////////////////////////////////////////////////
            // Filter Buttons
            const SizedBox(height: 42),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Text(
                    "Popular Places ",
                    style: TextStyle(
                      fontFamily: "Poopins",
                      fontSize: 20,
                      color: Color.fromRGBO(47, 47, 47, 1),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 27),
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      color: Color.fromRGBO(136, 136, 136, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            FilterButtonGroup(),
            ////////////////////////////////////////////////////////////////////////////////////
            // Places List
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PlaceCardWidget(
                    imageUrl: "assets/PracticaFigma/images/places/Place2.png",
                    placeName: "Mount Fuji",
                    city: "Tokyo",
                    rating: 4.8,
                    country: "Japan",
                  ),
                  PlaceCardWidget(
                    imageUrl: "assets/PracticaFigma/images/places/Place1.png",
                    placeName: "Andes Mountain",
                    city: "South",
                    rating: 4.7,
                    country: "America",
                  ),
                  PlaceCardWidget(
                    imageUrl: "assets/PracticaFigma/images/places/Place2.png",
                    placeName: "Andes Mountain",
                    city: "South",
                    rating: 4.7,
                    country: "America",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      ////////////////////////////////////////////////////////////////////////////////////
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Image.asset("assets/PracticaFigma/icons/navigation/icon_home.png", height: 22.97),
                Positioned(
                  bottom: -15,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/PracticaFigma/icons/navigation/icon_clock.png",
              height: 22.97,
            ),

            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/PracticaFigma/icons/navigation/icon_heart.png",
              height: 22.97,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/PracticaFigma/icons/navigation/icon_user.png", height: 22.97),
            label: "",
          ),
        ],
        currentIndex: 0,
      ),
    );
  }
}
