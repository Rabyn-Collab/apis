class Astro{
final String compatibility;
final String description;
final String mood;
final String color;
Astro({this.color, this.compatibility,
  this.description,this.mood});


factory Astro.fromJson(Map<String, dynamic> json){
  return Astro(
    color: json['color'],
    compatibility: json['compatibility'],
    description: json['description'],
    mood: json['mood']
  );

}

}