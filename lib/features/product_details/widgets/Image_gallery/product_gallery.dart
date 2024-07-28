import 'package:f7apparel_mobile/features/product_details/widgets/Image_gallery/thumbnail_indicator.dart';
import 'package:f7apparel_mobile/models/product_list/product_list.dart';
import 'package:f7apparel_mobile/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ProductGallery extends StatefulWidget {
  final List<Images> productImages;

  const ProductGallery({super.key, required this.productImages});

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 380,
                width: MediaQuery.of(context).size.width ,
                padding: const EdgeInsets.all(10),
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.productImages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) =>
                        Card(
                          // margin:  const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 5),
                          color: Colors.white,
                          elevation: 1,
                          child: Hero(
                            tag: 'mainImage',
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                widget.productImages[index].src!,
                                // width: double.infinity,
                                height: 210,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap:  () async {
                    await Share.shareUri( Uri.parse('https://www.youtube.com/watch?v=Gy1by7rKdME'), );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 30, right: 30),
                    child: const Icon(Icons.share, size: 30,),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                widget.productImages.length,
                    (index) =>
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: ThumbNailIndicator(
                        imageUrl: widget.productImages[index].src!,
                        isActive: index == _pageIndex,
                      ),
                    )),
          ),
        ]);
  }
}
