import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget infoItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // COVER
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/cover.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // FOTO PROFILE
                Positioned(
                  bottom: -50,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage:
                          AssetImage("assets/images/profile.jpg"),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 60),

            Text(
              "Naylani Safitri",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("Jakarta, Indonesia"),
            Text("Tugas Project Mobile Programing"),
            Text("Dosen Pengajar : Ibu Nafiah, S.Si., M.Kom"),
            Text("Flutter Developer"),

            SizedBox(height: 20),

            // BOX PROJECT & FOLLOWERS
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey.shade300,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  infoItem("Project", "16"),
                  Container(height: 40, width: 1, color: Colors.grey),
                  infoItem("Followers", "2308"),
                ],
              ),
            ),

            SizedBox(height: 20),

            // 🔥 BAGIAN PERKENALAN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tentang Saya",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),

                  Text(
                    "Saya adalah mahasiswa Universitas Pamulang Program Studi Sistem Informasi yang sedang mempelajari Mobile Programming menggunakan Flutter. "
                    "Saya memiliki minat dalam pengembangan aplikasi mobile dan terus belajar untuk meningkatkan kemampuan saya "
                    "dalam membuat aplikasi yang menarik dan fungsional.",
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}