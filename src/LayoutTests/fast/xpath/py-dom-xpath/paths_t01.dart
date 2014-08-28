/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../xpath-test-pre.dart";

void main() {
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <para id="1" />
        <div id="2" />
        <para id="3" />
   </doc>''',
    'application/xml');
test(doc, doc.documentElement, 'child::para', [doc.getElementsByTagName("para")[0], doc.getElementsByTagName("para")[1]]);
test(doc, doc.documentElement, 'child::*', [doc.documentElement.firstChild, doc.documentElement.firstChild.nextElementSibling, doc.documentElement.lastChild]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>This is <i>some</i> text.</doc>''',
    'application/xml');
test(doc, doc.documentElement, 'child::text()', [doc.documentElement.firstChild, doc.documentElement.lastChild]);
test(doc, doc.documentElement, 'child::node()', [doc.documentElement.firstChild, doc.documentElement.firstChild.nextElementSibling, doc.documentElement.lastChild]);
}
{// getAttributeNode not defined
var doc = (new DomParser()).parseFromString(r'''
    <doc name="foo" value="bar" />''',
    'application/xml');
//test(doc, doc.documentElement, 'attribute::name', [doc.documentElement.getAttributeNode("name")]);
//test(doc, doc.documentElement, 'attribute::*', [doc.documentElement.getAttributeNode("name"), doc.documentElement.getAttributeNode("value")]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <para id="1">
            <div id="2" />
            <para id="3" />
        </para>
   </doc>''',
    'application/xml');
test(doc, doc.documentElement, 'descendant::para', [doc.getElementsByTagName("para")[0], doc.getElementsByTagName("para")[1]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <div id="1">
            <div id="2">
                <context />
            </div>
            <div id="3" />
        </div>
        <div id="4" />
   </doc>''',
    'application/xml');
test(doc, '//context', 'ancestor::div', [doc.getElementsByTagName("div")[0], doc.getElementsByTagName("div")[1]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <div id="1">
            <div id="2" />
            <div id="3" />
        </div>
        <div id="4" />
   </doc>''',
    'application/xml');
test(doc, '//div[@id="3"]', 'ancestor-or-self::div', [doc.getElementsByTagName("div")[0], doc.getElementsByTagName("div")[2]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <para id="0">
        <div id="1" />
        <para id="2">
            <para id="3" />
        </para>
   '</para>''',
    'application/xml');
test(doc, doc.documentElement, 'descendant-or-self::para', [doc.getElementsByTagName("para")[0], doc.getElementsByTagName("para")[1], doc.getElementsByTagName("para")[2]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <para />
   </doc>''',
    'application/xml');
test(doc, doc.documentElement, 'self::para', []);
test(doc, 'para''', 'self::para', [doc.documentElement.firstChild]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <chapter><para id="1" /><para id="2" /></chapter>
        <chapter><section><para id="3" /></section></chapter>
        <para id="4" />
   </doc>''',
    'application/xml');
test(doc, doc.documentElement, 'child::chapter/descendant::para', [doc.getElementsByTagName("para")[0], doc.getElementsByTagName("para")[1], doc.getElementsByTagName("para")[2]]);
}
{

var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <chapter><para id="1" /><para id="2" /></chapter>
        <section><para id="3" /><sub><para id="4" /></sub></section>
        <para id="4" />
   </doc>''',
    'application/xml');
test(doc, doc.documentElement, 'child::*/child::para', [doc.getElementsByTagName("para")[0], doc.getElementsByTagName("para")[1], doc.getElementsByTagName("para")[2]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc><a><b><context /></b></a></doc>''',
    'application/xml');
test(doc, '//context', '/', [doc]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <para id="1"><context /></para>
        <para id="2" />
   </doc>''',
    'application/xml');
test(doc, '//context', '/descendant::para', [doc.getElementsByTagName("para")[0], doc.getElementsByTagName("para")[1]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <item id="1">
            <context />
            <olist><item id="2" /></olist>
        </item>
        <olist><item id="3" /></olist>
   </doc>''',
    'application/xml');
test(doc, '//context', '/descendant::olist/child::item', [doc.getElementsByTagName("item")[1], doc.getElementsByTagName("item")[2]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <div id="1" />
        <para id="2" />
        <para id="3" />
   </doc>''',
    'application/xml');
test(doc, doc.documentElement, 'child::para[position()=1]', [doc.getElementsByTagName("para")[0]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <para id="1" />
        <para id="2" />
        <div id="3" />
   </doc>''',
    'application/xml');
test(doc, doc.documentElement, 'child::para[position()=last()]', [doc.getElementsByTagName("para")[1]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <para id="1" />
        <para id="2" />
        <para id="3" />
        <div id="4" />
   </doc>''',
    'application/xml');
test(doc, doc.documentElement, 'child::para[position()=last()-1]', [doc.getElementsByTagName("para")[1]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <div id="1" /><para id="2" />
        <div id="3" /><para id="4" />
        <div id="5" /><para id="6" />
   </doc>''',
    'application/xml');
test(doc, doc.documentElement, 'child::para[position()>1]', [doc.getElementsByTagName("para")[1], doc.getElementsByTagName("para")[2]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <chapter id="1" /><chapter id="2" />
        <context />
        <chapter id="3" /><chapter id="4" />
   </doc>''',
    'application/xml');
test(doc, '//context', 'following-sibling::chapter[position()=1]', [doc.getElementsByTagName("chapter")[2]]);
test(doc, '//context', 'preceding-sibling::chapter[position()=1]', [doc.getElementsByTagName("chapter")[1]]);
}
{
var xml = "<doc>";
for (int i = 1; i <= 10; ++i) {
    for (int j = 1; j <= 10; ++j)
        xml = '$xml<figure id="${(i*10)+j}%d">';
    for (int j = 1; j <= 10; ++j)
        xml = '$xml</figure>';
}
xml += "</doc>";
var doc = (new DomParser()).parseFromString(xml, 'application/xml');
test(doc, doc.documentElement, '/descendant::figure[position()=42]', [doc.getElementsByTagName("figure")[41]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <chapter id="1" /><chapter id="2" /><chapter id="3" />
        <chapter id="4">
          <section id="4.1" /><section id="4.2" /><section id="4.3" />
        </chapter>
        <chapter id="5">
          <section id="5.1" /><section id="5.2" /><section id="5.3" />
        </chapter>
   </doc>''',
    'application/xml');
test(doc, doc.documentElement, '/child::doc/child::chapter[position()=5]/child::section[position()=2]', [doc.getElementsByTagName("section")[4]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <para id="1" type="info" />
        <para id="2" type="warning" />
        <para id="3" type="warning" />
        <para id="4" type="warning" />
        <para id="5" type="error" />
        <para id="6" type="warning" />
        <para id="7" type="warning" />
   </doc>''',
    'application/xml');
test(doc, doc.documentElement, 'child::para[attribute::type="warning"][position()=5]', [doc.getElementsByTagName("para")[6]]);
test(doc, doc.documentElement, 'child::para[position()=5][attribute::type="warning"]', []);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <chapter id="1" />
        <chapter id="2"><title>Introduction</title></chapter>
        <chapter id="3"><title>Body</title></chapter>
        <chapter id="4">
            <title>Another</title>
            <title>Introduction</title>
        </chapter>
    </doc>''',
    'application/xml');
test(doc, doc.documentElement, "child::chapter[child::title='Introduction']", [doc.getElementsByTagName("chapter")[1], doc.getElementsByTagName("chapter")[3]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <chapter id="1" />
        <chapter id="2"><title /></chapter>
        <chapter id="3"><title /><title /></chapter>
    </doc>''',
    'application/xml');
test(doc, doc.documentElement, "child::chapter[child::title]", [doc.getElementsByTagName("chapter")[1], doc.getElementsByTagName("chapter")[2]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <chapter id="1" />
        <appendix id="2" />
        <para id="3" />
        <chapter id="4" />
    </doc>''',
    'application/xml');
test(doc, doc.documentElement, "child::*[self::chapter or self::appendix]", [doc.getElementsByTagName("chapter")[0], doc.getElementsByTagName("appendix")[0], doc.getElementsByTagName("chapter")[1]]);
}
{
var doc = (new DomParser()).parseFromString(r'''
    <doc>
        <chapter id="1" />
        <appendix id="2" />
        <para id="3" />
        <chapter id="4" />
        <para id="5" />
    </doc>''',
    'application/xml');
test(doc,
  doc.documentElement,
  "child::*[self::chapter or self::appendix][position()=last()]",
  [doc.getElementsByTagName("chapter")[1]]
);
}

    checkTestFailures();    
}