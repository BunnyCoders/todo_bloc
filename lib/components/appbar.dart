import 'package:flutter/material.dart';

import '../core/design_system.dart';

// ignore: non_constant_identifier_names
PreferredSize CustomAppBarWithOutBackButton({
  required BuildContext context,
  required String text,
  bool isButton = false,
  String buttonText = 'Edit',
  Color buttonColor = DSColors.headingLight,
  Color buttonTextColor = DSColors.headingDark,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(DSSizes.xl),
    child: Container(
      decoration: const BoxDecoration(
        color: DSColors.headingLight,
      ),
      padding: const EdgeInsets.only(
        bottom: DSSizes.md,
        // left: DSSizes.sm,
        right: DSSizes.sm,
        top: 50,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: DSSizes.lg),
              Text(
                text,
                style: DSType.largeBold(
                  textColor: DSColors.headingDark,
                ),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
          const SizedBox(width: DSSizes.md),
          IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, RoutePaths.home);
              },
              icon: const Icon(
                Icons.home,
                color: DSColors.headingDark,
                size: DSSizes.lg,
              ))
        ],
      ),
    ),
  );
}
