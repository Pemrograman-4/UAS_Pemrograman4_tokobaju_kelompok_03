import 'dart:io';

import 'package:tokobuku/server/server.dart';
import 'package:tokobuku/ui/detail_produk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProdukView extends StatelessWidget {
  final String apiUrl = UrlServer + "buku/get";
  void showSnakbar(BuildContext context, Message, color) {
    final snackBar = SnackBar(content: Text(Message), backgroundColor: color);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    List<dynamic>? fecthDataProduk;
  }

  Future<List<dynamic>> getLists() async {
    var response = await http.get(Uri.parse(apiUrl));
    try {
      var decodedResponse = json.decode(response.body)['data'];
      print(decodedResponse);
      return decodedResponse;
    } on SocketException catch (_) {}
    return [];
  }

  void setDetail(BuildContext context, id, judul, penulis, genre, penerbit,
      deskripsi) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('_id', id);
    await prefs.setString('judul', judul);
    await prefs.setString('penulis', penulis);
    await prefs.setString('genre', genre);
    await prefs.setString('penerbit', penerbit);
    await prefs.setString('deskripsi', deskripsi);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => detail_produk_view(
                id: id,
                judul: judul,
                penulis: penulis,
                genre: genre,
                penerbit: penerbit,
                deskripsi: deskripsi)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produk Anda'),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: getLists(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(5),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => setDetail(
                        context,
                        snapshot.data[index]['_id'],
                        snapshot.data[index]['judul'],
                        snapshot.data[index]['penulis'],
                        snapshot.data[index]['genre'],
                        snapshot.data[index]['penerbit'],
                        snapshot.data[index]['deskripsi'],
                      ),
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 1.0,
                              child: Image.asset('assets/buku.jpg'),
                              // child: Image.network(
                              //     "http://localhost:5000/0.8538883697917976hagia.jpg" +
                              //         snapshot.data[index]['IMAGE']),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 2.0, 0.0),
                                child: ListTile(
                                  title: Text(
                                    snapshot.data[index]['judul'],
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  subtitle: Text("Penulis:" +
                                      snapshot.data[index]['penulis'] +
                                      "" +
                                      "            " +
                                      "Genre:" +
                                      snapshot.data[index]['genre'] +
                                      "" +
                                      "            " +
                                      "penerbit:" +
                                      snapshot.data[index]['penerbit'] +
                                      "" +
                                      "            " +
                                      "deskripsi:" +
                                      snapshot.data[index]['deskripsi']),

                                  // Text(),

                                  // author: author,
                                  // publishDate: publishDate,
                                  // readDuration: readDuration,
                                ),
                              ),
                            ),
                            // child:Card(),

                            // child:Text('Detail'),
                            // Expanded(child: Text)
                            // widget(child:)
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
