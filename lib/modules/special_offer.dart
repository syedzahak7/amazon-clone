class SpecialOffer {
  final String discount;
  final String title;
  final String detail;
  final String icon;

  SpecialOffer({
    required this.discount,
    required this.title,
    required this.detail,
    required this.icon,
  });
}

List<SpecialOffer> get students{
  return [...homeSpecialOffers];
}
final homeSpecialOffers = <SpecialOffer>[
  SpecialOffer(
    discount: '25%',
    title: "Today’s Special!",
    detail: 'Get discount for every order, only valid for today',
    icon: 'images/sofa.png',
  ),
  SpecialOffer(
    discount: '35%',
    title: "Shinny Chair!",
    detail: 'Please give me a star!',
    icon: 'images/shiny_chair.png',
  ),
  SpecialOffer(
    discount: '100%',
    title: "Not discount today!",
    detail: 'If you have any problem, contact me',
    icon: 'images/lamp.png',
  ),
  SpecialOffer(
    discount: '75%',
    title: "It's for you!",
    detail: 'Wish you have a funny time',
    icon: 'images/plastic_chair@2x-2.png',
  ),
  SpecialOffer(
    discount: '65%',
    title: "Make yourself at home!",
    detail: 'If you have any confuse, let me now',
    icon: 'images/book_case@2x.png',
  ),
];