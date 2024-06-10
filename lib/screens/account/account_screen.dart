import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AccountScreen extends StatelessWidget {
  static String routeName = "/account";

  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Account"),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Navigasi ke halaman pengaturan
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Navigasi ke halaman keranjang
              },
            ),
            Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {
                    // Navigasi ke halaman chat
                  },
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                color: Color(0xFFFB773C),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                              'assets/profile_pic.png'), // Ganti dengan gambar profil
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tumbas',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  // decoration: BoxDecoration(
                                  //   color: Colors.white,
                                  //   borderRadius: BorderRadius.circular(12),
                                  // ),
                                  child: Text(
                                    'Member Classic',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Icon(Icons.chevron_right, color: Colors.white),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Pengikut 0',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  'Mengikuti 2',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TabBar(
                indicatorColor: Color(0xFFFB773C),
                labelColor: Color(0xFFFB773C),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: "Beli"),
                  Tab(text: "Video"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pesanan Saya',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () {
                            // Navigasi ke riwayat pesanan
                          },
                          child: Text('Lihat Riwayat Pesanan',
                              style: TextStyle(color: Colors.blue)),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildOrderStatus(
                            icon: Icons.payment, label: 'Belum Bayar'),
                        _buildOrderStatus(
                            icon: Icons.local_shipping, label: 'Dikemas'),
                        _buildOrderStatus(
                            icon: Icons.airport_shuttle, label: 'Dikirim'),
                        _buildOrderStatus(
                            icon: Icons.star_border, label: 'Beri Penilaian'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderStatus({required IconData icon, required String label}) {
    return Column(
      children: [
        Icon(icon, size: 30),
        SizedBox(height: 4.0),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
