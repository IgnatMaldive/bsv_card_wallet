import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://api.whatsonchain.com/v1/bsv/main/exchangerate'));

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
  final String currency;
  final String rate;

  const Album({
    required this.currency,
    required this.rate,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      currency: json['currency'],
      rate: json['rate'],
    );
  }
}

class ApiPriceCall extends StatefulWidget {
  const ApiPriceCall({Key? key}) : super(key: key);

  @override
  _ApiPriceCallState createState() => _ApiPriceCallState();
}

class _ApiPriceCallState extends State<ApiPriceCall> {
  late Future<Album> futureAlbum;

  double precio = 0;
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
          precio = double.parse(snapshot.data!.rate);
          return Text(precio.toStringAsFixed(2));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const Text('loading');
      },
    );
  }
}
