import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../configs/l10n/app_localizations.dart';
import '../../../../configs/routes/route_config.dart';

class BottomMenuBarWidget extends StatelessWidget {
  BottomMenuBarWidget({required int currentTabIndex, Key? key})
      : _currentTabIndex = currentTabIndex,
        super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  final int _currentTabIndex;
  final IModularNavigator _modular = Modular.get<IModularNavigator>();

  void _navigateToScreen(int newTabIndex) {
    try {
      switch (newTabIndex) {
        case 0:
          _modular.pushNamed(createTaskRoute);
          analytics.logEvent(name: 'navigate_create');
          break;
        case 1:
          _modular.pushNamed(initialRoute);
          analytics.logEvent(name: 'navigate_edit');
          break;
        case 2:
          _modular.pushNamed(updateTaskRoute);
          analytics.logEvent(name: 'navigate_edit');
          break;
        case 3:
          _modular.pushNamed(getTaskGrpcRoute);
          break;
        default:
          _modular.pushNamed(notFoundRoute);
          break;
      }
    } catch (e) {
      _modular.pushNamed(notFoundRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: AppLocalizations.of(context).createBottomMenu,
          icon: const Icon(Icons.create),
        ),
        BottomNavigationBarItem(
          label: AppLocalizations.of(context).listBottomMenu,
          icon: const Icon(Icons.list),
        ),
        BottomNavigationBarItem(
          label: AppLocalizations.of(context).updateBottomMenu,
          icon: const Icon(Icons.update),
        ),
        BottomNavigationBarItem(
          label: AppLocalizations.of(context).grpcBottomMenu,
          icon: const Icon(Icons.update),
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: _currentTabIndex,
      onTap: (int newTabIndex) => _navigateToScreen(newTabIndex),
    );
  }
}
