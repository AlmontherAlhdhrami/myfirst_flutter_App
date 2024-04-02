class Castle{

  String? key;
  CastleData? castleData;
  Castle(this.key,this.castleData);

}
/*
'name':'picture1',
    'image':'a1.jpg',
    'place':'Muscat',
    'price':300*/
class CastleData{
  String? name;
  String?image;
  String?place;
  double?price;
  CastleData( this.name,this.image,this.place,this.price);
  CastleData.fromJson(Map<dynamic,dynamic> json){

    name =json['name'];
    image = json['image'];
    place=json['place'];
    price=checkDouble(json['price']);

  }
  double? checkDouble(dynamic price) {
    if (price is String) {
      return double.tryParse(price) ?? 0.0;
    } else if (price is int) {
      return price.toDouble();
    } else if (price is double) {
      return price;
    } else {
      return 0.0;
    }
  }

}
