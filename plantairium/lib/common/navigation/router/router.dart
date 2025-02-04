import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plantairium/common/navigation/router/routes.dart';
import 'package:plantairium/common/services/auth_service.dart';
import 'package:plantairium/common/ui/base.dart';
import 'package:plantairium/features/account/ui/account_options/my_account.dart';
import 'package:plantairium/features/chatbot/ui/chatbot.dart';
import 'package:plantairium/features/login/ui/login.dart';
import 'package:plantairium/features/plants/ui/plant.dart';
import 'package:plantairium/features/sensors/ui/sensor_view.dart';
import 'package:plantairium/features/sensors/ui/sensors.dart';

final authNotifier = AuthNotifier();

final GoRouter router = GoRouter(
  refreshListenable: authNotifier,
  routes: <RouteBase>[
    GoRoute(
      redirect: (context, state) {
        final isLoggedIn = authNotifier.isSignedIn;

        if (!isLoggedIn) {
          return '/login';
        }
        if (isLoggedIn) {
          return '/';
        }
        return null;
      },
      path: '/',
      name: AppRoute.home.name,
      builder: (BuildContext context, GoRouterState state) {
        return const Base();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'myaccount',
          name: AppRoute.myaccount.name,
          builder: (BuildContext context, GoRouterState state) {
            Map<AuthUserAttributeKey, String?> userInfos =
                state.extra as Map<AuthUserAttributeKey, String?>;
            return MyAccount(
              userInfos: userInfos,
            );
          },
        )
      ],
    ),
    GoRoute(
      path: '/llm',
      builder: (BuildContext context, GoRouterState state) {
        return const SizedBox();
      },
    ),
    GoRoute(
      path: '/chatbot',
      name: AppRoute.chatbot.name,
      builder: (BuildContext context, GoRouterState state) {
        // final int userId = int.parse(state.pathParameters['id']|);
        return Chatbot(
          userId: 1,
        );
      },
    ),
    GoRoute(
      path: '/sensors',
      name: AppRoute.sensors.name,
      builder: (BuildContext context, GoRouterState state) {
        return const SensorsView();
      },
    ),
    GoRoute(
      path: '/sensor',
      name: AppRoute.sensor.name,
      builder: (BuildContext context, GoRouterState state) {
        return const SensorPage();
      },
    ),
    GoRoute(
      path: '/plants/:id',
      name: AppRoute.plants.name,
      builder: (BuildContext context, GoRouterState state) {
        final int sensorId = int.parse(state.pathParameters['id']!);
        final Map<String, dynamic> extra =
            state.extra as Map<String, dynamic>? ?? {};
        final String sensorName = extra['sensorName'] as String? ?? '';
        final String sensorDate = extra['sensorDate'] as String? ?? '';
        final Map<String, dynamic> sensorFeatures =
            extra['sensorFeatures'] as Map<String, dynamic>? ?? {};

        return PlantsView(
          idSensore: sensorId,
          sensorFeatures: sensorFeatures,
          sensorName: sensorName,
          sensorDate: sensorDate,
        );
      },
    ),
    GoRoute(
      path: '/login',
      name: AppRoute.login.name,
      builder: (BuildContext context, GoRouterState state) {
        return Login(key: UniqueKey());
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);
