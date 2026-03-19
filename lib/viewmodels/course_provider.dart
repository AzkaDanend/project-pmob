import 'package:flutter/material.dart';
import '../models/course_model.dart';

class CourseProvider extends ChangeNotifier {
  // Data dummy untuk presentasi minggu ini
  final List<Course> _courses = [
    Course(title: "Web Development with Laravel", mentor: "Faisal Akbar", imageUrl: "https://via.placeholder.com/150"),
    Course(title: "UI/UX Design with Figma", mentor: "Felda Fahmi", imageUrl: "https://via.placeholder.com/150"),
    Course(title: "Mobile App with Flutter", mentor: "Alex", imageUrl: "https://via.placeholder.com/150"),
  ];

  List<Course> get courses => _courses;
}