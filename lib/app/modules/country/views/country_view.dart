import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/country_controller.dart';

class CountryView extends GetView<CountryController> {
  const CountryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CountryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CountryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
