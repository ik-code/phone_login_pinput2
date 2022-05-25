import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:phone_login/widgets/outlinebutton_pg.dart';
import 'package:phone_login/widgets/raised_btn_pg.dart';

import '../../../utilities/constans.dart';
import '../../menu_screen.dart';
import '../../../widgets/accordion.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  "https://lav.playground.wdscode.guru/storage/services/1653468559default-getaway.jpg",
  "https://lav.playground.wdscode.guru/storage/services/1652970409yacht.jpg",
  "https://lav.playground.wdscode.guru/storage/services/1653468559getaway.jpg",
];

class CategoryServiceSinglePostScreen extends StatefulWidget {
  static const routeName = '/category-service-single-post-screen';

  const CategoryServiceSinglePostScreen({Key? key}) : super(key: key);

  @override
  State<CategoryServiceSinglePostScreen> createState() =>
      _CategoryServiceSinglePostScreenState();
}

class _CategoryServiceSinglePostScreenState
    extends State<CategoryServiceSinglePostScreen> {
  var _ratingValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: IconButton(
            icon: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Color(0xFFFEFBDA),
                  Color(0xFFFEE9D2),
                ]),
              ),
              child: const Icon(Icons.arrow_back),
            ),
            iconSize: 24,
            color: const Color(0xFF212121),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.menu),
              iconSize: 40,
              color: const Color(0xFF212121),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: const [
                        Text(
                          'created by',
                          style: kCatServiceSinglePostAuthorGreyStyle,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Wade Warren',
                          style: kCatServiceSinglePostAuthorOrangeStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(height: 190.0),
                      items: imgList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                child: Image.network(
                                  i,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Yacht rent Pershing 90 in Blue Water Marina, Bimini (2007, refit 2017)',
                      style: kCatServiceSinglePostTitleBlackStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: const [
                        Text('26 May, 2022',
                            style: kCatServiceSinglePostTimeGreyStyle),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '10:00AM',
                          style: kCatServiceSinglePostTimeGreyStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "95' Azimut Flybridge yacht available for overnight trips to the Bahamas.Great condition, newly refit with incredible 5 star service.Water toys and snorkeling gear included!Explore the beautiful bay by boat! Book this 95' Azimut Flybridge Power Mega Yacht that can accommodate up to 9 people overnight... ",
                      style: kCatServiceSinglePostTextBlackStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Accordion(
                        title: 'Read More',
                        content:
                            "Rates starting as low as \$6,000 per day.You can cruise to the Bahamas and many more destinations.*A minimum 10-15% tip is mandatory for crew members and is not included in the charter prices.Rates include: Captain and crew members Boat pick up and drop off at the Marina Fun water activities for adults and kids Dinghy Water googles Water tubes Snorkeling gear Paddle Boards Full tank of Gas We provide towels, drinks, sodas, water, ice, etc. A brand new blue-tooth speaker system installed Brand new amplifier systems What You Can Expect:Enjoy this 5-star rated yacht from Azimut boat yard while discovering the beautiful destinations all around the Bahamas, Bimini, and many more!Expect comfort, excellent service, and a great time!If you have any questions we can answer them in the messaging platform before you pay."),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFF7F7F7),
                  ],
                )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '\$ 1600.00',
                            style: kGetawaysPriceStyle,
                          ),
                          Text(
                            '/ per day',
                            style: kCatServiceSinglePostTextBlackStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      RaisedButtonPG(
                          text: 'Book Service', onPressedHandler: () {}),
                    ],
                  ),
                ),
              ),

              // const SizedBox(
              //   height: 24,
              // ),
              Container(
                padding: const EdgeInsets.only(top: 48),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFF7F7F7),
                  ],
                )),
                child: Card(
                  elevation: 0.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(36), topRight:Radius.circular(36) )),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0, left: 24.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 24.0, bottom: 8.0),
                            child: RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Reviews - ',
                                    style:
                                        kCatServiceSinglePostReviewsTitleBlackStyle,
                                  ),
                                  TextSpan(
                                    text:
                                        'Yacht rent Pershing 90 in Blue Water Marina, Bimini (2007, refit 2017)',
                                    style:
                                        kCatServiceSinglePostReviewsTitleGreyStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              RatingBar(
                                initialRating: 4.5,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 28.0,
                                ratingWidget: RatingWidget(
                                  full: const Icon(
                                    Icons.star_rate_rounded,
                                    color: kOrangePG,
                                    size: 12.0,
                                  ),
                                  half: const Icon(
                                    Icons.star_half_rounded,
                                    color: kOrangePG,
                                  ),
                                  empty: const Icon(
                                    Icons.star_border_rounded,
                                    color: kOrangePG,
                                  ),
                                ),
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                  setState(() {
                                    _ratingValue = rating;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                '4.5',
                                style:
                                    kCatServiceSinglePostReviewsRaitingNumberStyle,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                              width: double.infinity,
                              child: OutlineButtonPG(
                                  text: 'Leave feedback',
                                  onPressedHandler: () {})),
                          const SizedBox(
                            height: 40,
                          ),
                          Column(
                           
                            children: [
                              Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                children: const[
                                  Text(
                                    'Esther Howard',
                                    style:
                                        kCatServiceSinglePostReviewsAuthorNumberStyle,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '30 May, 2021',
                                    style: kCatServiceSinglePostTimeGreyStyle,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Velit massa mus mattis velit at gravida nisi, at. In vitae arcu ultricies scelerisque dapibus. Venenatis, dignissim dolor ut quis nec, faucibus bibendum in. ',
                                    style: kCatServiceSinglePostTextBlackStyle,
                                  ),
                                  Divider(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                    height: 40,
                                  ),
                                ],
                              ),
                              Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                children: const[
                                  Text(
                                    'Esther Howard',
                                    style:
                                        kCatServiceSinglePostReviewsAuthorNumberStyle,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '30 May, 2021',
                                    style: kCatServiceSinglePostTimeGreyStyle,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Velit massa mus mattis velit at gravida nisi, at. In vitae arcu ultricies scelerisque dapibus. Venenatis, dignissim dolor ut quis nec, faucibus bibendum in. ',
                                    style: kCatServiceSinglePostTextBlackStyle,
                                  ),
                                  Divider(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                    height: 40,
                                  ),
                                ],
                              ),
                            Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                                children: const[
                                  Text(
                                    'Esther Howard',
                                    style:
                                        kCatServiceSinglePostReviewsAuthorNumberStyle,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '30 May, 2021',
                                    style: kCatServiceSinglePostTimeGreyStyle,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Velit massa mus mattis velit at gravida nisi, at. In vitae arcu ultricies scelerisque dapibus. Venenatis, dignissim dolor ut quis nec, faucibus bibendum in. ',
                                    style: kCatServiceSinglePostTextBlackStyle,
                                  ),
                                  Divider(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                    height: 40,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              )
              //     Expanded(
              //         child: _isLoadingServiceCategoryPostList
              //               ? const Center(
              //                     child: CircularProgressIndicator(),
              //               )
              //               :
              //               SingleChildScrollView(
              //           physics: const ScrollPhysics(),
              //           child:  Column(
              //                   children: [
              //                     Column(
              //                       children: [
              //                         // Text('arguments[dataItem]: '),
              //                         ListView.builder(
              //                           physics: const NeverScrollableScrollPhysics(),
              //                           shrinkWrap: true,
              //                           itemCount: dataItem.length,
              //                           itemBuilder: (ctx, i) =>
              //                               ServiceCategoryPostListItem(
              //                             dataItem[i]['id'],
              //                             dataItem[i]['title'],
              //                             dataItem[i]['price'].toDouble(),
              //                             dataItem[i]['fee'],
              //                             dataItem[i]['photos'],
              //                             dataItem[i]['description'],
              //                             dataItem[i]['date_time'],
              //                             dataItem[i]['duration_hours'],
              //                             dataItem[i]['duration_minutes'],
              //                             dataItem[i]['payment_type'].toString(),
              //                             dataItem[i]['created_by_id'],
              //                             dataItem[i]['created_at'],
              //                             dataItem[i]['updated_at'],
              //                             dataItem[i]['excerpt'],
              //                             dataItem[i]['pivot'],
              //                           ),
              //                         )
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //         ),
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}
