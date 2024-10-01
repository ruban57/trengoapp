import 'package:flutter/material.dart';

class ClosedTabviewScreen extends StatelessWidget {
  const ClosedTabviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Closed'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'My tickets'),
              Tab(text: 'All'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ClosedTab(),
            AllTab(),
          ],
        ),
      ),
    );
  }
}

class ClosedTab extends StatelessWidget {
  const ClosedTab({super.key});


  @override
  Widget build(BuildContext context) {
    // Display content for the "Unanswered" tab
    return const Center(
      child: Text('Closed tickets will appear here'),
    );
  }
}

class AllTab extends StatelessWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Display content for the "All" tab
    return const Center(
      child: Text('All tickets will appear here'),
    );
  }
}
