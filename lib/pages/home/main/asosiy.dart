import 'package:flutter/material.dart';

class Asosiy extends StatefulWidget {
  const Asosiy({super.key});

  @override
  State<Asosiy> createState() => _AsosiyState();
}

class _AsosiyState extends State<Asosiy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Departments /Categories"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "What do you want to \n Consult you like",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/image/image 16 (1).png",
                  ),
                ),
                GestureDetector(
                  child: Image.asset("assets/image/image 16.png"),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    "assets/image/image 18.png",
                  ),
                ),
                GestureDetector(
                  child: Image.asset("assets/image/image 19.png"),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    "assets/image/image 21.png",
                  ),
                ),
                GestureDetector(
                  child: Image.asset("assets/image/image 22.png"),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    "assets/image/image 16 (1).png",
                  ),
                ),
                GestureDetector(
                  child: Image.asset("assets/image/image 16.png"),
                ),
              ],
            ),
            SizedBox(
              height: 140,
            ),
            GestureDetector(
              onTap: () {
                //Navigator
              },
              child: Container(
                height: 53,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(child: Text("Continue")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
