import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:my_app/chat.dart';

const maxHomeItemWidth = 1400.0;
const _horizontalPadding = 32.0;
const _horizontalDesktopPadding = 81.0;
const _carouselHeightMin = 240.0;
const _carouselItemDesktopMargin = 8.0;
const _carouselItemMobileMargin = 4.0;
const _carouselItemWidth = 296.0;

bool isDisplayDesktop(BuildContext context) => true;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GPT Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(
          //default toast widget
          // toastBuilder: (String msg) => CustomToastWidget(msg: msg),
          // //default loading widget
          // loadingBuilder: (String msg) => CustomLoadingWidget(msg: msg),
          // //default notify widget
          // notifyStyle: FlutterSmartNotifyStyle(
          //   successBuilder: (String msg) => CustomSuccessWidget(msg: msg),
          //   failureBuilder: (String msg) => CustomFailureWidget(msg: msg),
          //   warningBuilder: (String msg) => CustomWarningWidget(msg: msg),
          //   alertBuilder: (String msg) => CustomAlertWidget(msg: msg),
          //   errorBuilder: (String msg) => CustomErrorWidget(msg: msg),
          // ),
          ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var role = '';

  setRole(content) {
    setState(() {
      role = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<String> contents = [
    //   '我希望你能扮演一个软件开发者的角色。我将提供一些关于网络应用需求的具体信息，而你的工作是提出一个架构和代码，用 Vue3 和 Flutter 开发安全的应用。',
    //   '我希望你能扮演一个 IT 架构师的角色。我将提供一些关于应用程序或其他数字产品功能的细节，而你的工作是想出将其整合到 IT 环境中的方法。这可能涉及到分析业务需求，进行差距分析，并将新系统的功能映射到现有的 IT 环境中。接下来的步骤是创建一个解决方案设计，一个物理网络蓝图，定义系统集成的接口和部署环境的蓝图。',
    //   '我想让你充当一名人工智能辅助的医生。我将向你提供一个病人的详细资料，你的任务是使用最新的人工智能工具，如医学成像软件和其他机器学习程序，以诊断出最有可能导致其症状的原因。你还应将传统方法，如体检、实验室测试等，纳入你的评估过程，以确保准确性。',
    //   '我想让你充当一个虚拟医生。我将描述我的症状，你将提供一个诊断和治疗计划。你应该只回复你的诊断和治疗计划，而不是其他。不要写解释。',
    //   '我希望您能作为语言病理学家（SLP），提出新的语言模式、沟通策略，并培养他们对不口吃的沟通能力的信心。您应该能够推荐技术、策略和其他治疗方法。在提供建议时，您还需要考虑患者的年龄、生活方式和关注点。',
    //   '我希望你能作为一本自助书。你将为我提供如何改善我生活中某些领域的建议和提示，如人际关系、职业发展或财务规划。例如，如果我在与重要的另一半的关系中挣扎，你可以建议有用的沟通技巧，使我们的关系更紧密。',
    //   '我希望你充当一个正则表达式生成器。你的角色是生成匹配文本中特定模式的正则表达式。你应该提供正则表达式的格式，以便于复制和粘贴到支持正则表达式的文本编辑器或编程语言中。不要写关于正则表达式如何工作的解释或例子；只需提供正则表达式本身。我的第一个提示是生成一个匹配 [正则要求] 的正则表达式。',
    //   '我希望你能充当英语翻译、拼写纠正者和改进者。我将用任何语言与你交谈，你将检测语言，翻译它，并在我的文本的更正和改进版本中用英语回答。我希望你用更漂亮、更优雅、更高级的英语单词和句子来取代我的简化 A0 级单词和句子。保持意思不变，但让它们更有文学性。我希望你只回答更正，改进，而不是其他，不要写解释。',
    // ];

    var carouselCards = <Widget>[
      _CarouseCard(
        assetColor: Color(0xFF344955),
        assetDarkColor: Color(0xFF1D2327),
        textColor: Colors.white,
        studyRoute: '/',
        title: '全栈程序员',
        content:
            '我希望你能扮演一个软件开发者的角色。我将提供一些关于网络应用需求的具体信息，而你的工作是提出一个架构和代码，用 Vue3 和 Flutter 开发安全的应用。',
        onTap: (content) => setRole(content),
      ),
      _CarouseCard(
        assetColor: Color(0xff86699e),
        assetDarkColor: Color(0xFF344955),
        textColor: Colors.white,
        studyRoute: '/',
        title: '架构师 IT',
        content:
            '我希望你能扮演一个 IT 架构师的角色。我将提供一些关于应用程序或其他数字产品功能的细节，而你的工作是想出将其整合到 IT 环境中的方法。这可能涉及到分析业务需求，进行差距分析，并将新系统的功能映射到现有的 IT 环境中。接下来的步骤是创建一个解决方案设计，一个物理网络蓝图，定义系统集成的接口和部署环境的蓝图。',
        onTap: (content) => setRole(content),
      ),
      _CarouseCard(
        assetColor: Color(0xFFdfd545),
        assetDarkColor: Color(0xFF1D2327),
        textColor: Colors.white,
        studyRoute: '/',
        title: 'AI 医生',
        content:
            '我想让你充当一名人工智能辅助的医生。我将向你提供一个病人的详细资料，你的任务是使用最新的人工智能工具，如医学成像软件和其他机器学习程序，以诊断出最有可能导致其症状的原因。你还应将传统方法，如体检、实验室测试等，纳入你的评估过程，以确保准确性。',
        onTap: (content) => setRole(content),
      ),
      _CarouseCard(
        assetColor: Color(0xFF8c2f00),
        assetDarkColor: Color(0xFF1D2327),
        textColor: Colors.white,
        studyRoute: '/',
        title: '虚拟医生',
        content:
            '我想让你充当一个虚拟医生。我将描述我的症状，你将提供一个诊断和治疗计划。你应该只回复你的诊断和治疗计划，而不是其他。不要写解释。',
        onTap: (content) => setRole(content),
      ),
      _CarouseCard(
        assetColor: Color(0xFFff6100),
        assetDarkColor: Color(0xFF1D2327),
        textColor: Colors.white,
        studyRoute: '/',
        title: '语言病理学家',
        content:
            '我希望您能作为语言病理学家（SLP），提出新的语言模式、沟通策略，并培养他们对不口吃的沟通能力的信心。您应该能够推荐技术、策略和其他治疗方法。在提供建议时，您还需要考虑患者的年龄、生活方式和关注点。',
        onTap: (content) => setRole(content),
      ),
      _CarouseCard(
        assetColor: Color(0xFFcf92e0),
        assetDarkColor: Color(0xFF1D2327),
        textColor: Colors.white,
        studyRoute: '/',
        title: '生活自助百科',
        content:
            '我希望你能作为一本自助书。你将为我提供如何改善我生活中某些领域的建议和提示，如人际关系、职业发展或财务规划。例如，如果我在与重要的另一半的关系中挣扎，你可以建议有用的沟通技巧，使我们的关系更紧密。',
        onTap: (content) => setRole(content),
      ),
      _CarouseCard(
        assetColor: Color(0xFF127f82),
        assetDarkColor: Color(0xFF1D2327),
        textColor: Colors.white,
        studyRoute: '/',
        title: '正则生成器',
        content:
            '我希望你充当一个正则表达式生成器。你的角色是生成匹配文本中特定模式的正则表达式。你应该提供正则表达式的格式，以便于复制和粘贴到支持正则表达式的文本编辑器或编程语言中。不要写关于正则表达式如何工作的解释或例子；只需提供正则表达式本身。我的第一个提示是生成一个匹配 [正则要求] 的正则表达式。',
        onTap: (content) => setRole(content),
      ),
      _CarouseCard(
        assetColor: Color(0xFFffcfc3),
        assetDarkColor: Color(0xFF1D2327),
        textColor: Colors.white,
        studyRoute: '/',
        title: '英语翻译或修改',
        content:
            '我希望你能充当英语翻译、拼写纠正者和改进者。我将用任何语言与你交谈，你将检测语言，翻译它，并在我的文本的更正和改进版本中用英语回答。我希望你用更漂亮、更优雅、更高级的英语单词和句子来取代我的简化 A0 级单词和句子。保持意思不变，但让它们更有文学性。我希望你只回答更正，改进，而不是其他，不要写解释。',
        onTap: (content) => setRole(content),
      ),
    ];
    return Scaffold(
      body: Column(
        key: const ValueKey('HomeListView'),
        children: [
          _DesktopCarousel(
            height: 200.0,
            setRoleCall: setRole,
            children: carouselCards,
          ),
          ChatPage(role)
        ],
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const carouselCards = <Widget>[
//       _CarouseCard(
//         assetColor: Color(0xFF344955),
//         assetDarkColor: Color(0xFF1D2327),
//         textColor: Colors.white,
//         studyRoute: '/',
//         title: '全栈程序员',
//         content:
//             '我希望你能扮演一个软件开发者的角色。我将提供一些关于网络应用需求的具体信息，而你的工作是提出一个架构和代码，用 Vue3 和 Flutter 开发安全的应用。',
//       ),
//       _CarouseCard(
//         assetColor: Color(0xff86699e),
//         assetDarkColor: Color(0xFF344955),
//         textColor: Colors.white,
//         studyRoute: '/',
//         title: '架构师 IT',
//         content:
//             '我希望你能扮演一个 IT 架构师的角色。我将提供一些关于应用程序或其他数字产品功能的细节，而你的工作是想出将其整合到 IT 环境中的方法。这可能涉及到分析业务需求，进行差距分析，并将新系统的功能映射到现有的 IT 环境中。接下来的步骤是创建一个解决方案设计，一个物理网络蓝图，定义系统集成的接口和部署环境的蓝图。',
//       ),
//       _CarouseCard(
//         assetColor: Color(0xFFdfd545),
//         assetDarkColor: Color(0xFF1D2327),
//         textColor: Colors.white,
//         studyRoute: '/',
//         title: 'AI 医生',
//         content:
//             '我想让你充当一名人工智能辅助的医生。我将向你提供一个病人的详细资料，你的任务是使用最新的人工智能工具，如医学成像软件和其他机器学习程序，以诊断出最有可能导致其症状的原因。你还应将传统方法，如体检、实验室测试等，纳入你的评估过程，以确保准确性。',
//       ),
//       _CarouseCard(
//         assetColor: Color(0xFF8c2f00),
//         assetDarkColor: Color(0xFF1D2327),
//         textColor: Colors.white,
//         studyRoute: '/',
//         title: '虚拟医生',
//         content:
//             '我想让你充当一个虚拟医生。我将描述我的症状，你将提供一个诊断和治疗计划。你应该只回复你的诊断和治疗计划，而不是其他。不要写解释。',
//       ),
//       _CarouseCard(
//         assetColor: Color(0xFFff6100),
//         assetDarkColor: Color(0xFF1D2327),
//         textColor: Colors.white,
//         studyRoute: '/',
//         title: '语言病理学家',
//         content:
//             '我希望您能作为语言病理学家（SLP），提出新的语言模式、沟通策略，并培养他们对不口吃的沟通能力的信心。您应该能够推荐技术、策略和其他治疗方法。在提供建议时，您还需要考虑患者的年龄、生活方式和关注点。',
//       ),
//       _CarouseCard(
//         assetColor: Color(0xFFcf92e0),
//         assetDarkColor: Color(0xFF1D2327),
//         textColor: Colors.white,
//         studyRoute: '/',
//         title: '生活自助百科',
//         content:
//             '我希望你能作为一本自助书。你将为我提供如何改善我生活中某些领域的建议和提示，如人际关系、职业发展或财务规划。例如，如果我在与重要的另一半的关系中挣扎，你可以建议有用的沟通技巧，使我们的关系更紧密。',
//       ),
//       _CarouseCard(
//         assetColor: Color(0xFF127f82),
//         assetDarkColor: Color(0xFF1D2327),
//         textColor: Colors.white,
//         studyRoute: '/',
//         title: '正则生成器',
//         content:
//             '我希望你充当一个正则表达式生成器。你的角色是生成匹配文本中特定模式的正则表达式。你应该提供正则表达式的格式，以便于复制和粘贴到支持正则表达式的文本编辑器或编程语言中。不要写关于正则表达式如何工作的解释或例子；只需提供正则表达式本身。我的第一个提示是生成一个匹配 [正则要求] 的正则表达式。',
//       ),
//       _CarouseCard(
//         assetColor: Color(0xFFffcfc3),
//         assetDarkColor: Color(0xFF1D2327),
//         textColor: Colors.white,
//         studyRoute: '/',
//         title: '英语翻译或修改',
//         content:
//             '我希望你能充当英语翻译、拼写纠正者和改进者。我将用任何语言与你交谈，你将检测语言，翻译它，并在我的文本的更正和改进版本中用英语回答。我希望你用更漂亮、更优雅、更高级的英语单词和句子来取代我的简化 A0 级单词和句子。保持意思不变，但让它们更有文学性。我希望你只回答更正，改进，而不是其他，不要写解释。',
//       ),
//     ];
//     return const Scaffold(
//       body: Column(
//         key: ValueKey('HomeListView'),
//         children: [
//           _DesktopCarousel(
//             height: 200.0,
//             children: carouselCards,
//           ),
//           ChatPage()
//         ],
//       ),
//     );
//   }
// }

class _CarouseCard extends StatelessWidget {
  const _CarouseCard({
    this.assetColor,
    this.assetDarkColor,
    this.textColor,
    required this.studyRoute,
    this.title,
    this.content,
    this.onTap,
  });

  // final ImageProvider? asset;
  // final ImageProvider? assetDark;
  final Color? assetColor;
  final Color? assetDarkColor;
  final Color? textColor;
  final String studyRoute;
  final String? title;
  final String? content;
  final ValueChanged<String?>? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;
    // final asset = isDark ? assetDark : this.asset;
    final assetColor = isDark ? assetDarkColor : this.assetColor;
    final textColor = isDark ? Colors.white.withOpacity(0.87) : this.textColor;
    // final isDesktop = true

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: _carouselItemDesktopMargin
          // ? _carouselItemDesktopMargin
          // : _carouselItemMobileMargin
          ),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: 150.0, // _carouselHeight(0.7, context),
      width: _carouselItemWidth,
      child: Material(
        // key: ValueKey(.describe),
        color: Colors.white,
        elevation: 4,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(
                      title!,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: assetColor,
                        fontSize: 16.0,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.visible,
                    ),
                  ]),
                  Text(
                    content!,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    onTap!(content);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DesktopCarousel extends StatefulWidget {
  const _DesktopCarousel({
    required this.height,
    required this.children,
    required this.setRoleCall,
  });

  final double height;
  final List<Widget> children;
  final Function setRoleCall;

  @override
  _DesktopCarouselState createState() => _DesktopCarouselState();
}

class _DesktopCarouselState extends State<_DesktopCarousel> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var showPreviousButton = false;
    var showNextButton = true;
    // Only check this after the _controller has been attached to the ListView.
    if (_controller.hasClients) {
      showPreviousButton = _controller.offset > 0;
      showNextButton =
          _controller.offset < _controller.position.maxScrollExtent;
    }

    final isDesktop = isDisplayDesktop(context);

    return Align(
      alignment: Alignment.center,
      child: Container(
        height: widget.height,
        constraints: const BoxConstraints(maxWidth: maxHomeItemWidth),
        child: Stack(
          children: [
            ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop
                    ? _horizontalDesktopPadding - _carouselItemDesktopMargin
                    : _horizontalPadding - _carouselItemMobileMargin,
              ),
              scrollDirection: Axis.horizontal,
              primary: false,
              // physics: const _SnappingScrollPhysics(),
              controller: _controller,
              itemExtent: _carouselItemWidth,
              itemCount: widget.children.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: widget.children[index],
              ),
            ),
            if (showPreviousButton)
              _DesktopPageButton(
                onTap: () {
                  _controller.animateTo(
                    _controller.offset - _carouselItemWidth,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            if (showNextButton)
              _DesktopPageButton(
                isEnd: true,
                onTap: () {
                  _controller.animateTo(
                    _controller.offset + _carouselItemWidth,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _DesktopPageButton extends StatelessWidget {
  const _DesktopPageButton({
    this.isEnd = false,
    this.onTap,
  });

  final bool isEnd;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const buttonSize = 58.0;
    const padding = _horizontalDesktopPadding - buttonSize / 2;
    return ExcludeSemantics(
      child: Align(
        alignment: isEnd
            ? AlignmentDirectional.centerEnd
            : AlignmentDirectional.centerStart,
        child: Container(
          width: buttonSize,
          height: buttonSize,
          margin: EdgeInsetsDirectional.only(
            start: isEnd ? 0 : padding,
            end: isEnd ? padding : 0,
          ),
          child: Tooltip(
            message: isEnd
                ? MaterialLocalizations.of(context).nextPageTooltip
                : MaterialLocalizations.of(context).previousPageTooltip,
            child: Material(
              color: Colors.black.withOpacity(0.5),
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onTap,
                child: Icon(
                  isEnd ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
