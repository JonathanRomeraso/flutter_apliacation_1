import 'package:flutter/material.dart';

class PlaceCardWidget extends StatelessWidget {
  final String imageUrl;
  final String placeName;
  final String city;
  final String country;
  final double rating;
  const PlaceCardWidget({
    required this.imageUrl,
    required this.placeName,
    required this.city,
    required this.rating,
    required this.country,

    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      margin: EdgeInsets.only(left: 26, top: 45, bottom: 56),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 26, left: 20, bottom: 25),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              top: 12,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.8),
                ),
                child: Image.asset(
                  "assets/PracticaFigma/icons/navigation/icon_heart.png",
                  width: 22,
                  height: 22,
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/Place",
                  arguments: {
                    'imageUrl': imageUrl,
                    'placeName': placeName,
                    'city': city,
                    'country': country,
                    'rating': rating,
                  },
                );
              },

              child: Container(
                padding: EdgeInsets.all(10),
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                    bottom: Radius.circular(15),
                  ),
                  color: Colors.black.withOpacity(0.6),
                ),
                ////////////////////////////////////////////////////////////////////////////////////
                // Data
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          Text(
                            "$placeName, ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(202, 200, 200, 1),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            city,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 14,
                                right: 16,
                              ),
                              child: Image(
                                image: AssetImage("assets/PracticaFigma/icons/ubi_icon.png"),
                                width: 16,
                                height: 16,
                              ),
                            ),
                            Text(
                              "$city, $country",
                              style: TextStyle(
                                color: Color.fromRGBO(202, 200, 200, 1),
                                fontSize: 14,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Image(
                                image: AssetImage("assets/PracticaFigma/icons/start_icon.png"),
                                width: 12,
                                height: 12,
                              ),
                            ),
                            Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
