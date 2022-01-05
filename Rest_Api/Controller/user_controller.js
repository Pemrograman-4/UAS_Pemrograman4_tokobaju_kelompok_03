const userModel = require('../Model/model_user')
const response = require('../Config/response')
const bcrypt = require('bcrypt')

/*
Fungsi Register
*/
exports.register = (data) =>
  new Promise((resolve, reject) => {
    userModel.findOne({
      email: data.email
    }).then((user) => {
      if (user) {
        reject(response.errorResponse('E-Mail Sudah Digunakan'))
      } else {
        bcrypt.hash(data.password, 10, (err, hash) => {
          data.password = hash
          userModel.create(data)
            .then(() => {
              resolve(response.suksesResponse('Berhasil Registrasi'))
            }).catch(() => {
              reject(response.errorResponse('Gagal Registrasi'))
            })
        })
      }
    })
  })

  /*
  Fungsi Login
  */
exports.login = (data) =>
  new Promise((resolve, reject) => {
    userModel.findOne({
      email: data.email
    }).then(user => {
      if (user) {
        if (bcrypt.compareSync(data.password, user.password)) {
          resolve(Object.assign(response.suksesResponse('Berhasil Login'), {
            user: user
          }))
        } else {
          reject(response.errorResponse('Password Salah'))
        }
      } else {
        reject(response.errorResponse('E-Mail Tidak Terdaftar/Email Salah'),
        )
      }
    })
  })

exports.update = async (req, res) => {
  try {
    await Model.findOneAndUpdate(
      { _id: req.params.id },
      {
        email: req.body.email,
        nama: req.body.nama,
        password: req.body.password,
        telp: req.body.telp,
      }
    );
    res.json(response.suksesResponse("Berhasil Update Data"));
  } catch (error) {
    res.json(response.errorResponse("Gagal Update Data"));
  }
};