import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MahasiswaController extends GetxController {
  late TextEditingController cKodeMatakuliah;
  late TextEditingController cNamaMatakuliah;
  late TextEditingController cSksMatakuliah;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference matakuliah = firestore.collection('matakuliah_22312163');

    return matakuliah.get();
  }

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference matakuliah = firestore.collection('matakuliah_22312163');

    return matakuliah.snapshots();
  }

  void add(String kodeMatakuliah, String namaMatakuliah, String sksMatakuliah) async {
    CollectionReference matakuliah = firestore.collection("matakuliah_22312163");

    try {
      await matakuliah.add({
        "kode_matakuliah": kodeMatakuliah,
        "nama_matakuliah": namaMatakuliah,
        "sks_matakuliah": sksMatakuliah,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data matakuliah",
          onConfirm: () {
            cKodeMatakuliah.clear();
            cNamaMatakuliah.clear();
            cSksMatakuliah.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Matakuliah.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef = firestore.collection("matakuliah_22312163").doc(id);

    return docRef.get();
  }

  void Update(String kodeMatakuliah, String namaMatakuliah, String sksMatakuliah, String id) async {
    DocumentReference matakuliahById = firestore.collection("matakuliah_22312163").doc(id);

    try {
      await matakuliahById.update({
        "kode_matakuliah": kodeMatakuliah,
        "nama_matakuliah": namaMatakuliah,
        "sks_matakuliah": sksMatakuliah,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Matakuliah.",
        onConfirm: () {
          cKodeMatakuliah.clear();
          cNamaMatakuliah.clear();
          cSksMatakuliah.clear();
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
        middleText: "Gagal Menambahkan Matakuliah.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("matakuliah_22312163").doc(id);

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
    cKodeMatakuliah = TextEditingController();
    cNamaMatakuliah = TextEditingController();
    cSksMatakuliah = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cKodeMatakuliah.dispose();
    cNamaMatakuliah.dispose();
    cSksMatakuliah.dispose();
    super.onClose();
  }
}
