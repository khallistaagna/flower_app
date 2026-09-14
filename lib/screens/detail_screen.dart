import 'package:flower_app/models/flower.dart';
import 'package:flower_app/theme/app_theme.dart';
import 'package:flower_app/widget/detail_header.dart';
import 'package:flower_app/widget/detail_total.dart';
import 'package:flower_app/widget/product_sumary.dart';
import 'package:flower_app/widget/quantity_stepper.dart';
import 'package:flower_app/widget/sheet_drag_andle.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.flower});

  final Flower flower;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  /**
   *  nilai ini "hidup" selama widget state ini ada setiapkali diubah oleh setstate flutter 
   * akan melakukan rebuild supaya tampilan ikut terupdate.
   */
  int _quantity = 1;

  void _increment() => setState(() => _quantity++);
  // pake if karena gabakal bisa dikurangin kalo 0
  void _decrement() {
    if (_quantity > 1) {
      setState(() => _quantity--);
    }
  }

  // akan memanggil kalo fitur ini akan memasukkan ke keranjang
  void _addToCart() {
    final flower = widget.flower;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$_quantity x ${flower.name} ditambahkan ke keranjang'),
      ),
    );

    
  }

  @override
  Widget build(BuildContext context) {
    final flower = widget.flower;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          DetailHeader(flower: flower, onBack: () => Navigator.of(context).pop()),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(22, 22, 22, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SheetDragAndle(),
                    SizedBox(height: 20),
                    ProductSumary(flower: flower),
                    SizedBox(height: 22),
                    Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                      ),
                      SizedBox(height: 26),
                      QuantityStepper(
                        quantity: _quantity, 
                        onIncrement: _increment, 
                        onDicrement: _decrement,
                        ),
                  ],
                ),
                
            )
           )
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addToCart,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        icon: Icon(Icons.shopping_bag_outlined, size: 20),
        label: Text('Tambah', style: TextStyle(fontWeight: FontWeight.w700)),

      ),
      bottomNavigationBar: DetailTotalBar(totalPrice: flower.price * _quantity),
    );
  }
}