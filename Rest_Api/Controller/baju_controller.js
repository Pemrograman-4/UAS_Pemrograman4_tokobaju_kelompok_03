/*
Bandar Lampung
*/
const Model = require("../Model/model_baju");
const response = require("../Config/response");

exports.get = (data) =>
  new Promise((resolve, reject) => {
    Model.find().then((data) => {
      if (data.length == 0) {
        reject(response.errorResult());
      } else {
        resolve(
          Object.assign(response.suksesResult("Succes"), {
            data: data,
          })
        );
      }
    });
  });

exports.add = (data) =>
  new Promise((resolve, reject) => {
    Model.create(data)
      .then(() =>
        resolve(response.suksesResponse("Berhasil Menambah Data Baju"))
      )
      .catch(() =>
        reject(response.errorResponse("Gagal Menambah Data Baju"))
      );
  });

  // Delete data
exports.delete = async (req, res) => {
  try {
    await Model.findOneAndDelete({ _id: req.params.id });
    res.json(response.suksesResponse("Berhasil Menghapus Data"));
  } catch (error) {
    res.json(response.errorResponse("Gagal Menghapus Data"));
  }
};

// update data
exports.update = async (req, res) => {
  try {
    await Model.findOneAndUpdate(
      { _id: req.params.id },
      {
        judul: req.body.judul,
        penulis: req.body.penulis,
        genre: req.body.genre,
        penerbit: req.body.penerbit,
        deskripsi: req.body.deskripsi,
      }
    );
    res.json(response.suksesResponse("Berhasil Update Data"));
  } catch (error) {
    res.json(response.errorResponse("Gagal Update Data"));
  }
};