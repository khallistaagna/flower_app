import 'package:flutter/material.dart';

//garis kecil abu di bagian atas atau sebuah "sheet ui" sebagai tanda bahwa screen tersebut bisa di drag ke atas atau ke bawah, misal di halaman detail bunga, sheet ui nya bisa di drag ke atas untuk menampilkan detail bunga secara penuh, dan bisa di drag ke bawah untuk menutup sheet ui nya
//singkatya bisa di scroll
class SheetDragAndle extends StatelessWidget {
  const SheetDragAndle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 44,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}