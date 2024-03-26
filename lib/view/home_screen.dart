import 'package:dressingroom/controller/dressing_provider.dart';
import 'package:dressingroom/view/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 80, 139, 74),
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
                      color: const Color.fromARGB(255, 209, 233, 186),
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                              name: data.title,
                              description: data.description,
                              price: data.price.toString(),
                              category: data.category,
                              image: data.image,
                              rating: data.rating.toString()),
                        )),
                        child: ListTile(
                          leading: Container(
                              padding: const EdgeInsets.all(5),
                              height: 100,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(data.image)),
                          title: Text(
                            data.title,
                            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                          ),
                          subtitle: Text(
                            "₹ ${data.price.toString()}",
                            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
