import 'package:drift_database/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../HomePage.dart';
import '../ProductPage.dart';

//go: sẽ tạo ra màn hình mới và xóa hết tất cả màn hình trong backstack
//push: sẽ thêm vào backstack, giữ nguyên các cái cũ
class AppRouter {
  AppRouter._();

  static bool isLoading = false;

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/product',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const ProductPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  logger.i(child);
                  return ScaleTransition(
                    scale: Tween(begin: 0.2, end: 1.0).animate(animation),
                    child: child,
                  );
                },
          );
        },
      ),
    ],
  );
}
