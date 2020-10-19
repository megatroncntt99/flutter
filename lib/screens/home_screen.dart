import 'package:flutter/material.dart';
import 'package:flutter_covid_19/config/palette.dart';
import 'package:flutter_covid_19/config/styles.dart';
import 'package:flutter_covid_19/data/data.dart';
import 'package:flutter_covid_19/screens/widget/country_dropdown.dart';

import 'widget/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country = 'USA';
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(physics: ClampingScrollPhysics(), slivers: [
        _buildHeader(sizeScreen.height),
        _buildPreventionTip(sizeScreen.height),
        _buildYourOwnTest(sizeScreen.height),
      ]),
    );
  }

  SliverToBoxAdapter _buildHeader(double heightScreen) {
    return SliverToBoxAdapter(
        child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "covid-19".toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              CountryDropdown(
                countries: ['USA', 'IN', 'FR', 'UK', 'CN', 'IT'],
                country: _country,
                onChange: (value) => this.setState(() {
                  _country = value;
                }),
              ),
            ],
          ),
          SizedBox(
            height: heightScreen * 0.03,
          ),
          Text(
            "Are you feeling sick?",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: heightScreen * 0.01,
          ),
          Text(
            "If you feel sick with any COVID-19 symptoms please call or text us immediately for help.",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: heightScreen * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FlatButton.icon(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.red,
                icon: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                label: Text(
                  "Call Now",
                  style: Styles.buttonTextStyle,
                ),
                textColor: Colors.white,
              ),
              FlatButton.icon(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.green,
                icon: Icon(
                  Icons.chat_bubble,
                  color: Colors.white,
                ),
                label: Text(
                  "Send SMS",
                  style: Styles.buttonTextStyle,
                ),
                textColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    ));
  }

  SliverToBoxAdapter _buildPreventionTip(double heightScreen) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Prevention Tips",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention
                  .map((e) => Column(
                        children: [
                          Image.asset(e.keys.first,
                              height: heightScreen * 0.12),
                          SizedBox(
                            height: heightScreen * 0.015,
                          ),
                          Text(
                            e.values.first,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double heightScreen) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: heightScreen * 0.15,
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFFAD9FE4), Palette.primaryColor]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/own_test.png"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do your own test!",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: heightScreen * 0.01,
                ),
                Text(
                  "Follow the instructions \nto do your ower test.",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  maxLines: 2,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
