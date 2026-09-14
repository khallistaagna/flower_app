import 'package:flower_app/models/flower.dart';
import 'package:flower_app/state/favorites_controller.dart';
import 'package:flower_app/theme/app_theme.dart';
import 'package:flower_app/widget/circle_icon_button.dart';
import 'package:flower_app/widget/flower_image.dart';
import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key, required this.flower, required this.onBack});

 final Flower flower;
 final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack( //krn numpuk
        children: [
          Positioned.fill(
            child: Hero(
              tag: 'flower-image-${flower.id}',
              child: FlowerNetworkImage(
                imageUrl: flower.imageUrl,
                fallbackIcon: flower.icon,
                fallbackColor: flower.color,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(
                      icon: Icons.arrow_back_rounded, 
                      onTap: onBack, 
                    ),
                    _FavoriteButton(flowerId: flower.id)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({super.key, required this.flowerId});

  final String flowerId;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<String>>(
      valueListenable: FavoriteController.intance,
      builder: (context, favoriteId, _) {
        final isFavorite = favoriteId.contains(flowerId);
        return CircleIconButton(
          icon: isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          iconColor: isFavorite ? AppTheme.primary : Colors.black87,
          onTap: () => FavoriteController.intance.toggle(flowerId),
          );
      },
    );
  }
}