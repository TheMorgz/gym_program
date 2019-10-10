import 'package:flutter/material.dart';

class GymProgram extends StatefulWidget {
  @override
  _GymProgramState createState() => _GymProgramState();
}

class _GymProgramState extends State<GymProgram> {
  List<String> _items = [];

  void _addItem(value) {
    setState(() {
      _items.add(value);
    });
  }
  
  void _removeItem(index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today\'s Exercises'),
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add Item',
        onPressed: _pushAddItemScreen
      ),
    );
  }

  Widget _buildList() {
    return (_items.length == 0) ? _emptyList() : ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        var item = _items[index];
        return _buildItem(item, index);
      }
    );
  }

  Widget _buildItem(String text, int index) {
    return ListTile(
      title: Text(text),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: (){
          _removeItem(index);
        },
      )
    );
  }

  Widget _emptyList() {
    return Center(
      child: Text('0 Exercises in your Gym Program')
    );
  }

  void _pushAddItemScreen(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Add an exercise'),
            ),
            body: TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'e.g. Incline Bench Press',
                contentPadding: EdgeInsets.all(10)
              ),
              onSubmitted: (value){
                _addItem(value);
                Navigator.pop(context);
              },
            ),
          );
        }
      )
    );
  }
}