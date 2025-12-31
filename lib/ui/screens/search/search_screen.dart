import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';
import '../../bloc/dashboard_bloc.dart';

class SearchScreen extends StatefulWidget {
  static const String path = '/search';
  final String? tuiId;
  const SearchScreen({super.key,this.tuiId});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final DashboardBloc _bloc = DashboardBloc();
  @override
  void initState() {
    _bloc.getSearchFlight(tuiId: widget.tuiId??"");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppBar(
        title: Text("Flight results"),
        backgroundColor: ColorName.background,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
