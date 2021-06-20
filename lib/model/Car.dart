class Car{

  late String _name;
  late String _number;
  late String _finacialDue;
  late String _insuranceDue;
  late String _taxDue;
  late String _emissionDue;
  late String _serviceDue;
  late String _id;


  String get id => _id;

  set id(String value) {
    _id = value;
  }


  Car(this._name, this._number, this._finacialDue, this._insuranceDue,
      this._taxDue, this._emissionDue, this._serviceDue, this._id);

  String get serviceDue => _serviceDue;

  set serviceDue(String value) {
    _serviceDue = value;
  }

  String get emissionDue => _emissionDue;

  set emissionDue(String value) {
    _emissionDue = value;
  }

  String get taxDue => _taxDue;

  set taxDue(String value) {
    _taxDue = value;
  }

  String get insuranceDue => _insuranceDue;

  set insuranceDue(String value) {
    _insuranceDue = value;
  }

  String get finacialDue => _finacialDue;

  set finacialDue(String value) {
    _finacialDue = value;
  }

  String get number => _number;

  set number(String value) {
    _number = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
  Map<String, dynamic> toJson() {
    return {
      '_name': this._name,
      '_number': this. _number,
      '_finacialDue':this._finacialDue,
      '_insuranceDue':this._insuranceDue,
      '_taxDue':this._taxDue,
      '_emissionDue':this._emissionDue,
      '_serviceDue':this._serviceDue,
      '_id':this._id


    };
  }
  Car.fromJson(Map<String, dynamic> json)
      : _name = json['_name'],
        _number = json['_number'],
        _finacialDue=json['_finacialDue'],
        _insuranceDue=json[ '_insuranceDue'],
        _taxDue=json[ '_taxDue'],
        _emissionDue=json['_emissionDue'],
        _serviceDue=json['_serviceDue'],
  _id=json['_id'];
}