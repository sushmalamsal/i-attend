import 'package:i_attend/import_all.dart';

class TaskcardView extends StatelessWidget {
  final String title;
  final Widget itemWidget;
  final String pointsText;
  const TaskcardView(
      {super.key,
      required this.title,
      required this.itemWidget,
      required this.pointsText});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskcardViewModel>.reactive(
      viewModelBuilder: () => TaskcardViewModel(),
      builder: (context, model, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 400),
            height: model.isExpanded ? 350 : 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/dollar.png',
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width: 4),
                          Text(
                            pointsText,
                            style: GoogleFonts.permanentMarker(
                              fontSize: 12,
                              color: const Color(0xFFDA9910),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (model.isExpanded) ...[
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.all(12.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 40,
                          mainAxisSpacing: 25,
                        ),
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return itemWidget;
                        },
                      ),
                    ),
                  ] else ...[
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(12.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 25,
                      ),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return itemWidget;
                      },
                    ),
                  ],
                  InkWell(
                    onTap: model.toggleExpansion,
                    child: Text(
                      model.isExpanded ? 'Collapse' : 'Expand',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
