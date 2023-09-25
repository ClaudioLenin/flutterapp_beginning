import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp_beginning/pages/animation_page.dart';
import 'package:flutterapp_beginning/pages/appbar_page.dart';
import 'package:flutterapp_beginning/pages/basicwidgets_page.dart';
import 'package:flutterapp_beginning/pages/bottomnavigationbar_page.dart';
import 'package:flutterapp_beginning/pages/decorators_page.dart';
import 'package:flutterapp_beginning/pages/dismissible_page.dart';
import 'package:flutterapp_beginning/pages/drawerapp_page.dart';
import 'package:flutterapp_beginning/pages/gestures_drag_drop_page.dart';
import 'package:flutterapp_beginning/pages/gestures_scale_page.dart';
import 'package:flutterapp_beginning/pages/gridview_page.dart';
import 'package:flutterapp_beginning/pages/heroanimation_page.dart';
import 'package:flutterapp_beginning/pages/layouts_page.dart';
import 'package:flutterapp_beginning/pages/listview_page.dart';
import 'package:flutterapp_beginning/pages/local_persistence_page.dart';
import 'package:flutterapp_beginning/pages/navigator_page.dart';
import 'package:flutterapp_beginning/pages/orientation_page.dart';
import 'package:flutterapp_beginning/pages/perfilusuario_page.dart';
import 'package:flutterapp_beginning/pages/platform_channel_page.dart';
import 'package:flutterapp_beginning/pages/sliver_page.dart';
import 'package:flutterapp_beginning/pages/stack_page.dart';
import 'package:flutterapp_beginning/pages/validatetextfield_page.dart';
import 'package:flutterapp_beginning/pages/widgettree_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Claud Len';
    final email = "claud@gml.com";
    final urlImage = 'https://avatars.githubusercontent.com/u/35999560?v=4';

    return Drawer(
      child: Material(
        // color: AppColors.primary,
        child: ListView(
          // padding: padding,
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(color: Colors.blue),
              child: buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PerfilUsuario(),
                )),
              ),
            ),
            // Divider(color: AppColors.secondaryBg),
            const SizedBox(height: 10),
            buildMenuItem(
              text: 'Widget Tree',
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: 'Basic Widgets',
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: 'Decorators',
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: 'Validate Textfield',
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: 'Orientation',
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: 'Animation',
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 5),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: 'Navigator',
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 6),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "Hero Animation",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 7),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "Bottom NavigationBar",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 8),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "Bottom AppBar",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 9),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "AppBar",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 10),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "Drawer",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 11),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "ListView",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 12),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "GridView",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 13),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "Stack",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 14),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "CustomScrollView",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 15),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "Layouts",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 16),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "Gestures Drag/Drop",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 17),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "Gestures Scale",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 18),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "Dismissible",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 19),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "Platform Channel",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 20),
            ),
            const SizedBox(height: 3),
            buildMenuItem(
              text: "Local Persistence",
              icon: Icons.arrow_right_alt,
              onClicked: () => selectedItem(context, 21),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              // Spacer(),
              // CircleAvatar(
              //   radius: 24,
              //   backgroundColor: AppColors.primary,
              //   child: Icon(Icons.add_comment_outlined, color: Colors.red),
              // )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.blue;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WidgetTreePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BasicWidgetsPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DecoratorsPage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ValidateTextFieldPage(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OrientationPage(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AnimationPage(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NavigatorPage(),
        ));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HeroAnimationPage(),
        ));
        break;
      case 8:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BottomNavigationBarPage(),
        ));
        break;
      case 9:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BottomAppBar(),
        ));
        break;
      case 10:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AppBarPage(),
        ));
        break;
      case 11:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DrawerAppPage(),
        ));
        break;
      case 12:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ListViewPage(),
        ));
        break;
      case 13:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GridViewPage(),
        ));
        break;
      case 14:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StackPage(),
        ));
        break;
      case 15:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SliversPage(),
        ));
        break;
      case 16:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LayoutsPage(),
        ));
        break;
      case 17:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GesturesDragDropPage(),
        ));
        break;
      case 18:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GestureScalePage(),
        ));
        break;
      case 19:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DismissiblePage(),
        ));
        break;
      case 20:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PlatformChannelPage(),
        ));
        break;
      case 21:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LocalPersistencePage(),
        ));
        break;
    }
  }

  // Future logout() => showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text("Salir"),
  //         content: TextField(
  //           autofocus: true,
  //         ),
  //         actions: [TextButton(onPressed: () {}, child: Text("Salir"))],
  //       ),
  //     );
  // void salir() {
  //   Navigator.of(context).pop();
  // }
}
