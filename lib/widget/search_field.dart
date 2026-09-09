import 'package:flower_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

/**
 *  widget ini tidak menyimpan text yang diketik penggunaya sendiri.
 *  setiap kali pengguna mengetik 'onChange' akan dipanggil dan home screen yang akan menyimpan textnya lalu 
 * memakainya untk memfilter daftar produk ini contoh lain dari pola 'liftingstateup'
 */

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onChange});

  final ValueChanged <String> onChange;

  @override
  Widget build(BuildContext context) {
    return TextField( // untuk memungkinkan kita menampilkan text input, biasanya dipake buat search bar
    onChanged: onChange,
    decoration: InputDecoration(
      hintText: 'Cari mawar, tulip, atau anggrek....',
      hintStyle: TextStyle(color: AppTheme.textSecondary, fontSize: 13.5),
      prefixIcon: Icon(Icons.search_rounded, color: AppTheme.textSecondary),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      )
    ),
    );
  }
}