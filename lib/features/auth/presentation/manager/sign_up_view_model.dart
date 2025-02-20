import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier{
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value){
    _selectedDate = value;
    notifyListeners();
  }
}