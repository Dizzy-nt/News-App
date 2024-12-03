import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About Tech News App',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'News App adalah aplikasi mobile yang dirancang untuk mempermudah Anda mengakses berita terbaru dari berbagai penjuru dunia, khususnya seputar teknologi. Dengan teknologi API dari NewsAPI, aplikasi ini menyajikan berita secara real-time, lengkap dengan judul, gambar, nama penulis, tanggal publikasi, dan isi berita yang relevan. '
              '\nStay updated with the most recent articles in the tech world!',
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Developer: R.Abdurrosyid - Made With 💖\nGithub: Dizzy-nt\nVersion: 1.0.0',
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
