import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trengoapp/screens/closed_tabview_screen.dart';
import 'package:trengoapp/screens/login_screen.dart';
import 'package:trengoapp/screens/new_conversation_screen.dart';
import 'package:trengoapp/screens/tab_item_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearchActive = false; // Toggle search bar visibility
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0; // Track the selected index of the BottomNavigationBar
  String _selectedMenuItem = 'New'; // Track selected menu item

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    if (index == 0) {
      // Show profile BottomModalSheet for Home
      showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        builder: (context) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage(
                      'assets/user.png'), // Replace with actual image asset or network image
                ),
                const SizedBox(height: 5.0),
                const Text(
                  'Ruban', // Replace with actual user name
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '+966 0549846168', // Replace with actual phone number
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),),
                      onPressed: () {

                      },
                      child: const Text('Get help',
                          style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black),),
                      onPressed: () {
                        // Edit profile action
                      },
                      child: const Text('Edit Profile',
                          style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text('Logout',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                _buildEditProfileButton(),
              ],
            ),
          );
        },
      );
    } else if (index == 1) {
      // Show BottomModalSheet for Phone (with country code and phone input)
      showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        // Allows the bottom sheet to adjust based on the keyboard
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        builder: (context) {
          // Use MediaQuery to determine the size of the viewable area when the keyboard is present
          final bottomInset = MediaQuery.of(context).viewInsets.bottom;
          String countryCode = '+966'; // Default country code

          return Padding(
            padding: EdgeInsets.only(
              bottom: bottomInset,
              // Adjust padding to prevent the keyboard from hiding content
              top: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // Minimize the height to fit the content
              children: [
                const Text(
                  'Enter Phone Number',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),

                // Phone number input section
                Row(
                  children: [
                    // Country Code Picker inside a Flexible widget
                    Flexible(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: CountryCodePicker(
                            onChanged: (code) {
                              countryCode = code.dialCode!;
                            },
                            initialSelection: 'SA',
                            favorite: ['+966', 'US', 'IN'],
                            showFlag: true,
                            showFlagDialog: true,
                            showDropDownButton: true,
                            alignLeft: true,
                            padding: const EdgeInsets.all(0),
                            textStyle: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    const Flexible(
                      flex: 4,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter phone number',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),),
                  onPressed: () {
                    print('Country Code: $countryCode');
                    // Add your phone call logic here
                  },
                  child: const Text('Call',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          );
        },
      );
    } else if (index == 2) {
      // Show BottomModalSheet for Notifications (Delete All | Mark All as Read)
      showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        builder: (context) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle delete all notifications action
                      },
                      child: const Text(
                        'Delete All',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle mark all as read action
                      },
                      child: const Text(
                        'Mark All as Read',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }

  // Update selected menu item
  void _onMenuItemSelected(String menuItem) {
    setState(() {
      _selectedMenuItem = menuItem; // Change the selected menu item
    });
  }

  List<Tab> _getTabsForMenuItem() {
    switch (_selectedMenuItem) {
      case 'Assigned' || 'Assigned to me':
        return const [
          Tab(text: 'Unanswered'),
          Tab(text: 'All'),
        ];
      case 'Closed':
        return const [
          Tab(text: 'My tickets'),
          Tab(text: 'All'),
        ];
      case 'Spam':
        return const [
          Tab(text: 'My tickets'),
          Tab(text: 'All'),
        ];
      case 'Mentioned':
        return const [
          Tab(text: 'To-do'),
          Tab(text: 'Done'),
        ];
      case 'Favourites':
        return const [];
      default:
        return const [
          Tab(text: 'New Conversations'),
        ];
    }
  }

  List<Widget> _getTabViewsForMenuItem() {
    switch (_selectedMenuItem) {
      case 'Assigned':
        return const [
          Center(child: Text('Unanswered Conversations')),
          Center(child: Text('All Conversations')),
        ];
      case 'Closed':
        return const [
          Center(child: Text('Closed Conversations')),
        ];
      case 'Spam':
        return const [
          Center(child: Text('Spam Conversations')),
        ];
      default:
        return const [
          Center(child: Text('New Conversations')),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: <Widget>[
            _buildExpandableTile(
              'Inbox',
              [
                _MenuItem(icon: Icons.inbox_outlined, title: 'New'),
                _MenuItem(icon: Icons.group, title: 'Assigned'),
                _MenuItem(icon: Icons.cancel, title: 'Closed'),
                _MenuItem(icon: Icons.report_gmailerrorred, title: 'Spam'),
              ],
            ),
            _buildExpandableTile(
              'Personal',
              [
                _MenuItem(icon: Icons.person, title: 'Assigned to me'),
                _MenuItem(icon: Icons.alternate_email, title: 'Mentioned'),
                _MenuItem(icon: Icons.star, title: 'Favourites'),
              ],
            ),
            _buildExpandableTile(
              'Teams',
              [
                _MenuItem(icon: Icons.inbox_outlined, title: 'New'),
                _MenuItem(icon: Icons.group, title: 'Assigned'),
                _MenuItem(icon: Icons.cancel, title: 'Closed'),
                _MenuItem(icon: Icons.report_gmailerrorred, title: 'Spam'),
              ],
            ),
            _buildExpandableTile(
              'Channels',
              [
                _MenuItem(icon: Icons.inbox_outlined, title: 'New'),
                _MenuItem(icon: Icons.group, title: 'Assigned'),
                _MenuItem(icon: Icons.cancel, title: 'Closed'),
                _MenuItem(icon: Icons.report_gmailerrorred, title: 'Spam'),
              ],
            ),
            _buildExpandableTile(
              'Views',
              [
                _MenuItem(icon: Icons.inbox_outlined, title: 'New'),
                _MenuItem(icon: Icons.group, title: 'Assigned'),
                _MenuItem(icon: Icons.cancel, title: 'Closed'),
                _MenuItem(icon: Icons.report_gmailerrorred, title: 'Spam'),
              ],
            ),
            _buildExpandableTile(
              'Labels',
              [
                _MenuItem(icon: Icons.inbox_outlined, title: 'New'),
                _MenuItem(icon: Icons.group, title: 'Assigned'),
                _MenuItem(icon: Icons.cancel, title: 'Closed'),
                _MenuItem(icon: Icons.report_gmailerrorred, title: 'Spam'),
              ],
            ),
            _buildExpandableTile(
              'Users',
              [
                _MenuItem(icon: Icons.inbox_outlined, title: 'New'),
                _MenuItem(icon: Icons.group, title: 'Assigned'),
                _MenuItem(icon: Icons.cancel, title: 'Closed'),
                _MenuItem(icon: Icons.report_gmailerrorred, title: 'Spam'),
              ],
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // Increase AppBar height
        child: AppBar(
          backgroundColor: Colors.white, // Set AppBar background color
          elevation: 5.0,
          title: Text(
            _selectedMenuItem, // Display selected menu item as title
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black, // Black color for title
              fontSize: 24.0,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {
                setState(() {
                  _isSearchActive = !_isSearchActive; // Toggle search bar
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.sort, color: Colors.black),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: 500,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: Center(
                                    child: Text(
                                      'Options',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.pop(
                                        context); // Close the bottom sheet
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            // Add some space between header and options
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Newest first',
                                      style: TextStyle(color: Colors.black)),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Oldest first',
                                      style: TextStyle(color: Colors.black)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 5.0,
        onPressed: () {
          Get.to(() => const NewConversationScreen());
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
        ),
        child: const Icon(Icons.edit, color: Colors.black),
      ),
      body: DefaultTabController(
        length: _getTabsForMenuItem().length,
        child: Column(
          children: [
            _isSearchActive
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 25.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  )
                : const SizedBox(),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black54,
              tabs: _getTabsForMenuItem(),
            ),
            Expanded(
              child: TabBarView(
                children: _getTabViewsForMenuItem(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.account_circle_outlined, size: 30.0),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.phone_outlined, size: 30.0),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.notifications_active_outlined, size: 30.0),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        elevation: 20.0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose(); // Dispose the controller to avoid memory leaks
    super.dispose();
  }

  // Function to build an expandable tile with icons
  Widget _buildExpandableTile(String title, List<_MenuItem> items) {
    return ExpansionTile(
      title: Text(title),
      children: items.map((item) {
        return ListTile(
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () {
            _onMenuItemSelected(item.title); // Update selected menu item
            Navigator.pop(context); // Close the drawer after selection
          },
        );
      }).toList(),
    );
  }
}

// Function to build the edit profile button
Widget _buildEditProfileButton() {
  return Column(
    children: [
      ListTile(
        leading: const Icon(Icons.contact_page, color: Colors.black),
        title: const Text('Contacts', style: TextStyle(color: Colors.black)),
        onTap: () {
          // Implement edit profile functionality
        },
      ),
      ListTile(
        leading: const Icon(Icons.person, color: Colors.black),
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        onTap: () {
          // Implement edit profile functionality
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings, color: Colors.black),
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
        onTap: () {
          // Implement edit profile functionality
        },
      ),
    ],
  );
}

// Class to represent a menu item with an icon and title
class _MenuItem {
  final IconData icon;
  final String title;

  _MenuItem({required this.icon, required this.title});
}
