import 'package:bookly/Features/person/presentation/view/widgets/cirular_avater.dart';
import 'package:bookly/Features/person/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly/Features/person/presentation/view/widgets/custom_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PersonBody extends StatelessWidget {
  const PersonBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              title: 'Profile',
            ),
            const Addimage(),
            const SizedBox(height: 15),
            const CustomListTile(
                title: 'My Account', loadingIcon: Icons.person_2_outlined),
            const SizedBox(height: 25),
            const CustomListTile(
                title: 'Natifications',
                loadingIcon: Icons.notifications_active_outlined),
            const SizedBox(height: 25),
            const CustomListTile(
                title: 'Settings', loadingIcon: Icons.settings_outlined),
            const SizedBox(height: 25),
            const CustomListTile(
                title: 'Help Center', loadingIcon: Icons.help_outline),
            const SizedBox(height: 25),
            CustomListTile(
              title: 'Log Out',
              loadingIcon: Icons.logout_outlined,
              ontap: () {
                _showWarningDialog(context);
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  void _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('Are you sure you want to Log Out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, 'Splashpage');
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                //  Navigator.pushNamed(context, 'Personpage');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PersonBody(),
                //   ),
                // );

                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
