import 'package:flutter/material.dart';

class FrequentlyCard extends StatelessWidget {
  const FrequentlyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Album image
          SizedBox(
            width: 150,
            height: 200,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  color: Colors.amber,
                )

                //  Image.asset(
                //   "",
                //   fit: BoxFit.cover,
                //   width: double.infinity,
                // ),
                ),
          ),
          const SizedBox(height: 5),
          // Album name
          const Text(
            'Album name',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          // Artist name
          const Text(
            'song name',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}