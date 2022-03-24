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
      asset: json['asset_id_quote'],
      rate: json['rate'],
    );
  }
}

Future<Album> fetchAlbumBTC(coin, value) async {
  final response = await http.get(
    Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$coin/$value?apikey=FADA8B3C-FFAE-4F4A-8949-39839FA99C62'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Album> fetchAlbumETH(coin, value) async {
  final response = await http.get(
    Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$coin/$value?apikey=FADA8B3C-FFAE-4F4A-8949-39839FA99C62'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Album> fetchAlbumLTC(coin, value) async {
  final response = await http.get(
    Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$coin/$value?apikey=FADA8B3C-FFAE-4F4A-8949-39839FA99C62'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
