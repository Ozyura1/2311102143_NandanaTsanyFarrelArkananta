import 'package:flutter/material.dart';

void main() {
  runApp(const KafeNusantaraApp());
}

class KafeNusantaraApp extends StatelessWidget {
  const KafeNusantaraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kafe Nusantara',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D68)),
        scaffoldBackgroundColor: const Color(0xFFF7F3EA),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  final String title;
  final String description;
  final String imageUrl;
  final String price;
}

const List<MenuItem> menuItems = [
  MenuItem(
    title: 'Nasi Goreng Rempah',
    description: 'Nasi goreng hangat dengan telur, ayam suwir, dan acar segar.',
    imageUrl:
        'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=900&q=80',
    price: 'Rp 28.000',
  ),
  MenuItem(
    title: 'Es Kopi Gula Aren',
    description: 'Kopi susu dingin dengan manis legit gula aren asli.',
    imageUrl:
        'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?auto=format&fit=crop&w=900&q=80',
    price: 'Rp 22.000',
  ),
  MenuItem(
    title: 'Sate Ayam Bumbu Kacang',
    description: 'Sate ayam bakar dengan bumbu kacang gurih dan lontong.',
    imageUrl:
        'https://images.unsplash.com/photo-1529563021893-cc83c992d75d?auto=format&fit=crop&w=900&q=80',
    price: 'Rp 30.000',
  ),
  MenuItem(
    title: 'Pisang Goreng Coklat',
    description: 'Pisang goreng renyah dengan coklat leleh dan taburan keju.',
    imageUrl:
        'https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?auto=format&fit=crop&w=900&q=80',
    price: 'Rp 18.000',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D68),
        foregroundColor: Colors.white,
        title: const Text('Kafe Nusantara'),
        actions: [
          IconButton(
            tooltip: 'Buka form',
            icon: const Icon(Icons.edit_note),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FormPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: const Color(0xFF2E7D68),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Menu Favorit Hari Ini',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Pilih menu, lihat detail, lalu kirim pesanan sederhana.',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(item: item),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item.imageUrl,
                              width: 96,
                              height: 96,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 96,
                                  height: 96,
                                  color: const Color(0xFFE4DED1),
                                  child: const Icon(Icons.restaurant, size: 36),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFF606060),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  item.price,
                                  style: const TextStyle(
                                    color: Color(0xFF2E7D68),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF2E7D68),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.shopping_bag),
        label: const Text('Form Pesan'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormPage()),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D68),
        foregroundColor: Colors.white,
        title: const Text('Detail Menu'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              item.imageUrl,
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 230,
                  color: const Color(0xFFE4DED1),
                  child: const Icon(Icons.restaurant, size: 64),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Text(
            item.title,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            item.price,
            style: const TextStyle(
              color: Color(0xFF2E7D68),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            item.description,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            icon: const Icon(Icons.add_shopping_cart),
            label: const Text('Pesan Sekarang'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController orderController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    orderController.dispose();
    super.dispose();
  }

  void submitOrder() {
    final name = nameController.text.trim();
    final order = orderController.text.trim();

    if (name.isEmpty || order.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama dan pesanan wajib diisi.')),
      );
      return;
    }

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pesanan Berhasil'),
          content: Text('Terima kasih, $name. Pesanan "$order" sudah dicatat.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Pesanan $order dikirim.')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D68),
        foregroundColor: Colors.white,
        title: const Text('Form Pesanan'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Isi Data Pesanan',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: orderController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pesanan',
                    prefixIcon: Icon(Icons.local_cafe),
                  ),
                ),
                const SizedBox(height: 18),
                FilledButton.icon(
                  icon: const Icon(Icons.send),
                  label: const Text('Kirim Pesanan'),
                  onPressed: submitOrder,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
