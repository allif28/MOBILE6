
import 'package:flutter/material.dart';
import 'detail_page.dart';



final List<Map<String, String>> travelData = [
  {
    'title': 'Raja Ampat',
    'image':
        'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=800',
  },
  {
    'title': 'Bromo',
    'image':
        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800',
  },
  {
    'title': 'Danau Toba',
    'image':
        'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=800',
  },
  {
    'title': 'Borobudur',
    'image':
        'https://images.unsplash.com/photo-1596402184320-417e7178b2cd?w=800',
  },
];



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget buildListView() {
    return ListView.builder(
      itemCount: travelData.length,
      itemBuilder: (context, index) {
        final item = travelData[index];

        return Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: ListTile(
            leading: Image.network(
              item['image']!,
              width: 100,
              fit: BoxFit.cover,
            ),
            title: Text(item['title']!),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(item: item),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: travelData.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final item = travelData[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailPage(item: item),
              ),
            );
          },
          child: Card(
            elevation: 3,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.network(
                    item['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Katalog Wisata'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(
                icon: Icon(Icons.list),
                text: 'List View',
              ),
              Tab(
                icon: Icon(Icons.grid_on),
                text: 'Grid View',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildListView(),
            buildGridView(),
          ],
        ),
      ),
    );
  }
}
