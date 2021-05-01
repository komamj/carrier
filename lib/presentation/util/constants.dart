class Constants {
  static const String stBaseUrl = ""; // 测试环境 base url
  static const String prodBaseUrl = ""; // 生产环境 base url

  static const KEY_USER = "key_user";

  static const String splashPage = "/splash"; // 启动页
  static const String loginPage = "/login"; // 登录页
  static const String homePage = "/home"; // 主界面
  static const String toBeDeterminedDetailPage =
      "/scheduling/reservations"; // 预约单详情页
  static const String waybillDetailPage = "/scheduling/waybill"; // 调度在途运单页
  static const String carSchedulingPage = "/scheduling/car"; // 选择车辆页
  static const String driverSchedulingPage = "/scheduling/driver"; // 选择司机页
  static const String usersPage = "/mine/users"; // 修改用户信息
  static const String editUserPhonePage =
      "/mine/users/edit_user_phone"; // 修改用户信息->更换手机号
  static const String editUserNewPhonePage =
      "/mine/users/edit_user_new_phone"; // 修改用户信息->更换手机号-->输入新手机号
  static const String settingsPage = "/mine/settings"; // 设置页
  static const String changePasswordPage =
      "/mine/settings/change_password"; // 设置页->修改密码
  static const String aboutUsPage = "/mine/settings/about_us"; // 设置页->关于我们
  static const String feedbackPage = "/mine/feedback"; // 反馈页

  static const String resourcePage =
      "/mine/resource/resource_management"; // 资源管理页
  static const String carAddPage =
      "/mine/resource/resource_management/car_add_page"; // 资源管理页->添加车辆
  static const String carAddBindPage =
      "/mine/resource/resource_management/car_add_bind_page"; // 资源管理页->关联车辆
  static const String carDelPage =
      "/mine/resource/resource_management/car_del_page"; // 资源管理页-->编辑车辆
  static const String carEditPage =
      "/mine/resource/resource_management/car_edit_page"; // 资源管理页-->车辆完善信息

  static const String driverAddPage =
      "/mine/resource/resource_management/driver_add_page"; // 资源管理页->添加司机
  static const String driverAddSearchPage =
      "/mine/resource/resource_management/driver_add_search_page"; // 资源管理页->搜索司机
  static const String driverDelPage =
      "/mine/resource/resource_management/driver_del_page"; // 资源管理页->编辑司机
  static const String driverEditPage =
      "/mine/resource/resource_management/driver_edit_page"; // 资源管理页->司机完善信息
  static const String driverInfoPage =
      "/mine/resource/resource_management/driver_info_page"; // 资源管理页->司机详情
  static const String driverInfoBankCardPage =
      "/mine/resource/resource_management/driver_info_bank_card_page"; // 资源管理页->司机详情->银行卡
  static const String driverInfoBankAddCardPage =
      "/mine/resource/resource_management/driver_info_bank_card_add_page"; // 资源管理页->司机详情->银行卡->添加银行卡
  static const String driverInfoBankCardAgreementPage =
      "/mine/resource/resource_management/driver_info_bank_card_agreement_page"; // 资源管理页->司机详情->银行卡->添加银行卡-->服务协议
  static const String driverInfoBankCardInfoPage =
      "/mine/resource/resource_management/driver_info_bank_card_info_page"; // 资源管理页->司机详情->银行卡->银行卡详情

  static const String agreementPage = "/mine/agreement"; // 平台协议页
}
