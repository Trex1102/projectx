import 'package:flutter/material.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Sub Settings View"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(
                index.toString(),
              ),
              title: Text("Settings no. $index"),
            ),
          );
        }),
      ),
    );
  }
}