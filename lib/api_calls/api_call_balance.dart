import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://api.whatsonchain.com/v1/bsv/test/address/n19Ca185CcWNCKaZMkMaEqadi9V4dCZZeh/balance'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load price');
  }
}

class Album {
  final int confirmed;
  final int unconfirmed;

  const Album({
    required this.confirmed,
    required this.unconfirmed,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      confirmed: json['confirmed'],
      unconfirmed: json['unconfirmed'],
    );
  }
}

class ApiBalanceCall extends StatefulWidget {
  const ApiBalanceCall({Key? key}) : super(key: key);

  @override
  _ApiBalanceCallState createState() => _ApiBalanceCallState();
}

class _ApiBalanceCallState extends State<ApiBalanceCall> {
  late Future<Album> futureAlbum;

  double balance = 0;
  double balanceBSV = 0;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          balance = double.parse(snapshot.data!.confirmed.toString());
          balanceBSV = balance / 8000000;
          return Text(balance.toString()); //// * 8000000
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading message
        return const Text('loading');
      },
    );
  }

  int get data {
    return 3;
  }

  String get numerito => 'estomadkej';
}
