import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recipes_list_controller.dart';

class RecipesListView extends GetView<RecipesListController> {
  const RecipesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecipesListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RecipesListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
