import 'package:flutter/material.dart';
import 'package:tufind_frontend/controller/page_router.dart';
import 'package:tufind_frontend/model/color.dart';
import 'package:tufind_frontend/view/ui-components/button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: NavigationBar(
          backgroundColor: darkBlue,
          destinations: [
            IconButton(
              onPressed: () => PageRouter.toHomePage(context),
              icon: const Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
              ),
            ),
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            ),
          ],
        ),
        body: Center(
          child: MyButton(
            onPressed: () => PageRouter.toLandingPage(context),
            text: "LOGOUT",
            color: Colors.red,
          ),
        ));
  }
}
