import 'package:flutter/material.dart';
import '../data/recipes_data.dart';
import '../models/recipe.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openRecipeDetails(BuildContext context, Recipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailsScreen(recipe: recipe)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe Book')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: sampleRecipes.length,
          itemBuilder: (context, index) {
            final recipe = sampleRecipes[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 18),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => _openRecipeDetails(context, recipe),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      recipe.imagePath,
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 170,
                          color: Colors.orange.shade100,
                          child: const Center(
                            child: Icon(
                              Icons.restaurant,
                              size: 60,
                              color: Colors.deepOrange,
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.name,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            recipe.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(
                                Icons.timer_outlined,
                                size: 18,
                                color: Colors.deepOrange,
                              ),
                              const SizedBox(width: 6),
                              Text('${recipe.cookTimeMinutes} min'),
                              const SizedBox(width: 20),
                              const Icon(
                                Icons.local_fire_department_outlined,
                                size: 18,
                                color: Colors.deepOrange,
                              ),
                              const SizedBox(width: 6),
                              Text(recipe.difficulty),
                              const Spacer(),
                              const Icon(Icons.chevron_right),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
