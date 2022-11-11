import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safelane/authentication/login.dart';
import 'draggableItemsModel.dart';

class draggableItems extends StatelessWidget {
  const draggableItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.85,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 60,
              height: 7,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SettingButtons(
              onTap: () {},
              child: Icon(Icons.person),
              textLabel: 'My Profile',
            ),
            SettingButtons(
              onTap: () {},
              child: Icon(Icons.notifications),
              textLabel: 'Notifications',
            ),
            SettingButtons(
              onTap: () {},
              child: Icon(Icons.info),
              textLabel: 'About',
            ),
            SettingButtons(
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginScreen()));
                });
              },
              child: Icon(Icons.logout),
              textLabel: 'Log Out',
            )
          ],
        ),
      ),
    );
  }
}
