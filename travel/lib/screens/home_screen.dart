import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../widgets/categories_list.dart';
import '../widgets/item_list.dart';
import '../widgets/picture_with_text.dart';
import '../widgets/search_with_button.dart';
import '../widgets/top_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset("assets/icons/search.svg"),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset("assets/icons/search.svg"),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset("assets/icons/search.svg"),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: SvgPicture.asset("assets/icons/search.svg"),
          ),
        ],
      ),
      backgroundColor: kDefaultBackgroundColor,
      body: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 2000),
        builder: (context, double? value, child) {
          return ShaderMask(
            shaderCallback: (rect) {
              return RadialGradient(
                radius: value != null ? value * 5 : 1 * 5,
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.transparent,
                  Colors.transparent
                ],
                stops: [0.0, 0.55, 0.6, 1.0],
                center: FractionalOffset(0.5, .85),
              ).createShader(rect);
            },
            child: child,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  kDefaultPadding, kDefaultPadding * 3, kDefaultPadding, 0),
              child: PictureWithText(),
            ),
            SizedBox(height: size.height * .035),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(kDefaultPadding, 0, kDefaultPadding, 0),
              child: SearchWithButton(),
            ),
            SizedBox(height: size.height * .035),
            Flexible(
              child: Padding(
                padding: EdgeInsets.fromLTRB(kDefaultPadding, 0, 0, 0),
                child: TopNavigationBar(),
              ),
            ),
            SizedBox(height: size.height * .0175),
            Padding(
              padding: EdgeInsets.fromLTRB(kDefaultPadding, 0, 0, 0),
              child: ItemList(),
            ),
            SizedBox(height: size.height * .035),
            Padding(
              padding: EdgeInsets.fromLTRB(kDefaultPadding, 0, 0, 0),
              child: Text(
                'Categories',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * .0185,
                ),
              ),
            ),
            SizedBox(height: size.height * .03),
            Padding(
              padding: EdgeInsets.fromLTRB(kDefaultPadding, 0, 0, 0),
              child: CategoriesList(),
            ),
          ],
        ),
      ),
    );
  }
}
