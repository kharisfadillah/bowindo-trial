import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/auth/login_page.dart';
import 'providers/auth_provider.dart';
import 'providers/branch_provider.dart';
import 'providers/department_provider.dart';
import 'providers/employee_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<EmployeeProvider>(create: (_) => EmployeeProvider()),
        ChangeNotifierProvider<DepartmentProvider>(create: (_) => DepartmentProvider()),
        ChangeNotifierProvider<BranchProvider>(create: (_) => BranchProvider()),
      ],
      child: const MaterialApp(
        title: 'Bowindo Trial',
        home: LoginPage(),
      ),
    );
  }
}
