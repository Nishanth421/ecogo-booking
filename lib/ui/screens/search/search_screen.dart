import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/search_response_model.dart';
import '../../../gen/colors.gen.dart';
import '../../../styleguide/typography.dart';
import '../../bloc/dashboard_bloc.dart';
import '../../widgets/error_widget.dart';

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

  Widget emptyScreenWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Assets.images.imgEmptySearch.image(),
        Gap(29),
        Text(
          "No Flights found",
          style: h6.w500.black,
        )
      ],
    );
  }
  
  Widget myCards(ONWARD? data){
    return Column(
      children: [
        Container(
          child: Text(data?.segmentInformation?.first.flightDesignator?.mac?.name?.toString()??""),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppBar(
        title: Text("Flight results"),
        backgroundColor: ColorName.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: StreamBuilder<List<ONWARD?>>(
            stream: _bloc.searchStream,
            builder: (context, snapshot){
              if (snapshot.hasError) {
                return ErrorWidgetWithRetry(
                    error: snapshot.error.toString(),
                    retry: () async {
                      await _bloc.getSearchFlight(tuiId: widget.tuiId??"");
                    });
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return WaitingLoader();
                case ConnectionState.active:
                case ConnectionState.done:
                List<ONWARD?> data = snapshot.data ?? [];
                  return data.isEmpty
                      ? emptyScreenWidget()
                      : ListView(
                      children: [
                        Gap(27),
                        FilterFlights(bloc: _bloc),
                        Gap(20),
                        Column(
                            children: data
                                .map((e) => myCards(e))
                                .toList()),
                        Gap(40),
                      ]);
                default:
                  return Container();
              }
        }),
      ),
    );
  }
}


class FilterFlights extends StatefulWidget {
   DashboardBloc? bloc;
    FilterFlights({super.key,this.bloc});
  @override
  _FilterFlightsState createState() => _FilterFlightsState();
}

class _FilterFlightsState extends State<FilterFlights> {
  String selectedType = "Recommended"; // default selection

  final List<String> tripTypes = ["Recommended", "Cheapest", "Fastest"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tripTypes.map((type) {
          bool isSelected = selectedType == type;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(type),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    selectedType = type;
                  });
                  // Optional: notify parent or bloc
                  widget.bloc?.flightFilter(type:selectedType);
                }
              },
              selectedColor: Colors.blue,
              backgroundColor: Colors.grey[200],
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class WaitingLoader extends StatelessWidget {
  const WaitingLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: SpinKitCircle(
              color: ColorName.primary,
              size: 25.0,
            )),
      ],
    );
  }
}