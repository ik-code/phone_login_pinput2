import 'package:flutter/material.dart';

class AddReviewScreen extends StatelessWidget {
const AddReviewScreen({ Key? key }) : super(key: key);

static const routeName = '/add-review';


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text('ADD YOUR REVIEW'),
      ),
    );
  }
}