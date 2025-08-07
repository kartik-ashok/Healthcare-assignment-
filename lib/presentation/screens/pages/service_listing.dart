import 'package:flutter/material.dart';
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
      'image': 'https://placekitten.com/300/200',
    },
    {
      'name': 'Furry Friends Hotel',
      'type': 'Boarding',
      'rating': 4.8,
      'availability': false,
      'petTypes': ['Dog'],
      'image': 'https://placekitten.com/301/200',
    },
    {
      'name': 'Happy Tails Vet',
      'type': 'Vet',
      'rating': 4.6,
      'availability': true,
      'petTypes': ['Dog', 'Cat', 'Rabbit'],
      'image': 'https://placekitten.com/302/200',
    },
  ];

  Widget buildBadge(bool isOpen) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isOpen ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isOpen ? 'Open' : 'Closed',
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Service Listings')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
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
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      service['image'],
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service['name'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(service['type']),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: Colors.amber[700], size: 20),
                            const SizedBox(width: 4),
                            Text('${service['rating']}'),
                            const Spacer(),
                            buildBadge(service['availability']),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children:
                              List.generate(service['petTypes'].length, (i) {
                            return Chip(
                              label: Text(service['petTypes'][i]),
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
          );
        },
      ),
    );
  }
}
