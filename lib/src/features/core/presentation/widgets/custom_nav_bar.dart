import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/colors.dart' as colors;
import '../../../../utils/sizes.dart' as sizes;

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(final BuildContext context) {
    final bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    final int selectedIndex = getSelectedIndex(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isIos
            ? const BorderRadius.all(
                Radius.circular(50),
              )
            : null,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0xFFD0D0D0),
            blurRadius: 20,
          ),
        ],
      ),
      margin: isIos
          ? const EdgeInsets.fromLTRB(
              sizes.defaultSize,
              sizes.defaultSize,
              sizes.defaultSize,
              26,
            )
          : null,
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <NavBarButton>[
            NavBarButton(
              onTap: () {
                onNavButtonTap(context, 0);
              },
              icon: Icons.wb_cloudy_outlined,
              text: 'Weather',
              isActive: selectedIndex == 0,
            ),
            NavBarButton(
              onTap: () {
                onNavButtonTap(context, 1);
              },
              icon: Icons.group,
              text: 'Friends',
              isActive: selectedIndex == 1,
            ),
            NavBarButton(
              onTap: () {
                onNavButtonTap(context, 2);
              },
              icon: Icons.search,
              text: 'Searches',
              isActive: selectedIndex == 2,
            ),
            NavBarButton(
              onTap: () {
                onNavButtonTap(context, 3);
              },
              icon: Icons.person,
              text: 'Account',
              isActive: selectedIndex == 3,
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarButton extends StatelessWidget {
  const NavBarButton({
    required this.onTap,
    required this.icon,
    required this.text,
    required this.isActive,
    super.key,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String text;
  final bool isActive;

  @override
  Widget build(final BuildContext context) {
    final bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: isIos
            ? MediaQuery.of(context).size.width / 6
            : (MediaQuery.of(context).size.width - sizes.defaultSize) / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: isActive ? colors.detailColor : null,
            ),
            Text(
              text,
              style: TextStyle(
                color: isActive ? colors.detailColor : null,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}

int getSelectedIndex(final BuildContext context) {
  final GoRouter router = GoRouter.of(context);
  final String location = router.location;
  if (location == '/') {
    return 0;
  }
  if (location.startsWith('/friends')) {
    return 1;
  }
  if (location.startsWith('/recent-searches')) {
    return 2;
  }
  if (location.startsWith('/account-info')) {
    return 3;
  }
  return 0;
}

void onNavButtonTap(final BuildContext context, final int value) {
  switch (value) {
    case 0:
      return context.go('/');
    case 1:
      return context.go('/friends');
    case 2:
      return context.go('/recent-searches');
    case 3:
      return context.go('/account-info');
    default:
      return context.go('/');
  }
}
