import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,  // Base color of the shimmer
      highlightColor: Colors.grey[100]!, // Highlight moving color
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 20, width: 150, color: Colors.white), // Title placeholder
              SizedBox(height: 10),
              Container(height: 14, width: double.infinity, color: Colors.white), // Subtitle
              SizedBox(height: 10),
              Container(height: 14, width: double.infinity, color: Colors.white), // Subtitle
            ],
          ),
        ),
      ),
    );
  }
}
