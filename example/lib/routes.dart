import 'package:example/features/chart/presentation/chart_page.dart';
import 'package:example/features/home/presentation/home_page.dart';
import 'package:example/features/login/presentation/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
    GoRoute(
      path: '/login_page',
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home_page',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      path: '/chart_page',
      builder: (BuildContext context, GoRouterState state) => const ChartPage(),
    ),
  ],
);
