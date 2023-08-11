import 'package:example/core/widgets/connectivity_handler.dart';
import 'package:example/core/widgets/dialogs.dart';
import 'package:example/features/chart/presentation/chart_page.dart';
import 'package:example/features/home/presentation/home_page.dart';
import 'package:example/features/login/presentation/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  routes: <RouteBase>[
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) =>
          ConnectivityHandler(child),
      routes: <RouteBase>[
        GoRoute(
          name: 'loading_dialog',
          path: '/loading_dialog',
          builder: (BuildContext context, GoRouterState state) =>
              const LoadingDialog(),
        ),
        GoRoute(
          name: 'logout_dialog',
          path: '/logout_dialog',
          builder: (BuildContext context, GoRouterState state) =>
              LogoutDialog(model: state.extra as LogoutModel),
        ),
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const LoginPage(),
        ),
        GoRoute(
          path: '/login_page',
          builder: (BuildContext context, GoRouterState state) =>
              const LoginPage(),
        ),
        GoRoute(
          path: '/home_page',
          builder: (BuildContext context, GoRouterState state) =>
              const HomePage(),
        ),
        GoRoute(
          path: '/chart_page',
          builder: (BuildContext context, GoRouterState state) =>
              const ChartPage(),
        ),
      ],
    )
  ],
);
