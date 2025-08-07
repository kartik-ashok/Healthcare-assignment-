import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('Pet Center Details')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Image.network(
              'https://placekitten.com/800/300',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Paw Palace',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('123 Pet Street, Animal Town'),
                  const Text('Contact: (123) 456-7890'),
                  const SizedBox(height: 20),
                  const Text('Services Offered',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ...services.map((s) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(s['name']!),
                        trailing: Text(s['fee']!,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      )),
                  const SizedBox(height: 20),
                  const Text('Available Professionals',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Column(
                    children: professionals.map((pro) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(pro['image']!),
                        ),
                        title: Text(pro['name']!),
                        subtitle: Text(pro['title']!),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text('Book Appointment', style: TextStyle(fontSize: 16)),
        ),
      ),
    );
  }
}
