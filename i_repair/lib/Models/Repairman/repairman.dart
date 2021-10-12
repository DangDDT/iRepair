class Repairman {
  const Repairman(this.name, this.code, this.distance, this.rating, this.avatar,
      this.majorCode);
  final String code;
  final String name;
  final double distance;
  final int rating;
  final String avatar;
  final String majorCode;
}

const List<Repairman> repairmanList = <Repairman>[
  Repairman(
      "Phạm Tấn Phát",
      'R00001',
      0.3,
      3,
      "https://scontent.fsgn5-6.fna.fbcdn.net/v/t1.6435-9/135090916_1331932087169648_6344578304214591181_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=F4SVrapJ8sMAX-Tg1sM&_nc_ht=scontent.fsgn5-6.fna&oh=288679314910bff7aeda46333245c387&oe=618595DD",
      "TL"),
  Repairman(
      "Vũ Phi Long",
      'R00002',
      0.3,
      4,
      "https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/89471558_2661034714138926_7334722076097380352_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=174925&_nc_ohc=V0KQqy1tptwAX9cBOEe&_nc_ht=scontent.fsgn5-11.fna&oh=8f20c400ad006752911e7d7fd2ebbb96&oe=6183B008",
      "X2"),
  Repairman(
      "Nguyễn Phi Long",
      'R00003',
      5.5,
      3,
      "https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/47326142_1170771333099896_4919208150722150400_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=174925&_nc_ohc=eYuhQgOA6l4AX_HXHQo&tn=DpUZyiwjEV2LUXq3&_nc_ht=scontent.fsgn5-10.fna&oh=e95c1cafe90c27455b75ff5ee766b942&oe=618200B8",
      "MG"),
  Repairman(
      "Nguyễn Thuần",
      'R00004',
      1.5,
      4,
      "https://scontent.fsgn5-9.fna.fbcdn.net/v/t39.30808-6/217621601_1467637380256743_6771480550308407712_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=QOVxcjdDwvkAX-6xNrH&_nc_ht=scontent.fsgn5-9.fna&oh=6bea423ca2866baebaa36ceb26fe5ee5&oe=6163E041",
      "ĐT"),
  Repairman(
      "Lê Tấn Thịnh",
      'R00005',
      1.5,
      4,
      "https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/193024051_2458304014315692_1000004856554295334_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Jt6Py7q9oNsAX9lB5du&_nc_ht=scontent.fsgn5-11.fna&oh=6521f63d23ab07faa8ecb1386d8e4902&oe=61846475",
      "MT"),
  Repairman(
      "Nguyễn Minh Châu",
      'R00006',
      0.4,
      3,
      "https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.6435-9/134128865_1327574057615835_8691594146851068400_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=174925&_nc_ohc=9cnRGubufJ4AX8qSUhU&_nc_ht=scontent.fsgn5-5.fna&oh=5c121bc10bb919a0f65a3737415279d3&oe=61857BBE",
      "X4"),
  Repairman(
      "Nguyễn Duy Anh",
      'R00007',
      1.0,
      4,
      "https://scontent.fsgn5-9.fna.fbcdn.net/v/t1.6435-9/37258184_872056529631501_7229243735211507712_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=174925&_nc_ohc=86G9oLGQUJsAX9EKD0X&tn=DpUZyiwjEV2LUXq3&_nc_ht=scontent.fsgn5-9.fna&oh=5a853f340b7ce814c2766524ab0b7f4f&oe=6181E88C",
      "ON"),
  Repairman(
      "Phạm Hữu Nghĩa",
      'R00008',
      0.7,
      3,
      "https://scontent.fsgn5-8.fna.fbcdn.net/v/t1.6435-9/145490152_1645861872468232_2404576525271328519_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=-KKRXEcThkEAX-VQeMP&_nc_ht=scontent.fsgn5-8.fna&oh=5dfe93870e948990400b19eafa9ebd6e&oe=6183DEBC",
      "TL"),
  Repairman(
      "Nguyễn Quốc Khánh",
      'R00009',
      1.0,
      4,
      "https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.6435-9/80389988_564294717757002_6559485070489419776_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=_Q-sC4vgFLMAX-_D411&_nc_ht=scontent.fsgn5-4.fna&oh=3b91b4f467d5a992c3b70dd05eb72a59&oe=6182222E",
      "TL"),
  Repairman(
      "Lưu Lập Hòa",
      'R000010',
      0.2,
      3,
      "https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/s552x414/33569195_546359705780742_2182061124030038016_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=174925&_nc_ohc=6wfawH4BJKoAX82D73f&_nc_ht=scontent.fsgn5-10.fna&oh=e6b44d2c70595783467b746c8288af22&oe=6185047E",
      "MG"),
  Repairman(
      "Trần Phú Sơn",
      'R000011',
      1.5,
      3,
      "https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.6435-9/202304614_1109701929525145_4801822179073318783_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=174925&_nc_ohc=v0_5ZoxDkZMAX9YxbTq&_nc_ht=scontent.fsgn5-4.fna&oh=56704a903b1904f05f2e807c33539131&oe=6184804C",
      "ĐT"),
  Repairman(
      "Đặng Như Phong",
      'R000012',
      0.2,
      3,
      "https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.6435-9/240186103_1249129632199951_1611544894358524152_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=lH4lc-W2CyIAX_pjwPp&_nc_ht=scontent.fsgn5-4.fna&oh=4ecdc5a2992a68ba46fb9d8eaec43efe&oe=61842754",
      "X2"),
  Repairman(
      "Võ Đăng Khoa",
      'R000013',
      1.5,
      3,
      "https://scontent.fsgn5-11.fna.fbcdn.net/v/t1.6435-9/141741914_1387024964973354_6463379853589425388_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=174925&_nc_ohc=fdKbjAw0WN0AX-3BkqP&_nc_ht=scontent.fsgn5-11.fna&oh=473a0dc0a4f5181d31856c8b34c4231b&oe=618501B9",
      "X4"),
];

List<Repairman> repairmanListByMajor(String majorCode) {
  List<Repairman> list = [];
  for (Repairman r in repairmanList) {
    if (r.majorCode == majorCode) {
      list.add(r);
    }
  }
  return list;
}
