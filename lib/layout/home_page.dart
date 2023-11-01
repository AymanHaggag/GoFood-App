import 'package:flutter/material.dart';
import 'package:gofood/views/widgets/recipe_card.dart';

import '../shared/network/recipe.api.dart';
import '../models/recipe_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe>? recipesList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    recipesList = await RecipeApi.getRecipe();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('GoFood Recipe')
            ],
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: recipesList!.length,
          itemBuilder: (context, index) {
            return RecipeCard(
                title: recipesList![index].name,
                cookTime: recipesList![index].totalTime,
                rating: recipesList![index].rating.toString(),
                thumbnailUrl: recipesList![index].images,
                 directionsUrl : recipesList![index].directionsUrl);
          },
        ));
  }
}