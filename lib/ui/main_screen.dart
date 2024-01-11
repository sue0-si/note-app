import 'package:flutter/material.dart';

import 'create_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _updateTitleController = TextEditingController();
  final _updateDescriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _updateTitleController.dispose();
    _updateDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // note.length
        itemBuilder: (context, index) => ListTile(
          title: Text('제목'),
          trailing: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _updateTitleController,
                            decoration: InputDecoration(labelText: 'title'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'input field is required';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _updateDescriptionController,
                            decoration: InputDecoration(labelText: 'Write your note here'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'input field is required';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  //
                                }
                              },
                              child: const Text('Finished'),
                            ),
                          ),
                        ],
                      ),
                    );
                    // TextField(
                    //   controller: _updateController,
                    //
                    //   // note.description = _updateController.text
                    // );
                  },
                  icon: Icon(Icons.edit_note)),
              IconButton(
                onPressed: () {
                  // TODO: 메모 지우는 로직
                },
                icon: Icon(Icons.delete_forever),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
