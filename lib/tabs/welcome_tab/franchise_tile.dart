import 'dart:ffi';

import 'package:flutter/material.dart';

class FranchiseTile extends StatelessWidget {
  final VoidCallback onTap;
  final int franchiseIndex;
  const FranchiseTile({
    Key? key,
    required this.onTap,
    required this.franchiseIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: const Key('franchiseWidget'),
      onTap: onTap,
      child: Container(
        color: const Color(0xFFBA68C8),
        child: AnimatedCrossFade(
          crossFadeState: franchiseIndex == 0
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 500),
          firstChild: const Image(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/franchise_1.jpeg'),
          ),
          secondChild: const Image(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/franchise_2.jpeg'),
          ),
        ),
      ),
    );
  }
}
