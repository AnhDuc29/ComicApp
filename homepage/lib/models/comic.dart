import 'dart:ffi';

class Comic{
  final String name;
  final double chapter;
  final int number;
  final String poster;
  const Comic({required this.name,required this.chapter,required this.number,required this.poster});
}

const trendsData =  [
  Comic(
    name: 'Hoa sơn tái xuất',
    number: 10, 
    chapter : 24, 
    poster: 'assets/images/hoa-son-tai-xuat.jpg' ,
  ),
  Comic(
    name: 'Tu tiên giả đại chiến siêu năng lực',
    number: 4, 
    chapter : 10, 
    poster: 'assets/images/tu-tien-gia-dai-chien-sieu-nang-luc.jpg' ,
  ),
  Comic(
    name: 'Thích Khách',
    number: 3, 
    chapter : 24, 
    poster: 'assets/images/tu_than_phieu_nguyet.jpg' ,
  ),
  Comic(
    name: 'Once Punch Man',
    number: 7, 
    chapter : 2, 
    poster: 'assets/images/once_punch_man.jpg' ,
  ),
  Comic(
    name: 'Thất sách chuyển sinh',
    number: 201, 
    chapter : 2, 
    poster: 'assets/images/that-sach-chuyen-sinh.jpg' ,
  ),
  Comic(
    name: 'FriendZone',
    number: 4, 
    chapter : 234, 
    poster: 'assets/images/friendzone.jpg' ,
  ),
  Comic(
    name: 'Sự trở lại của anh hùng cấp thảm họa',
    number: 10, 
    chapter : 29, 
    poster: 'assets/images/su-tro-lai-cua-anh-hung-cap-tham-hoa.jpg' ,
  ),
  
];

const recentsData = [
  Comic(
    name: 'Phi lôi đạo',
    number: 8, 
    chapter : 111, 
    poster: 'assets/images/phi_loi_dao.png' ,
  ),
  Comic(
    name: 'Thể thao cực hạn',
    number: 6, 
    chapter : 10, 
    poster: 'assets/images/the_thao_cuc_han.jpg' ,
  ),
  Comic(
    name: 'Tử thần phiêu nguyệt',
    number: 14, 
    chapter : 24, 
    poster: 'assets/images/tu_than_phieu_nguyet.jpg' ,
  ),
  Comic(
    name: 'Once Punch Man',
    number: 7, 
    chapter : 2, 
    poster: 'assets/images/once_punch_man.jpg' ,
  ),
  Comic(
    name: 'The Beginning after the end',
    number: 1, 
    chapter : 111, 
    poster: 'assets/images/the-beginning-after-the-end.jpg' ,
  ),
  Comic(
    name: 'Tu tiên giả đại chiến siêu năng lực',
    number: 4, 
    chapter : 10, 
    poster: 'assets/images/tu-tien-gia-dai-chien-sieu-nang-luc.jpg' ,
  ),
  Comic(
    name: 'Hoa sơn tái xuất',
    number: 10, 
    chapter : 24, 
    poster: 'assets/images/hoa-son-tai-xuat.jpg' ,
  ),
  Comic(
    name: 'Thất sách chuyển sinh',
    number: 201, 
    chapter : 2, 
    poster: 'assets/images/that-sach-chuyen-sinh.jpg' ,
  ),
  Comic(
    name: 'FriendZone',
    number: 4, 
    chapter : 234, 
    poster: 'assets/images/friendzone.jpg' ,
  ),
  Comic(
    name: 'Sự trở lại của anh hùng cấp thảm họa',
    number: 10, 
    chapter : 29, 
    poster: 'assets/images/su-tro-lai-cua-anh-hung-cap-tham-hoa.jpg' ,
  ),
  
];

const bannersData = [
  Comic(
    name: 'Jujutsu Kaisen',
    number: 1, 
    chapter : 111, 
    poster: 'assets/banners/Jujutsu_Kaisen.jpg' ,
  ),
  
];
