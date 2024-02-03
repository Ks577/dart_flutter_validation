import 'package:flutter/material.dart';

enum GenderList { male, female }

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  GenderList _gender = GenderList.female;
  bool checkBox1 = false;
  bool checkBox2 = false;
  bool checkBox3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(6),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.pets),
                  labelText: "Your dog's name",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your dog's name";
                  }
                  return null;
                }),
            TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.person), labelText: "Your name"),
                validator: (value) {
                  if (value!.isEmpty) return "Please enter your name";
                  return null;
                }),
            TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.mail), labelText: "E-mail"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid Email';
                  }
                  return null;
                }),
            TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.phone), labelText: "Phone number"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                }),
            const SizedBox(height: 1.0),
            TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.pets), labelText: "Breed of dog"),
                validator: (value) {
                  if (value!.isEmpty) return "Please enter your dog's breed";
                  return null;
                }),
            const SizedBox(height: 30),
            const Text("Your dog's gender",
                style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center),
            const SizedBox(height: 15),
            RadioListTile(
              title: const Text('Male'),
              value: GenderList.male,
              groupValue: _gender,
              onChanged: (GenderList? value) {
                setState(() {
                  _gender = value!;
                });
              },
            ),
            RadioListTile(
              title: const Text('Female'),
              value: GenderList.female,
              groupValue: _gender,
              onChanged: (GenderList? value) {
                setState(() {
                  _gender = value!;
                });
              },
            ),
            const SizedBox(height: 30),
            const Text("Your dog's diet",
                style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center),
            const SizedBox(height: 15),
            CheckboxListTile(
                title: const Text('Dry food'),
                value: checkBox1,
                onChanged: (bool? value) {
                  setState(() {
                    checkBox1 = value!;
                  });
                }),
            CheckboxListTile(
                title: const Text('Wet food'),
                value: checkBox2,
                onChanged: (bool? value) {
                  setState(() {
                    checkBox2 = value!;
                  });
                }),
            const SizedBox(height: 5.0),
            CheckboxListTile(
                title: const Text('Homemade food'),
                value: checkBox3,
                onChanged: (bool? value) {
                  setState(() {
                    checkBox3 = value!;
                  });
                }),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String text;
                  if (checkBox1 == false) {
                    text = '';
                  } else {
                    text = 'Thank you your submission has been saved ';
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(text),
                      backgroundColor: Colors.black54,
                    ),
                  );
                }
              },
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Entry form'),
              backgroundColor: Colors.purple,
            ),
            body: const MyForm()),
      ),
    );
