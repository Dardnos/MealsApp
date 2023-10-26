import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/data/dummy_data.dart';

class AddNewMeal extends StatefulWidget {
  const AddNewMeal({super.key});

  @override
  State<AddNewMeal> createState() => _AddNewMealState();
}

class _AddNewMealState extends State<AddNewMeal> {
  final uuid = const Uuid();
  final TextEditingController titleController = TextEditingController();
  final List<String> selectedCategories =
      []; // List to store selected categories
  final TextEditingController imageUrlController = TextEditingController(
      text:
          'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg');
  final TextEditingController durationController = TextEditingController();
  String selectedAffordability = 'affordable'; // Initial selection
  String selectedComplexity = 'simple'; // Initial selection
  final List<String> ingredients = [];
  final List<String> steps = [];
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  String newIngredient = ''; // Store the newly entered ingredient
  String newStep = ''; // Store the newly entered step

  // Function to add a new ingredient to the list
  void _addIngredient() {
    if (newIngredient.isNotEmpty) {
      setState(() {
        ingredients.add(newIngredient);
        newIngredient = ''; // Clear the input field
      });
    }
  }

  // Function to add a new step to the list
  void _addStep() {
    if (newStep.isNotEmpty) {
      setState(() {
        steps.add(newStep);
        newStep = ''; // Clear the input field
      });
    }
  }

  Map<String, Affordability> affordabilityValues = {
    'Affordable': Affordability.affordable,
    'Pricey': Affordability.pricey,
    'Luxurious': Affordability.luxurious,
  };

  Map<String, Complexity> complexityValues = {
    'Simple': Complexity.simple,
    'Challenging': Complexity.challenging,
    'Hard': Complexity.hard,
  };

  // Function to add a new meal to the dummyMeals list
  void _addNewMeal() {
    final Meal newMeal = Meal(
      id: uuid.v4(),
      categories: selectedCategories,
      title: titleController.text,
      imageUrl: imageUrlController.text,
      duration: int.parse(durationController.text),
      affordability: affordabilityValues[selectedAffordability] ??
          Affordability.affordable,
      complexity: complexityValues[selectedComplexity] ?? Complexity.simple,
      ingredients: ingredients,
      steps: steps,
      isGlutenFree: isGlutenFree,
      isVegan: isVegan,
      isVegetarian: isVegetarian,
      isLactoseFree: isLactoseFree,
    );

    dummyMeals.add(newMeal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input field for title
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              style: const TextStyle(color: Colors.white),
            ),

            // Input field for categories
            const SizedBox(height: 16.0),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                itemCount: availableCategories.length,
                itemBuilder: (ctx, index) {
                  final category = availableCategories[index];
                  return CheckboxListTile(
                    title: Text(category.title),
                    value: selectedCategories.contains(category.id),
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          selectedCategories.add(category.id);
                        } else {
                          selectedCategories.remove(category.id);
                        }
                      });
                    },
                  );
                },
              ),
            ),

            // Input field for image URL
            const SizedBox(height: 16.0),
            TextFormField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
              style: const TextStyle(color: Colors.white),
            ),

            // Input field for duration
            const SizedBox(height: 16.0),
            TextFormField(
              controller: durationController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Duration (minutes)'),
              style: const TextStyle(color: Colors.white),
            ),

            // Input field for affordability
            const SizedBox(height: 16.0),
            DropdownButton<Affordability>(
              value: affordabilityValues[selectedAffordability] ??
                  Affordability.affordable,
              onChanged: (value) {
                setState(() {
                  selectedAffordability = affordabilityValues.keys.firstWhere(
                    (key) => affordabilityValues[key] == value,
                    orElse: () => 'Affordable',
                  );
                });
              },
              items: affordabilityValues.keys
                  .map<DropdownMenuItem<Affordability>>(
                    (String value) => DropdownMenuItem<Affordability>(
                      value: affordabilityValues[value],
                      child: Text(value,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  )
                  .toList(),
            ),

            // Input field for complexity
            const SizedBox(height: 16.0),
            DropdownButton<Complexity>(
              value: complexityValues[selectedComplexity] ?? Complexity.simple,
              onChanged: (value) {
                setState(() {
                  selectedComplexity = complexityValues.keys.firstWhere(
                    (key) => complexityValues[key] == value,
                    orElse: () => 'Simple',
                  );
                });
              },
              items: complexityValues.keys
                  .map<DropdownMenuItem<Complexity>>(
                    (String value) => DropdownMenuItem<Complexity>(
                      value: complexityValues[value],
                      child: Text(value,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  )
                  .toList(),
            ),

            // Checkbox for isGlutenFree

            Row(
              children: [
                const Text('Gluten-Free',
                    style: TextStyle(fontSize: 18.0, color: Colors.white)),
                Checkbox(
                  value: isGlutenFree,
                  onChanged: (value) {
                    setState(() {
                      isGlutenFree = value ?? false;
                    });
                  },
                ),
              ],
            ),

            // Checkbox for isVegan
            Row(
              children: [
                const Text('Vegan',
                    style: TextStyle(fontSize: 18.0, color: Colors.white)),
                Checkbox(
                  value: isVegan,
                  onChanged: (value) {
                    setState(() {
                      isVegan = value ?? false;
                    });
                  },
                ),
              ],
            ),

            // Checkbox for isVegetarian
            Row(
              children: [
                const Text('Vegetarian',
                    style: TextStyle(fontSize: 18.0, color: Colors.white)),
                Checkbox(
                  value: isVegetarian,
                  onChanged: (value) {
                    setState(() {
                      isVegetarian = value ?? false;
                    });
                  },
                ),
              ],
            ),

            // Checkbox for isLactoseFree
            Row(
              children: [
                const Text('Lactose-Free',
                    style: TextStyle(fontSize: 18.0, color: Colors.white)),
                Checkbox(
                  value: isLactoseFree,
                  onChanged: (value) {
                    setState(() {
                      isLactoseFree = value ?? false;
                    });
                  },
                ),
              ],
            ),

            // Input field for adding ingredients
            const SizedBox(height: 16.0),
            TextFormField(
              onChanged: (value) {
                newIngredient = value;
              },
              decoration: const InputDecoration(labelText: 'Add Ingredient'),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addIngredient,
              child: const Text('Add Ingredient'),
            ),
            // Display the ingredients
            SizedBox(
              height: 150.0,
              child: Column(
                children: [
                  const Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: ingredients.length,
                      itemBuilder: (ctx, index) {
                        return Card(
                          child: ListTile(
                            title: Text(ingredients[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  ingredients.removeAt(index);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Input field for adding steps
            const SizedBox(height: 16.0),
            TextFormField(
              onChanged: (value) {
                newStep = value;
              },
              decoration: const InputDecoration(labelText: 'Add Step'),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addStep,
              child: const Text('Add Step'),
            ),
            // Display the steps
            SizedBox(
              height: 150.0,
              child: Column(
                children: [
                  const Text(
                    'Steps',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: steps.length,
                      itemBuilder: (ctx, index) {
                        return Card(
                          child: ListTile(
                            title: Text(steps[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  steps.removeAt(index);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addNewMeal,
              child: const Text('Add Meal'),
            ),
          ],
        ),
      ),
    );
  }
}
