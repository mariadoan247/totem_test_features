import 'package:flutter/material.dart';
import 'package:totem_test_app/boxes/search.dart';

const _cdib = [
  _CdibConfiguration(
    title: "Know what tribe your are a part of and your family name",
    body: "Extra info",
  ),
  _CdibConfiguration(
    title:
        "Identify the ancestor you are trying to trace your lineage to on the Dawes roll",
    body: "Extra info",
  ),
  _CdibConfiguration(
    title:
        "Look up that ancestor on a historical website such as:\nDawes Rolls | Oklahoma Historical Society (okhistory.org)",
    body: "Extra info",
  ),
  _CdibConfiguration(
    title:
        "If you found your ancestor proceed to step 5, otherwise proceed to step 10",
    body: "Extra info",
  ),
  _CdibConfiguration(
    title: "Look up your ancestor’s census card and enrollment packet . . .",
    body:
        "- A Census cards list the enrollee’s name, age, sex, blood quantum, tribe, place of residence, and roll number.\n- An Enrollment packet provides details about the individual and their family, including marriage, birth, and death information. They may include transcripts of interviews with family members or neighbors and correspondence regarding enrollment.",
  ),
  _CdibConfiguration(
    title:
        "Provide documents of each birth and death of family members in the lineage",
    body: "Extra info",
  ),
  _CdibConfiguration(
    title:
        "Submit your birth certificate, social security number, and driver’s license",
    body: "Extra info",
  ),
  _CdibConfiguration(
    title:
        "Submit all documents and apply for your CDIB with the Bureau of Indian Affairs (BIA)",
    body: "Extra info",
  ),
  _CdibConfiguration(
    title: "Wait for 6-8 weeks for your application to process",
    body: "Extra info",
  ),
  _CdibConfiguration(
    title:
        "If you are unable to find your ancestor, try searching another tribes roll, the 1900 U.S. census, or the rejected Dawes Roll applicants",
    body: "Extra info",
  ),
];

class CDIB extends StatefulWidget {
  const CDIB({
    super.key,
  });

  @override
  State<CDIB> createState() => _CDIBState();
}

class _CDIBState extends State<CDIB> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 12),
        for (int i = 0; i < _cdib.length; ++i) ...[
          _CreateStep(
            index: i + 1,
            title: _cdib[i].title,
            body: _cdib[i].body,
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _CreateStep extends StatefulWidget {
  const _CreateStep({
    required this.index,
    required this.title,
    required this.body,
  });

  final int index;

  final String title;

  final String body;

  @override
  State<_CreateStep> createState() => __CreateStepState();
}

class __CreateStepState extends State<_CreateStep> {
  bool _isSelected = false;
  Color get _backgroundColor => _isSelected ? Colors.white : Colors.black;
  Color get _indexColor => _isSelected ? Colors.black : Colors.white;

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isSelected = !_isSelected;
            });
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),
              color: _backgroundColor,
            ),
            child: Center(
              child: Text(
                "${widget.index}",
                style: TextStyle(color: _indexColor),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(
                  widget.title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              if (_isExpanded) ...[
                const SizedBox(height: 8),
                Text(
                  widget.body,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _CdibConfiguration {
  const _CdibConfiguration({
    required this.title,
    required this.body,
  });

  final String title;

  final String body;
}
