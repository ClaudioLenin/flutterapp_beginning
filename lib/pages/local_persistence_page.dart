import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapp_beginning/classes/database.dart';
import 'package:flutterapp_beginning/pages/edit_entry.dart';
import 'package:flutterapp_beginning/widgets/gridview_builder.dart';
import 'package:flutterapp_beginning/widgets/navigation_drawer_widget.dart';
import 'package:intl/intl.dart';

class LocalPersistencePage extends StatefulWidget {
  const LocalPersistencePage({super.key});

  @override
  State<LocalPersistencePage> createState() => _LocalPersistencePageState();
}

class _LocalPersistencePageState extends State<LocalPersistencePage> {
  late Database _database;
  late DateTime _selectedDate; // Inicialización de _selectedDate

  Future<List<Journal>> _loadJournals() async {
    await DatabaseFileRoutines().readJournals().then((journalsJson) {
      _database = databaseFRomJson(journalsJson);
      _database.journal
          .sort((comp1, comp2) => comp2.date.compareTo(comp1.date));
    });
    return _database.journal;
  }

  void _addOrEditJournal(
      {required bool add, required int index, required Journal journal}) async {
    JournalEdit _journalEdit = JournalEdit(action: '', journal: journal);
    _journalEdit = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditEntry(
          add: add,
          index: index,
          journalEdit: _journalEdit,
        ),
        fullscreenDialog: true,
      ),
    );
    switch (_journalEdit.action) {
      case 'Save':
        if (add) {
          setState(() {
            _database.journal.add(_journalEdit.journal);
          });
        } else {
          setState(() {
            _database.journal[index] = _journalEdit.journal;
          });
        }
        DatabaseFileRoutines().writeJournals(databaseToJson(_database));
        break;
      case 'Cancel':
        break;
      default:
        break;
    }
  }

  //Build the ListView with Separator
  Widget _buildListViewSeparated(AsyncSnapshot snapshot) {
    return ListView.separated(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        String _titleDate = DateFormat.yMMMd()
            .format(DateTime.parse(snapshot.data[index].date));
        String _subtitle =
            snapshot.data[index].mood + '\n' + snapshot.data[index].note;
        return Dismissible(
          key: Key(snapshot.data[index].id),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: ListTile(
            leading: Column(
              children: <Widget>[
                Text(
                  DateFormat.d()
                      .format(DateTime.parse(snapshot.data[index].date)),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    color: Colors.blue,
                  ),
                ),
                Text(DateFormat.E()
                    .format(DateTime.parse(snapshot.data[index].date))),
              ],
            ),
            title: Text(
              _titleDate,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(_subtitle),
            onTap: () {
              _addOrEditJournal(
                  add: false, index: index, journal: snapshot.data[index]);
            },
          ),
          onDismissed: (direction) {
            setState(() {
              _database.journal.removeAt(index);
            });
            DatabaseFileRoutines().writeJournals(databaseToJson(_database));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.grey);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Local Persistence'),
      ),
      body: FutureBuilder(
        initialData: [],
        future: _loadJournals(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // (BuildContext context, AsyncSnapshot)
          return !snapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _buildListViewSeparated(snapshot);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(padding: const EdgeInsets.all(24.0)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Journal Entry',
        child: Icon(Icons.add),
        onPressed: () {
          DateTime now = DateTime.now();
          _selectedDate = DateTime(now.year, now.month, now.day);
          _addOrEditJournal(
            add: true,
            index: -1,
            journal: Journal(
              id: '', // Asigna un ID apropiado
              date: _selectedDate.toString(), // Asigna una fecha adecuada
              mood: '', // Asigna un estado de ánimo apropiado
              note: '', // Asigna una nota adecuada
            ),
          );
        },
      ),
    );
  }
}
