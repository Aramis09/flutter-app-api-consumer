import 'package:flutter/material.dart';
import 'package:flutter_aplication_bloc/client/features/home/interfaces/advertising_list.dart';
import 'package:flutter_aplication_bloc/client/features/home/presentation/bloc/advertising_bloc.dart';
import 'package:flutter_aplication_bloc/client/features/home/presentation/widgets/advertising_widgets/advertising_slider.dart';
import 'package:flutter_aplication_bloc/client/features/home/presentation/widgets/advertising_widgets/section_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvertisingDetailWidget extends StatelessWidget {
  final Map<String, String> params;
  const AdvertisingDetailWidget({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final advertising = BlocProvider.of<AdvertisingBloc>(context)
      ..add(GetAdvertisingDetail(id: int.parse(params['id'] ?? "0")));
    // final colors = Theme.of(context).colorScheme;

    return BlocBuilder<AdvertisingBloc, AdvertisingState>(
      builder: (context, state) => LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            // Expanded(child: Image.network(state.advertisingDetail!.image)),
            Expanded(child: _MapToSections().render(state))
          ],
        ),
      ),
    );
  }
}

class _MapToSections {
  _MapToSections();
  Widget render(AdvertisingState state) {
    if (state.advertisingDetail?.sectionsViews != null) {
      List<SectionsView> sections = state.advertisingDetail!.sectionsViews;
      return Padding(
        // padding: EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        child: Scrollbar(
          child: ListView.builder(
              itemCount: sections.length,
              itemBuilder: (context, index) => Column(
                    children: [
                      CardSection(
                        sectionDetail: sections[index],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  )),
        ),
      );
    }
    return const Text("No data");
  }
}
