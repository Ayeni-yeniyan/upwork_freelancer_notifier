// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetJobCollection on Isar {
  IsarCollection<Job> get jobs => this.collection();
}

const JobSchema = CollectionSchema(
  name: r'Job',
  id: -5961302972855324388,
  properties: {
    r'budget': PropertySchema(
      id: 0,
      name: r'budget',
      type: IsarType.string,
    ),
    r'clientStat': PropertySchema(
      id: 1,
      name: r'clientStat',
      type: IsarType.string,
    ),
    r'clientTotalExpenditure': PropertySchema(
      id: 2,
      name: r'clientTotalExpenditure',
      type: IsarType.string,
    ),
    r'contractorTier': PropertySchema(
      id: 3,
      name: r'contractorTier',
      type: IsarType.string,
    ),
    r'country': PropertySchema(
      id: 4,
      name: r'country',
      type: IsarType.string,
    ),
    r'dateTime': PropertySchema(
      id: 5,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 6,
      name: r'description',
      type: IsarType.string,
    ),
    r'isViewed': PropertySchema(
      id: 7,
      name: r'isViewed',
      type: IsarType.bool,
    ),
    r'jobLink': PropertySchema(
      id: 8,
      name: r'jobLink',
      type: IsarType.string,
    ),
    r'jobType': PropertySchema(
      id: 9,
      name: r'jobType',
      type: IsarType.string,
    ),
    r'notifId': PropertySchema(
      id: 10,
      name: r'notifId',
      type: IsarType.long,
    ),
    r'paymentStat': PropertySchema(
      id: 11,
      name: r'paymentStat',
      type: IsarType.string,
    ),
    r'proposals': PropertySchema(
      id: 12,
      name: r'proposals',
      type: IsarType.string,
    ),
    r'ratingStat': PropertySchema(
      id: 13,
      name: r'ratingStat',
      type: IsarType.double,
    ),
    r'skills': PropertySchema(
      id: 14,
      name: r'skills',
      type: IsarType.stringList,
    ),
    r'time': PropertySchema(
      id: 15,
      name: r'time',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 16,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _jobEstimateSize,
  serialize: _jobSerialize,
  deserialize: _jobDeserialize,
  deserializeProp: _jobDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _jobGetId,
  getLinks: _jobGetLinks,
  attach: _jobAttach,
  version: '3.1.0',
);

int _jobEstimateSize(
  Job object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.budget.length * 3;
  bytesCount += 3 + object.clientStat.length * 3;
  bytesCount += 3 + object.clientTotalExpenditure.length * 3;
  bytesCount += 3 + object.contractorTier.length * 3;
  bytesCount += 3 + object.country.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.jobLink.length * 3;
  bytesCount += 3 + object.jobType.length * 3;
  bytesCount += 3 + object.paymentStat.length * 3;
  bytesCount += 3 + object.proposals.length * 3;
  {
    final list = object.skills;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.time.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _jobSerialize(
  Job object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.budget);
  writer.writeString(offsets[1], object.clientStat);
  writer.writeString(offsets[2], object.clientTotalExpenditure);
  writer.writeString(offsets[3], object.contractorTier);
  writer.writeString(offsets[4], object.country);
  writer.writeDateTime(offsets[5], object.dateTime);
  writer.writeString(offsets[6], object.description);
  writer.writeBool(offsets[7], object.isViewed);
  writer.writeString(offsets[8], object.jobLink);
  writer.writeString(offsets[9], object.jobType);
  writer.writeLong(offsets[10], object.notifId);
  writer.writeString(offsets[11], object.paymentStat);
  writer.writeString(offsets[12], object.proposals);
  writer.writeDouble(offsets[13], object.ratingStat);
  writer.writeStringList(offsets[14], object.skills);
  writer.writeString(offsets[15], object.time);
  writer.writeString(offsets[16], object.title);
}

Job _jobDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Job(
    budget: reader.readString(offsets[0]),
    clientStat: reader.readString(offsets[1]),
    clientTotalExpenditure: reader.readString(offsets[2]),
    contractorTier: reader.readString(offsets[3]),
    country: reader.readString(offsets[4]),
    dateTime: reader.readDateTimeOrNull(offsets[5]),
    description: reader.readString(offsets[6]),
    isViewed: reader.readBoolOrNull(offsets[7]) ?? false,
    jobLink: reader.readString(offsets[8]),
    jobType: reader.readString(offsets[9]),
    notifId: reader.readLong(offsets[10]),
    paymentStat: reader.readString(offsets[11]),
    proposals: reader.readString(offsets[12]),
    ratingStat: reader.readDouble(offsets[13]),
    skills: reader.readStringList(offsets[14]),
    time: reader.readString(offsets[15]),
    title: reader.readString(offsets[16]),
  );
  object.id = id;
  return object;
}

P _jobDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readStringList(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _jobGetId(Job object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _jobGetLinks(Job object) {
  return [];
}

void _jobAttach(IsarCollection<dynamic> col, Id id, Job object) {
  object.id = id;
}

extension JobQueryWhereSort on QueryBuilder<Job, Job, QWhere> {
  QueryBuilder<Job, Job, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension JobQueryWhere on QueryBuilder<Job, Job, QWhereClause> {
  QueryBuilder<Job, Job, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Job, Job, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension JobQueryFilter on QueryBuilder<Job, Job, QFilterCondition> {
  QueryBuilder<Job, Job, QAfterFilterCondition> budgetEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'budget',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> budgetGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'budget',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> budgetLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'budget',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> budgetBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'budget',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> budgetStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'budget',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> budgetEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'budget',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> budgetContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'budget',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> budgetMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'budget',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> budgetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'budget',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> budgetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'budget',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientStatEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientStat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientStatGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientStat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientStatLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientStat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientStatBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientStat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientStatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clientStat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientStatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clientStat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientStatContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientStat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientStatMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientStat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientStatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientStat',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientStatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientStat',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientTotalExpenditureEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientTotalExpenditure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition>
      clientTotalExpenditureGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientTotalExpenditure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientTotalExpenditureLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientTotalExpenditure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientTotalExpenditureBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientTotalExpenditure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition>
      clientTotalExpenditureStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clientTotalExpenditure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientTotalExpenditureEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clientTotalExpenditure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientTotalExpenditureContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientTotalExpenditure',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> clientTotalExpenditureMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientTotalExpenditure',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition>
      clientTotalExpenditureIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientTotalExpenditure',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition>
      clientTotalExpenditureIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientTotalExpenditure',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> contractorTierEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractorTier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> contractorTierGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contractorTier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> contractorTierLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contractorTier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> contractorTierBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contractorTier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> contractorTierStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contractorTier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> contractorTierEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contractorTier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> contractorTierContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contractorTier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> contractorTierMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contractorTier',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> contractorTierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractorTier',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> contractorTierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contractorTier',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> countryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> countryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> countryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> countryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'country',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> countryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> countryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> countryContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> countryMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'country',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> countryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> countryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> dateTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dateTime',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> dateTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dateTime',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> dateTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> dateTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> dateTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> dateTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> isViewedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isViewed',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobLinkEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobLinkGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobLinkLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobLinkBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobLink',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobLinkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobLinkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobLinkContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobLinkMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobLink',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobLink',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobLink',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jobType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobTypeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'jobType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobTypeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'jobType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jobType',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> jobTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'jobType',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> notifIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notifId',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> notifIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notifId',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> notifIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notifId',
        value: value,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> notifIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notifId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> paymentStatEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentStat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> paymentStatGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paymentStat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> paymentStatLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paymentStat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> paymentStatBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paymentStat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> paymentStatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paymentStat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> paymentStatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paymentStat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> paymentStatContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paymentStat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> paymentStatMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paymentStat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> paymentStatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paymentStat',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> paymentStatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paymentStat',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> proposalsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proposals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> proposalsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'proposals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> proposalsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'proposals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> proposalsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'proposals',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> proposalsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'proposals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> proposalsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'proposals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> proposalsContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'proposals',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> proposalsMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'proposals',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> proposalsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'proposals',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> proposalsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'proposals',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> ratingStatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ratingStat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> ratingStatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ratingStat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> ratingStatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ratingStat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> ratingStatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ratingStat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'skills',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'skills',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skills',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'skills',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'skills',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'skills',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'skills',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'skills',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'skills',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'skills',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'skills',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'skills',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'skills',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'skills',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'skills',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'skills',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'skills',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> skillsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'skills',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> timeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> timeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> timeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> timeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> timeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> timeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> timeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'time',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> timeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'time',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> timeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> timeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'time',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Job, Job, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension JobQueryObject on QueryBuilder<Job, Job, QFilterCondition> {}

extension JobQueryLinks on QueryBuilder<Job, Job, QFilterCondition> {}

extension JobQuerySortBy on QueryBuilder<Job, Job, QSortBy> {
  QueryBuilder<Job, Job, QAfterSortBy> sortByBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budget', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByBudgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budget', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByClientStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientStat', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByClientStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientStat', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByClientTotalExpenditure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientTotalExpenditure', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByClientTotalExpenditureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientTotalExpenditure', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByContractorTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorTier', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByContractorTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorTier', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByIsViewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isViewed', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByIsViewedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isViewed', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByJobLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobLink', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByJobLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobLink', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByJobType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobType', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByJobTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobType', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByNotifId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifId', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByNotifIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifId', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByPaymentStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStat', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByPaymentStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStat', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByProposals() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proposals', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByProposalsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proposals', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByRatingStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ratingStat', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByRatingStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ratingStat', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension JobQuerySortThenBy on QueryBuilder<Job, Job, QSortThenBy> {
  QueryBuilder<Job, Job, QAfterSortBy> thenByBudget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budget', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByBudgetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'budget', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByClientStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientStat', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByClientStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientStat', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByClientTotalExpenditure() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientTotalExpenditure', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByClientTotalExpenditureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientTotalExpenditure', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByContractorTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorTier', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByContractorTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractorTier', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByIsViewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isViewed', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByIsViewedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isViewed', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByJobLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobLink', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByJobLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobLink', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByJobType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobType', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByJobTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jobType', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByNotifId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifId', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByNotifIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notifId', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByPaymentStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStat', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByPaymentStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentStat', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByProposals() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proposals', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByProposalsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'proposals', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByRatingStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ratingStat', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByRatingStatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ratingStat', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Job, Job, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension JobQueryWhereDistinct on QueryBuilder<Job, Job, QDistinct> {
  QueryBuilder<Job, Job, QDistinct> distinctByBudget(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'budget', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByClientStat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientStat', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByClientTotalExpenditure(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientTotalExpenditure',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByContractorTier(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractorTier',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'country', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByIsViewed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isViewed');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByJobLink(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobLink', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByJobType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jobType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByNotifId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notifId');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByPaymentStat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paymentStat', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByProposals(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'proposals', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByRatingStat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ratingStat');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctBySkills() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skills');
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Job, Job, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension JobQueryProperty on QueryBuilder<Job, Job, QQueryProperty> {
  QueryBuilder<Job, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> budgetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'budget');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> clientStatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientStat');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> clientTotalExpenditureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientTotalExpenditure');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> contractorTierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractorTier');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'country');
    });
  }

  QueryBuilder<Job, DateTime?, QQueryOperations> dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Job, bool, QQueryOperations> isViewedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isViewed');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> jobLinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobLink');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> jobTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jobType');
    });
  }

  QueryBuilder<Job, int, QQueryOperations> notifIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notifId');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> paymentStatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentStat');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> proposalsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'proposals');
    });
  }

  QueryBuilder<Job, double, QQueryOperations> ratingStatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ratingStat');
    });
  }

  QueryBuilder<Job, List<String>?, QQueryOperations> skillsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skills');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<Job, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
