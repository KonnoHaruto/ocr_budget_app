// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spending_analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpendingInsight _$SpendingInsightFromJson(Map<String, dynamic> json) {
  return _SpendingInsight.fromJson(json);
}

/// @nodoc
mixin _$SpendingInsight {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpendingInsightCopyWith<SpendingInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingInsightCopyWith<$Res> {
  factory $SpendingInsightCopyWith(
          SpendingInsight value, $Res Function(SpendingInsight) then) =
      _$SpendingInsightCopyWithImpl<$Res, SpendingInsight>;
  @useResult
  $Res call({String title, String description, double confidence});
}

/// @nodoc
class _$SpendingInsightCopyWithImpl<$Res, $Val extends SpendingInsight>
    implements $SpendingInsightCopyWith<$Res> {
  _$SpendingInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? confidence = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpendingInsightImplCopyWith<$Res>
    implements $SpendingInsightCopyWith<$Res> {
  factory _$$SpendingInsightImplCopyWith(_$SpendingInsightImpl value,
          $Res Function(_$SpendingInsightImpl) then) =
      __$$SpendingInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, double confidence});
}

/// @nodoc
class __$$SpendingInsightImplCopyWithImpl<$Res>
    extends _$SpendingInsightCopyWithImpl<$Res, _$SpendingInsightImpl>
    implements _$$SpendingInsightImplCopyWith<$Res> {
  __$$SpendingInsightImplCopyWithImpl(
      _$SpendingInsightImpl _value, $Res Function(_$SpendingInsightImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? confidence = null,
  }) {
    return _then(_$SpendingInsightImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendingInsightImpl implements _SpendingInsight {
  const _$SpendingInsightImpl(
      {required this.title,
      required this.description,
      required this.confidence});

  factory _$SpendingInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendingInsightImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final double confidence;

  @override
  String toString() {
    return 'SpendingInsight(title: $title, description: $description, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingInsightImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, confidence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingInsightImplCopyWith<_$SpendingInsightImpl> get copyWith =>
      __$$SpendingInsightImplCopyWithImpl<_$SpendingInsightImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingInsightImplToJson(
      this,
    );
  }
}

abstract class _SpendingInsight implements SpendingInsight {
  const factory _SpendingInsight(
      {required final String title,
      required final String description,
      required final double confidence}) = _$SpendingInsightImpl;

  factory _SpendingInsight.fromJson(Map<String, dynamic> json) =
      _$SpendingInsightImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  double get confidence;
  @override
  @JsonKey(ignore: true)
  _$$SpendingInsightImplCopyWith<_$SpendingInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpendingRecommendation _$SpendingRecommendationFromJson(
    Map<String, dynamic> json) {
  return _SpendingRecommendation.fromJson(json);
}

/// @nodoc
mixin _$SpendingRecommendation {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get potentialSavings => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpendingRecommendationCopyWith<SpendingRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingRecommendationCopyWith<$Res> {
  factory $SpendingRecommendationCopyWith(SpendingRecommendation value,
          $Res Function(SpendingRecommendation) then) =
      _$SpendingRecommendationCopyWithImpl<$Res, SpendingRecommendation>;
  @useResult
  $Res call(
      {String title,
      String description,
      double potentialSavings,
      int priority});
}

/// @nodoc
class _$SpendingRecommendationCopyWithImpl<$Res,
        $Val extends SpendingRecommendation>
    implements $SpendingRecommendationCopyWith<$Res> {
  _$SpendingRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? potentialSavings = null,
    Object? priority = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      potentialSavings: null == potentialSavings
          ? _value.potentialSavings
          : potentialSavings // ignore: cast_nullable_to_non_nullable
              as double,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpendingRecommendationImplCopyWith<$Res>
    implements $SpendingRecommendationCopyWith<$Res> {
  factory _$$SpendingRecommendationImplCopyWith(
          _$SpendingRecommendationImpl value,
          $Res Function(_$SpendingRecommendationImpl) then) =
      __$$SpendingRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      double potentialSavings,
      int priority});
}

/// @nodoc
class __$$SpendingRecommendationImplCopyWithImpl<$Res>
    extends _$SpendingRecommendationCopyWithImpl<$Res,
        _$SpendingRecommendationImpl>
    implements _$$SpendingRecommendationImplCopyWith<$Res> {
  __$$SpendingRecommendationImplCopyWithImpl(
      _$SpendingRecommendationImpl _value,
      $Res Function(_$SpendingRecommendationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? potentialSavings = null,
    Object? priority = null,
  }) {
    return _then(_$SpendingRecommendationImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      potentialSavings: null == potentialSavings
          ? _value.potentialSavings
          : potentialSavings // ignore: cast_nullable_to_non_nullable
              as double,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendingRecommendationImpl implements _SpendingRecommendation {
  const _$SpendingRecommendationImpl(
      {required this.title,
      required this.description,
      required this.potentialSavings,
      required this.priority});

  factory _$SpendingRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendingRecommendationImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final double potentialSavings;
  @override
  final int priority;

  @override
  String toString() {
    return 'SpendingRecommendation(title: $title, description: $description, potentialSavings: $potentialSavings, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingRecommendationImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.potentialSavings, potentialSavings) ||
                other.potentialSavings == potentialSavings) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, potentialSavings, priority);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingRecommendationImplCopyWith<_$SpendingRecommendationImpl>
      get copyWith => __$$SpendingRecommendationImplCopyWithImpl<
          _$SpendingRecommendationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingRecommendationImplToJson(
      this,
    );
  }
}

abstract class _SpendingRecommendation implements SpendingRecommendation {
  const factory _SpendingRecommendation(
      {required final String title,
      required final String description,
      required final double potentialSavings,
      required final int priority}) = _$SpendingRecommendationImpl;

  factory _SpendingRecommendation.fromJson(Map<String, dynamic> json) =
      _$SpendingRecommendationImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  double get potentialSavings;
  @override
  int get priority;
  @override
  @JsonKey(ignore: true)
  _$$SpendingRecommendationImplCopyWith<_$SpendingRecommendationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SpendingAnalysis _$SpendingAnalysisFromJson(Map<String, dynamic> json) {
  return _SpendingAnalysis.fromJson(json);
}

/// @nodoc
mixin _$SpendingAnalysis {
  String get id => throw _privateConstructorUsedError;
  AnalysisType get type => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  List<SpendingInsight> get insights => throw _privateConstructorUsedError;
  List<SpendingRecommendation> get recommendations =>
      throw _privateConstructorUsedError;
  Map<String, double> get categoryBreakdown =>
      throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpendingAnalysisCopyWith<SpendingAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingAnalysisCopyWith<$Res> {
  factory $SpendingAnalysisCopyWith(
          SpendingAnalysis value, $Res Function(SpendingAnalysis) then) =
      _$SpendingAnalysisCopyWithImpl<$Res, SpendingAnalysis>;
  @useResult
  $Res call(
      {String id,
      AnalysisType type,
      DateTime startDate,
      DateTime endDate,
      List<SpendingInsight> insights,
      List<SpendingRecommendation> recommendations,
      Map<String, double> categoryBreakdown,
      double totalAmount,
      DateTime createdAt});
}

/// @nodoc
class _$SpendingAnalysisCopyWithImpl<$Res, $Val extends SpendingAnalysis>
    implements $SpendingAnalysisCopyWith<$Res> {
  _$SpendingAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? insights = null,
    Object? recommendations = null,
    Object? categoryBreakdown = null,
    Object? totalAmount = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AnalysisType,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<SpendingInsight>,
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<SpendingRecommendation>,
      categoryBreakdown: null == categoryBreakdown
          ? _value.categoryBreakdown
          : categoryBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpendingAnalysisImplCopyWith<$Res>
    implements $SpendingAnalysisCopyWith<$Res> {
  factory _$$SpendingAnalysisImplCopyWith(_$SpendingAnalysisImpl value,
          $Res Function(_$SpendingAnalysisImpl) then) =
      __$$SpendingAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      AnalysisType type,
      DateTime startDate,
      DateTime endDate,
      List<SpendingInsight> insights,
      List<SpendingRecommendation> recommendations,
      Map<String, double> categoryBreakdown,
      double totalAmount,
      DateTime createdAt});
}

/// @nodoc
class __$$SpendingAnalysisImplCopyWithImpl<$Res>
    extends _$SpendingAnalysisCopyWithImpl<$Res, _$SpendingAnalysisImpl>
    implements _$$SpendingAnalysisImplCopyWith<$Res> {
  __$$SpendingAnalysisImplCopyWithImpl(_$SpendingAnalysisImpl _value,
      $Res Function(_$SpendingAnalysisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? insights = null,
    Object? recommendations = null,
    Object? categoryBreakdown = null,
    Object? totalAmount = null,
    Object? createdAt = null,
  }) {
    return _then(_$SpendingAnalysisImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AnalysisType,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      insights: null == insights
          ? _value._insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<SpendingInsight>,
      recommendations: null == recommendations
          ? _value._recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<SpendingRecommendation>,
      categoryBreakdown: null == categoryBreakdown
          ? _value._categoryBreakdown
          : categoryBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendingAnalysisImpl implements _SpendingAnalysis {
  const _$SpendingAnalysisImpl(
      {required this.id,
      required this.type,
      required this.startDate,
      required this.endDate,
      required final List<SpendingInsight> insights,
      required final List<SpendingRecommendation> recommendations,
      required final Map<String, double> categoryBreakdown,
      required this.totalAmount,
      required this.createdAt})
      : _insights = insights,
        _recommendations = recommendations,
        _categoryBreakdown = categoryBreakdown;

  factory _$SpendingAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendingAnalysisImplFromJson(json);

  @override
  final String id;
  @override
  final AnalysisType type;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  final List<SpendingInsight> _insights;
  @override
  List<SpendingInsight> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

  final List<SpendingRecommendation> _recommendations;
  @override
  List<SpendingRecommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  final Map<String, double> _categoryBreakdown;
  @override
  Map<String, double> get categoryBreakdown {
    if (_categoryBreakdown is EqualUnmodifiableMapView)
      return _categoryBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryBreakdown);
  }

  @override
  final double totalAmount;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'SpendingAnalysis(id: $id, type: $type, startDate: $startDate, endDate: $endDate, insights: $insights, recommendations: $recommendations, categoryBreakdown: $categoryBreakdown, totalAmount: $totalAmount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingAnalysisImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality().equals(other._insights, _insights) &&
            const DeepCollectionEquality()
                .equals(other._recommendations, _recommendations) &&
            const DeepCollectionEquality()
                .equals(other._categoryBreakdown, _categoryBreakdown) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_insights),
      const DeepCollectionEquality().hash(_recommendations),
      const DeepCollectionEquality().hash(_categoryBreakdown),
      totalAmount,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingAnalysisImplCopyWith<_$SpendingAnalysisImpl> get copyWith =>
      __$$SpendingAnalysisImplCopyWithImpl<_$SpendingAnalysisImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingAnalysisImplToJson(
      this,
    );
  }
}

abstract class _SpendingAnalysis implements SpendingAnalysis {
  const factory _SpendingAnalysis(
      {required final String id,
      required final AnalysisType type,
      required final DateTime startDate,
      required final DateTime endDate,
      required final List<SpendingInsight> insights,
      required final List<SpendingRecommendation> recommendations,
      required final Map<String, double> categoryBreakdown,
      required final double totalAmount,
      required final DateTime createdAt}) = _$SpendingAnalysisImpl;

  factory _SpendingAnalysis.fromJson(Map<String, dynamic> json) =
      _$SpendingAnalysisImpl.fromJson;

  @override
  String get id;
  @override
  AnalysisType get type;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  List<SpendingInsight> get insights;
  @override
  List<SpendingRecommendation> get recommendations;
  @override
  Map<String, double> get categoryBreakdown;
  @override
  double get totalAmount;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$SpendingAnalysisImplCopyWith<_$SpendingAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
