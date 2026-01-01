import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';

import '../../../data/models/search_response_model.dart';
import '../../../gen/assets.gen.dart';
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
          width: MediaQuery.of(context).size.width,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorName.white,
          ),
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Assets.svgs.icFlight.svg(height: 20,color:ColorName.darkBlue),
                  Gap(10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data?.segmentInformation?.first.flightDesignator?.mac?.name?.toString()??"",
                      style: h6),
                      Text(
                        "${data?.segmentInformation?.first.flightDesignator?.mac?.code ?? ""}"
                            " - "
                            "${data?.segmentInformation?.first.flightDesignator?.flightNumber ?? ""}",
                      style: h6,
                      ),
                    ],
                  )
                ],
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_bloc.timeFormat(time: data?.segmentInformation?.first.arrivalTime?.toString()??""),
                          style: placeholder),
                      Text(_bloc.dateFormat(date: data?.segmentInformation?.first.arrivalTime?.toString()??""),
                          style: h6),

                      Text(data?.segmentInformation?.first.arrivalAirport?.cityCode?.toString()??"",
                          style: h6),
                    ],
                  ),
                  Gap(10),
                  Expanded(
                    child:LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _bloc.durationFormat(
                                duration: data?.segmentInformation?.first.duration ?? 0,
                              ),
                              style: h6,
                            ),

                            Row(
                              children: [
                                CircleAvatar(radius: 5, backgroundColor: ColorName.darkPrimary),
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: ColorName.background,
                                    margin: const EdgeInsets.symmetric(horizontal: 6),
                                  ),
                                ),
                                CircleAvatar(radius: 5, backgroundColor: ColorName.darkPrimary),
                              ],
                            ),
                            Text(
                              data?.segmentInformation?.first.stops == 0
                                  ? "Non-stop"
                                  : "${data?.segmentInformation?.first.stops} Stops",
                              style: h6,
                            ),
                          ],
                        );
                      }
                    ),
                  ),
                  Gap(10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_bloc.timeFormat(time: data?.segmentInformation?.first.departureTime?.toString()??""),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: placeholder),
                      Text(_bloc.dateFormat(date: data?.segmentInformation?.first.departureTime?.toString()??""),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: h6),
                      Text(data?.segmentInformation?.first.departureAirport?.cityCode?.toString()??"",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: h6),
                    ],
                  ),
                ],
              ),
              Gap(10),
              Divider(
                color: ColorName.background,
              ),
              Gap(10),
              Row(
                children: [
                  Expanded(
                    child: Text("Flight Details",
                        style: h6.w400.copyWith(color: ColorName.darkPrimary)),
                  ),
                  Text(
                    "₹ ${data?.totalPriceList?.first.fareDetail?.adult?.fareComponents?.totalFare ?? ""}",
                    style: h6.w400.copyWith(color: ColorName.black),
                  ),
                  Gap(5),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: ColorName.darkBlue),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Center(
                      child: Text("Book Now",
                          style: h6.w400.copyWith(color: ColorName.white)),
                    ),
                  )
                ],
              ),
              Gap(10),
            ],
          ),
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
        elevation: 0,
        surfaceTintColor: Colors.transparent,
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
                print("ddd${data.length}");
                  return data.isEmpty
                      ? emptyScreenWidget()
                      :  Column(
                  children: [
                    const Gap(27),
                    FilterFlights(bloc: _bloc),
                    const Gap(20),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return myCards(data[index]);
                        },
                      ),
                    ),
                    const Gap(40),
                  ],
                );
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
              checkmarkColor: ColorName.white,
              selectedColor: ColorName.darkBlue,
              backgroundColor: ColorName.background,
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