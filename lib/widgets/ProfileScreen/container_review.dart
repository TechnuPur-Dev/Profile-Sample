import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:profilescreen/utils/colors.dart';

class ReviewDetails extends StatelessWidget {
  const ReviewDetails({Key? key, required this.review, required this.flag})
      : super(key: key);
  final bool flag;
  final dynamic review;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBarIndicator(
            rating: review["reviewStart"],
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
            itemCount: 5,
            itemSize: 15.0,
            direction: Axis.horizontal,
          ),
          Text(
            DateFormat('MM/dd/yyyy').format(review["date"]),
            style: TextStyle(fontSize: 12, color: colorBodyText),
          )
        ],
      ),
      Text(
        review["review"],
        style: TextStyle(fontSize: 14, color: colorBodyText),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              review["clientName"],
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      if (flag)
        Divider(
          height: 30,
          color: colorBorderColor,
        )
    ]);
  }
}
