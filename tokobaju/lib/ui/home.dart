import 'package:tokobuku/ui/add_produk.dart';
import 'package:tokobuku/ui/login.dart';
import 'package:tokobuku/ui/profile.dart';
import 'package:tokobuku/ui/view_produk.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatelessWidget {
  Future<void> Logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  width: 300,
                  height: 200,
                  child: Image.asset("assets/banner.jpg"),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(20.0),
              //   child: Container(
              //     width: 100,
              //     height: 100,
              //     child: Image.asset("assets/icon.png"),
              //   ),
              // )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Container(
              //   padding: EdgeInsets.all(10.0),
              // ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    height: 100.0,
                    minWidth: 150.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: const Text("Produk Saya"),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProdukView()),
                      )
                    },
                    splashColor: Colors.redAccent,
                  )),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    height: 100.0,
                    minWidth: 150.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: const Text("Tambah Produk"),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddProduk()),
                      )
                    },
                    splashColor: Colors.redAccent,
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    height: 100.0,
                    minWidth: 150.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: const Text("Profile"),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyProfile()),
                      )
                    },
                    splashColor: Colors.redAccent,
                  )),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 18.0,
                    height: 100.0,
                    minWidth: 150.0,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: const Text("Keluar"),
                    onPressed: () => {
                      Logout(),
                      //  Logout();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginview()),
                      )
                    },
                    splashColor: Colors.redAccent,
                  )),
            ],
          ),
        ],
      )),
    );
  }
}
