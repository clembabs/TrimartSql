import 'dart:convert';

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
    SqfEntityField('quantity', DbType.integer),
    SqfEntityField('selling_price', DbType.real, defaultValue: 0),
    SqfEntityField('cost_price', DbType.real, defaultValue: 0),
    SqfEntityField('imageUrl', DbType.text),
  ],
);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
  modelName: 'myAppDatabaseModel', // optional
  databaseName: 'product_manager',
  //TODO: Add Password using flutter_Secure_storage
  password: null, // You can set a password if you want to use crypted database
  databaseTables: [tableProduct],
  sequences: [seqIdentity],
);
