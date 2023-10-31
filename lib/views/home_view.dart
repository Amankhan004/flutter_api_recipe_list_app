import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_api/models/recipe.dart';
import 'package:flutter_recipe_app_api/models/recipe_api.dart';
import 'package:flutter_recipe_app_api/views/widgets/recipe_card.dart';
import 'package:http/http.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<Recipe> recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restaurant_menu,
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Text(
                'Food Recipe',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: recipes[index].name,
                      cookTime: recipes[index].totalTime,
                      rating: recipes[index].rating.toString(),
                      thumbnailUrl: recipes[index].images);
                },
              ));
  }
}
