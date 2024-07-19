import 'package:flutter/material.dart';

void main() {
  runApp(FavoriteRecipesApp());
}

class FavoriteRecipesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FavoriteRecipesPage(),
    );
  }
}

class Recipe {
  final String name;
  final String details;

  Recipe(this.name, this.details);
}

class FavoriteRecipesPage extends StatefulWidget {
  @override
  _FavoriteRecipesPageState createState() => _FavoriteRecipesPageState();
}

class _FavoriteRecipesPageState extends State<FavoriteRecipesPage> {
  List<Recipe> favoriteRecipes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add your own recipes')),
      ),
      body: ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          final recipe = favoriteRecipes[index];

          return ListTile(
            title: Text(recipe.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            subtitle: Text(recipe.details),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  favoriteRecipes.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          _showAddRecipeDialog(context);
        },
        child: Text(
          'Add Recipe',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Future<void> _showAddRecipeDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailsController = TextEditingController();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Recipe'),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Enter recipe name'),
              ),
              TextField(
                controller: detailsController,
                decoration: InputDecoration(labelText: 'Enter recipe details'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                setState(() {
                  String name = nameController.text.trim();
                  String details = detailsController.text.trim();
                  if (name.isNotEmpty) {
                    favoriteRecipes.add(Recipe(name, details));
                  }
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
