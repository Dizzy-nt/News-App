import 'package:flutter/material.dart';
import '../models/article_model.dart';
import 'package:intl/intl.dart';  // Pastikan sudah diimpor
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context)!.settings.arguments as Article;

    // Format tanggal
    String formatDate(String date) {
      try {
        DateTime parsedDate = DateTime.parse(date);  // Mengonversi ISO 8601 date
        return DateFormat('dd MMMM yyyy, HH:mm').format(parsedDate);  // Format ke tanggal yang lebih mudah dibaca
      } catch (e) {
        return 'Unknown date';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Artikel'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Artikel
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8.0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    article.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Judul Artikel
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),

              // Author dan Published Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article.author != null
                        ? 'By ${article.author}'
                        : 'By Unknown Author',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    article.publishedAt != null
                        ? formatDate(article.publishedAt!)
                        : 'Unknown date',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Konten Artikel
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 6.0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  article.content ?? 'No content available',
                  style: const TextStyle(
                    fontSize: 16.0,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Tombol Buka URL
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(article.url);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    shadowColor: Colors.teal.shade200,
                    elevation: 8.0,
                  ),
                  child: const Text(
                    'Baca Artikel',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
