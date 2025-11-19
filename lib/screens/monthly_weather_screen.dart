import 'package:flutter/material.dart';

class MonthlyWeatherScreen extends StatefulWidget {
  final String cityName;

  const MonthlyWeatherScreen({Key? key, required this.cityName}) : super(key: key);

  @override
  State<MonthlyWeatherScreen> createState() => _MonthlyWeatherScreenState();
}

class _MonthlyWeatherScreenState extends State<MonthlyWeatherScreen> {
  // Daftar semua bulan
  final List<String> _months = const [
    'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 
    'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
  ];
  
  // Inisialisasi bulan yang dipilih
  late String _selectedMonth;

  // 💡 Data perkiraan bulanan (12 bulan)
  // Format: {'Kota': {'Bulan': {'max': '...', 'min': '...', 'hujan': '...', 'kondisi': '...'}}}
  final Map<String, Map<String, Map<String, String>>> _monthlyData = {
    'Jakarta': {
      'Januari': {'max': '30°C', 'min': '24°C', 'hujan': '20 hari', 'kondisi': 'Hujan Ringan'},
      'Februari': {'max': '30°C', 'min': '24°C', 'hujan': '18 hari', 'kondisi': 'Hujan Ringan'},
      'Maret': {'max': '31°C', 'min': '25°C', 'hujan': '15 hari', 'kondisi': 'Berawan'},
      'April': {'max': '32°C', 'min': '25°C', 'hujan': '12 hari', 'kondisi': 'Cerah Berawan'},
      'Mei': {'max': '33°C', 'min': '26°C', 'hujan': '8 hari', 'kondisi': 'Cerah'},
      'Juni': {'max': '33°C', 'min': '26°C', 'hujan': '5 hari', 'kondisi': 'Cerah'},
      'Juli': {'max': '33°C', 'min': '26°C', 'hujan': '4 hari', 'kondisi': 'Cerah'},
      'Agustus': {'max': '34°C', 'min': '27°C', 'hujan': '3 hari', 'kondisi': 'Panas'},
      'September': {'max': '34°C', 'min': '27°C', 'hujan': '5 hari', 'kondisi': 'Cerah'},
      'Oktober': {'max': '33°C', 'min': '26°C', 'hujan': '10 hari', 'kondisi': 'Berawan'},
      'November': {'max': '32°C', 'min': '25°C', 'hujan': '15 hari', 'kondisi': 'Hujan Ringan'},
      'Desember': {'max': '31°C', 'min': '25°C', 'hujan': '22 hari', 'kondisi': 'Hujan Sedang'},
    },
    'Bandung': {
      'Januari': {'max': '25°C', 'min': '18°C', 'hujan': '25 hari', 'kondisi': 'Berawan'},
      'Februari': {'max': '25°C', 'min': '18°C', 'hujan': '23 hari', 'kondisi': 'Berawan'},
      'Maret': {'max': '26°C', 'min': '19°C', 'hujan': '20 hari', 'kondisi': 'Hujan Ringan'},
      'April': {'max': '27°C', 'min': '19°C', 'hujan': '15 hari', 'kondisi': 'Cerah Berawan'},
      'Mei': {'max': '28°C', 'min': '20°C', 'hujan': '10 hari', 'kondisi': 'Cerah'},
      'Juni': {'max': '28°C', 'min': '19°C', 'hujan': '5 hari', 'kondisi': 'Cerah'},
      'Juli': {'max': '28°C', 'min': '19°C', 'hujan': '3 hari', 'kondisi': 'Cerah'},
      'Agustus': {'max': '29°C', 'min': '20°C', 'hujan': '2 hari', 'kondisi': 'Panas'},
      'September': {'max': '29°C', 'min': '20°C', 'hujan': '5 hari', 'kondisi': 'Cerah'},
      'Oktober': {'max': '28°C', 'min': '19°C', 'hujan': '12 hari', 'kondisi': 'Berawan'},
      'November': {'max': '27°C', 'min': '18°C', 'hujan': '20 hari', 'kondisi': 'Hujan'},
      'Desember': {'max': '26°C', 'min': '18°C', 'hujan': '24 hari', 'kondisi': 'Hujan'},
    },
    'Bogor': {
      'Januari': {'max': '23°C', 'min': '19°C', 'hujan': '28 hari', 'kondisi': 'Hujan Deras'},
      'Februari': {'max': '24°C', 'min': '19°C', 'hujan': '26 hari', 'kondisi': 'Hujan Deras'},
      'Maret': {'max': '25°C', 'min': '20°C', 'hujan': '24 hari', 'kondisi': 'Hujan'},
      'April': {'max': '26°C', 'min': '20°C', 'hujan': '20 hari', 'kondisi': 'Hujan Ringan'},
      'Mei': {'max': '27°C', 'min': '21°C', 'hujan': '15 hari', 'kondisi': 'Berawan'},
      'Juni': {'max': '27°C', 'min': '21°C', 'hujan': '12 hari', 'kondisi': 'Berawan'},
      'Juli': {'max': '26°C', 'min': '20°C', 'hujan': '10 hari', 'kondisi': 'Berawan'},
      'Agustus': {'max': '27°C', 'min': '21°C', 'hujan': '8 hari', 'kondisi': 'Cerah Berawan'},
      'September': {'max': '27°C', 'min': '21°C', 'hujan': '12 hari', 'kondisi': 'Berawan'},
      'Oktober': {'max': '26°C', 'min': '20°C', 'hujan': '18 hari', 'kondisi': 'Hujan Ringan'},
      'November': {'max': '25°C', 'min': '19°C', 'hujan': '25 hari', 'kondisi': 'Hujan'},
      'Desember': {'max': '24°C', 'min': '18°C', 'hujan': '27 hari', 'kondisi': 'Hujan'},
    },
    'Surabaya': {
      'Januari': {'max': '33°C', 'min': '26°C', 'hujan': '15 hari', 'kondisi': 'Cerah Berawan'},
      'Februari': {'max': '33°C', 'min': '26°C', 'hujan': '14 hari', 'kondisi': 'Cerah Berawan'},
      'Maret': {'max': '34°C', 'min': '27°C', 'hujan': '10 hari', 'kondisi': 'Cerah'},
      'April': {'max': '34°C', 'min': '27°C', 'hujan': '5 hari', 'kondisi': 'Cerah'},
      'Mei': {'max': '35°C', 'min': '28°C', 'hujan': '2 hari', 'kondisi': 'Panas'},
      'Juni': {'max': '35°C', 'min': '27°C', 'hujan': '1 hari', 'kondisi': 'Panas'},
      'Juli': {'max': '35°C', 'min': '27°C', 'hujan': '1 hari', 'kondisi': 'Panas'},
      'Agustus': {'max': '36°C', 'min': '28°C', 'hujan': '0 hari', 'kondisi': 'Panas'},
      'September': {'max': '36°C', 'min': '28°C', 'hujan': '1 hari', 'kondisi': 'Panas'},
      'Oktober': {'max': '35°C', 'min': '27°C', 'hujan': '5 hari', 'kondisi': 'Cerah'},
      'November': {'max': '34°C', 'min': '27°C', 'hujan': '10 hari', 'kondisi': 'Cerah Berawan'},
      'Desember': {'max': '34°C', 'min': '27°C', 'hujan': '18 hari', 'kondisi': 'Hujan Ringan'},
    },
  };

  @override
  void initState() {
    super.initState();
    // Inisialisasi _selectedMonth dengan bulan pertama dari daftar
    _selectedMonth = _months.first;
  }

  @override
  Widget build(BuildContext context) {
    // Ambil data untuk kota dan bulan yang dipilih
    final Map<String, String> monthData = 
        _monthlyData[widget.cityName]?[_selectedMonth] ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text('Perkiraan Bulanan ${widget.cityName}'),
        backgroundColor: const Color(0xff2193b0),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff2193b0), Color(0xff6dd5ed)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ➡️ Dropdown Pilihan Bulan
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedMonth,
                    hint: const Text('Pilih Bulan'),
                    icon: const Icon(Icons.calendar_month, color: Colors.blue),
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    // Menggunakan list _months yang berisi Januari-Desember
                    items: _months.map((String month) {
                      return DropdownMenuItem<String>(
                        value: month,
                        child: Text(month),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedMonth = newValue;
                        });
                      }
                    },
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // 📊 Tampilan Data Perkiraan
              Text(
                'Ringkasan Cuaca **$_selectedMonth**',
                style: const TextStyle(
                  fontSize: 22, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.white
                ),
              ),
              const Divider(color: Colors.white70),
              
              _buildDataCard('Suhu Maksimum Rata-rata', monthData['max'] ?? 'N/A', Icons.thermostat),
              _buildDataCard('Suhu Minimum Rata-rata', monthData['min'] ?? 'N/A', Icons.device_thermostat),
              _buildDataCard('Jumlah Hari Hujan', monthData['hujan'] ?? 'N/A', Icons.cloudy_snowing),
              _buildDataCard('Kondisi Dominan', monthData['kondisi'] ?? 'N/A', Icons.sunny_snowing),
              
              const SizedBox(height: 40),
              const Text(
                '* Data ini adalah perkiraan berdasarkan data historis.',
                style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pembantu untuk menampilkan data dalam bentuk kartu
  Widget _buildDataCard(String label, String value, IconData icon) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
      ),
    );
  }
}