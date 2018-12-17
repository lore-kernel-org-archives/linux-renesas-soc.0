Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26AEC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:18:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56B2120874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 16:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="sVEmQbfJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388053AbeLQQSJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 11:18:09 -0500
Received: from mail-eopbgr1410111.outbound.protection.outlook.com ([40.107.141.111]:44096
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388056AbeLQQSI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 11:18:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzNEmrnpSIHhBSIbWnqk/kpo2TIKYHoJfE4eTNWofIk=;
 b=sVEmQbfJNtL1JI2FZ2k9zA2p1O+NSFsFFCeQpGJuD+QWgpexCY/vO83fnLSHYQyyTC7W3g9AfZ7poL4+T6AZgBJEk2BMB52sCAKBLahR1zgd5hbE5tmWajOHMaeo0M+660o62M4wghBtNGe9UwvV2KlosA4Ie5Lx4LHzV2i+5zU=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1626.jpnprd01.prod.outlook.com (52.133.162.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.21; Mon, 17 Dec 2018 16:17:49 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::dcee:f270:d42b:5b48]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::dcee:f270:d42b:5b48%5]) with mapi id 15.20.1425.023; Mon, 17 Dec 2018
 16:17:49 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>
CC:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and IIC-DVFS
 support
Thread-Topic: [PATCH 02/17] arm64: dts: renesas: r8a774c0: Add I2C and
 IIC-DVFS support
Thread-Index: AQHUk5Cw21PJc0Kk+kO145apBL9P1aWDH2wAgAAAYlA=
Date:   Mon, 17 Dec 2018 16:17:48 +0000
Message-ID: <TY1PR01MB1770F1E7A7386FCA2202C6A0C0BC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVvGw4-=vxn5CgF7kkb_eYKqjNby0FvD8Mh22EkEt8hTA@mail.gmail.com>
In-Reply-To: <CAMuHMdVvGw4-=vxn5CgF7kkb_eYKqjNby0FvD8Mh22EkEt8hTA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1626;20:KmF0yYHqnR+dEzQeFmR8xdfDRz/x9/ZHiYK8RAbpZgc03PWpJBND6bIDd1PXRxlck5bmshFVOXvgMXz9NieqrWtJlyVQ63zyHxtBwIh8aFqicbUzTNpOcGrAh1rfr2L6aaVVuOaY/IfUKMGhxVUMsO0dDrBJha9b/EGwKQwZ4hI=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: c0b683bf-2f05-4410-f78e-08d6643b301c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1626;
x-ms-traffictypediagnostic: TY1PR01MB1626:
x-microsoft-antispam-prvs: <TY1PR01MB1626275366A1B4C6F5139639C0BC0@TY1PR01MB1626.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(5005020)(6040522)(2401047)(8121501046)(93006095)(93001095)(3231475)(944501520)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);SRVR:TY1PR01MB1626;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB1626;
x-forefront-prvs: 08897B549D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(366004)(376002)(346002)(136003)(199004)(189003)(76176011)(476003)(186003)(486006)(26005)(6506007)(53546011)(102836004)(44832011)(11346002)(446003)(66066001)(105586002)(106356001)(99286004)(97736004)(110136005)(54906003)(316002)(2906002)(7696005)(33656002)(68736007)(6116002)(3846002)(71190400001)(71200400001)(86362001)(55016002)(478600001)(229853002)(14454004)(6306002)(53936002)(6246003)(9686003)(6436002)(39060400002)(107886003)(4326008)(10126004)(8936002)(5660300001)(81166006)(81156014)(8676002)(74316002)(256004)(305945005)(25786009)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1626;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: i8XZp154GmBw7pbGuGNTX94el7sStVBaYysxhDm3tCVhxDSOjO6ljGg4qowInobfG3v42B2vp7i1B6x0p61oY8r9hGHHqWQMYsFN77ru7/40GrdoBFPfrs8k2DAGT9kvrSXd1/T2qen9VTe/aCZVXSIaQnR3/6SmZ52IdJNuwPiTDdl7cyAXs3uRTuVxLgz28nICRlU/xg23NJaaWtiaeUUHt0Os7P8eO+dk+pUjZMDmX+mF9D9m8704xvW2bKCJBawUNgRfOpUQ2rZ0d2CwCvaTXlRPRJkt9zgDi0IaQvaNk6ntjeH2aqMI2YHYhVDM
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b683bf-2f05-4410-f78e-08d6643b301c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2018 16:17:48.7863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1626
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gR2VlcnQsIGhlbGxvIFNpbW9uDQoNCkkgaGF2ZSBqdXN0IHJlY2VpdmVkIHdvcmQgZnJv
bSBKYXBhbiwgYXBwYXJlbnRseSB0aGV5IGFyZSBnb2luZyB0byBkcm9wIElDVFIsIElDUlIsIElD
VEEsIElDVEIsIElDVEMsIElDVEQsIElDU0YsIGFuZCBJQ1ZDT04gZnJvbSB0aGUgUlovRzIgZG9j
dW1lbnRhdGlvbi4NCg0KVGhhbmtzLA0KRmFiDQoNCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTcgRGVjZW1iZXIgMjAxOCAxNjoxMg0K
PiBUbzogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+DQo+
IENjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgR2VlcnQgVXl0dGVyaG9ldmVu
IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IFNpbW9uIEhvcm1hbiA8aG9ybXNAdmVyZ2UubmV0
LmF1PjsNCj4gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT47IE1hZ251cyBEYW1t
IDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBMaW51eC1SZW5lc2FzIDxsaW51eC1yZW5lc2FzLQ0K
PiBzb2NAdmdlci5rZXJuZWwub3JnPjsgb3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRU
RU5FRCBERVZJQ0UgVFJFRSBCSU5ESU5HUyA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBD
aHJpcw0KPiBQYXRlcnNvbiA8Q2hyaXMuUGF0ZXJzb24yQHJlbmVzYXMuY29tPjsgQmlqdSBEYXMg
PGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAyLzE3XSBh
cm02NDogZHRzOiByZW5lc2FzOiByOGE3NzRjMDogQWRkIEkyQyBhbmQgSUlDLURWRlMgc3VwcG9y
dA0KPg0KPiBPbiBGcmksIERlYyAxNCwgMjAxOCBhdCAxMDozNyBBTSBGYWJyaXppbyBDYXN0cm8N
Cj4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gQWRkIHRoZSBJ
MkNbMC03XSBhbmQgSUlDIEJ1cyBJbnRlcmZhY2UgZm9yIERWRlMgKElJQyBmb3IgRFZGUykNCj4g
PiBkZXZpY2VzIG5vZGVzIHRvIHRoZSByOGE3NzRjMCBkZXZpY2UgdHJlZS4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMu
Y29tPg0KPg0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT4NCj4NCj4gVGhlIHJlZ2lzdGVyIHNpemUgZm9yIElJQ0RWRlMgY2FuIGJlIGVu
bGFyZ2VkIGxhdGVyLCBhcyB0aGUgbWFwcGluZw0KPiBpbmNsdWRlcyB0aGUgZnVsbCBQQUdFX1NJ
WkUgYmxvY2sgYW55d2F5Lg0KPg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4NCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQNCj4NCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0K
Pg0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBj
YWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KDQoNCltodHRw
czovL3d3dzIucmVuZXNhcy5ldS9tZWRpYS9lbWFpbC91bmljZWYuanBnXQ0KDQpUaGlzIENocmlz
dG1hcywgaW5zdGVhZCBvZiBzZW5kaW5nIG91dCBjYXJkcywgUmVuZXNhcyBFbGVjdHJvbmljcyBF
dXJvcGUgaGF2ZSBkZWNpZGVkIHRvIHN1cHBvcnQgVW5pY2VmIHdpdGggYSBkb25hdGlvbi4gRm9y
IGZ1cnRoZXIgZGV0YWlscyBjbGljayBoZXJlPGh0dHBzOi8vd3d3LnVuaWNlZi5vcmcvPiB0byBm
aW5kIG91dCBhYm91dCB0aGUgdmFsdWFibGUgd29yayB0aGV5IGRvLCBoZWxwaW5nIGNoaWxkcmVu
IGFsbCBvdmVyIHRoZSB3b3JsZC4NCldlIHdvdWxkIGxpa2UgdG8gdGFrZSB0aGlzIG9wcG9ydHVu
aXR5IHRvIHdpc2ggeW91IGEgTWVycnkgQ2hyaXN0bWFzIGFuZCBhIHByb3NwZXJvdXMgTmV3IFll
YXIuDQoNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBMdGQsIER1a2VzIE1lYWRvdywg
TWlsbGJvYXJkIFJvYWQsIEJvdXJuZSBFbmQsIEJ1Y2tpbmdoYW1zaGlyZSwgU0w4IDVGSCwgVUsu
IFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdhbGVzIHVuZGVyIFJlZ2lzdGVyZWQgTm8uIDA0NTg2
NzA5Lg0K
