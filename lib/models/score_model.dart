// import 'dart:convert';

class ScoreModel {
  final String id;
  final String qlsvNguoihocId;
  final String daotaoChuongtrinhId;
  final double diemtrungbinh;
  final int tongsotinchi;
  final String thoigiandaotaoId;
  final String dohoc;
  final String namhoc;
  final double thoigiankyhoc;
  final String thoigiandaotaonamhoc;
  final String loaidiemTrungbinhId;
  final String loaidiemTrungbinh_Ten;
  final String loaidiemTrungbinh_Ma;
  final String phamvitonghopdiemId;
  final String phamvitonghopdiemTen;
  final String thangdiemId;
  final int thangdiemTen;
  final int thangdiemMa;
  final double sohocphanhoclai;
  final double sohocphanthilai;
  final double sotchoclai;
  final double sotcthilai;
  final double sohocphanmien;
  final double sotcmien;
  final double sotcdat;
  final double thuoctinhlantinh;
  final double sohocphanDat;
  ScoreModel({
    required this.id,
    required this.qlsvNguoihocId,
    required this.daotaoChuongtrinhId,
    required this.diemtrungbinh,
    required this.tongsotinchi,
    required this.thoigiandaotaoId,
    required this.dohoc,
    required this.namhoc,
    required this.thoigiankyhoc,
    required this.thoigiandaotaonamhoc,
    required this.loaidiemTrungbinhId,
    required this.loaidiemTrungbinh_Ten,
    required this.loaidiemTrungbinh_Ma,
    required this.phamvitonghopdiemId,
    required this.phamvitonghopdiemTen,
    required this.thangdiemId,
    required this.thangdiemTen,
    required this.thangdiemMa,
    required this.sohocphanhoclai,
    required this.sohocphanthilai,
    required this.sotchoclai,
    required this.sotcthilai,
    required this.sohocphanmien,
    required this.sotcmien,
    required this.sotcdat,
    required this.thuoctinhlantinh,
    required this.sohocphanDat,
  });
  factory ScoreModel.fromJson(Map<String, dynamic> json) {
    return ScoreModel(
      id: json['ID'] ?? '',
      qlsvNguoihocId: json['QLSV_NGUOIHOC_ID'] ?? '',
      daotaoChuongtrinhId: json['DAOTAO_CHUONGTRINH_ID'] ?? '',
      diemtrungbinh: json['DIEMTRUNGBINH'] ?? 0.0,
      tongsotinchi: json['TONGSOTINCHI'] ?? '',
      thoigiandaotaoId: json['DAOTAO_THOIGIANDAOTAO_ID'] ?? '',
      dohoc: json['DOHOC'] ?? '',
      namhoc: json['NAMHOC'] ?? '',
      thoigiankyhoc: json['DAOTAO_THOIGIANDAOTAO_KY'] ?? '',
      thoigiandaotaonamhoc: json['DAOTAO_THOIGIANDAOTAO_NAMHOC'] ?? '',
      loaidiemTrungbinhId: json['LOAIDIEMTRUNGBINH_ID'] ?? '',
      loaidiemTrungbinh_Ten: json['LOAIDIEMTRUNGBINH_TEN'] ?? '',
      loaidiemTrungbinh_Ma: json['LOAIDIEMTRUNGBINH_MA'] ?? '',
      phamvitonghopdiemId: json['PHAMVITONGHOPDIEM_ID'] ?? '',
      phamvitonghopdiemTen: json['PHAMVITONGHOPDIEM_TEN'] ?? '',
      thangdiemId: json['THANGDIEM_ID'] ?? '',
      thangdiemTen: json['THANGDIEM_TEN'] ?? '',
      thangdiemMa: json['THANGDIEM_MA'] ?? '',
      sohocphanhoclai: json['SOHOCPHANHOCLAI'] ?? 0.0,
      sohocphanthilai: json['SOHOCPHANTHILAI'] ?? 0.0,
      sotchoclai: json['SOTCHOCLAI'] ?? 0.0,
      sotcthilai: json['SOTCTHILAI'] ?? 0.0,
      sohocphanmien: json['SOHOCPHANMIEN'] ?? 0.0,
      sotcmien: json['SOTCMIEN'] ?? 0.0,
      sotcdat: json['SOTCDAT'] ?? 0.0,
      thuoctinhlantinh: json['THUOCTINHLANTINH'] ?? 0.0,
      sohocphanDat: json['SOHOCPHANDAT'] ?? 0.0,
    );
  }
}
