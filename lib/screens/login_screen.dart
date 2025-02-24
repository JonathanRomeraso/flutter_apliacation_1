import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global_values.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValidating = false;
  @override
  Widget build(BuildContext context) {
    final txtUser = TextFormField(
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: "Introduce el usuario"),
    );

    final txtPass = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), hintText: "Introduce la contraseña"),
    );

    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        opacity: 0.3,
        fit: BoxFit.cover,
        image: AssetImage("assets/fondo.jpg"),
      )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 500,
              child: ValueListenableBuilder(
                  valueListenable: GlobalValues.isValidating,
                  builder: (context, value, child) {
                    GlobalValues.isValidating.value = false;
                    return value ? CircularProgressIndicator() : Container();
                  })
              //isValidating ? CircularProgressIndicator() : Container(),
              ),
          Positioned(
            top: 270,
            left: 2,
            child: Lottie.asset("assets/tecnm.json", height: 250),
          ),
          Positioned(
              bottom: 50,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 250,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 248, 254),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    txtUser,
                    const SizedBox(
                      height: 10,
                    ),
                    txtPass,
                    GestureDetector(
                      onTap: () {
                        GlobalValues.isValidating.value = true;
                        //isValidating = true;
                        //setState(() {});
                        Future.delayed(Duration(milliseconds: 4000)).then(
                          (value) {
                            //isValidating = false;
                            //setState(() {});
                            Navigator.pushNamed(context, "/dash");
                          },
                        );
                      },
                      //onTap: () => Navigator.pushNamed(context, "/list"),
                      /*
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListStudentsScreen(),
                          )),
                      */
                      child: Image.asset(
                        "assets/buttonSignUp.png",
                        height: 80,
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}
