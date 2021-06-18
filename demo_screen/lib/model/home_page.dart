class HomePageModel {
  final String? name;
  final String? contact;
  final String? location;
  final String? noOfPersons;

  HomePageModel({
    this.name,
    this.contact,
    this.location,
    this.noOfPersons,
  });

  @override
  String toString() {
    return 'Name $name, Contact $contact, Prefered Location $location, Persons to live with $noOfPersons';
  }
}
