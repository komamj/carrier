class Count {
  final int toBeDeterminedCount; // 预约单(待确定)
  final int inTheSchedulingCount; // 预约单(调度中)
  final int preRefuse; // 预约单(已拒绝)
  final int preOver; // 预约单(调度完成)
  final int tranUnRece; // 运单(未接单)
  final int tranAccept; // 运单(已接单)
  final int tranToBePick; // 运单(待提货)
  final int tranportIng; // 运单(运输中)
  final int tranSign; // 运单(已签收)
  final int tranAgainSign; // 运单(重新签收)
  final int tranAbnormal; // 运单(运单异常)
  final int tranReject; // 运单(被拒绝)

  Count(
      {this.toBeDeterminedCount = 0,
      this.inTheSchedulingCount = 0,
      this.preRefuse = 0,
      this.preOver = 0,
      this.tranUnRece = 0,
      this.tranAccept = 0,
      this.tranToBePick = 0,
      this.tranportIng = 0,
      this.tranSign = 0,
      this.tranAgainSign = 0,
      this.tranAbnormal = 0,
      this.tranReject = 0});

  factory Count.fromJson(Map<String, dynamic> json) {
    return Count(
      toBeDeterminedCount: json['preToBeDetermined'],
      inTheSchedulingCount: json['preDispatchIng'],
      preRefuse: json['preRefuse'],
      preOver: json['preOver'],
      tranUnRece: json['tranUnRece'],
      tranAccept: json['tranAccept'],
      tranToBePick: json['tranToBePick'],
      tranportIng: json['tranportIng'],
      tranSign: json['tranSign'],
      tranAgainSign: json['tranAgainSign'],
      tranAbnormal: json['tranAbnormal'],
      tranReject: json['tranReject'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'preToBeDetermined': toBeDeterminedCount,
        'preDispatchIng': inTheSchedulingCount,
        'preRefuse': preRefuse,
        'preOver': preOver,
        'tranUnRece': tranUnRece,
        'tranAccept': tranAccept,
        'tranToBePick': tranToBePick,
        'tranportIng': tranportIng,
        'tranSign': tranSign,
        'tranAgainSign': tranAgainSign,
        'tranAbnormal': tranAbnormal,
        'tranReject': tranReject
      };
}
