import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_19/config/palette.dart';
import 'package:flutter_covid_19/data/data.dart';
import 'package:flutter_covid_19/screens/widget/custom_app_bar.dart';
import 'package:flutter_covid_19/screens/widget/stats_gird.dart';

import 'widget/covid_bar_chart.dart';

class StatsScreen extends StatefulWidget {
  StatsScreen({Key key}) : super(key: key);

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Palette.primaryColor,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(),
          _buildRegionTabBar(),
          _buildStatsTabBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: StatsGird(),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: CovidBarChart(
                covidCases: covidUSADailyNewCases,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Statistics",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverPadding _buildRegionTabBar() {
    return SliverPadding(
        padding: const EdgeInsets.all(20),
        sliver: SliverToBoxAdapter(
            child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white24,
          ),
          child: DefaultTabController(
            length: 2,
            child: TabBar(
              indicator: BubbleTabIndicator(
                indicatorColor: Colors.white,
                indicatorHeight: 40,
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
              ),
              unselectedLabelColor: Colors.white,
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              tabs: [
                Text("My Country"),
                Text("Global"),
              ],
              onTap: (value) {
                print(value);
              },
            ),
          ),
        )));
  }

  SliverPadding _buildStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.white60,
            labelColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            tabs: [
              Text("Total"),
              Text("To day"),
              Text("Yesterday"),
            ],
            onTap: (value) {
              print(value);
            },
          ),
        ),
      ),
    );
  }
}
