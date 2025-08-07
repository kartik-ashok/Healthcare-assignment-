import 'package:flutter/material.dart';
import 'package:healthcare_assignment/core/constants/app_imagepaths.dart';
import 'package:healthcare_assignment/presentation/screens/pages/service_listing.dart';

class TopPetService extends StatelessWidget {
  const TopPetService({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Services',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = const [
    'All',
    'Grooming',
    'Boarding',
    'Vet',
    'Training',
    'Walking'
  ];

  final List<Map<String, dynamic>> featuredCenters = [
    {
      'name': 'Paws N Prithvi',
      'location': 'JP Nagar',
      'rating': 4.7,
      'image': AppImagePaths.clinic3,
      'category': 'Daycare'
    },
    {
      'name': 'Tail Treats Hub',
      'location': 'Koramangala',
      'rating': 4.4,
      'image': AppImagePaths.clinic1,
      'category': 'Pet Café'
    },
    {
      'name': 'Meow Mansion',
      'location': 'Indiranagar',
      'rating': 4.9,
      'image': AppImagePaths.clinic2,
      'category': 'Grooming'
    },
    {
      'name': 'Woof Ville',
      'location': 'Banashankari',
      'rating': 4.6,
      'image': AppImagePaths.clinic4,
      'category': 'Training'
    },
    {
      'name': 'Desi Doggo Den',
      'location': 'HSR Layout',
      'rating': 4.5,
      'image': AppImagePaths.clinic5,
      'category': 'Vet'
    },
    {
      'name': 'Bangalore Barkers',
      'location': 'BTM Layout',
      'rating': 4.3,
      'image': AppImagePaths.clinic2,
      'category': 'Walking'
    },
    {
      'name': 'Namma Pet Care',
      'location': 'Malleshwaram',
      'rating': 4.7,
      'image': AppImagePaths.clinic3,
      'category': 'Daycare'
    },
    {
      'name': 'Indie Tails',
      'location': 'Yelahanka',
      'rating': 4.6,
      'image': AppImagePaths.clinic1,
      'category': 'Boarding'
    },
    {
      'name': 'Kannada Kennels',
      'location': 'Jayanagar',
      'rating': 4.8,
      'image': AppImagePaths.clinic4,
      'category': 'Vet'
    },
    {
      'name': 'Mysore Meows',
      'location': 'Mysuru',
      'rating': 4.9,
      'image': AppImagePaths.clinic5,
      'category': 'Pet Café'
    },
  ];

  String selectedCategory = 'All';
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredCenters =
        featuredCenters.where((center) {
      final matchesCategory =
          selectedCategory == 'All' || center['category'] == selectedCategory;
      final matchesSearch =
          center['name'].toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    // Sort centers by rating and take the top 5
    List<Map<String, dynamic>> topRatedCenters = List.from(filteredCenters)
      ..sort((a, b) => b['rating'].compareTo(a['rating']));
    if (topRatedCenters.length > 5) {
      topRatedCenters = topRatedCenters.sublist(0, 5);
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Pet Services'),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for grooming, vet, or boarding',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Categories Dropdown
            DropdownButton<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            const Text(
              'Top Rated Pet Centers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Top Rated Pet Centers Grid
            SizedBox(
              height: 200, // Set a fixed height for the grid
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: topRatedCenters.length,
                itemBuilder: (context, index) {
                  final center = topRatedCenters[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ServiceListingScreen();
                        },
                      ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              center['image'],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            center['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            '${center['location']} • ⭐ ${center['rating']}',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Featured Pet Centers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // Featured Pet Centers List
            Expanded(
              child: ListView.builder(
                itemCount: filteredCenters.length,
                itemBuilder: (context, index) {
                  final center = filteredCenters[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ServiceListingScreen();
                        },
                      ));
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            center['image'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(center['name']),
                        subtitle: Text(
                            '${center['location']} • ⭐ ${center['rating']}'),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text('Book'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
