import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';

class BannerAndDetails extends StatelessWidget {
  const BannerAndDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                height: 200.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/banner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 145.0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        AppContanst.USERNAME,
                        style: const TextStyle(fontSize: 22),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: colorDarkBlue,
                          ),
                          Text('London, UK',
                              style: TextStyle(color: colorBodyText)),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RatingBarIndicator(
                        rating: 5,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                        itemCount: 5,
                        itemSize: 15.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // Profile image
          Positioned(
            top: 130.0, // (background container size) - (circle height / 2)
            child: Container(
              height: 140.0,
              width: 140.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: colorPink),
                    child: const Center(
                      child: Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover),
                  border: Border.all(
                    color: colorWhite,
                    width: 4,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
