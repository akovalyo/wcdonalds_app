import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../theme/theme.dart';
import '../../../widgets/image_placeholder.dart';
import '../../../widgets/text_paragraph.dart';

class WhappyMealContainer extends StatefulWidget {
  const WhappyMealContainer({Key? key}) : super(key: key);

  @override
  State<WhappyMealContainer> createState() => _WhappyMealContainerState();
}

class _WhappyMealContainerState extends State<WhappyMealContainer> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      const SizedBox(height: 12),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Cost: ',
              style: AppTheme.richTextBody1Black(context, bold: true),
            ),
            TextSpan(
              text: '1000 \$WcdDollars',
              style: AppTheme.richTextBody1Black(context),
            ),
          ],
        ),
      ),
      const SizedBox(height: 6),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Supply: ',
              style: AppTheme.richTextBody1Black(context, bold: true),
            ),
            TextSpan(
              text: '1000',
              style: AppTheme.richTextBody1Black(context),
            ),
          ],
        ),
      ),
    ];

    final List<Widget> slides = [
// ======== SLIDE1 ========
      WhappyMealSlide(
        title: '1000',
        num: '1',
        height: 160,
        body: Column(
          children: children,
        ),
      ),
// ======== SLIDE2 ========
      WhappyMealSlide(
        title: '1000',
        num: '2',
        height: 160,
        body: Column(
          children: children,
        ),
      ),
// ======== SLIDE3 ========
      WhappyMealSlide(
        title: '1000',
        num: '3',
        height: 160,
        body: Column(
          children: children,
        ),
      ),
// ======== SLIDE4 ========
      WhappyMealSlide(
        title: '1000',
        num: '4',
        height: 160,
        body: Column(
          children: children,
        ),
      ),

// ======== SLIDE5 ========
      WhappyMealSlide(
        title: 'NEW PHASE',
        num: '?',
        height: 220,
        body: Column(
          children: const [
            SizedBox(height: 12),
            TextParagraph(
                'After all Whappy Meals are sold out we will start a new phase where \$WcDollars is important.'),
          ],
        ),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
      child: Column(
        children: [
          const TextParagraph(
              'Whappy Meals are the way you use your \$WcDollars. Whappy Meals are divided in 4 collections. Each collectin will have unique TOYS (NFTs) for that collection mixed with some other NFTs from other projects with different value. This means a Whappy Meal can have a Wcdonalds Toy, a Kirin Kingdom NFT or even a The Suits NFT (both are examples).'),
          const Divider(
            color: Colors.yellow,
          ),
          const SizedBox(height: 12),
          const TextParagraph(
            'WHAPPY MEALS COLLECTION',
            bold: true,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 250,
            width: AppTheme.getMaxWidgetWidth(context),
            child: CarouselSlider(
              items: slides,
              carouselController: _controller,
              options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  autoPlayInterval: const Duration(
                    seconds: 8,
                  ),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: slides.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
          const Divider(
            color: Colors.yellow,
          ),
          const SizedBox(height: 12),
          const TextParagraph(
            'WHAPPY MEALS DROPS',
            bold: true,
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '• TOYS: ',
                  style: AppTheme.richTextBody1Black(context, bold: true),
                ),
                TextSpan(
                  text:
                      '65% chances to get a WcDonalds Toy from your Whappy Meal. If you collect all toys from the collection you will enter in a raffle for a surprise NFT.',
                  style: AppTheme.richTextBody1Black(context),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '• Low tier NFTs: ',
                  style: AppTheme.richTextBody1Black(context, bold: true),
                ),
                TextSpan(
                  text:
                      'Other collections NFTs have a 20% chances to come in a Whappy Meal.',
                  style: AppTheme.richTextBody1Black(context),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '• NFTs: ',
                  style: AppTheme.richTextBody1Black(context, bold: true),
                ),
                TextSpan(
                  text:
                      'More valuable NFTs wil lhave a 5% chances to come in a Wappy Meal.',
                  style: AppTheme.richTextBody1Black(context),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '• Unlucky: ',
                  style: AppTheme.richTextBody1Black(context, bold: true),
                ),
                TextSpan(
                  text: '10% chances to get nothing.',
                  style: AppTheme.richTextBody1Black(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WhappyMealSlide extends StatelessWidget {
  final String title;
  final Widget body;
  final double height;
  final String num;
  const WhappyMealSlide({
    Key? key,
    required this.title,
    required this.body,
    this.height = 200,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 216, 71, 68),
      height: height,
      width: AppTheme.getMaxWidgetWidth(context),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Image(
                    color: Color.fromRGBO(239, 83, 80, 1),
                    image: AssetImage('assets/images/circle.png'),
                    height: 50,
                  ),
                  TextParagraph(
                    num,
                    fontFamilyHeadline: true,
                    bold: true,
                  ),
                ],
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            body,
          ],
        ),
      ),
    );
  }
}
