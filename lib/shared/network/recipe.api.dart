import 'dart:convert';
import 'package:gofood/models/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "24",
          "start": "0",
          "tag": "list.recipe.popular"}
    );

    final response = await http.get(
        uri,
        headers: {
      "x-rapidapi-key": "6e1dd69cd7msh6309312b9e57906p18d24djsn8caed6dd36c9",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    },
    );

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
