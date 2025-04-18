import 'package:flutter/material.dart';

class WorkerHomeScreen extends StatelessWidget {
  const WorkerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Sample static data (as if fetched from Firebase)
    final Map<String, String> request = {
      'name': 'Riya Sharma',
      'location': 'Sector 22, Noida',
      'reference': 'Overflowing garbage near the park gate.',
      'imageUrl': 'https://via.placeholder.com/300x200', // placeholder image
      'status': 'Pending'
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Worker Home")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome, Worker!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            const Text(
              'Pending Request',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: ${request['name']}", style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text("Location: ${request['location']}"),
                    const SizedBox(height: 6),
                    Text("Reference: ${request['reference']}"),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        request['imageUrl']!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Status: ${request['status']}", style: const TextStyle(color: Colors.orange)),
                        ElevatedButton(
                          onPressed: () {
                            // future: mark as resolved / start job
                          },
                          child: const Text("Start"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
