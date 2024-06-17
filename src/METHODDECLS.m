#include "Producer.h"
= METHODDECLS:Object CATEGORIES() {}
- (BOOL)isEmpty {;}
- (BOOL)isEqual:aStr {;}
- (BOOL)isEqualSTR:(STR)aStr {;}
- (BOOL)isUnary {;}
- (STR)str {;}
- (unsigned)hash {;}
- (unsigned)size {;}
- add:aLink {;}
- argument {;}
- argument:anArgument {;}
- argumentType {;}
- array:anArray {;}
- asByteArray {;}
- assign:aList {;}
- assign:anAssignmentList value:aValue {;}
- at:(unsigned)anInt {;}
- cascade:anExpr {;}
- category:aString {;}
- classVariableNames:aString {;}
- comment:aString {;}
- elementsPerform:(SEL)aSelector with:arg1 with:arg2 {;}
- elementsPerform:(SEL)aSelector with:arg1 {;}
- elementsPerform:(SEL)aSelector {;}
- eachElementPerform:(SEL)aSelector with:arg1 with:arg2 {;}
- eachElementPerform:(SEL)aSelector with:arg1 {;}
- eachElementPerform:(SEL)aSelector {;}
- expr {;}
- expr:anExpr {;}
- free {;}
- freeContents {;}
- gen {;}
- genDeclaration {;}
- genExpr {;}
- genPrivate {;}
- genReceiver:aReceiver selector:aSelector {;}
- initialize {;}
- insert:aLink {;}
- install:aTemplate translation:aTranslation {;}
- instanceVariableNames:aString {;}
- lastElement {;}
- name:aByteArray {;}
- name:aFunctionName args:anArgumentList {;}
- name:aString argument:anArgument {;}
- poolDictionaries:aString {;}
- predecessorOf:aLink {;}
- primitive:aToken {;}
- receiver {;}
- receiver:anObject selector:aSelector {;}
- receiver:anObject {;}
- receiverType {;}
- receiverType:aType selector:aSelector {;}
- remove:aLink {;}
- selector {;}
- selector:aSelector asFactory:(BOOL)isFactoryMethod {;}
- selector:aSelector {;}
- sourceName:sourceIdentifier targetType:aType targetName:anIdentifier {;}
- statements:aStatementList {;}
- str:(STR)aString {;}
- successor {;}
- successor:aLink {;}
- superclass:aClass {;}
- template:aTemplate translation:aTranslation {;}
- translation {;}
- translation:aTranslation {;}
- translationFor:aMsg {;}
- type {;}
- type:aType name:aName {;}
- type:aType rule:(STR)aString {;}
- type:aType translation:aByteArray {;}
- type:aType {;}
- uniqueIdentifier:(STR)aString {;}
- value {;}
- value:aValue {;}
- variables:aVarList {;}
