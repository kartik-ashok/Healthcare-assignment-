import 'package:flutter/material.dart';
import 'package:healthcare_assignment/core/constants/app_imagepaths.dart';
import 'package:healthcare_assignment/core/constants/app_sizes.dart';
import 'package:healthcare_assignment/core/constants/app_text_styles.dart';

class PetCenterDetailScreen extends StatelessWidget {
  const PetCenterDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> services = [
      {'name': 'Grooming', 'fee': '\$40'},
      {'name': 'Vet Checkup', 'fee': '\$60'},
      {'name': 'Boarding', 'fee': '\$30'},
    ];

    final List<Map<String, String>> professionals = [
      {
        'name': 'Dr. Jane Doe',
        'title': 'Veterinarian',
        'image': 'https://randomuser.me/api/portraits/women/44.jpg'
      },
      {
        'name': 'Alex Smith',
        'title': 'Pet Groomer',
        'image': 'https://randomuser.me/api/portraits/men/32.jpg'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pet Center Details', style: AppTextStyles.heading2),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImagePaths.clinic1,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(ResponsiveSize.width(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Paw Palace', style: AppTextStyles.heading1),
                    SizedBox(height: ResponsiveSize.height(1)),
                    Text(
                      '123 Pet Street, Animal Town',
                      style: AppTextStyles.heading2,
                    ),
                    Text(
                      'Contact: (123) 456-7890',
                      style: AppTextStyles.heading2,
                    ),
                    SizedBox(height: ResponsiveSize.height(2)),
                    Text('Services Offered', style: AppTextStyles.heading2),
                    ...services.map((s) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(s['name']!, style: AppTextStyles.medium1),
                          trailing:
                              Text(s['fee']!, style: AppTextStyles.medium2),
                        )),
                    SizedBox(height: ResponsiveSize.height(2)),
                    Text('Available Professionals',
                        style: AppTextStyles.heading2),
                    SizedBox(height: ResponsiveSize.height(1.2)),
                    Column(
                      children: professionals.map((pro) {
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.network(pro['image']!)),
                          title: Text(
                            pro['name']!,
                            style: AppTextStyles.medium1,
                          ),
                          subtitle: Text(
                            pro['title']!,
                            style: AppTextStyles.medium2,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(ResponsiveSize.width(3)),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveSize.height(2),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ResponsiveSize.width(3)),
            ),
          ),
          child: Text(
            'Book Appointment',
            style: AppTextStyles.heading2,
          ),
        ),
      ),
    );
  }
}
