// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'dart:math';

class DocumentTile extends StatelessWidget {
  const DocumentTile(
      {super.key,
      required this.text,
      required this.description,
      required this.colorOption,
      required this.icon});
  final text, description, colorOption;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: colorOption,
                  child: icon,
                  // child: const Icon(
                  //   Icons.file_copy,
                  //   color: Colors.white,
                  // )
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    // "Driving License",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    // "Document to drive in India",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 104, 103, 103)),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}
