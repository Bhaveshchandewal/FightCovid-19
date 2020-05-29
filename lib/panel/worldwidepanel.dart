import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map worldData;

  const WorldwidePanel({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(
              title: 'Confirmed',
              panelColor: Colors.red.shade800,
              textColor: Colors.red.shade100,
              count: worldData['cases'].toString()),
          StatusPanel(
              title: 'Active',
              panelColor: Colors.blue.shade800,
              textColor: Colors.blue.shade100,
              count: worldData['active'].toString()),
          StatusPanel(
              title: 'Recovered',
              panelColor: Colors.green.shade800,
              textColor: Colors.green.shade100,
              count: worldData['recovered'].toString()),
          StatusPanel(
              title: 'Deaths',
              panelColor: Colors.grey.shade800,
              textColor: Colors.grey.shade100,
              count: worldData['deaths'].toString()),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      //decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
      margin: EdgeInsets.all(10.0),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16.0, color: textColor),
          )
        ],
      ),
    );
  }
}
