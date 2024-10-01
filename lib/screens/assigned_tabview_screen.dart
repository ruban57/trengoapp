import 'package:flutter/material.dart';

class AssignedTabViewScreen extends StatelessWidget {
  const AssignedTabViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Assigned'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Unanswered'),
              Tab(text: 'All'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UnansweredTab(),
            AllTab(),
          ],
        ),
      ),
    );
  }
}

class UnansweredTab extends StatelessWidget {
  const UnansweredTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Display content for the "Unanswered" tab
    return const Center(
      child: Text('Unanswered tickets will appear here'),
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
