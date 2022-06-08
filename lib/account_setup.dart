import 'package:flutter/material.dart';
import 'MyWallet.dart';

class AccountSetup extends StatelessWidget {
  AccountSetup({Key? key}) : super(key: key);
//  String miCadena = 'micadenita';

  // String devuelveCadena() {
  //   return miCadena;
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var MNEMONIC =
        'edge eagle zoo dog zone tiger emerge trial limit tiger average basket';

    var wallet = MyWallet.fromSeed(MNEMONIC);

    var faucetAddress =
        wallet.receivingAddress; //we "receive" faucet funds here
    var spendingAddress = wallet.spendingAddress; //our second address

    String cuenta = faucetAddress.toString();
    String miCadena = spendingAddress.toString();

    print("Receiving Address : ${faucetAddress} "); //send Faucet coins here
    print("Spending Address : ${spendingAddress}"); //send received coins here

//    return Text(cuenta);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Receive: '),
            Text(cuenta),
          ],
        ),
        Row(
          children: [
            Text('Spend: '),
            Text(miCadena),
          ],
        ),
      ],
    );
  }

  String get numerito => 'esto';

  Text get textPushed {
    return const Text(
      'first text',
    );
  }

  String get textPushed2 {
    return ('aquello');
  }
}
