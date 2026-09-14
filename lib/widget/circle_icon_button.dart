import 'package:flutter/material.dart';

//tombol bulat, dengan icon di tengah nya yang muncul di beberapa screen, misal di halaman detail bunga, tombol ini akan muncul di atas gambar bunga, untuk menampilkan menu share, favorite, dll
//area mana yang tau itu tuh touch action
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
     this.iconColor = Colors.black87
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: CircleBorder(),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }
}