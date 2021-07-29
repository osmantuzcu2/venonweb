import 'package:flutter/material.dart';
import 'package:venonweb/models/GeneralModels.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const secondaryColor2 = Color(0x323545);

const defaultPadding = 16.0;

const baseUrl = "http://15.188.73.215:5000";

List<UserTypeModel> userType = [
  UserTypeModel(type: "Admin", code: 1), //SystemAdmin
  UserTypeModel(type: "Bayi", code: 2), //AgentAdmin
  UserTypeModel(type: "Personel", code: 3), //Personnel
  UserTypeModel(type: "Müşteri", code: 4) //Customer
];
