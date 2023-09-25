import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp_beginning/widgets/gridview_builder.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';

class LayoutsPage extends StatelessWidget {
  const LayoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Layouts',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        // brightness:Brightness.light,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.cloud_queue))
        ],
      ),
      drawer: NavigationDrawerWidget(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildJournalHeaderImage(),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildJournalEntry(),
                Divider(),
                _buildJournalWeather(),
                Divider(),
                _buildJournalTags(),
                Divider(),
                _buildJournalFooterImages(),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildJournalHeaderImage() {
    return Image(
      image: AssetImage('assets/images/present.png'),
      fit: BoxFit.cover,
    );
  }

  Widget _buildJournalEntry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Birthday',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt, ipsum in sollicitudin efficitur, ligula elit hendrerit neque, vel feugiat leo enim non odio. In hac habitasse platea dictumst. Duis tincidunt auctor lacinia. Sed rhoncus massa eget odio sagittis, sit amet mollis massa sollicitudin. Aliquam eu nisi sagittis, dictum nulla quis, volutpat mi. Cras ac ipsum commodo, pellentesque leo vitae, tincidunt ex.',
          style: TextStyle(
            color: Colors.black54,
          ),
        )
      ],
    );
  }

  Widget _buildJournalWeather() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.wb_sunny, color: Colors.orange),
          ],
        ),
        SizedBox(
          width: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '81° Clear',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  '4500 San Alpho Drive, Dallas, TX United States',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget _buildJournalTags() {
    return Wrap(
      spacing: 8.0,
      children: List.generate(7, (int index) {
        return Chip(
          label: Text(
            'Gift ${index + 1}',
            style: TextStyle(fontSize: 10.0),
          ),
          avatar: Icon(
            Icons.card_giftcard,
            color: Colors.blue.shade300,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }),
    );
  }

  Widget _buildJournalFooterImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/salmon.png'),
          radius: 40.0,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/asparagus.png'),
          radius: 40.0,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/strawberries.png'),
          radius: 40.0,
        ),
        SizedBox(
          width: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.cake),
              Icon(Icons.star_border),
              Icon(Icons.music_note),
              // Icon(Icons.movie),
            ],
          ),
        )
      ],
    );
  }
}
