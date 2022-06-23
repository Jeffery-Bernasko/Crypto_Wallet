import 'package:crypto_wallet/net/flutterfire.dart';
import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  const AddView({ Key key }) : super(key: key);

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {

  List coins = [
    "bitcoin",
    "thether",
    "etherum"
  ];

  String dropdownValue = "bitcoin";
  TextEditingController _amountController = TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: dropdownValue,
            onChanged: (String value) {
              setState(() {
                dropdownValue = value;
              });
            },
            items: coins.map<DropdownMenuItem<String>>(( value) {

              return DropdownMenuItem<String> (
                value: value,
                child: Text(value),
                );
            }).toList() ,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Coin Amount',
              ),
            ),
          ),
            Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.white,
                ),

                child: MaterialButton(
                  onPressed: () async {
                   // TO Do
                   await addCoin(dropdownValue, _amountController.text);
                   Navigator.of(context).pop();
                  },
                  child: Text('Add'),
                ),
              )
        ],
      ),
    );
  }
}