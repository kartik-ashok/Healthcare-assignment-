import 'package:flutter/material.dart';
import 'package:healthcare_assignment/core/constants/app_colors.dart';
import 'package:healthcare_assignment/core/constants/app_imagepaths.dart';
import 'package:healthcare_assignment/core/constants/app_sizes.dart';
import 'package:healthcare_assignment/core/constants/app_text_styles.dart';
import 'package:healthcare_assignment/presentation/screens/pages/service_listing.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Categories> {
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(ResponsiveSize.width(2)),
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
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide:
                      BorderSide(color: Colors.blue.shade300, width: 1.5),
                ),
              ),
            ),

            SizedBox(height: ResponsiveSize.height(10)),
            DropdownButtonFormField<String>(
              iconEnabledColor: AppColors.primaryBlue,
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

            SizedBox(height: ResponsiveSize.height(10)),

            Text(
              'Featured Pet Centers',
              style: AppTextStyles.heading2,
            ),

            SizedBox(height: ResponsiveSize.height(10)),

            // Featured Pet Centers List
            Expanded(
              child: filteredCenters.isEmpty
                  ? const Center(
                      child: Text(
                        "No centers found",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    )
                  : ListView.builder(
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
                            margin: EdgeInsets.symmetric(
                                vertical: ResponsiveSize.height(10)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  ResponsiveSize.width(3)),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    ResponsiveSize.width(2)),
                                child: Container(
                                  width: ResponsiveSize.width(60),
                                  height: ResponsiveSize.height(60),
                                  child: Image.asset(
                                    center['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(
                                center['name'],
                                style: AppTextStyles.medium1,
                              ),
                              subtitle: Text(
                                '${center['location']} • ⭐ ${center['rating']}',
                                style: AppTextStyles.medium2,
                              ),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  // Handle booking action
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryBlue,
                                    foregroundColor: Colors.white, // Text color
                                    elevation: 4, // Subtle shadow
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          ResponsiveSize.width(3)),
                                    ),
                                    textStyle: AppTextStyles.medium1),
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
