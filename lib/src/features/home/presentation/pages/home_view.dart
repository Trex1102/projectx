import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.home,
              color: Colors.red,
              size: 100,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Home",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 12,
            ),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                context.push('/add_expense_screen');
              },
              child: const Text(
                "Navigate To Sub Home View",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
