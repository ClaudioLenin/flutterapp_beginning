import 'package:flutter/material.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class BasicWidgetsPage extends StatelessWidget {
  const BasicWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Widgets"),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
        flexibleSpace: SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75.0,
            color: Colors.white70,
          ),
        ),
        bottom: PopupMenuButtonWidget(),
      ),
      drawer: NavigationDrawerWidget(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              const ContainerWithBoxDecorationWidget(),
              Divider(),
              const ColumnWidget(),
              Divider(),
              const RowWidget(),
              Divider(),
              const ColumnAndRowNestingWidget(),
              Divider(),
              const ButtonsWidget(),
              Divider(),
              const ButtonBarWidget(),
              Image(
                image: AssetImage("assets/images/totoro.png"),
                fit: BoxFit.cover,
                color: Colors.deepOrange,
              ),
              Image.network(
                  'https://www.clipartmax.com/png/middle/146-1462015_calavera-dia-de-muertos-png.png'),
              Icon(
                Icons.brush,
                color: Colors.lightBlue,
                size: 48.0,
              ),
              Divider(),
              const BoxDecoratorWidget(),
              Divider(),
              const InputDecoratorsWidget(),
              // PopupMenuButton(itemBuilder: (BuildContext context){
              //   return foodMenuList.map
              // })
            ]),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.lightGreen.shade100,
      ),
      //OR
      // This creates a Stadium Shape FloatingActionButton
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   child: Icon(Icons.play_arrow),
      //   label: Text('Play')
      // ),
      bottomNavigationBar: BottomAppBar(
        // hasNotch: true,
        color: Colors.lightGreen.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.pause),
            Icon(Icons.stop),
            Icon(Icons.access_time),
            Padding(padding: EdgeInsets.all(32.0)),
          ],
        ),
      ),
    );
  }
}

class TodoMenuItem {
  final String title;
  final Icon icon;

  TodoMenuItem({required this.title, required this.icon});
}

List<TodoMenuItem> foodMenuList = [
  TodoMenuItem(title: "Fast Food", icon: Icon(Icons.fastfood)),
  TodoMenuItem(title: "Remind Me", icon: Icon(Icons.add_alarm)),
  TodoMenuItem(title: "Flight", icon: Icon(Icons.flight)),
  TodoMenuItem(title: "Music", icon: Icon(Icons.audiotrack)),
];

class PopupMenuButtonWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PopupMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen.shade100,
      height: preferredSize.height,
      width: double.infinity,
      child: Center(
        child: PopupMenuButton<TodoMenuItem>(
          icon: Icon(Icons.view_list),
          onSelected: ((valueSelected) {
            print('valueSelected: ${valueSelected.title}');
          }),
          itemBuilder: (BuildContext context) {
            return foodMenuList.map((TodoMenuItem todoMenuItem) {
              return PopupMenuItem<TodoMenuItem>(
                value: todoMenuItem,
                child: Row(
                  children: <Widget>[
                    Icon(todoMenuItem.icon.icon),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Text(todoMenuItem.title)
                  ],
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(75.0);
}

class ColumnAndRowNestingWidget extends StatelessWidget {
  const ColumnAndRowNestingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text("Columns and Row Nesting 1"),
        Text("Columns and Row Nesting 2"),
        Text("Columns and Row Nesting 3"),
        Padding(padding: EdgeInsets.all(16.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Row Nesting 1"),
            Text("Row Nesting 2"),
            Text("Row Nesting 3"),
          ],
        )
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("Row 1"),
        Padding(padding: EdgeInsets.all(16.0)),
        Text("Row 2"),
        Padding(padding: EdgeInsets.all(16.0)),
        Text("Row 3"),
      ],
    );
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("Column 1"),
        Divider(),
        Text("Column 2"),
        Divider(),
        Text("Column 3"),
      ],
    );
  }
}

class ContainerWithBoxDecorationWidget extends StatelessWidget {
  const ContainerWithBoxDecorationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100.0),
              bottomRight: Radius.circular(10.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.lightGreen.shade500],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Flutter World',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.deepPurple,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.deepPurpleAccent,
                  decorationStyle: TextDecorationStyle.dotted,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  TextSpan(text: " for"),
                  TextSpan(
                    text: " Mobile",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Flag',
                style: TextStyle(color: Colors.lightGreen.shade100),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Icon(Icons.flag),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.flight)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.flight),
              iconSize: 42.0,
              color: Colors.white,
              tooltip: 'Flight',
            ),
          ],
        )
      ],
    );
  }
}

class ButtonBarWidget extends StatelessWidget {
  const ButtonBarWidget({super.key});

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.map),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.airport_shuttle),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.brush),
            highlightColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class BoxDecoratorWidget extends StatelessWidget {
  const BoxDecoratorWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.orange,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              )
            ]),
      ),
    );
  }
}

class InputDecoratorsWidget extends StatelessWidget {
  const InputDecoratorsWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16.0,
          ),
          decoration: InputDecoration(
            labelText: "Notes",
            labelStyle: TextStyle(color: Colors.purple),
            border: OutlineInputBorder(),
          ),
        ),
        Divider(
          color: Colors.lightGreen,
          height: 50.0,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Enter your notes",
          ),
        ),
      ],
    );
  }
}
