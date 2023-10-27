import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sql_app/src/core/constants/app_colors.dart';
import 'package:sql_app/src/core/constants/app_text_styles.dart';
import 'package:sql_app/src/core/constants/svgs.dart';
import 'package:sql_app/src/core/utilities/file_utils.dart';

class UploadLogo extends StatefulWidget {
  final dynamic image;
  final Function(Uint8List?)? onChangeLogoFile;

  const UploadLogo({
    super.key,
    this.onChangeLogoFile,
    this.image,
  });

  @override
  State<UploadLogo> createState() => _UploadLogoState();
}

class _UploadLogoState extends State<UploadLogo> {
  Uint8List? _logoFile;

  Future<void> _pickLogoImage(ImageSource source) async {
    final pickedFile = await FileUtils.getXFile(source, crop: true);

    if (pickedFile != null) {
      setState(() {
        _logoFile = pickedFile;
        widget.onChangeLogoFile!(_logoFile);
      });
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: DottedBorder(
          color: AppColors.ash,
          strokeWidth: 2,
          dashPattern: const [8, 8],
          radius: const Radius.circular(20.0),
          child: Container(
            width: 308.w,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(.14),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) => Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: AppColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(height: 22.h),
                          ListTile(
                            leading: const Icon(Icons.camera_alt),
                            title: const Text('Take a photo'),
                            onTap: () {
                              _pickLogoImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Choose from gallery'),
                            onTap: () {
                              _pickLogoImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(height: 30.h)
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: _ImageContainer(
                logoFile: _logoFile,
                image: widget.image,
              ),
            ),
          ),
        ),
      );
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({
    required Uint8List? logoFile,
    this.image,
  }) : _logoFile = logoFile;

  final Uint8List? _logoFile;
  final dynamic image;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _logoFile != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.memory(
                    _logoFile!,
                    width: double.infinity,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                )
              : (image != null && image != ''
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.memory(
                        image,
                        width: double.infinity,
                        height: 150.0,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Upload Your Image',
                          textAlign: TextAlign.center,
                          style:
                              AppTextStyles.headlineTwo.copyWith(fontSize: 20),
                        ),
                        SizedBox(height: 15.h),
                        SvgPicture.asset(SvgIcons.uploadIcon),
                        const SizedBox(height: 16.0),
                        Text(
                          'Drag & drop images',
                          style: AppTextStyles.regular.copyWith(fontSize: 13),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'JPG,PNG',
                          style: AppTextStyles.bodySmall
                              .copyWith(fontSize: 13, color: AppColors.grey),
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ))
        ],
      );
}
