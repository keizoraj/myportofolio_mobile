import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/widgets/project_card.dart';

// Halaman utama MyPortfolio
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // Data pemilik portofolio
  final String npm = "2506597510";
  final String nama = "Keizora Jelita Wohingati";
  final String kelas = "PBP A";

  // Daftar tombol menu
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Proyek", Icons.folder, Colors.blue),
    ItemHomepage("Tambah Proyek", Icons.add_circle, Colors.green),
    ItemHomepage("Logout", Icons.logout, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyPortfolio',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Kartu informasi pemilik portofolio
              Row(
                children: [
                  Expanded(
                    child: InfoCard(
                      title: 'NPM',
                      content: npm,
                    ),
                  ),
                  Expanded(
                    child: InfoCard(
                      title: 'Name',
                      content: nama,
                    ),
                  ),
                  Expanded(
                    child: InfoCard(
                      title: 'Class',
                      content: kelas,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16.0),

              // Sambutan dan menu
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Selamat datang di MyPortfolio Mobile!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),

              const SizedBox(height: 16.0),

              // Grid menu
              GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: items.map((ItemHomepage item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget kartu informasi
class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}

// Model data tombol menu
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}
