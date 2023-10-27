import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'product.g.dart';

const tableProduct = SqfEntityTable(
  tableName: 'products',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: true,
  fields: [
    SqfEntityField('name', DbType.text),
    SqfEntityField('quantity', DbType.integer, defaultValue: 1),
    SqfEntityField('selling_price', DbType.real, defaultValue: 0.00),
    SqfEntityField('cost_price', DbType.real, defaultValue: 0.00),
    SqfEntityField('imageUrl', DbType.blob),
  ],
);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
  modelName: 'myAppDatabaseModel', // optional
  databaseName: 'product_manager',
  password: String.fromEnvironment(
      'db_password'), // You can set a password if you want to use crypted database
  databaseTables: [tableProduct],
  sequences: [seqIdentity],
);
