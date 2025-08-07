import 'package:flutter/material.dart';
import 'package:healthcare_assignment/core/constants/app_imagepaths.dart';
import 'package:healthcare_assignment/core/constants/app_sizes.dart';
import 'package:healthcare_assignment/core/constants/app_text_styles.dart';
import 'package:healthcare_assignment/presentation/screens/pages/pet_center_detail_screen.dart';

class ServiceListingScreen extends StatelessWidget {
  const ServiceListingScreen({super.key});

  final List<Map<String, dynamic>> services = const [
    {
      'name': 'Paw Palace',
      'type': 'Grooming',
      'rating': 4.5,
      'availability': true,
      'petTypes': ['Dog', 'Cat'],
      'image': AppImagePaths.cat,
    },
    {
      'name': 'Furry Friends Hotel',
      'type': 'Boarding',
      'rating': 4.8,
      'availability': false,
      'petTypes': ['Dog'],
      'image': AppImagePaths.dog,
    },
    {
      'name': 'Happy Tails Vet',
      'type': 'Vet',
      'rating': 4.6,
      'availability': true,
      'petTypes': ['Dog', 'Cat', 'Rabbit'],
      'image': AppImagePaths.deer,
    },
  ];

  Widget buildBadge(bool isOpen) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveSize.width(8),
        vertical: ResponsiveSize.height(4),
      ),
      decoration: BoxDecoration(
        color: isOpen ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(ResponsiveSize.width(6)),
      ),
      child: Text(isOpen ? 'Open' : 'Closed', style: AppTextStyles.medium1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Service Listings', style: AppTextStyles.heading1),
        centerTitle: true,
        elevation: 4,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(ResponsiveSize.width(20)),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const PetCenterDetailScreen();
                },
              ));
            },
            child: Card(
              margin: EdgeInsets.only(bottom: ResponsiveSize.height(20)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ResponsiveSize.width(8)),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(ResponsiveSize.width(8)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: ResponsiveSize.height(150),
                          width: double.infinity,
                          child: Image.asset(
                            service['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ResponsiveSize.width(4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service['name'],
                            style: AppTextStyles.heading1
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: ResponsiveSize.height(0.5)),
                          Text(
                            service['type'],
                            style: AppTextStyles.medium1
                                .copyWith(color: Colors.grey[600]),
                          ),
                          SizedBox(height: ResponsiveSize.height(0.5)),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber[700],
                                size: ResponsiveSize.width(7),
                              ),
                              SizedBox(width: ResponsiveSize.width(1)),
                              Text(
                                '${service['rating']}',
                                style: AppTextStyles.medium1,
                              ),
                              const Spacer(),
                              buildBadge(service['availability']),
                            ],
                          ),
                          SizedBox(height: ResponsiveSize.height(1)),
                          Wrap(
                            spacing: ResponsiveSize.width(2),
                            children:
                                List.generate(service['petTypes'].length, (i) {
                              return Chip(
                                label: Text(service['petTypes'][i],
                                    style: AppTextStyles.medium1),
                                backgroundColor: Colors.teal.shade50,
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
