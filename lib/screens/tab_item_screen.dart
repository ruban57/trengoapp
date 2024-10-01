import 'package:flutter/material.dart';

class TabItemScreen extends StatelessWidget {
  final String title;


  const TabItemScreen({
    super.key,
    required this.title,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
            ),
             Container(
              margin: const EdgeInsetsDirectional.all(20.0),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
    );
  }
}