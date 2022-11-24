import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/model/model.dart';
import 'package:flutter/services.dart';
List<Model> listModel = [];


class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
    final _formKey = GlobalKey<FormState>();

    String _title = "";
    int _amount = 0;
    String _type = "Income";
    List<String> _listType = ["Income", "Expense"];
    String _date = "";

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar : AppBar(
                title: Text('Add Budget Info'),
            ),
            drawer: DrawerWidget(
            ),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Example: Buy Pokemon Scarlet",
                                            labelText: "Budget Title",
                                            // Add icons to make it more intuitive
                                            icon: const Icon(Icons.people),
                                            // Added a circular border to make it neater
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        // Added behavior when name is typed 
                                        onChanged: (String? value) {
                                            setState(() {
                                                _title = value!;
                                            });
                                        },
                                        // Added behavior when data is saved
                                        onSaved: (String? value) {
                                            setState(() {
                                                _title = value!;
                                            });
                                        },
                                        // Validator as form validation
                                        validator: (String? value) {
                                            if (value == null || value.isEmpty) {
                                                return 'Title cannot be empty!';
                                            }
                                            return null;
                                        },
                                    )
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                        ],
                                        decoration: InputDecoration(
                                            hintText: "Example: 200",
                                            labelText: "Budget Amount",
                                            // Add icons to make it more intuitive
                                            icon: const Icon(Icons.people),
                                            // Added a circular border to make it neater
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(5.0),
                                            ),
                                        ),
                                        // Added behavior when name is typed 
                                        onChanged: (String? value) {
                                            setState(() {
                                                _amount = int.parse(value!);
                                            });
                                        },
                                        // Added behavior when data is saved
                                        onSaved: (String? value) {
                                            setState(() {
                                                _amount = int.parse(value!);
                                            });
                                        },
                                        // Validator as form validation
                                        validator: (String? value) {
                                            if (value == null || value == 0) {
                                                return 'Amount cannot be empty!';
                                            }
                                            return null;
                                        },
                                    )
                                ),
                                TextField(
                                    controller: TextEditingController(), //editing controller of this TextField
                                    decoration: InputDecoration( 
                                        icon: Icon(Icons.calendar_today), //icon of text field
                                        labelText: "Enter Date" //label text of field
                                    ),
                                    readOnly: true,  //set it true, so that user will not able to edit text
                                    onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                            context: context, initialDate: DateTime.now(),
                                            firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2100)
                                        );
                                    
                                        if (pickedDate != null ) {
                                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                                            setState(() {
                                                _date = formattedDate; //set output date to TextField value. 
                                            });
                                        }
                                    },
                                ),
                                DropdownButton(
                                    value: _type,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: _listType.map((String items) {
                                        return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                        );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                        setState(() {
                                            _type = newValue!;
                                        });
                                    },
                                ),
                            ]
                        )
                    )
                )
            ),
            floatingActionButton: TextButton(
                child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                    if (_formKey.currentState!.validate()) {
                        listModel.add(
                            Model(
                                title: _title,
                                amount: _amount,
                                date: _date,
                                type: _type,
                            )
                        );
                        showDialog(
                            context: context,
                            builder: (context) {
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 15,
                                    child: Container(
                                        child: ListView(
                                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                                            shrinkWrap: true,
                                            children: <Widget>[
                                                Center(child: const Text('Saved:')),
                                                SizedBox(height: 20),
                                                Center(child: Text('Budget Title: ' + _title)),
                                                Center(child: Text('Budget Amount: ' + "$_amount")),
                                                Center(child: Text('Budget Date: ' + _date)),
                                                Center(child: Text('Budget Type: ' + _type)),
                                                SizedBox(height: 20),
                                                TextButton(
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                    child: Text('Kembali'),
                                                ), 
                                            ],
                                        ),
                                    ),
                                );
                            },
                        );
                    }
                },
            )
        );
    }
}