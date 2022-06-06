import 'package:flutter/material.dart';
import '/theme/app_colors.dart';
import '/theme/app_text_theme.dart';
import 'list_text.dart';

enum ApiMethod { get, post }

final methodColor = [
  AppColor.green,
  AppColor.blue1,
];

class ApiField extends StatelessWidget {
  final String link;
  final List<String> request;
  final String statusCode;
  final List<String> headers;
  final List<String> body;
  final ApiMethod method;
  final Widget? parameterBox;

  const ApiField({
    Key? key,
    required this.link,
    required this.request,
    required this.statusCode,
    required this.headers,
    required this.body,
    this.parameterBox,
    required this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Endpoint',
              style: AppTextTheme.mediumHeaderTitle(AppColor.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          border: Border.all(
                            color: methodColor[method.index],
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            method.name.toUpperCase(),
                            style: AppTextTheme.superscript(
                              methodColor[method.index],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          link,
                          style: AppTextTheme.link(AppColor.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (parameterBox != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        'Parameters',
                        style: AppTextTheme.mediumHeaderTitle(AppColor.black),
                      ),
                    ),
                    parameterBox!,
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
              child: Text(
                'Request',
                style: AppTextTheme.mediumHeaderTitle(AppColor.black),
              ),
            ),
            Text(
              'Example',
              style: AppTextTheme.mediumBodyText(AppColor.black),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: _buildBox(request),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Text(
                'Response',
                style: AppTextTheme.mediumHeaderTitle(AppColor.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: _buildResponse(
                statusCode: statusCode,
                headers: headers,
                body: body,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildBox(List<String> titles) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.yellow1.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BuildListText(
          titles: titles,
          color: AppColor.blue2,
        ),
      ),
    );
  }

  Widget _buildResponse({
    required String statusCode,
    required List<String> headers,
    required List<String> body,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'StatusCode: $statusCode',
            style: AppTextTheme.mediumBodyText(AppColor.black),
          ),
        ),
        Text(
          'HEADERS',
          style: AppTextTheme.mediumBodyText(AppColor.black),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: _buildBox(headers),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            'BODY',
            style: AppTextTheme.mediumBodyText(AppColor.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: _buildBox(body),
        ),
      ],
    );
  }
}
