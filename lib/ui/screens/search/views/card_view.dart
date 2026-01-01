import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../data/models/search_response_model.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../styleguide/typography.dart';
import '../../../bloc/dashboard_bloc.dart';

class FlightCardView extends StatelessWidget {
  ONWARD? data;
  final DashboardBloc _bloc = DashboardBloc();
   FlightCardView({super.key,this.data});

  @override
  Widget build(BuildContext context) {
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
                                  CircleAvatar(radius: 5, backgroundColor: ColorName.darkBlue),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: ColorName.background,
                                      margin: const EdgeInsets.symmetric(horizontal: 6),
                                    ),
                                  ),
                                  CircleAvatar(radius: 5, backgroundColor: ColorName.darkBlue),
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
                        style: h6.w400.copyWith(color: ColorName.darkBlue)),
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
}
