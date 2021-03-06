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
  // String coin = 'BTC';
  late Future<Album> futureAlbumBTC;
  late Future<Album> futureAlbumETH;
  late Future<Album> futureAlbumLTC;

  getRateFromValue(coin, value) {
    futureAlbumBTC = fetchAlbumBTC('BTC', value);
    futureAlbumETH = fetchAlbumETH('ETH', value);
    futureAlbumLTC = fetchAlbumLTC('LTC', value);
  }

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
    String value = 'USD';
    getRateFromValue('BTC', value);
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
                    future: futureAlbumBTC,
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
                    future: futureAlbumETH,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          '1 ETH = ${(snapshot.data!.rate).toInt()} ${snapshot.data!.asset}',
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
                    future: futureAlbumLTC,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          '1 LTC = ${(snapshot.data!.rate).toInt()} ${snapshot.data!.asset}',
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
          SizedBox(height: 150),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
                icon: Icon(Icons.menu),
                style: TextStyle(fontSize: 18),
                value: selectedCurrency,
                items: getmenuItems(),
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value!;
                    getRateFromValue('BTC', value);
                    getRateFromValue('BTC', value);
                    getRateFromValue('BTC', value);
                  });
                }),
          ),
        ],
      ),
    );
  }
}
