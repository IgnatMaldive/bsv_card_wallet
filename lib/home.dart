// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:littlewallet/settings.dart';
import 'api_calls/api_call_price.dart';
import 'api_calls/api_call_balance.dart';
import 'account_setup.dart';

//var dollarPrice = int.parse(ApiPriceCall().toString());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String miString = 'holita';
    double miNum = 0;

    print('asfff $miString');
//    print(miString);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 223, 223),
        body: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              margin: EdgeInsets.all(20),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white)),
              child: SizedBox(
                height: 200,
//
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 5,
                            child: ListTile(
                              title: Text("23.000 Satoshi"),
                              subtitle: Text("0.04 \$"),
                            ),
                          ),
                        ],
                      ),
                      flex: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.settings),
                              color: Colors.grey,
                              tooltip: 'Settings',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Settings()),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 120),
                        Row(
                          children: [
                            TextButton(
                              child: Text("SEND"),
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            TextButton(
                              child: Text("RECEIVE"),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                //AlbumCall(),
                SizedBox(
                  width: 20,
                ),
                Text('user@paymail.com'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                // Text(
                //   'Second Key: ',
                // ),
                AccountSetup(),
                // Text(AccountSetup().textPushed2),
                // Text(AccountSetup().numerito),
                // Text(AccountSetup().miCadena),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                //AlbumCall(),
                SizedBox(
                  width: 20,
                ),
                Text('Current BSV price: '),
                ApiPriceCall(),
//                Text(miString.toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 20,
                ),
                //AlbumCall(),
                Text('Account balance: '),
//                Text(ApiBalanceCall()),
//                ApiBalanceCall(),
                ApiBalanceCall(),
//                miNum = int.parse(ApiBalanceCall())
//                Text(ApiBalanceCall().toString()),

//                miString.data,

//                Text(miString),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 20,
                ),
                //AlbumCall(),
                Text('Dollar balance: '),
                //GetPriceDollar(),
                // Student(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 20,
                ),
                //AlbumCall(),
                Text('Network: TestNet '),
                //               Text(miString),

                // Student(),
              ],
            ),
          ],
        ));
  }
}
