// ignore_for_file: await_only_futures

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  Future addQuizCategory(Map<String,dynamic>userQuizCategory,String category)async{
    return await FirebaseFirestore.instance
    .collection(category)
    .add(userQuizCategory);
  
  }

  Future <Stream<QuerySnapshot>>getCategoryQuiz(String category)async{
    return await FirebaseFirestore.instance.collection(category).snapshots();
  }


  Future addFeedbackCategory(Map<String,dynamic>userFeedbackCategory,String category)async{
    return await FirebaseFirestore.instance
    .collection(category)
    .add(userFeedbackCategory);
  
  }
}