import 'package:flutter/material.dart';
import 'package:restaurante/models/categ.api.dart';
import 'package:restaurante/models/categ.dart';
import 'package:restaurante/views/widgets/categ_card.dart';

class CategHomePage extends StatefulWidget {
  static String id = 'categ_home_page';
  @override
  _CategHomePageState createState() => _CategHomePageState();
}

class _CategHomePageState extends State<CategHomePage> {
  late List<Categ> _categs;
  bool _isLoading = true;

  @override
  void initState() {
    // // TODO: implement initState
    super.initState();

    getCategs();
  }

  Future<void> getCategs() async {
    _categs = await CategApi.getCateg();
    setState(() {
      _isLoading = false;
    });
    print(_categs);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food & Drink - Categorias')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _categs.length,
                itemBuilder: (context, index) {
                  return CategCard(
                      description: _categs[index].description,
                      nombre: _categs[index].nombre.toString(),
                      thumbnailUrl: _categs[index].images);
                },
              )
        // RecipeCard(
        //     description:
        //         "Todas nuestras pechugas vienen acompañadas de papas a la francesa, arepa y ensalada.",
        //     nombre:
        //         'Todas nuestras pechugas vienen acompañadas de papas a la francesa, arepa y ensalada.',
        //     precio: '20000',
        //     thumbnailUrl:
        //         'https://elrancherito.com.co/wp-content/uploads/2020/06/Pechuga-a-la-parrillada-100x100.jpg'),
        // RecipeCard(
        //     description: "My Recipe",
        //     nombre: '30 min',
        //     precio: '4.3',
        //     thumbnailUrl:
        //         'https://elrancherito.com.co/wp-content/uploads/2020/06/Pechuga-a-la-parrillada-600x600.jpg')
        //));
        );
  }
}
