import 'package:dressingroom/controller/dressing_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[500],
        title: const Text(
          "Dressing Room",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Consumer<DressingProvider>(
        builder: (context, provider, child) {
          return provider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.brown,
                ))
              : ListView.builder(
                  itemCount: provider.allDresses.length,
                  itemBuilder: (context, index) {
                    final data = provider.allDresses[index];
                    return Card(
                      color: Colors.brown[200],
                      child: ListTile(
                        leading: Container(
                            height: 100,
                            width: 60,
                            color: Colors.white,
                            child: Image.network(data.image)),
                        title: Text(data.title),
                        subtitle: Text(data.price.toString()),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
