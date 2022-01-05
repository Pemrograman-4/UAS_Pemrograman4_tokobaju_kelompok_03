const mongoose = require('mongoose')
const Schema = mongoose.Schema
const UserSchema = new Schema({
    judul: { type: String },
    penulis: { type: String },
    genre: { type: String },
    penerbit: { type: String },
    gambar: { type: String },
    deskripsi: { type: String },
    date: { type: Date, default: Date.now }

})
module.exports = mongoose.model('baju', UserSchema)