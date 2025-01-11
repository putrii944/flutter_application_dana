import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KirimUangPage(),
    );
  }
}

class KirimUangPage extends StatelessWidget {
  const KirimUangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kirim Uang'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Cari nomor telepon/rekening bank',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView(
                padding: const EdgeInsets.symmetric(vertical: 1),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Jumlah item per baris
                  crossAxisSpacing: 4, // Jarak horizontal antar item
                  mainAxisSpacing: 4, // Jarak vertikal antar item
                ),
                children: [
                  _buildMenuCard(Icons.group, 'Kirim ke Grup',
                      labelBadge: 'Baru'),
                  _buildMenuCard(Icons.group_add, 'Kirim ke Teman'),
                  _buildMenuCard(Icons.account_balance, 'Kirim ke Bank',
                      labelBadge: 'Gratis Transfer 10x'),
                  _buildMenuCard(Icons.wallet, 'Saldo Digital'),
                  _buildMenuCard(Icons.money, 'Tarik Tunai'),
                  _buildMenuCard(Icons.card_giftcard, 'DANA Kaget'),
                  _buildMenuCard(Icons.chat, 'Kirim ke Chat'),
                  _buildMenuCard(Icons.qr_code, 'Scan QR Code'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'TUTUP',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(IconData icon, String label, {String? labelBadge}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 25, // Ukuran lebih kecil
              child: Icon(icon, size: 24), // Ukuran ikon lebih kecil
            ),
            if (labelBadge != null)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4, vertical: 2), // Padding lebih kecil
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    labelBadge,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
