import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cart_record.g.dart';

abstract class CartRecord implements Built<CartRecord, CartRecordBuilder> {
  static Serializer<CartRecord> get serializer => _$cartRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'product_name')
  String get productName;

  @nullable
  @BuiltValueField(wireName: 'product_image')
  String get productImage;

  @nullable
  @BuiltValueField(wireName: 'product_taille')
  String get productTaille;

  @nullable
  @BuiltValueField(wireName: 'product_prix')
  String get productPrix;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CartRecordBuilder builder) => builder
    ..productName = ''
    ..productImage = ''
    ..productTaille = ''
    ..productPrix = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart');

  static Stream<CartRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CartRecord._();
  factory CartRecord([void Function(CartRecordBuilder) updates]) = _$CartRecord;

  static CartRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCartRecordData({
  String productName,
  String productImage,
  String productTaille,
  String productPrix,
}) =>
    serializers.toFirestore(
        CartRecord.serializer,
        CartRecord((c) => c
          ..productName = productName
          ..productImage = productImage
          ..productTaille = productTaille
          ..productPrix = productPrix));
