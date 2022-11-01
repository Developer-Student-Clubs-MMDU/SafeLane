import 'package:flutter/material.dart';
import 'package:safelane/onBoarding/onbording.dart';
class contents{
  final String image, title, description;
  contents({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<contents> demo_data=[
  contents(
    image: "assets/images/undraw_current_location_re_j130.svg", 
    title: "Mark any barrier on the road", 
    description: ""),
  contents(
    image: "assets/images/undraw_location_search_re_ttoj.svg", 
    title: "Search safe road for a better \njourney", 
    description: ""),
  contents(
    image: "assets/images/undraw_navigator_a479.svg", 
    title: "Get to your place without \nany barrier", 
    description: ""),

];