// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'fish_model.dart';

class ListPondSortir {
  String? id;
  String? name;
  bool? isInputed;
  bool? isActive;
  List<Fish>? fish;

  dynamic dataInput;
  ListPondSortir(
      {this.id,
      this.isInputed,
      this.name,
      this.isActive,
      this.dataInput,
      this.fish});
}

class ListInputSortir {
  String? name;
  String? id;
  String? status;
  List<Fish>? fish;
  String? sampleLong;
  String? sampleWeight;
  String? waterHeight;
  String? type;
  ListInputSortir({
    this.name,
    this.id,
    this.fish,
    this.status,
    this.sampleLong,
    this.sampleWeight,
    this.waterHeight,
    this.type,
  });
}
