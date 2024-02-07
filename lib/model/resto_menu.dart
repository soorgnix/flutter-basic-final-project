class RestoMenu {
  String name;
  int category;
  int price;
  String picLocation;
  String description;
  bool isAvailable;

  RestoMenu ({
    required this.name,
    required this.category,
    required this.price,
    required this.picLocation,
    required this.description,
    required this.isAvailable
  });
}

var restoMenuList = [
  RestoMenu(
    name: 'Nasi Ayam Bakar',
    category: 1,
    price: 35000,
    picLocation : 'images/main_course_nasi_ayam_bakar.jpg',
    description: 'Nasi dengan ayam bakar potongan dada atau paha, lengkap dengan tahu, tempe, dan lalaban.',
    isAvailable: true
  ),
  RestoMenu(
    name: 'Nasi Ayam Goreng',
    category: 1,
    price: 35000,
    picLocation : 'images/main_course_nasi_ayam_goreng.jpg',
    description: 'Nasi dengan ayam goreng potongan dada atau paha, lengkap dengan tahu, tempe, dan lalaban.',
    isAvailable: true
  ),
  RestoMenu(
    name: 'Nasi Goreng',
    category: 1,
    price: 20000,
    picLocation : 'images/main_course_nasi_goreng.jpg',
    description: 'Nasi digoreng dengan kecap manis, dengan irisan bakso, sosis, ati dan ampela.',
    isAvailable: true
  ),
  RestoMenu(
    name: 'Nasi Sate Ayam',
    category: 1,
    price: 25000,
    picLocation : 'images/main_course_nasi_sate.jpg',
    description: 'Sate ayam berjumlah 10 tusuk dengan nasi.',
    isAvailable: false
  ),
  RestoMenu(
    name: 'Nasi Soto',
    category: 1,
    price: 25000,
    picLocation : 'images/main_course_nasi_soto.jpeg',
    description: 'Soto ayam dengan nasi.',
    isAvailable: true
  ),
  RestoMenu(
    name: 'Gorengan',
    category: 2,
    price: 5000,
    picLocation : 'images/snack_gorengan.jpg',
    description: 'Gorengan bala-bala, gehu, comro, cireng, pisang goreng',
    isAvailable: true
  ),
  RestoMenu(
    name: 'Lumpia',
    category: 2,
    price: 10000,
    picLocation : 'images/snack_lumpiah.jpg',
    description: 'Lumpia isi.',
    isAvailable: false
  ),
  RestoMenu(
    name: 'Pisang Keju',
    category: 2,
    price: 10000,
    picLocation : 'images/snack_pisang_keju.jpg',
    description: 'Pisang dipotong-potong, dibalur dengan meses dan keju',
    isAvailable: true
  ),
  RestoMenu(
    name: 'Es Teh Manis',
    category: 3,
    price: 5000,
    picLocation : 'images/drink_estehmanis.jpg',
    description: 'Minuman Teh dengan gula dan es batu',
    isAvailable: true
  ),
  RestoMenu(
    name: 'Es Jeruk',
    category: 3,
    price: 10000,
    picLocation : 'images/drink_jusjeruk.jpg',
    description: 'Minuman Jeruk peras dengan es batu',
    isAvailable: true
  )
];