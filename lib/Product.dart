import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'SectionHeaderDelegate.dart';

class Product{
  ProductData data;

  Product({
    this.data,
  });

}

class ProductData{
  Products data;

  ProductData({
    this.data,
  });
}

class Products{
  int total_count;
  final List<Item> streets;

  ProductData({
    this.total_count,
    this.streets
  });
}

class Item{
  String productlabel;
  String name;
  String sku;

  Item({
    this.productlabel,
    this.name,
    this.sku,
  });
}