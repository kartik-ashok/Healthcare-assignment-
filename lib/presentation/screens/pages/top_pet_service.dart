import 'package:flutter/material.dart';
import 'package:healthcare_assignment/core/constants/app_imagepaths.dart';
import 'package:healthcare_assignment/core/constants/app_sizes.dart';
import 'package:healthcare_assignment/core/constants/app_text_styles.dart';
import 'package:healthcare_assignment/presentation/screens/pages/service_listing.dart';

class TopPetService extends StatefulWidget {
  const TopPetService({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TopPetService> {
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(ResponsiveSize.width(4)),
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
                hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200], // Light background
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(25), // Large radius for pill shape
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide:
                      BorderSide(color: Colors.blue.shade300, width: 1.5),
                ),
              ),
            ),

            SizedBox(height: ResponsiveSize.height(2)),

            // Categories Dropdown
            DropdownButtonFormField<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                filled: true,
                fillColor: Colors.grey[200],
                hintText: "Select Category",
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              dropdownColor: Colors.white,
              icon: const Icon(Icons.keyboard_arrow_down_rounded,
                  color: Colors.black),
              items: categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: ResponsiveSize.height(2)),

            Text('Top Rated Pet Centers', style: AppTextStyles.heading2),

            SizedBox(height: ResponsiveSize.height(1)),

            // Top Rated Pet Centers Grid
            Expanded(
              child: topRatedCenters.isEmpty
                  ? const Center(
                      child: Text(
                        "No centers found",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(ResponsiveSize.width(0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        ResponsiveSize.width(2)),
                                    child: Container(
                                      width: ResponsiveSize.width(100),
                                      height: ResponsiveSize.height(50),
                                      child: Image.asset(
                                        center['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: ResponsiveSize.height(1)),
                                  Text(
                                    center['name'],
                                    style: AppTextStyles.medium1
                                        .copyWith(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: ResponsiveSize.height(0.5)),
                                  Text(
                                    '${center['location']} • ⭐ ${center['rating']}',
                                    style: AppTextStyles.small1,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
