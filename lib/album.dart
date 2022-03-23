import 'dart:convert';
import 'package:http/http.dart' as http;

class Album {
  final String asset;
  final double rate;

  const Album({
    required this.asset,
    required this.rate,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      asset: json['src_side_base'][0]['asset'],
      rate: json['src_side_base'][0]['rate'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http.get(
    Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=A44CC6B1-AEF0-487D-AA20-3DF8F9FC433D'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
