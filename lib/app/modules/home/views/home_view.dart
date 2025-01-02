import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';
import 'package:myapp/app/modules/dosen/views/dosen_add_view.dart';
import 'package:myapp/app/modules/dosen/views/dosen_view.dart';
import 'package:myapp/app/modules/mahasiswa/views/mahasiswa_add_view.dart';
import 'package:myapp/app/modules/mahasiswa/views/mahasiswa_view.dart';
import 'package:myapp/app/modules/pegawai/views/pegawai_add_view.dart';
import 'package:myapp/app/modules/pegawai/views/pegawai_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return DashboardAdmin();
  }
}

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  final cAuth = Get.find<AuthController>();
  int _index = 0;
  List<Map> _fragment = [
    {
      'title': 'Data Matakuliah',
      'view': MahasiswaView(),
      'add': () => MahasiswaAddView()
    },
    {
      'title': 'Data Mahasiswa',
      'view': MahasiswaView(),
      'add': () => MahasiswaAddView()
    },
    {'title': 'Data Dosen', 'view': DosenView(), 'add': () => DosenAddView()},
    {
      'title': 'Data Karyawan',
      'view': PegawaiView(),
      'add': () => PegawaiAddView()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 157, 216),
        titleSpacing: 0,
        title: Text(_fragment[_index]['title']),
        actions: [
          IconButton(
            onPressed: () => Get.to(_fragment[_index]['add']),
            icon: Icon(Icons.add_circle_outline),
          )
        ],
      ),
      body: _fragment[_index]['view'],
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 160, 33, 33),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  backgroundImage: NetworkImage(
                    "https://trueog.id/cdn/shop/files/TimetoChill_1.jpg?v=1726660243",
                  ),
                  onBackgroundImageError: (exception, stackTrace) {
                    print('Error loading image: $exception');
                  },
                ),
                Text(
                  "Tirta Rizki Ramadhan",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Admin UTI',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 0);
              Get.back();
            },
            leading: Icon(Icons.dashboard),
            title: Text('Matakuliah 22312163'),
            trailing: Icon(Icons.navigate_next),
            iconColor: const Color.fromARGB(255, 33, 113, 160),
            textColor: const Color.fromARGB(255, 33, 113, 160),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 1);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Mahasiswa'),
            trailing: Icon(Icons.navigate_next),
            iconColor: const Color.fromARGB(255, 33, 113, 160),
            textColor: const Color.fromARGB(255, 33, 113, 160),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 2);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Dosen'),
            trailing: Icon(Icons.navigate_next),
            iconColor: const Color.fromARGB(255, 33, 113, 160),
            textColor: const Color.fromARGB(255, 33, 113, 160),
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 3);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Karyawan 22312163'),
            trailing: Icon(Icons.navigate_next),
            iconColor: const Color.fromARGB(255, 33, 113, 160),
            textColor: const Color.fromARGB(255, 33, 113, 160),
          ),
          ListTile(
            onTap: () {
              Get.back();
              cAuth.logout();
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.navigate_next),
            iconColor: const Color.fromARGB(255, 33, 113, 160),
            textColor: const Color.fromARGB(255, 33, 113, 160),
          ),
        ],
      ),
    );
  }
}
