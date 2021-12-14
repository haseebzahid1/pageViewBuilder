class BlogImage {
  final String imageUrl;
  final String imgTitle;
  final num price;
  final String location;
  final double rating;
  BlogImage({
    required this.imageUrl,
    required this.imgTitle,
    required this.price,
    required this.location,
    required this.rating,
  });
}

List<BlogImage> blogLists = [
  BlogImage(
      imageUrl: "assets/img/welcome-one.png",
      imgTitle: "Yousemite",
      price: 250,
      rating: 4.0,
      location: "USA, California"),
  BlogImage(
      imageUrl: "assets/img/welcome-two.png",
      imgTitle: "British Columbia",
      price: 1276,
      rating: 4.0,
      location: "USA, California"),
  BlogImage(
      imageUrl: "assets/img/welcome-three.png",
      imgTitle: "British Columbia",
      price: 1276,
      rating: 4.0,
      location: "USA, California"),
];
