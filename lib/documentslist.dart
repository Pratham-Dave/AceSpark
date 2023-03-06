import 'package:flutter/material.dart';

class DocumentTile extends StatelessWidget {
  const DocumentTile({super.key});

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
                      color: Colors.orange,
                      child: const Icon(
                        Icons.file_copy,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Driving License",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Document to drive in India",
                      style:
                          TextStyle(color: Color.fromARGB(255, 104, 103, 103)),
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
        ));
  }
}
