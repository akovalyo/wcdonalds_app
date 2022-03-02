import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../theme/theme.dart';
import '../../../widgets/image_placeholder.dart';
import '../../../widgets/text_paragraph.dart';

class StakingGameContainer extends StatefulWidget {
  const StakingGameContainer({Key? key}) : super(key: key);

  @override
  State<StakingGameContainer> createState() => _StakingGameContainerState();
}

class _StakingGameContainerState extends State<StakingGameContainer> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> howWorkSliders = [
// ======== SLIDE1 ========
      buildSlide(
        title: '1. FRANCHISE SELL',
        image: 'assets/images/franchise_2.jpeg',
        color: Colors.blue,
        height: 220,
        body: Column(
          children: const [
            TextParagraph('Sell a total of 555 franchises'),
            SizedBox(height: 5),
            TextParagraph('1 SOL* - White List'),
            TextParagraph('1.5* SOL Public'),
            SizedBox(height: 5),
            TextParagraph(
              '*Price can be changed',
              fontSize: 12,
            ),
          ],
        ),
      ),
// ======== SLIDE2 ========
      buildSlide(
        title: '2. STAKE WORKERS',
        image: 'assets/images/worker_wback.png',
        color: Colors.blue,
        height: 220,
        body: Column(
          children: const [
            TextParagraph('Workers generate \$WcDollars every 24h'),
            SizedBox(height: 10),
            TextParagraph(
                'Depending on rarity rank workers generate more or less Wc\$'),
          ],
        ),
      ),
// ======== SLIDE3 ========
      buildSlide(
        title: '3. STAKE FRANCHISE',
        image: 'assets/images/franchise_1.jpeg',
        color: Colors.blue,
        height: 220,
        body: Column(
          children: const [
            TextParagraph(
                'Everytime a Worker claim Wc\$ 20% of that claims goes to pool.'),
            SizedBox(height: 10),
            TextParagraph(
                'At the end of the day all the Wc\$ from the pool goes for each staked Franchise.'),
          ],
        ),
      ),
// ======== SLIDE4 ========
      buildSlide(
        title: '4. RISK GAME',
        image: 'assets/images/bomb.png',
        color: Colors.blue,
        height: 220,
        body: Column(
          children: const [
            TextParagraph(
                'If you unstake a worker it has 15% chance to be reassigned to another Franchise.'),
            SizedBox(height: 10),
            TextParagraph(
                'That risk is lowered if you own a Executive, Chief or Global Wanager.'),
          ],
        ),
      ),

// ======== SLIDE5 ========
      buildSlide(
        title: '4. WHAPPY MEALS',
        image: 'assets/images/whappy_meal.png',
        color: Colors.blue,
        height: 220,
        body: Column(
          children: const [
            TextParagraph('With Wc\$ you can buy Whappy Meals.'),
            SizedBox(height: 10),
            TextParagraph(
                'Each Whappy Meal gives you a brand new NFT from Wcdonalds collection (TOYS) or other collections.'),
          ],
        ),
      ),

// ======== SLIDE6 ========
      buildSlide(
        title: '6. TOYS',
        image: 'assets/images/toys.png',
        color: Colors.blue,
        height: 220,
        body: Column(
          children: const [
            TextParagraph(
                'Toys will be listed in the second marker. All royalties from selling them goes for the liquidity.'),
            SizedBox(height: 10),
            TextParagraph(
                'If you collect one of each toy from a collection you can participate for the Big Wac Raffle.'),
          ],
        ),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
      child: Column(
        children: [
          const Text('HOW DOES IT WORK',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          const SizedBox(height: 10),
          SizedBox(
            height: 300,
            width: AppTheme.getMaxWidgetWidth(context),
            child: CarouselSlider(
              items: howWorkSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  height: 300,
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
            children: howWorkSliders.asMap().entries.map((entry) {
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
        ],
      ),
    );
  }

  Widget buildSlide(
      {required String title,
      required String image,
      required Color color,
      required Widget body,
      double height = 200}) {
    return Container(
      height: height,
      color: color,
      width: AppTheme.getMaxWidgetWidth(context),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            ImagePlaceholder(
              height: 50,
              width: 50,
              imagePath: image,
              placeholder: Container(
                color: Colors.blue[600],
              ),
            ),
            body,
          ],
        ),
      ),
    );
  }
}
