import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductListingEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class GetProductListing extends ProductListingEvent {
  final BuildContext context;
  final Map<String, dynamic>
  parameters; //Key and value(e.g. username and password)
  final String? accessToken;

  GetProductListing(this.context, {required this.parameters, this.accessToken});
}
class ArrivalProductListing extends ProductListingEvent {
  final BuildContext context;
  final Map<String, dynamic>
  parameters; //Key and value(e.g. username and password)
  final String? accessToken;

  ArrivalProductListing(this.context, {required this.parameters, this.accessToken});
}
