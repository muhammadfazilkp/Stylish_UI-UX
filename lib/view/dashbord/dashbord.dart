import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/controller/feach_data/user_provider.dart';

class DashbordScreen extends StatelessWidget {
  const DashbordScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).fetchUsers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          if (value.user != null) {
            return Expanded(
              child: ListView.builder(
                itemCount: value.user!.length,
                itemBuilder: (context, index) {
                  final data = value.user![index];
                  return ListTile(
                    title: Text('${data.userFirstname} ${data.userLastname}'),
                    subtitle: Text('Email: ${data.userEmail}'),
                    // Add more details as needed
                  );
                },
              ),
            );
          } else {
            // Handle loading state or display an error message
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

