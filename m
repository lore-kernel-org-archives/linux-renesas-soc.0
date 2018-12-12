Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2CBC67839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 18:03:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E077620839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 18:03:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="hsZV7iy0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E077620839
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbeLLSDg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 13:03:36 -0500
Received: from mail-eopbgr1410112.outbound.protection.outlook.com ([40.107.141.112]:64632
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727748AbeLLSDg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 13:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QcbBBQXNqZUvzxsvbDtczONOpHsgoqRgz4RtPBS7yo=;
 b=hsZV7iy0DVCW1BXM/gkzxw9lnFd2knI85gHnMKbX5CTOB7FV3BbCO2mdasWGDwcxlqiWe8sutLnHlnG04ZoZHOEVE9zuIcKgdZoFL+gaptrF+QNm0a+cEv2xVZQikgsm0g0W5X9eHp9veBgTGWf4STfySqvx9G9+JC8BY0+SHvE=
Received: from TY2SPR01MB0015.jpnprd01.prod.outlook.com (20.177.150.9) by
 TY1PR01MB1785.jpnprd01.prod.outlook.com (52.133.163.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Wed, 12 Dec 2018 18:03:29 +0000
Received: from TY2SPR01MB0015.jpnprd01.prod.outlook.com
 ([fe80::493f:286a:e3bf:5ecf]) by TY2SPR01MB0015.jpnprd01.prod.outlook.com
 ([fe80::493f:286a:e3bf:5ecf%6]) with mapi id 15.20.1425.016; Wed, 12 Dec 2018
 18:03:29 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Rob Herring <robh@kernel.org>, Kumar Gala <kumar.gala@linaro.org>
CC:     Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M
 EVB
Thread-Topic: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M
 EVB
Thread-Index: AQHUh+RU1KuMS3Q/EEimI0alfQTw/KV6cWmAgAC/l5CAADpbAIAAAJpg
Date:   Wed, 12 Dec 2018 18:03:29 +0000
Message-ID: <TY2SPR01MB0015C0AC923F1CDEC44061D88AA70@TY2SPR01MB0015.jpnprd01.prod.outlook.com>
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com>
 <20181212021549.GA26333@bogus>
 <TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1785;20:wvnWvbfTNK/aRAmLlEO2wetmL0llpOmmkL5uff6TUaapjYwoHrFpW+sS88rEKko9Fw04kxabjA5hmD0iQG2zbB3c7bzlJxHQ79bcKsivguVeT31vRlE1xmWzUVP5GvXpSW0x9iFxZ3N5gFgriCULRzq6Y8bPHhShuUfGz4y4LGA=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: bbe085bd-a1a9-41f1-dc5a-08d6605c1f1f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1785;
x-ms-traffictypediagnostic: TY1PR01MB1785:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-microsoft-antispam-prvs: <TY1PR01MB17854EE6748B38033489ED268AA70@TY1PR01MB1785.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230017)(999002)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231472)(944501520)(52105112)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:TY1PR01MB1785;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB1785;
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(136003)(346002)(366004)(396003)(376002)(189003)(69234005)(199004)(86362001)(106356001)(6506007)(105586002)(3846002)(26005)(186003)(11346002)(81156014)(25786009)(6116002)(81166006)(486006)(476003)(8676002)(102836004)(446003)(74316002)(305945005)(55016002)(9686003)(68736007)(5660300001)(2906002)(33656002)(99286004)(76176011)(256004)(14444005)(7696005)(53936002)(4326008)(7736002)(6246003)(110136005)(71190400001)(14454004)(97736004)(54906003)(71200400001)(8936002)(478600001)(72206003)(316002)(93886005)(6436002)(66066001)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1785;H:TY2SPR01MB0015.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: P1+fNQdQ3z3e9AMB5JuEekMKsw9nIvn67oDkgf72kKx0Sz0mxhnUa1JZYqKKntc+h6lTnBXtI3VcTwok71K68QBFAmYfJKQ1rN+XU5BYeuLkNonc+kr1kyNzQ3afGuVJdQevxU+4sM7pNClRwex0FU0IIAH0dOHxh9QL8jP+j14IvMGFFIER5t8NAjfs0Gyt0x/ecWQ8iSt3szlM/pUvRVq1t9llNlOUAB/Z+AwAAHFIOgTYK4yiTH+xabbMCSurPPuMNqKyMRIq1xfhROyMXeO4JI6JJs2R33B29WB2Un7t6xk+vZc5vn3EMC/pa16X
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe085bd-a1a9-41f1-dc5a-08d6605c1f1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 18:03:29.2871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1785
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gV2VkbmVzZGF5LCBEZWNlbWJlciAxMiwgMjAxOCAxLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
PiBOb3QgcmVhbGx5Lg0KPiA+IFRoZSAiUVNQSSIgYWN0dWFsbHkgd29ya3MgYXMgYSBtZW1vcnkg
bWFwcGVkIFNQSSAoYXMgaW4sIHRoZSBDUFUgc2Vlcw0KPiA+IHRoZSBRU1BJIGZsYXNoIGFzIGEg
bGluZWFyIHJlYWQtb25seSBhZGRyZXNzIHJhbmdlKS4NCj4gDQo+IFllcywgdGhvc2UgY29udHJv
bGxlcnMgYXJlIGJlY29taW5nIHByZXR0eSBzdGFuZGFyZC4NCg0KWWEsIG15IFNvQ3MgYXJlIG5v
dCBzbyBzcGVjaWFsIGFueSBtb3JlIDooDQoNCkJ1dCwgWElQX0tFUk5FTCBkb2VzIG5vdCBzZWVt
IHRvIGJlIG1haW5zdHJlYW0gZWl0aGVyLg0KDQoNCj4gPiBUaGVyZWZvcmUsIHRoZXJlIGlzIG5v
IG5lZWQgdG8ga25vdyBhbnl0aGluZyBhYm91dCB0aGUgYWN0dWFsbHkNCj4gPiBGbGFzaCB0aGF0
IGlzIGNvbm5lY3RlZCwgYmVjYXVzZSB5b3UgYXJlIG5ldmVyIGFsbG93ZWQgdG8gaW50ZXJhY3Qg
d2l0aA0KPiBpdA0KPiA+IChvciBldmVuIHF1ZXJ5IGl0IG9uIGJvb3QpLg0KPiANCj4gT2theSwg
YnV0IHRoZXNlIGRheXMgdS1ib290IHVzZXMgRFQgaXRzZWxmLiBTbyBob3cgZG9lcyB1LWJvb3Qg
a25vdw0KPiBob3cgdG8gc2V0IHRoaW5ncyB1cD8gSXQncyBnb2luZyB0byBuZWVkIHRvIGtub3cg
d2hhdCBjb250cm9sbGVyIGFuZA0KPiBmbGFzaCBkZXRhaWxzLg0KDQpUaGF0J3MgYWxsIGhhbmQg
Y29kZWQgYXQgdGhlIG1vbWVudC4gQXMgdGhlc2UgUXVhZC1TUEkgY2hpcHMgY2FtZSBvbiB0aGUN
Cm1hcmtldCwgZWFjaCB2ZW5kb3IgaGFkIHRoZWlyIG93biB3YXkgdG8gZ2V0IGluIChhbmQgb3V0
KSBvZiB0aGVzZSANCm1vZGVzLCBhbmQgZXZlbiB0aGUgcHJvdG9jb2xzIHdlcmUgbm90IHRoZSBz
YW1lLiBTb21ldGltZXMgZXZlbiB0aGUgc2FtZSANCmZsYXNoIHZlbmRvciB3b3VsZCBkbyB0aGlu
Z3MgZGlmZmVyZW50IGZvcm0gY2hpcCB0byBjaGlwLiBBdCB0aGlzIHBvaW50LCANCihhdCBsZWFz
dCBmb3IgUmVuZXNhcykgSSBoYXZlIHUtYm9vdCBjb2RlIHRoYXQgYXQgbGVhc3QgcG9pbnRzIHlv
dSBpbiB0aGUgDQpyaWdodCBkaXJlY3Rpb24gZGVwZW5kaW5nIG9uIHdoYXQgZmxhc2ggdmVuZG9y
IHlvdSBnbyB3aXRoLi4uLmJ1dCBJIA0KY2FuJ3QgZ3VhcmFudGVlIHlvdSB3b24ndCBuZWVkIHRv
IGRvIHNvbWUgdHdlYWtpbmcuDQoNCg0KPiBPciBob3cgZG9lcyBvbmUgZG8gYSBmbGFzaCB1cGRh
dGUgKGluIHRoZSBmaWVsZCk/DQpXZWxsLi4uLmZvciB0aGF0IHRoZXJlJ3MgYSAic3BlY2lhbCIg
ZHJpdmVyIHRoYXQgSSB3cm90ZS4gQmFzaWNhbGx5LCANCmdvaW5nIGJhY2sgdG8gdGhlIHdheXMg
d2UndmUgZG9uZSBpdCB3aXRoIE1DVSBmb3IgeWVhcnM6IENvcHkgY29kZSB0byBSQU0sIA0Kc2h1
dCBvZmYgaW50ZXJydXB0cywganVtcCB0byBSQU0sIGRvIHlvdXIgYnVzaW5lc3MsIGp1bXAgYmFj
ayB0byBmbGFzaC4NCg0KQWdhaW4sIHR3ZWFraW5nIGlzIG5lZWRlZCBkZXBlbmRpbmcgb24gd2hh
dCBTUEkgZmxhc2ggeW91IHVzZSwgc28gdGhlcmUgDQppcyBubyBtYWdpYyAnb25lIGRyaXZlciBm
aXRzIGFsbCcuDQoNCg0KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJldHRlciB0byBoYXZlIGEgcHJv
cGVydHkgdG8gc2F5IHRoZSBmbGFzaCBpcw0KPiBhbHJlYWR5IHNldHVwIGFuZCBqdXN0IHVzZSBp
dC4gT3IgbWF5YmUgaXQgY2FuIGJlIGRvbmUgd2l0aA0KPiBjb21wYXRpYmxlczoNCj4gDQo+IHNw
aUAxMjM0IHsNCj4gICBjb21wYXRpYmxlID0gInZlbmRvcixzb2MtcXVhZHNwaSIsICJtbWlvLXNw
aSI7DQo+ICAgZmxhc2hAMCB7DQo+ICAgICBjb21wYXRpYmxlID0gInNvbWUtZmxhc2gtcGFydCIs
ICJtdGQtcm9tIjsNCj4gICB9Ow0KPiB9Ow0KPiANCj4gTm93IHRoZSBwcm9ibGVtIGlzIGhvdyB0
byBkZWZpbmUgdGhlIGFkZHJlc3MgcmFuZ2UgYXMgU1BJIGZsYXNoDQo+IGRldmljZXMgYXJlIGFs
cmVhZHkgZGVmaW5lZCB0byB1c2UgU1BJIGNoaXAtc2VsZWN0IG51bWJlcnMuIFRoZQ0KPiBlYXNp
ZXN0IG9wdGlvbiBmcm9tIGEgRFQgc3RhbmRwb2ludCBpcyBqdXN0IGxvb2sgYXQgdGhlIHBhcmVu
dCByZWcNCj4gcHJvcGVydHkgYW5kIGZpZ3VyZSBvdXQgdGhlIG1lbW9yeSByYW5nZSAodHlwaWNh
bGx5IHRoZXJlIGFyZSAyIGFuZA0KPiB5b3Ugd2FudCB0aGUgYmlnIG9uZSkuIE9yIHlvdSBjb3Vs
ZCBoYXZlIHNvbWUgc2ltcGxlIGRyaXZlciB0aGF0IGtub3dzDQo+IHdoaWNoIHJlZyByYW5nZSB0
byBnZXQgZm9yIHNwZWNpZmljIGNvbXBhdGlibGVzLg0KDQoNCkknbSBzdGlsbCBjb25mdXNlZCBv
biB3aHkgSSB3b3VsZCB3YW50IHRvIGRvIHRoaXMgYXMgSSB3YW50IHRoZSBrZXJuZWwgDQp0byBu
b3Qga25vdyBub3RoaW5nIGFib3V0IHRoZSB1bmRlcmx5aW5nIEhXIHNvIGl0IG5ldmVyIHRyaWVz
IHRvIGFjY2Vzcw0KaXQgYW55IHdheS4NCkF0IHRoZSBlbmQgb2YgdGhlIGRheSwgYWxsIEkgd2Fu
dCBpcyBmb3IgdGhlIGtlcm5lbCB0byBkbyBhbiBpb3JlbWFwIG9mIA0KdGhpcyBhcmVhIGZvciBt
ZSBzbyBteSBmaWxlIHN5c3RlbSAoWElQIGNyYW1mcyBpbiB0aGlzIGNhc2UpIGNhbiBhY2Nlc3Mg
DQppdC4gIm10ZC1yb20iIGRvZXMgdGhpcyBmb3IgbWUgdG9kYXkuDQoNCkp1c3QgRllJLCBlYXJs
eSBpbiBib290LCB0aGUga2VybmVsIGFscmVhZHkgbWFwcGVkIHBhcnQgb2YgbXkgUVNQSSBpbnRv
IA0KdmlydHVhbCBtZW1vcnkgc2luY2Ugd2UncmUgbW9zdCBsaWtlbHkgcnVubmluZyBhbiBYSVBf
S0VSTkVMLg0KDQpXaGlsZSB0aGVzZSBYSVAgTGludXggc3lzdGVtcyBzZWVtIHRvIGZ1bmN0aW9u
IHF1aWV0IHdlbGwsIEkgbWlnaHQgbmVlZCANCnRvIGNvbnRpbnVlIHRvIGhpZGUgc29tZSBvZiB0
aGUgaW5uZXIgZGV0YWlscyBmcm9tIG1haW5saW5lIGJlY2F1c2UgdGhleQ0KZG9uJ3QgYWx3YXlz
IGZpdCBpbnRvIHRoZSBkaXJlY3Rpb24gb2YgdGhlIGtlcm5lbCBzeXN0ZW1zIChpZSwgbW9uc3Rl
ciANCnF1YWQgY29yZSBzeXN0ZW1zIHdpdGggbG90cyBvZiBERFIgbWVtb3J5KS4NCg0KVGhlIG90
aGVyIFhJUCBmaWxlIHN5c3RlbSB0aGF0IHdlIHVzZSBtb3JlIG9mdGVuIChBWEZTLCBub3QgaW4g
bWFpbmxpbmUpDQpkb2VzIG5vdCByZXF1aXJlIHRoZSBwYXJ0aXRpb25zIGluIERUIGF0IGFsbCwg
c28gaXQncyByZWFsbHkgb25seSANCm5lZWRlZCB3aGVuIHVzaW5nIGNyYW1mcy4gU28gZm9yIG5v
dywgbWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIGp1c3QgcmVtb3ZlDQp0aGlzIGNvbmZ1c2lu
ZyBwb3J0aW9uIG9mIHRoZSBkdHMuDQoNCg0KQ2hyaXMNCg==
