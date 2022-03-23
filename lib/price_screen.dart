import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'album.dart';

// https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=A44CC6B1-AEF0-487D-AA20-3DF8F9FC433D
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  int? startingRate;
  late Future<Album> futureAlbum;

  getmenuItems() {
    List<DropdownMenuItem<String>> menuItems = [];
    for (String currency in currenciesList) {
      var a = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      menuItems.add(a);
    }
    return menuItems;
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                  child: FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          '1 BTC = ${(snapshot.data!.rate).toInt()} ${snapshot.data!.asset}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  )),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
                icon: Icon(Icons.menu),
                value: selectedCurrency,
                items: getmenuItems(),
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value!;
                  });
                }),
          ),
        ],
      ),
    );
  }
}

// Text(
// '1 BTC = ${startingRate} USD',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 20.0,
// color: Colors.white,
// ),
// ),
