import 'dart:convert';
import 'package:restaurante/models/categ.dart';
import 'package:http/http.dart' as http;

class CategApi {
//var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
  // "limit": "18",
  // "start": "0",
  // "tag": "list.recipe.popular"
// });

// req.headers({
  // "x-rapidapi-host": "yummly2.p.rapidapi.com",
  // "x-rapidapi-key": "ed7a2a0d60msh760fbb43282f9b1p162ae3jsnd807e5ea6e2f",
  // "useQueryString": true
// });

  static Future<List<Categ>> getCateg() async {
    //var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
    var uri = Uri.https(
      'wsc.fabricasoftware.co',
      'api/categorias',
    );
    //  {"limit": "18", "start": "0", "tag": "list.recipe.popular"});
    //);

    final response = await http.get(uri
        // , headers: {
        //   "x-rapidapi-host": "yummly2.p.rapidapi.com",
        //   "x-rapidapi-key": "ed7a2a0d60msh760fbb43282f9b1p162ae3jsnd807e5ea6e2f",
        //   "useQueryString": 'true'
        // }
        );

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['datos']) {
      _temp.add(i);
    }

    return Categ.categsFromSnapshot(_temp);
  }
}
