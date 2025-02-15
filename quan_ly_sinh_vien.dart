import 'dart:io';

// Lớp SinhVien để lưu thông tin của mỗi sinh viên
class SinhVien {
  String hoTen;
  double diemToan;
  double diemLy;
  double diemHoa;

  SinhVien(this.hoTen, this.diemToan, this.diemLy, this.diemHoa);

  // Hàm tính điểm trung bình
  double tinhDTB() {
    return (diemToan + diemLy + diemHoa) / 3;
  }

  // Hàm xếp loại học lực dựa trên ĐTB
  String xepLoai() {
    double dtb = tinhDTB();
    if (dtb < 5) return "Kém";
    if (dtb < 7) return "Khá";
    if (dtb < 9) return "Giỏi";
    return "Xuất sắc";
  }
}

// Danh sách lưu trữ sinh viên
List<SinhVien> danhSachSinhVien = [];

void main() {
  while (true) {
    print("\n===== QUẢN LÝ SINH VIÊN =====");
    print("1. Thêm sinh viên");
    print("2. Hiển thị danh sách sinh viên");
    print("3. Tìm sinh viên có ĐTB cao nhất");
    print("4. Thoát chương trình");
    stdout.write("Chọn chức năng (1-4): ");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        themSinhVien();
        break;
      case '2':
        hienThiDanhSach();
        break;
      case '3':
        timSinhVienCaoNhat();
        break;
      case '4':
        print("Thoát chương trình.");
        return;
      default:
        print("Lựa chọn không hợp lệ, vui lòng nhập lại.");
    }
  }
}

// Chức năng 1: Thêm sinh viên vào danh sách
void themSinhVien() {
  stdout.write("Nhập họ tên sinh viên: ");
  String hoTen = stdin.readLineSync()!;

  stdout.write("Nhập điểm Toán: ");
  double diemToan = double.parse(stdin.readLineSync()!);

  stdout.write("Nhập điểm Lý: ");
  double diemLy = double.parse(stdin.readLineSync()!);

  stdout.write("Nhập điểm Hóa: ");
  double diemHoa = double.parse(stdin.readLineSync()!);

  danhSachSinhVien.add(SinhVien(hoTen, diemToan, diemLy, diemHoa));
  print("✅ Đã thêm sinh viên: $hoTen.");
}

// Chức năng 2: Hiển thị danh sách sinh viên
void hienThiDanhSach() {
  if (danhSachSinhVien.isEmpty) {
    print("⚠️ Danh sách sinh viên trống.");
    return;
  }

  print("\n===== DANH SÁCH SINH VIÊN =====");
  for (var sv in danhSachSinhVien) {
    print(
        "${sv.hoTen} - ĐTB: ${sv.tinhDTB().toStringAsFixed(2)} - Xếp loại: ${sv.xepLoai()}");
  }
}

// Chức năng 3: Tìm sinh viên có ĐTB cao nhất
void timSinhVienCaoNhat() {
  if (danhSachSinhVien.isEmpty) {
    print("⚠️ Danh sách sinh viên trống.");
    return;
  }

  SinhVien topSV = danhSachSinhVien
      .reduce((sv1, sv2) => sv1.tinhDTB() > sv2.tinhDTB() ? sv1 : sv2);
  print("\n🏆 Sinh viên có ĐTB cao nhất:");
  print(
      "${topSV.hoTen} - ĐTB: ${topSV.tinhDTB().toStringAsFixed(2)} - Xếp loại: ${topSV.xepLoai()}");
}
