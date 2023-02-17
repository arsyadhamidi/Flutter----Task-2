import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  State<RegistrasiPage> createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  bool _obsure = true;

  void _cekPassword() {
    if (_obsure == true) {
      setState(() {
        _obsure = false;
      });
    } else {
      setState(() {
        _obsure = true;
      });
    }
  }

  String gender = 'male';
  List<String> _item = ['Islam', 'Kristen', 'Budha', 'Hindu'];
  String _selectItem = 'Islam';

  TextEditingController _nama = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _motto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "FORM REGISTRASI",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: TextFormField(
              controller: _nama,
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.person),
                  label: Text("Masukan Nama Lengkap"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: TextFormField(
              controller: _password,
              obscureText: _obsure,
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.padlock),
                  label: Text("Masukan Password"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _cekPassword();
                    },
                    icon: Icon(_obsure
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: TextFormField(
              maxLines: 8,
              controller: _motto,
              decoration: InputDecoration(
                  hintText: 'Masukkan Motto Hidup',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  )),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile(
                  value: 'male',
                  title: Text("Male"),
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
              ),
              Expanded(
                  child: RadioListTile(
                value: 'female',
                title: Text("Female"),
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ))
            ],
          ),
          Center(
            child: Text("Agama :"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: DropdownButton(
              value: _selectItem,
              icon: Icon(Icons.arrow_drop_down_outlined),
              onChanged: (value) {
                setState(() {
                  _selectItem = value!;
                });
              },
              items: _item.map<DropdownMenuItem<String>>((String dataAgama) {
                return DropdownMenuItem(
                  value: dataAgama,
                  child: Text(dataAgama),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: MaterialButton(
              height: 60,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Center(
                            child: Text(
                          "INFORMASI",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        content: Container(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Nama : ${_nama.text}"),
                              Text("Password : ${_password.text}"),
                              Text("Motto : ${_motto.text}"),
                              Text("Jenis Kelamin : ${gender}"),
                              Text("Agama : ${_selectItem}"),
                            ],
                          ),
                        ),
                      );
                    });
              },
              color: Colors.blueAccent,
              child: Text(
                "SIGN UP",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
