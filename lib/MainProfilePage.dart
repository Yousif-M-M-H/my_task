import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import 'ProfilePage.dart';

class MainProfilePage extends StatelessWidget {
  const MainProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Your Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.keyboard_backspace_sharp,
            // opticalSize: 112,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        // color: Color.fromRGBO(222, 226, 230, 1),
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Stack(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/images/person.jpg')),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromRGBO(47, 158, 68, 0.8),
                  ),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Yousif hatim",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Soninhatim66@gmail.com",
            style: TextStyle(color: Color.fromRGBO(134, 142, 150, 1)),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Edit profile"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(47, 158, 68, 0.8),
                  side: BorderSide.none,
                  shape: StadiumBorder()),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          const Divider(),
          SizedBox(
            height: 10,
          ),
          ProfileMenuWidget(
            title: "settings",
            icon: Icons.settings,
            onPress: () {},
          ),
          ProfileMenuWidget(
            title: "billing Details",
            icon: Icons.wallet,
            onPress: () {},
          ),
          ProfileMenuWidget(
            title: "User Manangemant",
            icon: Icons.check,
            onPress: () {},
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          ProfileMenuWidget(
            title: "information",
            icon: Icons.info,
            onPress: () {},
          ),
          ProfileMenuWidget(
            title: "LogOut",
            icon: Icons.logout,
            textColor: Colors.red,
            endIcon: false,
            onPress: () {},
          ),
        ]),
      )),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPress,
      this.endIcon = true,
      this.textColor});
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color.fromRGBO(47, 158, 68, 0.1)),
        child: Icon(
          icon,
          color: Color.fromRGBO(47, 158, 68, 0.8),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1?.apply(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.withOpacity(0.1)),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
                size: 18.0,
              ),
            )
          : null,
    );
  }
}
