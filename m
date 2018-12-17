Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A76C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 17:42:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4310420874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 17:42:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="SgC5pBFX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388448AbeLQRmE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 12:42:04 -0500
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:9077
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726706AbeLQRmD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 12:42:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArL2plq/0srnHQP2kd8Jo8erXWMWXQFsmAShjTx6KDw=;
 b=SgC5pBFX5n1lxPqJfMq3R3ylT1ui5wl/LHk9bCGvRXqNMsRIxJ0dcmf5m0H+Ar/MFaPG0UQSBh0Q5JM8EUl7CLHcZ5Q385vqIVMXHcq3o+AL4NI6R+Slq4TRZzS5LByUTiDFqGSwDsyDrixhLZ+6tjw9eKYihSBOk8MSwWphvDo=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1758.jpnprd01.prod.outlook.com (52.133.168.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Mon, 17 Dec 2018 17:41:59 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::78ca:ce95:aef5:e8ca]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::78ca:ce95:aef5:e8ca%6]) with mapi id 15.20.1425.023; Mon, 17 Dec 2018
 17:41:58 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Kumar Gala <kumar.gala@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M
 EVB
Thread-Topic: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M
 EVB
Thread-Index: AQHUh+RU1KuMS3Q/EEimI0alfQTw/KV6cWmAgAC/l5CAADpbAIAAAJpggAe+YoCAAAeecIAAEmqAgAAForA=
Date:   Mon, 17 Dec 2018 17:41:58 +0000
Message-ID: <TYXPR01MB1568A2C057989ADB17FA07B88ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com>
 <20181212021549.GA26333@bogus>
 <TYXPR01MB1568DD386FE18BD1F985E5178AA70@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_Jsq+Ah7Xg0VnEaYyn4giFeQme9r9GyRsFDucq78BP+Cw2=A@mail.gmail.com>
 <TY2SPR01MB0015C0AC923F1CDEC44061D88AA70@TY2SPR01MB0015.jpnprd01.prod.outlook.com>
 <CAL_JsqL5rLb+6Qhet0zqpHuqeU42wsFRJ+S48N0KPg43KxOiDg@mail.gmail.com>
 <TYXPR01MB156894C0FEE2A2CF02820A018ABC0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAL_JsqLkqUTWh7RkG8tdTNhaTOMTOovDstZCqC=croQbAWmJSg@mail.gmail.com>
In-Reply-To: <CAL_JsqLkqUTWh7RkG8tdTNhaTOMTOovDstZCqC=croQbAWmJSg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TYXPR01MB1758;20:0BTjgE8PSmlA2fcQAjn3jkabvnyOi3LEUQPc60Zok9oXuBr74mjIYTeDSlEtq5dNY3+nmsHaSaH6t5pSFGNj/h0k56gL80c09fOIi0B2P5bm6BiRnIJc+H4Ge7KOtQRhaA4SeDbu713q+ihFZkhG81FPLWB9yJvml5+HWAyvj7U=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 9b4eab9f-7edc-4c68-530c-08d66446f1f6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYXPR01MB1758;
x-ms-traffictypediagnostic: TYXPR01MB1758:
x-microsoft-antispam-prvs: <TYXPR01MB1758930E8311E46A36FB99A88ABC0@TYXPR01MB1758.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(3231475)(944501520)(52105112)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:TYXPR01MB1758;BCL:0;PCL:0;RULEID:;SRVR:TYXPR01MB1758;
x-forefront-prvs: 08897B549D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(366004)(376002)(346002)(396003)(199004)(189003)(53936002)(478600001)(106356001)(4326008)(105586002)(2906002)(33656002)(8936002)(316002)(72206003)(6246003)(14454004)(229853002)(6916009)(74316002)(68736007)(6436002)(305945005)(7736002)(97736004)(99286004)(7696005)(186003)(76176011)(26005)(6506007)(66066001)(9686003)(102836004)(5660300001)(81156014)(81166006)(8676002)(25786009)(54906003)(55016002)(3846002)(6116002)(476003)(11346002)(93886005)(446003)(486006)(71190400001)(86362001)(256004)(71200400001)(14444005);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1758;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 8VRGsY32wWNy35mCRzvvRRAz9u7qTQd8gBt5S54fScn10eAjA7bUsI0Nav2MbK+B6ytWATCD847wSg1f2CGX/RsLzKi/BLmknJmjOqq9Qxgxu7rKvGxRgvUWYOWt8hKp7BSu3WVari8fCZ6qHBdQXBcuosVjVqyhy18hNmC0udjwFIF8TikXDcrzsCTCbOVpkf/j9EI3+pZATwhRrFvjWdiOp1VA9h/U+JSO66h2L9+3qgp/AhnmxJG7o8yt+6gKCdPJG7Oi3UyZnvHufSg1ak7NOimqtDTnLv7Oq0VhluazDsB9Y9FFlPRjO0UFl1dt
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4eab9f-7edc-4c68-530c-08d66446f1f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2018 17:41:58.5131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1758
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gTW9uZGF5LCBEZWNlbWJlciAxNywgMjAxOCAxLCBsaW51eC1yZW5lc2FzLXNvYy1vd25lckB2
Z2VyLmtlcm5lbC5vcmcgd3JvdGU6DQo+ID4gWXVwLi4udGhlcmUncyB0aGUga2lsbGVyIQ0KPiA+
IFlvdSdsbCBub3RpY2UgdGhhdCBpbiBtYWlubGluZSBSWi9BIGRldmljZXMsIHRoZXJlIGlzIG5v
IFFTUEkgZHJpdmVyLA0KPiA+IGFuZCBhbHNvIHRoZSBRU1BJIGNsb2NrIGlzIGxlZnQgb3V0IG9m
IHRoZSBsaXN0IG9mIEhXIGNsb2Nrcy4gT3RoZXJ3aXNlLA0KPiA+IGFzIHlvdSBtZW50aW9uZWQs
IHRoYXQgJ3VudXNlZCcgY2xvY2sgd291bGQgZ2V0IHNodXQgb2ZmIGF0IHRoZSBlbmQgb2YNCj4g
PiBib290Li4uYW5kIHlvdSdyZSB3aG9sZSBzeXN0ZW0gd291bGQgc3RvcCBpbW1lZGlhdGVseS4N
Cj4gDQo+IElmIHlvdSBoYWQgYSBzaW1wbGUgZHJpdmVyIHdpdGggdGhlIGJpbmRpbmcgYXMgSSBw
cm9wb3NlZCwgdGhlbiBpdA0KPiBjb3VsZCBkbyB0aGUgaW9yZW1hcCBhbmQgY2xvY2sgbWFuYWdl
bWVudC4gQW5kIHlvdSBjb3VsZCBhbHNvIGhhdmUNCj4gc3BlY2lmaWMgU1BJIGFuZCBmbGFzaCBk
cml2ZXJzIGZvciB3aGVuIHlvdSBuZWVkIHRvIGZsYXNoaW5nIHdpdGhvdXQNCj4gY2hhbmdpbmcg
dGhlIERULg0KDQpJIGFncmVlLg0KDQpBdCB0aGUgc2FtZSB0aW1lLCB0aGlzIHBhcnRpY3VsYXIg
WElQLVFTUEkgSFcgaXMgbm93IHVzZWQgaW4gdGhlIGxhdGVzdCANClJlbmVzYXMgUi1DYXIgZGV2
aWNlcywgYW5kIHRoZXJlIGhhcyBiZWVuIHNvbWUgdGFsayBvZiB1cHN0cmVhbWluZyB0aGUgDQpk
cml2ZXIgZm9yIGl0IChhcyBpbiwgdXNpbmcgaXQgaW4gU1BJIG1vZGUgaW5zdGVhZCBvZiBYSVAg
bW9kZSkuDQpJJ20gd2FpdGluZyB0byBzZWUgd2hlcmUgdGhhdCBlbmRzIHVwLCBhbmQgaWYgSSBz
aG91bGQganVzdCB1c2UgdGhhdCANClNQSSBtb2RlIGRyaXZlciBmb3IgdGhlIFJaL0Egc2VyaWVz
IGJ1dCBzaW1wbHkgcHV0IGluIGEgbmV3IHByb3BlcnR5IGxpa2UNCiJ1c2UteGlwLW1vZGU7IiB0
aGF0IGJhc2ljYWxseSB0ZWxscyB0aGUgZHJpdmVyIHRvIGRvIG5vdGhpbmcgZXhjZXB0IGVuYWJs
ZSANCnRoZSBjbG9jayAoYWdhaW4pIHNvIGl0IGRvZXNuJ3QgZ2V0IHNodXQgb2ZmIGF0IHRoZSBl
bmQgb2YgYm9vdC4NCg0KSG93ZXZlciwgd2l0aCB5b3VyIGlkZWEsIEkgY291bGQgYWxzbyBhZGQg
aW4gdGhlIGlvLXJlbWFwcGluZyBpbnRvIHRoYXQgDQpkcml2ZXIgYXMgd2VsbC4NCg0KVGhlIG9u
bHkgdGhpbmcgSSBjYW4ndCByZW1lbWJlciBpcyBpZiB0aGUgY3JhbWZzLXhpcCBkcml2ZXIgcmVh
bGx5IA0KbmVlZGVkIHRvIGhhdmUgYW4gbXRkIHBhcnRpdGlvbiB3aXRoICdwcm9iZS10eXBlID0g
ImRpcmVjdC1tYXBwZWQiOycgDQp1bmRlcm5lYXRoIGl0IHNvIGl0IGNvdWxkIG1vcmUgY2xvc2Vs
eSBtYXAgZGlmZmVyZW50IHJlZ2lvbnMgZHVyaW5nIHJ1bi10aW1lLiANCkFuZCBpbiB0aGF0IGNh
c2UsIHRoZSBRU1BJIGRyaXZlciBzaG91bGQgbm90IGJlIGRvaW5nIGFuIGlvLXJlbWFwcGluZyAN
CmJlY2F1c2UgaXQncyBub3QgaXRzIHJlc3BvbnNpYmlsaXR5IChhbmQgbWlnaHQgc2NyZXcgdGhp
bmdzIHVwKS4NCg0KDQpDaHJpcw0KDQo=
