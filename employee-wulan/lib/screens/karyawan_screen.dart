
import 'package:flutter/material.dart';

class KaryawanScreen extends StatefulWidget {
  const KaryawanScreen({super.key});

  @override
  State<KaryawanScreen> createState() => _KaryawanScreenState();
}

class _KaryawanScreenState extends State<KaryawanScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posisi Karyawan')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Masukkan nama karyawan',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                _controller.clear();
              },
            ),
            Expanded(
              child: StreamBuilder<Map<String, String>>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map<String, String> items = snapshot.data!;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final key = items.keys.elementAt(index);
                        final item = items[key];
                        return ListTile(
                          title: Text(item!),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                            },
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


