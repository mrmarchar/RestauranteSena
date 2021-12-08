import 'package:flutter/material.dart';
import 'package:restaurante/models/recipe.api.dart';
import 'package:restaurante/models/recipe.dart';
import 'package:restaurante/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  static String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    // // TODO: implement initState
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
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
              Text('Food & Drink - Productos')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      description: _recipes[index].description,
                      nombre: _recipes[index].nombre.toString(),
                      precio: _recipes[index].precio.toString(),
                      thumbnailUrl: _recipes[index].images);
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
