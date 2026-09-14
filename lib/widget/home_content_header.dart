import 'package:flower_app/data/dummy_data.dart';
import 'package:flower_app/theme/app_theme.dart';
import 'package:flower_app/widget/banner_carousel.dart';
import 'package:flower_app/widget/category_chip_list.dart';
import 'package:flower_app/widget/home_header.dart';
import 'package:flower_app/widget/profile_sheet.dart';
import 'package:flower_app/widget/search_field.dart';
import 'package:flutter/material.dart';

class HomeContentHeader extends StatelessWidget {
  const HomeContentHeader({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onCategoryChanged,
    required this.onQueryChanged,
  });

  final String selectedCategory;
  final List<String> categories;
  final ValueChanged<String> onCategoryChanged;
  final ValueChanged<String> onQueryChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(
            onProfileTap: () => showProfileSheet(context),
          ),

          SizedBox(height: 18),

          BannerCarousel(
            banner: dummyBanners,
          ),

          SizedBox(height: 20),

          SearchField(
            onChange: onQueryChanged,
          ),

          SizedBox(height: 18),

          CategoryChipList(
            categories: categories,
            selectedCategory: selectedCategory,
            onSelected: onCategoryChanged,
          ),

          SizedBox(height: 22),
          Text(
            'Rekomendasi untukmu',
            style: AppTheme.display(fontSize: 18),
          ),
          SizedBox(height: 14),
          
        ],
      ),
    );
  }
}