// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_constructors_in_immutables, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContractDetailsPage extends StatefulWidget {
  final String contractTitle;

  ContractDetailsPage(this.contractTitle);

  @override
  _ContractDetailsPageState createState() => _ContractDetailsPageState();
}

class _ContractDetailsPageState extends State<ContractDetailsPage> {
  String sellerName = '';
  String sellerIdCard = '';
  String sellerResidence = '';
  String sellerIdCardDate = '';
  String buyerName = '';
  String buyerIdCard = '';
  String buyerResidence = '';
  String buyerIdCardDate = '';
  String propertyAddress = '';
  String propertyOwnership = '';
  String propertyOwnershipMethod = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contractTitle),
        backgroundColor: const Color(0xff446FAF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'عقد بيع شقة',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Arial'),
              ),
              SizedBox(height: 16),
              Text(
                'إنه في يوم الموافق / / قد تحرر بين كل من: -',
                style: TextStyle(fontFamily: 'Arial'),
              ),
              _buildSectionTitle('بيانات البائع:'),
              _buildSellerInfoTextField('اسم البائع', onChanged: (value) => sellerName = value),
              _buildSellerInfoTextField('رقم البطاقة', onChanged: (value) => sellerIdCard = value),
              _buildSellerInfoTextField('مكان الإقامة', onChanged: (value) => sellerResidence = value),
              _buildSellerInfoTextField('تاريخ إصدار البطاقة', onChanged: (value) => sellerIdCardDate = value),
              SizedBox(height: 16),
              _buildSectionTitle('بيانات المشتري:'),
              _buildBuyerInfoTextField('اسم المشتري', onChanged: (value) => buyerName = value),
              _buildBuyerInfoTextField('رقم البطاقة الشخصية', onChanged: (value) => buyerIdCard = value),
              _buildBuyerInfoTextField('مكان الإقامة', onChanged: (value) => buyerResidence = value),
              _buildBuyerInfoTextField('تاريخ إصدار البطاقة', onChanged: (value) => buyerIdCardDate = value),
              SizedBox(height: 16),
              _buildSectionTitle('تفاصيل العقار:'),
              _buildPropertyInfoTextField('عنوان العقار', onChanged: (value) => propertyAddress = value),
              _buildPropertyInfoTextField('ملكية الشقة', onChanged: (value) => propertyOwnership = value),
              _buildPropertyInfoTextField('طريقة الحصول على الملكية', onChanged: (value) => propertyOwnershipMethod = value),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    // Handle saving contract details
                  },
                  child: Text('save', style: TextStyle(fontFamily: 'Arial')),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff446FAF)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Arial'),
      ),
    );
  }

  Widget _buildSellerInfoTextField(String labelText, {required ValueChanged<String> onChanged}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(labelText: labelText),
    );
  }

  Widget _buildBuyerInfoTextField(String labelText, {required ValueChanged<String> onChanged}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(labelText: labelText),
    );
  }

  Widget _buildPropertyInfoTextField(String labelText, {required ValueChanged<String> onChanged}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(labelText: labelText),
    );
  }
}
