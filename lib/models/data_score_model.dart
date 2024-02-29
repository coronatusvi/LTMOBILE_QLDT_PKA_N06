class ResponseScoreModel {
  final String? id;
  final String? message;
  final int? pages;
  final bool? success;
  final Learning_Model? data; // Dữ liệu cụ thể

  ResponseScoreModel({
    this.id,
    this.message,
    this.pages,
    this.success,
    this.data,
  });

  factory ResponseScoreModel.fromJson(Map<String, dynamic> json) {
    return ResponseScoreModel(
      id: json['Id'],
      message: json['Message'],
      pages: json['Pages'],
      success: json['Success'],
      data: json['Data'],
    );
  }
}

class Learning_Model {
  final String rsdiemmoinhat;
  final String rsdiemthanhphan;
  final String rsdiemketthuchocphan;
  final String rshocphanchuahoanthanh;
  final String rsdiemtrungbinhchung;
  final String rskhoikienthucbatbuoc;
  final String rskhoikienthuctuchondon;
  final String rskhoikienthuctuchonkep;
  final String rskhoikienthucbatbuochocphan;
  final String rskhoikienthuctuchondonhocphan;
  final String rskhoikienthuctuchonkephocphan;
  final String rsthongtinnguoihoc;
  Learning_Model({
    required this.rsdiemmoinhat,
    required this.rsdiemthanhphan,
    required this.rsdiemketthuchocphan,
    required this.rshocphanchuahoanthanh,
    required this.rsdiemtrungbinhchung,
    required this.rskhoikienthucbatbuoc,
    required this.rskhoikienthuctuchondon,
    required this.rskhoikienthuctuchonkep,
    required this.rskhoikienthucbatbuochocphan,
    required this.rskhoikienthuctuchondonhocphan,
    required this.rskhoikienthuctuchonkephocphan,
    required this.rsthongtinnguoihoc,
  });

  factory Learning_Model.fromJson(Map<String, dynamic> json) {
    return Learning_Model(
      rsdiemmoinhat: json['rsDiemMoiNhat'] ?? '',
      rsdiemthanhphan: json['rsDiemThanhPhan'] ?? '',
      rsdiemketthuchocphan: json['rsDiemKetThucHocPhan'] ?? '',
      rshocphanchuahoanthanh: json['rsHocPhanChuaHoanThanh'] ?? '',
      rsdiemtrungbinhchung: json['rsDiemTrungBinhChung'] ?? '',
      rskhoikienthucbatbuoc: json['rsKhoiKienThucBatBuoc'] ?? '',
      rskhoikienthuctuchondon: json['rsKhoiKienThucTuChonDon'] ?? '',
      rskhoikienthuctuchonkep: json['rsKhoiKienThucTuChonKep'] ?? '',
      rskhoikienthucbatbuochocphan: json['rsKhoiKienThucBatBuocHocPhan'] ?? '',
      rskhoikienthuctuchondonhocphan:
          json['rsKhoiKienThucTuChonDonHocPhan'] ?? '',
      rskhoikienthuctuchonkephocphan:
          json['rsKhoiKienThucTuChonKepHocPhan'] ?? '',
      rsthongtinnguoihoc: json['rsThongTinNguoiHoc'] ?? '',
    );
  }
}