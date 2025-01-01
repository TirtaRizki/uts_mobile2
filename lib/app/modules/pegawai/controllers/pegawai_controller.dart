import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PegawaiController extends GetxController {
  late TextEditingController cNomor;
  late TextEditingController cJabatan;
  late TextEditingController cNama;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference karyawan_22312165 =
        firestore.collection('karyawan_22312165');

    return karyawan_22312165.get();
  }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference karyawan_22312165 =
        firestore.collection('karyawan_22312165');

    return karyawan_22312165.snapshots();
  }

  void add(
      String no_karyawan, String nama_karyawan, String jabatan_karyawan) async {
    CollectionReference karyawan_22312165 =
        firestore.collection("karyawan_22312165");

    try {
      await karyawan_22312165.add({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data pegawai.",
          onConfirm: () {
            cNomor.clear();
            cNama.clear();
            cJabatan.clear();
            Get.back();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Karyawan.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef =
        firestore.collection("karyawan_22312165").doc(id);

    return docRef.get();
  }

  void Update(String no_karyawan, String nama_karyawan, String jabatan_karyawan,
      String id) async {
    DocumentReference karyawanById =
        firestore.collection("karyawan_22312165").doc(id);

    try {
      await karyawanById.update({
        "no_karyawan": no_karyawan,
        "nama_karyawan": nama_karyawan,
        "jabatan_karyawan": jabatan_karyawan,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data karyawan.",
        onConfirm: () {
          cNomor.clear();
          cNama.clear();
          cJabatan.clear();
          Get.back();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Karyawan.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef =
        firestore.collection("karyawan_22312165").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    cNomor = TextEditingController();
    cNama = TextEditingController();
    cJabatan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNomor.dispose();
    cNama.dispose();
    cJabatan.dispose();
    super.onClose();
  }
}
