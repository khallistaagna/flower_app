import 'package:flower_app/data/dummy_data.dart';
import 'package:flower_app/models/flower.dart';
import 'package:flower_app/screens/detail_screen.dart';
import 'package:flower_app/widget/flower_card.dart';
import 'package:flower_app/widget/home_content_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _query = '';
  String _selectedCategory = 'Semua';
  
  //method getter
  List<String> get _categories {
    final unique = <String>{'Semua', ...dummyFlowers.map((f) => f.category)};
    return unique.toList();
  }

  List<Flower> get _filteredFlowers {
    return dummyFlowers.where((flower) {
      final matchesQuery = flower.name.toLowerCase().contains(_query.toLowerCase());
      final matchesCategory = _selectedCategory == 'Semua' || flower.category == _selectedCategory;
      return matchesQuery && matchesCategory;
    }) .toList();
  }

  //
  void _openDetail(Flower flower) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => DetailScreen(flower: flower)));

  }

  @override
  Widget build(BuildContext context) {
    final flowers = _filteredFlowers;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeContentHeader(
              selectedCategory: _selectedCategory, 
              categories: _categories, 
              onQueryChanged: (value) => setState(() => _query = value),
              onCategoryChanged: (value) => setState(() => _selectedCategory = value),
              ),
          ),

          if (flowers.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text('Bunga tidak ditemukan'),
                ),
              )
              else
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.75,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => FlowerCard(
                        flower: flowers[index],
                        onTap: () => _openDetail(flowers[index]),
                      ),
                      childCount: flowers.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
}