import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BerandaPage extends StatelessWidget {

  void showToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  void showDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Konfirmasi"),
       content: Text(
        "Ingin melanjutkan ke materi berikutnya?\n"
        "Klik lanjut untuk melihat penjelasan selanjutnya."
      ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Tidak"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Fluttertoast.showToast(msg: "Silahkan Klik Menu List di Bawah yaaa!!");
            },
            child: Text("Lanjut"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Menu Utama",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () => showToast("Data berhasil disimpan"),
              icon: Icon(Icons.save),
              label: Text("Submit"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),

            SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () => showToast("Data berhasil dihapus"),
              icon: Icon(Icons.delete),
              label: Text("Delete"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),

            SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: () => showDialogBox(context),
              icon: Icon(Icons.warning),
              label: Text("Dialog"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}