import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&w=1600",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bienvenido a DreamHomes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Encuentra el departamento de tus sueños en pocos pasos.\nExplora ahora las mejores opciones.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecommendationsPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 40,
                      ),
                    ),
                    child: Text(
                      "Explorar Departamentos",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendationsPage extends StatelessWidget {
  final List<Map<String, String>> properties = [
    {
      "title": "Departamento Moderno",
      "price": "\$734/Month",
      "location": "Marbella, España",
      "rating": "4.8",
      "image":
          "https://tse3.mm.bing.net/th?id=OIP.kv7T4tnpbJvaVYZcjKdGAQHaH2&pid=Api"
    },
    {
      "title": "Cocina Contemporánea",
      "price": "\$850/Month",
      "location": "Madrid, España",
      "rating": "4.5",
      "image":
          "https://tse1.mm.bing.net/th?id=OIP.jHMby1HzaQE_SOHykOVnhQHaE7&pid=Api"
    },
    {
      "title": "Dormitorio Acogedor",
      "price": "\$500/Month",
      "location": "Barcelona, España",
      "rating": "4.7",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.XUt_3P9HIjsS44ggaZzMtQHaIW&pid=Api"
    },
    {
      "title": "Vista al Mar",
      "price": "\$1,200/Month",
      "location": "Palm Beach Club",
      "rating": "4.9",
      "image":
          "https://tse1.mm.bing.net/th?id=OIP.aS1ikI0QINeekKAhP4cNVQHaE7&pid=Api"
    },
    {
      "title": "Baño Moderno",
      "price": "\$450/Month",
      "location": "Valencia, España",
      "rating": "4.6",
      "image":
          "https://tse4.mm.bing.net/th?id=OIP.Vt_fCUNPVl-DdxlmJdE0WgHaIk&pid=Api"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendations'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.network(
                    property['image']!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: Center(
                          child: Text(
                            "Image not available",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property['title']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        property['price']!,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(
                            property['location']!,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          SizedBox(width: 5),
                          Text(
                            property['rating']!,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
