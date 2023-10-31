import 'dart:convert';
import 'package:flutter_recipe_app_api/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": '66c19bd2femshe1f91cb2bf622ffp116df9jsnbe374d5344d7',
      "x-rapidapi-host":'yummly2.p.rapidapi.com',
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(temp);
  }
}