import 'package:drift_database/state-management/ProductCubit.dart';
import 'package:drift_database/ui/routes/AppRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'local/db/AppDatabase.dart';

final logger = Logger(
  printer: PrettyPrinter(methodCount: 0, errorMethodCount: 5, lineLength: 80),
);

void main() {
  final db = AppDatabase();
  runApp(
    BlocProvider(
      create: (BuildContext context) {
        return ProductCubit(0);
      },
      child: MultiProvider(
        providers: [
          Provider(create: (context) => db.productDao),
          Provider(create: (context) => db.userDao),
        ],
        //child để xác định xem widget nào được nhận các khởi tạo trên
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      builder: (context, child) => Stack(
        children: [
          child!,
          AppRouter.isLoading
              ? Center(child: CircularProgressIndicator())
              : SizedBox(),
        ],
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
