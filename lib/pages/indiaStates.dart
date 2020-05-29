import 'package:covidtracker/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IndiaState extends StatefulWidget {
  @override
  _IndiaStateState createState() => _IndiaStateState();
}

class _IndiaStateState extends State<IndiaState> {
  List countryData;
  Map overallIndia;
  fetchIndiaStateData() async {
    http.Response response =
        await http.get('https://api.rootnet.in/covid19-in/stats/latest');
    setState(() {
      overallIndia = json.decode(response.body)['data']['summary'];
      countryData = json.decode(response.body)['data']['regional'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchIndiaStateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('India Stats'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: Search(countryData, 2));
            },
          )
        ],
      ),
      body: countryData == null
          ? CircularProgressIndicator()
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 130,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 150,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              countryData[index]['loc'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Confirmed : ' +
                                    countryData[index]['totalConfirmed']
                                        .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red.shade800),
                              ),
                              Text(
                                'Foreign Cases: ' +
                                    countryData[index]['confirmedCasesForeign']
                                        .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade800),
                              ),
                              Text(
                                'Recovered : ' +
                                    countryData[index]['discharged'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green.shade800),
                              ),
                              Text(
                                'Deaths : ' +
                                    countryData[index]['deaths'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
