import 'package:ecogo_booking/ui/screens/search/views/card_view.dart';
import 'package:ecogo_booking/ui/screens/search/views/filter_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';

import '../../../data/models/search_response_model.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../styleguide/typography.dart';
import '../../bloc/dashboard_bloc.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/shimmer_loader.dart';

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
        Gap(29),
        Center(
          child: Text(
            "No Flights found",
            style: h6.w500.black,
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
                          return FlightCardView(data: data[index]);
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


class WaitingLoader extends StatelessWidget {
  const WaitingLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.only(bottom: 10),
      itemBuilder: (context, index) {
        return LoadingCard();
      },
    );
  }
}