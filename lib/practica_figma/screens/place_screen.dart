import 'package:flutter/material.dart';
import 'package:flutter_application_1/practica_figma/views/info_place_widget.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          //borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ////////////////////////////////////////////////////////////////////////////////////
            // Image
            Container(
              padding: const EdgeInsets.only(top: 26),
              width: double.infinity,
              height: 480,
              margin: EdgeInsets.only(left: 28, top: 28, bottom: 28, right: 28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(args['imageUrl']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    top: 0,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/home");
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(29, 29, 29, 0.4),
                        ),
                        child: Image.asset(
                          "assets/PracticaFigma/icons/arrow_left_icon.png",
                          width: 22,
                          height: 22,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(29, 29, 29, 0.4),
                      ),
                      child: Image.asset(
                        "assets/PracticaFigma/icons/archive_icon.png",
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 21,
                      vertical: 29,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 104,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(0.6),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                args['placeName'],
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: "Inter",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Price",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Roboto",
                                  color: Color(0xFFCAC8C8),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/PracticaFigma/icons/ubi_icon.png",
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    "${args['city']}, ${args['country']}",
                                    style: TextStyle(
                                      color: Color(0xFFCAC8C8),
                                      fontSize: 18,
                                      fontFamily: "Roboto",
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                "\$230",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                ),
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

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 28, top: 40, right: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ////////////////////////////////////////////////////////////////////////////////////
                    //Over View
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Overview",
                          style: TextStyle(
                            color: Color.fromRGBO(27, 27, 27, 1),
                            fontSize: 22,
                            fontFamily: "Inter",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Text(
                            "Details",
                            style: TextStyle(
                              color: Color.fromRGBO(27, 27, 27, .62),
                              fontSize: 16,
                              fontFamily: "Inter",
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoPlaceWidget(
                            icon: "assets/PracticaFigma/icons/clock_icon.png",
                            label: "8 hours",
                          ),
                          InfoPlaceWidget(
                            icon: "assets/PracticaFigma/icons/cloud_icon.png",
                            label: "16°C",
                          ),
                          InfoPlaceWidget(
                            icon: "assets/PracticaFigma/icons/start2_icon.png",
                            label: "4.5",
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 14),
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [
                            Color.fromRGBO(165, 165, 165, 1),
                            Color.fromRGBO(165, 165, 165, 0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      child: Text(
                        "This vast mountain range is renowned for its remarkable diversity in terms of topography and climate. "
                        "It features towering peaks, active volcanoes, deep canyons, expansive plateaus.",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                          letterSpacing: 1.52,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(height: 20),

                    ////////////////////////////////////////////////////////////////////////////////////
                    // Book Button
                    Padding(
                      padding: const EdgeInsets.only(left: 28, right: 29),
                      child: Center(
                        child: SizedBox(
                          height: 66,
                          width: 373,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Book Now",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Roboto",
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Image.asset("assets/PracticaFigma/icons/send_icon.png", height: 23),
                              ],
                            ),
                          ),
                        ),
                      ),
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
