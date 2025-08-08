import 'package:flutter/material.dart';
import 'package:healthcare_assignment/core/constants/app_colors.dart';
import 'package:healthcare_assignment/core/constants/app_imagepaths.dart';
import 'package:healthcare_assignment/core/constants/app_sizes.dart';
import 'package:healthcare_assignment/core/constants/app_text_styles.dart';

class PetCenterDetailScreen extends StatelessWidget {
  const PetCenterDetailScreen({super.key});

  void _showSuccessBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
        });
        return SizedBox(
          width: double.maxFinite,
          height:
              MediaQuery.of(context).size.height * 0.20, // 20% of screen height
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle, size: 50, color: Colors.green),
                SizedBox(height: ResponsiveSize.height(1.5)),
                Text(
                  'Submitted successfully',
                  style: AppTextStyles.heading2,
                  textAlign: TextAlign.center,
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
          padding: EdgeInsets.all(ResponsiveSize.width(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  AppImagePaths.clinic1,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Paw Palace', style: AppTextStyles.heading1),
                  SizedBox(height: ResponsiveSize.height(1)),
                  Text(
                    '123 Pet Street, Animal Town',
                    style: AppTextStyles.small1,
                  ),
                  Text(
                    'Contact: (123) 456-7890',
                    style: AppTextStyles.small1,
                  ),
                  // SizedBox(height: ResponsiveSize.height(2)),
                  Text('Services Offered', style: AppTextStyles.heading2),
                  ...services.map((s) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(s['name']!, style: AppTextStyles.medium1),
                        trailing: Text(s['fee']!, style: AppTextStyles.medium2),
                      )),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(ResponsiveSize.width(20)),
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              builder: (context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.25, // 25% of screen height
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Are you sure you want to confirm?',
                          style: AppTextStyles.heading2,
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: ResponsiveSize.width(100),
                                height: ResponsiveSize.height(40),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context); // close the sheet
                                  },
                                  child: const Text(
                                    'No',
                                    style: AppTextStyles.medium2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ResponsiveSize.width(100),
                                height: ResponsiveSize.height(40),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryBlue,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _showSuccessBottomSheet(context);
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: AppTextStyles.mediumWhite2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveSize.height(2),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ResponsiveSize.width(3)),
            ),
          ),
          child: Text(
            'Book Appointment',
            style: AppTextStyles.heading2.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
