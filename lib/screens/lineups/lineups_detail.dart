import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:valineups/banner_ads.dart';
import 'package:valineups/google_ads.dart';
import 'package:valineups/styles/project_color.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class LineupDetailScreen extends StatefulWidget {
  final DocumentSnapshot lineup;

  LineupDetailScreen({required this.lineup});

  @override
  _LineupDetailScreenState createState() => _LineupDetailScreenState();
}

class _LineupDetailScreenState extends State<LineupDetailScreen> {
  late PageController _pageController;
  int _currentImageIndex = 0;
  BannerAd? _bannerAd;
  final GoogleAds _googleAds = GoogleAds();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentImageIndex);
    _googleAds.loadBannerAd(onAdLoaded: (ad) {
      setState(() {
        _bannerAd = ad;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final imagePaths = List<String>.from(widget.lineup['imagePaths']);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.circle, color: ProjectColor().dark),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ProjectColor().white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: ProjectColor().dark,
      ),
      backgroundColor: ProjectColor().dark,
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                if (_bannerAd != null)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SafeArea(
                      child: Container(
                        width: _bannerAd!.size.width.toDouble(),
                        height: _bannerAd!.size.height.toDouble(),
                        child: AdWidget(ad: _bannerAd!),
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: PhotoViewGallery.builder(
                pageController: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                },
                itemCount: imagePaths.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(imagePaths[index]),
                    initialScale: PhotoViewComputedScale.contained,
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                  );
                },
                scrollPhysics: BouncingScrollPhysics(),
                backgroundDecoration: BoxDecoration(
                  color: ProjectColor().dark,
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: _currentImageIndex,
                  count: imagePaths.length,
                  effect: ScrollingDotsEffect(
                    activeDotColor: ProjectColor().white,
                    dotColor: ProjectColor().white.withOpacity(0.5),
                    dotHeight: 8.0,
                    dotWidth: 8.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            GoogleAdsPage()
          ],
        ),
      ),
    );
  }
}
