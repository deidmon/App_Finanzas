import 'package:app_finanzas/design/colors.dart';
import 'package:flutter/material.dart';

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 12,
          ),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/user.png'),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Expanded(
          child: Text(
            'Store Name',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        ContainerHeaderIcon(
          iconButton: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: AppColors.brandPrimaryColor,
            ),
          ),
        ),
        ContainerHeaderIcon(
          configMargin: const EdgeInsets.only(
            left: 12,
          ),
          iconButton: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.brandPrimaryColor,
            ),
          ),
        )
      ],
    );
  }
}

class ContainerHeaderIcon extends StatelessWidget {
  final IconButton iconButton;
  final EdgeInsets? configMargin;
  const ContainerHeaderIcon({
    super.key,
    required this.iconButton,
    this.configMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: configMargin,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.brandLightColorBorder,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: iconButton,
    );
  }
}
