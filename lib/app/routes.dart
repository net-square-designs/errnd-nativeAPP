import 'package:flutter/material.dart';

import 'pages/auth_pages/forgotpassword_page.dart';
import 'pages/auth_pages/login_page.dart';
import 'pages/auth_pages/register_page.dart';
import 'pages/home_pages/home_page.dart';

final routes = {
  "/home": (BuildContext context) => HomePage(),
  "/login": (BuildContext context) => LoginPage(),
  "/register": (BuildContext context) => RegisterPage(),
  "/forgotPassword": (BuildContext context) => ForgotPasswordPage(),
};
