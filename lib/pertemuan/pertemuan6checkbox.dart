import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Pertemuan6Checkbox extends StatefulWidget {
  const Pertemuan6Checkbox({super.key}); //

  @override
  State<Pertemuan6Checkbox> createState() => _Pertemuan6CheckboxState();
}

class _Pertemuan6CheckboxState extends State<Pertemuan6Checkbox> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();

  bool _isCheckedSyarat = false;
  String _errorText = '';

  Map<String, bool> _hobbies = {
    'Membaca': false,
    'Olahraga': false,
    'Musik': false,
    'Game': false,
    'Traveling': false,
  };

  String _namaError = '';
  String _nimError = '';
  String _kelasError = '';
  String _hobbyError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Form dengan Checkbox'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildDataDiri(),
            const SizedBox(height: 20),
            _buildHobi(),
            const SizedBox(height: 20),
            _buildSyarat(),
            const SizedBox(height: 20),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDataDiri() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Data Diri", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: _namaController,
              decoration: InputDecoration(
                labelText: "Nama",
                errorText: _namaError.isEmpty ? null : _namaError,
              ),
            ),
            TextField(
              controller: _nimController,
              decoration: InputDecoration(
                labelText: "NIM",
                errorText: _nimError.isEmpty ? null : _nimError,
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _kelasController,
              decoration: InputDecoration(
                labelText: "Kelas",
                errorText: _kelasError.isEmpty ? null : _kelasError,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHobi() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text("Hobi (minimal 1)", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ..._hobbies.keys.map((hobby) {
            return CheckboxListTile(
              title: Text(hobby),
              value: _hobbies[hobby],
              onChanged: (val) {
                setState(() {
                  _hobbies[hobby] = val!;
                });
              },
            );
          }).toList(),
          if (_hobbyError.isNotEmpty)
            Text(_hobbyError, style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  Widget _buildSyarat() {
    return Card(
      child: Column(
        children: [
          CheckboxListTile(
            title: const Text("Setuju syarat & ketentuan"),
            value: _isCheckedSyarat,
            onChanged: (val) {
              setState(() {
                _isCheckedSyarat = val!;
              });
            },
          ),
          if (_errorText.isNotEmpty)
            Text(_errorText, style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () => _submit(),
      child: const Text("DAFTAR SEKARANG"),
    );
  }

  void _submit() {
    setState(() {
      _namaError = _namaController.text.isEmpty ? "Nama wajib diisi" : "";
      _nimError = _nimController.text.isEmpty ? "NIM wajib diisi" : "";
      _kelasError = _kelasController.text.isEmpty ? "Kelas wajib diisi" : "";
      _hobbyError = !_hobbies.values.any((e) => e)
          ? "Pilih minimal 1 hobi"
          : "";
      _errorText = !_isCheckedSyarat ? "Harus setuju syarat" : "";
    });

    if (_namaError.isEmpty &&
        _nimError.isEmpty &&
        _kelasError.isEmpty &&
        _hobbyError.isEmpty &&
        _errorText.isEmpty) {
      
      List<String> selectedHobby = _hobbies.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Pendaftaran Berhasil"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Nama: ${_namaController.text}"),
              Text("NIM: ${_nimController.text}"),
              Text("Kelas: ${_kelasController.text}"),
              Text("Hobi: ${selectedHobby.join(", ")}"),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Fluttertoast.showToast(msg: "Data berhasil disimpan");
              },
              child: const Text("OK"),
            )
          ],
        ),
      );
    }
  }
}