// import 'package:flutter/material.dart';
//
//
// enum PageStatus { LOADING, ERROR, SUCCESS, FLOATING_LOADING }
//
// class PageContainer extends StatelessWidget {
//   final PageStatus? status;
//   final Color? backgroundColor;
//   final Widget? title;
//   final Widget success;
//   final Widget err;
//   final Widget loading;
//
//   const PageContainer({
//     Key? key,
//     this.status = PageStatus.SUCCESS,
//     this.backgroundColor,
//     this.title,
//     required this.success,
//     this.err =  const Center(
//       child: Text('我是错误页'),
//     ),
//     this.loading =  const Center(
//       child: CircularProgressIndicator(),
//     ),
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: SafeArea(child: _buildBody()),
//     );
//   }
//
//   Widget _buildBody() {
//     if (title != null) {
//       return Column(
//         children: [
//           title!,
//           Expanded(child: _buildContent()),
//         ],
//       );
//     } else {
//       return _buildContent();
//     }
//   }
//
//   Widget _buildContent() {
//     switch (status) {
//       case PageStatus.LOADING:
//         return Visibility(
//             visible: status == PageStatus.LOADING, child: loading!);
//       case PageStatus.SUCCESS:
//         return success;
//       case PageStatus.ERROR:
//         return Visibility(visible: status == PageStatus.ERROR, child: err!);
//       case PageStatus.FLOATING_LOADING:
//         return Stack(
//           children: [
//             success,
//             Container(
//               color: Color(0x99000000),
//               child: loading!,
//             )
//           ],
//         );
//       default:
//         throw '非法Status = $status';
//     }
//   }
// }
//
//
