
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, String> item;

  const DetailPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['title']!),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // Gambar wisata
            Image.network(
              item['image']!,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                item['title']!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Deskripsi wisata
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Informasi detail mengenai tempat wisata ini.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
