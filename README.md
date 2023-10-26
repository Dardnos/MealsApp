# Meals App Architecture and Documentation

## Introduction
This document provides an overview of the app's architecture, user stories, specifications, and file/folder structure based on the provided code structure. 
The app is designed to help users explore and manage meal categories, view meal details, and apply filters to customize their meal preferences.


## New Features

### Add Meal
The app now allows users to add a new meal with details such as title, image, ingredients, steps, duration, complexity, affordability, and dietary preferences.
Users can save the meal and have it displayed in the list of available meals.

## App Architecture

### User Interface
The app follows a typical Flutter application structure, with screens and widgets:

1. **Screens**: Represent various user interface screens of the app.
    - `CategoriesScreen`: Displays available meal categories.
    - `FiltersScreen`: Allows users to set meal filters.
    - `MealsScreen`: Lists meals based on selected categories.
    - `MealDetailsScreen`: Shows details of a specific meal.
    - `AddNewMeal`: Allows users to add a new meal.
    - `TabsScreen`: Implements the bottom navigation tabs for Categories and Favorites.

2. **Widgets**: Reusable UI components used throughout the app.
    - `CategoryGridItem`: Represents a category grid item.
    - `MainDrawer`: Implements the main navigation drawer.
    - `MealItem`: Displays individual meal items.
    - `MealItemTrait`: A small widget for displaying meal traits (e.g., duration, complexity).

### Data and Models
Data and models are used to manage and represent the app's content:

1. **Data**:
    - `dummy_data.dart`: Contains sample data for meal categories and meals.

2. **Models**:
    - `Category`: Represents a meal category with an ID, title, and color.
    - `Meal`: Represents a meal with details such as ID, title, ingredients, steps, and more.

### State Management
State management is implemented using Riverpod, a Flutter state management package:

1. **Providers**:
    - `FavoriteMealsNotifier`: Manages the user's favorite meals.
    - `FiltersNotifier`: Handles user-selected filters (gluten-free, lactose-free, vegetarian, vegan).
    - `mealsProvider`: Provides the list of available meals.
    - `filteredMealsProvider`: Filters meals based on user-selected filters.

### Main Entry Point
The app's main entry point is defined in `main.dart`. It sets up the app's theme and initializes the `TabsScreen` as the initial view.

## Meals App User Stories

1. **Add Meal**
   - As a user, I want to add a new meal with details such as title, image, ingredients, steps, duration, complexity, affordability, and dietary preferences.
   - I want to save the meal and have it displayed in the list of available meals.

2. **View Meals**
   - As a user, I want to view a list of all available meals.
   - I want to see each meal's title, image, and basic information.

3. **View Meal Details**
   - As a user, I want to view the details of a specific meal when I select it from the list.
   - I want to see information such as ingredients, steps, duration, complexity, affordability, and dietary preferences.
   - I also want to have the option to add or remove the meal from my favorites.

4. **Filter Meals**
   - As a user, I want to filter available meals based on dietary preferences, such as gluten-free, lactose-free, vegetarian, and vegan.
   - I want the filtered meals to update based on my selections.

5. **View Favorites**
   - As a user, I want to view a list of my favorite meals.
   - I want to see each meal's title, image, and basic information.

6. **Visualize Meal Categories**
   - As a user, I want to see a visual representation (e.g., a grid of categories) of available meal categories.
   - I want to select a category and see a list of meals that belong to that category.

7. **Adjust Filters**
   - As a user, I want to adjust my dietary preference filters.
   - I want to customize my filters for gluten-free, lactose-free, vegetarian, and vegan meals.

## Specifications

- **Categories**: The app loads predefined meal categories and displays them in a grid.
- **Meals**: When a category is selected, the app displays a list of meals within that category.
- **Meal Details**: Users can click on a meal to view its details, including ingredients and steps.
- **Filters**: Users can set filters for dietary preferences to customize meal lists.
- **New Meal**: Users can add a new meal with details such as title, image, ingredients, steps, duration, complexity, affordability, and dietary preferences.
- **Favorites**: Users can mark meals as favorites for easy access.
- **Navigation**: Users can navigate between Categories, Add New Meal and Favorites using a bottom navigation bar.
- **Theme**: The app uses a custom theme with a dark color scheme and custom fonts.

## File and Folder Structure
The app's files and folders are organized as follows:

- lib/ (Root Directory)
  - models/ (Folder for Data Models)
    - category.dart (Definition of the `Category` data model)
    - meal.dart (Definition of the `Meal` data model)
  - providers/ (Folder for State Management)
    - favorites_provider.dart (Management of favorite meals)
    - filters_provider.dart (Management of dietary preference filters)
    - meals_provider.dart (Provides a list of meals)
  - screens/ (Folder for App Screens)
    - categories.dart (Categories Screen)
    - filters.dart (Filters Screen)
    - meal_details.dart (Meal Details Screen)
    - meals.dart (Meals Screen)
    - new_meal.dart (Add New Meal Screen)
    - tabs.dart (Tabs Screen, entry point)
  - widgets/ (Folder for Custom Widgets)
    - category_grid_item.dart (Definition of the `CategoryGridItem` widget)
    - main_drawer.dart (Definition of the `MainDrawer` widget)
    - meal_item.dart (Definition of the `MealItem` widget)
    - meal_item_trait.dart (Definition of the `MealItemTrait` widget)
  - main.dart (Entry point of the application)

This organized structure ensures maintainability and modularity, 
making it easier to expand and improve the app's functionality in the future.

## Class Diagrams

Detailed class diagrams are provided below:

Diagram 1: App, Category, Meal, Complexity, Affordability, Filter classes
```mermaid
classDiagram
class App
App : +build() Widget
StatelessWidget <|-- App

class Category
Category : +id String
Category : +title String
Category : +color Color
Category o-- Color

class Meal
Meal : +id String
Meal : +categories List~String~
Meal : +title String
Meal : +imageUrl String
Meal : +ingredients List~String~
Meal : +steps List~String~
Meal : +duration int
Meal : +complexity Complexity
Meal o-- Complexity
Meal : +affordability Affordability
Meal o-- Affordability
Meal : +isGlutenFree bool
Meal : +isLactoseFree bool
Meal : +isVegan bool
Meal : +isVegetarian bool

class Complexity
<<enumeration>> Complexity
Complexity : +index int
Complexity : +values$ List~Complexity~
Complexity : +simple$ Complexity
Complexity o-- Complexity
Complexity : +challenging$ Complexity
Complexity o-- Complexity
Complexity : +hard$ Complexity
Complexity o-- Complexity
Enum <|.. Complexity

class Affordability
<<enumeration>> Affordability
Affordability : +index int
Affordability : +values$ List~Affordability~
Affordability : +affordable$ Affordability
Affordability o-- Affordability
Affordability : +pricey$ Affordability
Affordability o-- Affordability
Affordability : +luxurious$ Affordability
Affordability o-- Affordability
Enum <|.. Affordability

class FavoriteMealsNotifier
FavoriteMealsNotifier : +toggleMealFavoriteStatus() bool
StateNotifier <|-- FavoriteMealsNotifier

class FiltersNotifier
FiltersNotifier : +setFilters() void
FiltersNotifier : +setFilter() void
StateNotifier <|-- FiltersNotifier

class Filter
<<enumeration>> Filter
Filter : +index int
Filter : +values$ List~Filter~
Filter : +glutenFree$ Filter
Filter o-- Filter
Filter : +lactoseFree$ Filter
Filter o-- Filter
Filter : +vegetarian$ Filter
Filter o-- Filter
Filter : +vegan$ Filter
Filter o-- Filter
Enum <|.. Filter
```

Diagram 2: CategoriesScreen, _CategoriesScreenState, FiltersScreen, MealsScreen, MealDetailsScreen classes

```mermaid
classDiagram
class CategoriesScreen
CategoriesScreen : +availableMeals List~Meal~
CategoriesScreen : +createState() State<CategoriesScreen>
StatefulWidget <|-- CategoriesScreen

class _CategoriesScreenState
_CategoriesScreenState : -_animationController AnimationController
_CategoriesScreenState o-- AnimationController
_CategoriesScreenState : +initState() void
_CategoriesScreenState : +dispose() void
_CategoriesScreenState : -_selectCategory() void
_CategoriesScreenState : +build() Widget
State <|-- _CategoriesScreenState
SingleTickerProviderStateMixin <|-- _CategoriesScreenState

class FiltersScreen
FiltersScreen : +build() Widget
ConsumerWidget <|-- FiltersScreen

class MealsScreen
MealsScreen : +title String?
MealsScreen : +meals List~Meal~
MealsScreen : +selectMeal() void
MealsScreen : +build() Widget
StatelessWidget <|-- MealsScreen

class MealDetailsScreen
MealDetailsScreen : +meal Meal
MealDetailsScreen o-- Meal
MealDetailsScreen : +build() Widget
ConsumerWidget <|-- MealDetailsScreen
```

Diagram 3: The newly added AddNewMeal and _AddNewMealState classes

```mermaid
classDiagram
class AddNewMeal
AddNewMeal : +createState() State<AddNewMeal>
StatefulWidget <|-- AddNewMeal
```

Diagram 3: The newly added AddNewMeal and _AddNewMealState classes

```mermaid
classDiagram
class _AddNewMealState
_AddNewMealState : +uuid Uuid
_AddNewMealState o-- Uuid
_AddNewMealState : +titleController TextEditingController
_AddNewMealState o-- TextEditingController
_AddNewMealState : +selectedCategories List~String~
_AddNewMealState : +imageUrlController TextEditingController
_AddNewMealState : +durationController TextEditingController
_AddNewMealState : +selectedAffordability String
_AddNewMealState : +selectedComplexity String
_AddNewMealState : +ingredients List~String~
_AddNewMealState : +steps List~String~
_AddNewMealState : +isGlutenFree bool
_AddNewMealState : +isVegan bool
_AddNewMealState : +isVegetarian bool
_AddNewMealState : +isLactoseFree bool
_AddNewMealState : +newIngredient String
_AddNewMealState : +newStep String
_AddNewMealState : +affordabilityValues Map~String, Affordability~
_AddNewMealState : +complexityValues Map~String, Complexity~
_AddNewMealState : -_addIngredient() void
_AddNewMealState : -_addStep() void
_AddNewMealState : -_addNewMeal() void
_AddNewMealState : +build() Widget
State <|-- _AddNewMealState
```

Diagram 4: TabsScreen, _TabsScreenState, CategoryGridItem, MainDrawer, MealItem, MealItemTrait classes

```mermaid
classDiagram
class TabsScreen
TabsScreen : +createState() ConsumerState<TabsScreen>
ConsumerStatefulWidget <|-- TabsScreen

class _TabsScreenState
_TabsScreenState : -_selectedPageIndex int
_TabsScreenState : -_selectPage() void
_TabsScreenState : -_setScreen() void
_TabsScreenState : +build() Widget
ConsumerState <|-- _TabsScreenState

class CategoryGridItem
CategoryGridItem : +category Category
CategoryGridItem o-- Category
CategoryGridItem : +onSelectCategory void Function
CategoryGridItem o-- void Function
CategoryGridItem : +build() Widget
StatelessWidget <|-- CategoryGridItem

class MainDrawer
MainDrawer : +onSelectScreen void FunctionString
MainDrawer o-- void FunctionString
MainDrawer : +build() Widget
StatelessWidget <|-- MainDrawer

class MealItem
MealItem : +meal Meal
MealItem o-- Meal
MealItem : +onSelectMeal void FunctionMeal
MealItem o-- void FunctionMeal
MealItem : +complexityText String
MealItem : +affordabilityText String
MealItem : +build() Widget
StatelessWidget <|-- MealItem

class MealItemTrait
MealItemTrait : +icon IconData
MealItemTrait o-- IconData
MealItemTrait : +label String
MealItemTrait : +build() Widget
StatelessWidget <|-- MealItemTrait
```

## Peer Review




## Screenshots

The following screenshots show the app's user interface:

![Main Screen](doc/screenshots/main.png)
![Category Screen](doc/screenshots/category.png)
![Filter Screen](doc/screenshots/filters.png)
![Favorites Screen](doc/screenshots/favorites.png)

### New Screenshots (after adding new features):

![New Main Screen](doc/screenshots/newMain.png)
![New Meal pt.1](doc/screenshots/newMeal1.png)
![New Meal pt.2](doc/screenshots/newMeal2.png)
![New Meal pt.3](doc/screenshots/newMeal3.png)
