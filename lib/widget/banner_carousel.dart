import 'dart:async';
import 'package:flower_app/models/promo_banner.dart';
import 'package:flower_app/widget/banner_slide.dart';
import 'package:flower_app/widget/carousel_dot.dart';
import 'package:flutter/material.dart';

//caraousel banner akan bergeser detik, untuk handling seperti ini kita butuh handling pake statefull untuk melakukan perubahan pake widget
class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, required this.banner });

  final List<PromoBanner>banner;

  @override
  State<BannerCarousel> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BannerCarousel> {
  /**
   * Page controller utuk mengatur slide mana yang sedang tampi di page view
   */

  late final PageController _controller = PageController();
  Timer? _timer;
  int _page = 0;

  @override
  void initState() {
    super.initState();

    //timer.periodic akan menjalankan fungsi di dlamnya secr berulang ulng
    // (_) = ini tuh anonimus parameter
    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      if (!mounted || widget.banner.isEmpty) return;
      final next = (_page + 1) % widget.banner.length;
      _controller.animateToPage(
        next,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic
        );
    } );
  }

  @override
  /**
   * timer harus dicancle saat widget dihancurkan atau saat tidak tampil di layar kalo lupa kita cencle timer akan terus mencoba jalan di latar belakang atau backgroud
   * walau carauselnya sudah tidak muncul dilayar ini salah satu penyebab memori leak di flutter
   */

  // untuk menghentikan biar dia ga ajalan di latar belakang
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banner.isEmpty) return const SizedBox.shrink(); 
    return Column(
      children: [
        SizedBox(
          height: 158,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.banner.length,
            //*
            //dipnggil saat pengguna swipe manual, bukan cuman saat digeser otomatis sama timer supaya titik indikator dibawah 
            //selalu sinkron dengan slide yang benar benar tampil
            /// initstate sama setestate
            onPageChanged: (index) => setState(() => _page = index),
            itemBuilder: (contect, index) => BannerSlide(banner: widget.banner[index]),

          ),
        ),
        SizedBox(height: 10),
        CarouselDots(
          count: widget.banner.length,
          activeIndex: _page,
          activeColor: widget.banner[_page].gradientColors.first,
          ),
      ],
    );
  }
}