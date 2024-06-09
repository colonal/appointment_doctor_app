import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Omar!",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 4),
            Text(
              "How are you doing today?",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).disabledColor.withOpacity(.1),
          child: SvgPicture.asset("assets/svgs/notifications.svg"),
        )
      ],
    );
  }
}
