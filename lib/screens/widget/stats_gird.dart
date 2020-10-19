import 'package:flutter/material.dart';

class StatsGird extends StatelessWidget {
  const StatsGird({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          children: [
            Flexible(
                child: Row(
              children: [
                _buildStatCard(
                  "Total Cases",
                  "1.81 M",
                  Colors.orange,
                ),
                _buildStatCard(
                  "Deaths",
                  "105 K",
                  Colors.red,
                ),
              ],
            )),
            Flexible(
                child: Row(
              children: [
                _buildStatCard(
                  "Recovered",
                  "391 M",
                  Colors.green,
                ),
                _buildStatCard(
                  "Active",
                  "105 K",
                  Colors.blue,
                ),
                _buildStatCard(
                  "Deaths",
                  "N/A",
                  Colors.purple,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String count, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
