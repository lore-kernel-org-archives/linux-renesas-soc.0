Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38CCC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 11:30:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7902F217D7
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 11:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="D88bx585"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728243AbfAYLai (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 06:30:38 -0500
Received: from mail-eopbgr1410097.outbound.protection.outlook.com ([40.107.141.97]:8840
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728469AbfAYLah (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 06:30:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Djf75+s6WJ4OSl75bqt2jktR2NK7KOOm++kGfY/59ds=;
 b=D88bx585iaogcR9UGAlal0BLSCv4D3PX7urR1ZixXZSlVcOcMCL5ThMLowrsy9lj4sfD/WUfIgm5COMob86mHJ99iH415fyTIGHPH67Lm3bBpUjhLaiGAKWdrksQFzGfYiHijDbOCKY7DsHb8e4+1/vkXxKpxGJvisMHLJkN8Fc=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.241.22) by
 OSBPR01MB3111.jpnprd01.prod.outlook.com (52.134.254.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.18; Fri, 25 Jan 2019 11:30:29 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9cb9:6c95:2d20:7852]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9cb9:6c95:2d20:7852%2]) with mapi id 15.20.1558.016; Fri, 25 Jan 2019
 11:30:29 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Samuel Holland <samuel@sholland.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
Thread-Topic: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
Thread-Index: AQHUbQZ8TtZTW3QcxUq23D537RtyIaW+wYkAgAGiYjA=
Date:   Fri, 25 Jan 2019 11:30:29 +0000
Message-ID: <OSBPR01MB21034B1D07C9BA05859AEA73B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdW-qt+3iNit1wVxN2JyRwCArJzBNvvjDZJyxYRjvDkLuA@mail.gmail.com>
In-Reply-To: <CAMuHMdW-qt+3iNit1wVxN2JyRwCArJzBNvvjDZJyxYRjvDkLuA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB3111;20:H2yeFw6Xxv2qZgaEb0802i6zoFfSzNVuiCg84dnHMLvr1BOBbj5C9Q+aVG+w3AGChRta+42zMm+dsDWa3LPxMIqcNA5X74FSOiFoF4vo2LdGirEKPh6Lvtz0+RZEmkfmrY+Cjsq/53TKF/XcW2TDpHK0iyBfgbo1ZjBHL+CXvL0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 4c7cb73f-d322-4f89-09f9-08d682b8825c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB3111;
x-ms-traffictypediagnostic: OSBPR01MB3111:
x-microsoft-antispam-prvs: <OSBPR01MB31117197D9279D81DD6C9A3EB89B0@OSBPR01MB3111.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0928072091
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(136003)(346002)(376002)(366004)(396003)(13464003)(199004)(51914003)(189003)(966005)(7416002)(53936002)(105586002)(39060400002)(7696005)(76176011)(316002)(478600001)(110136005)(54906003)(25786009)(14454004)(71200400001)(71190400001)(68736007)(86362001)(74316002)(99286004)(186003)(26005)(14444005)(44832011)(256004)(9686003)(6306002)(2906002)(6436002)(6506007)(102836004)(33656002)(81156014)(8676002)(6116002)(305945005)(53546011)(8936002)(81166006)(3846002)(106356001)(97736004)(4326008)(6246003)(229853002)(11346002)(476003)(486006)(66066001)(7736002)(446003)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3111;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xbNMUzK5zURnm20swKMXHJ546zCbK0W8aG1hVRZHzSFaoSsa+Qzdc5WqjAChmGSpxLThH7Hqwbuh3M7Q5Yqcji9+5LPQS/tR+x/f32CIhC07a9jW8GUXZSGL13rXBDNmv2Mp7tiueuwtGw3tu4Ex+dZ7VaDVU4vWJYTcmHJonVzkerxckH0bqECMdFdpdcC4I5t6sAL8FI8lgjmdHHGRaDXRgjGBMMNB91yx24EzLJVEkrQRU/YpGpIiaHYGO1aGF9eUDJAsJDRabJzhU4MyOKVuamwycIN+mXUmzVEk4LvHX361nUZfwnzxywlEfrlAKSig50JTIkaBWLn5zdWIW6xVRXZxqxE1SAOI3jeHVVtCJyvK9n11HSl17nLHYY+THfSDwEbX1USSNKRxoIkJmNsslpHY/wUJuGh016A/vas=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7cb73f-d322-4f89-09f9-08d682b8825c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2019 11:30:29.0448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3111
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLiBJIHN0YXJ0ZWQgdGVzdGluZyBD
TVQgb24gbGF0ZXN0IGtlcm5lbChMaW51eC1uZXh0LTIwMTkwMTI1IGFuZCBhbHNvIHJlbmVzYXMt
ZGV2KSBhbmQgZm91bmQgdGhhdCBpdCBpcyBicm9rZW4gb24gUi1DYXIgTTMtVyBkZXZpY2UuDQoN
Ck9uIGZ1cnRoZXIgaW52ZXN0aWdhdGlvbiB0aGUgcGF0Y2ggKCIgODIzNGY2NzM0YzVkNzRhYzc5
NGU1NTE3NDM3ZjUxYzU3ZDY1Zjg2NSIgICBQTS1ydW50aW1lOiBTd2l0Y2ggYXV0b3N1c3BlbmQg
b3ZlciB0byB1c2luZyBocnRpbWVycykgIGlzIGNhdXNpbmcgdGhlIGlzc3VlLg0KDQpEdXJpbmcg
Y2xvY2sgc291cmNlIHN3aXRjaGluZywgSXQgY2FsbHMgdGhlIGZ1bmN0aW9uICJzaF9jbXRfZW5h
YmxlIiAgd2hpY2ggY2FsbHMgIiBwbV9ydW50aW1lX2dldF9zeW5jKCZjaC0+Y210LT5wZGV2LT5k
ZXYpOyIgIGFuZCBhZnRlciB0aGF0IGNvbnNvbGUgZnJlZXplcy4NCg0KU2VyZ2VpOiBIYXZlIHlv
dSBub3RpY2VkIHRoaXMgaXNzdWUgIG9uIFItQ2FyIFYzTSBhbmQgVjNIIGJvYXJkcyB3aXRoIGxh
dGVzdCBrZXJuZWw/DQoNClJlZ2FyZHMsDQpCaWp1DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogbGludXgtcmVuZXNhcy1zb2Mtb3duZXJAdmdlci5rZXJuZWwub3JnIDxs
aW51eC1yZW5lc2FzLXNvYy0NCj4gb3duZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2Yg
R2VlcnQgVXl0dGVyaG9ldmVuDQo+IFNlbnQ6IDI0IEphbnVhcnkgMjAxOSAxMDoxNg0KPiBUbzog
QmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJv
YmgrZHRAa2VybmVsLm9yZz47IE1hcmsgUnV0bGFuZA0KPiA8bWFyay5ydXRsYW5kQGFybS5jb20+
OyBTaW1vbiBIb3JtYW4gPGhvcm1zQHZlcmdlLm5ldC5hdT47IE1hZ251cw0KPiBEYW1tIDxtYWdu
dXMuZGFtbUBnbWFpbC5jb20+OyBMaW51eC1SZW5lc2FzIDxsaW51eC1yZW5lc2FzLQ0KPiBzb2NA
dmdlci5rZXJuZWwub3JnPjsgb3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBE
RVZJQ0UNCj4gVFJFRSBCSU5ESU5HUyA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBHZWVy
dCBVeXR0ZXJob2V2ZW4NCj4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgQ2hyaXMgUGF0ZXJz
b24NCj4gPENocmlzLlBhdGVyc29uMkByZW5lc2FzLmNvbT47IERhbmllbCBMZXpjYW5vDQo+IDxk
YW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPjsgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+OyBKb2huDQo+IFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz47IEZhYnJpemlv
IENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPjsgU2FtdWVsIEhvbGxh
bmQgPHNhbXVlbEBzaG9sbGFuZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTY0OiBk
dHM6IHJlbmVzYXM6IHI4YTc3OTY6IEFkZCBDTVQgZGV2aWNlIG5vZGVzDQo+DQo+IEhpIEJpanUs
DQo+DQo+IE9uIEZyaSwgT2N0IDI2LCAyMDE4IGF0IDEwOjMyIEFNIEJpanUgRGFzIDxiaWp1LmRh
c0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBhZGRzIENNVHswfDF8Mnwz
fSBkZXZpY2Ugbm9kZXMgZm9yIHI4YTc3OTYgU29DLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
QmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IFRoaXMgcGF0
Y2ggaXMgdGVzdGVkIGFnYWluc3QgcmVuZXNhcy1kZXYNCj4gPg0KPiA+IEkgaGF2ZSBleGVjdXRl
ZCBvbiBpbmNvbnNpc3RlbmN5LWNoZWNrLCBuYW5vc2xlZXAgYW5kDQo+ID4gY2xvY2tzb3VyY2Vf
c3dpdGNoIHNlbGZ0ZXN0cyBvbiB0aGlzIGFybTY0IFNvQy4gVGhlDQo+ID4gaW5jb25zaXN0ZW5j
eS1jaGVjayBhbmQgbmFub3NsZWVwIHRlc3RzIGFyZSB3b3JraW5nIGZpbmUuVGhlDQo+ID4gY2xv
Y2tzb3VyY2Vfc3dpdGNoIGFzeW5jaHJvbm91cyB0ZXN0IGlzIGZhaWxpbmcgZHVlIHRvIGluY29u
c2lzdGVuY3ktY2hlY2sNCj4gZmFpbHVyZSBvbiAiYXJjaF9zeXNfY291bnRlciIuDQo+ID4NCj4g
PiBCdXQgaWYgaSBza2lwIHRoZSBjbG9ja3NvdXJjZV9zd2l0Y2hpbmcgb2YgImFyY2hfc3lzX2Nv
dW50ZXIiLCB0aGUNCj4gPiBhc3luY2hyb25vdXMgdGVzdCBpcyBwYXNzaW5nIGZvciBDTVQwLzEv
Mi8zIHRpbWVyLg0KPiA+DQo+ID4gSGFzIGFueSBvbmUgbm90aWNlZCB0aGlzIGlzc3VlPw0KPg0K
PiBjbG9ja2V2ZW50cy9uZXh0IG5vdyBoYXMgY29tbWl0IDdjZDZkY2EzNjAwZDhkNzENCj4gKCJj
bG9ja3NvdXJjZS9kcml2ZXJzL2FyY2hfdGltZXI6IFdvcmthcm91bmQgZm9yIEFsbHdpbm5lciBB
NjQgdGltZXINCj4gaW5zdGFiaWxpdHkiKS4gIFBlcmhhcHMgdGhpcyBpcyByZWxhdGVkLCBhbmQg
dGhlIHNhbWUgdGVzdCBwcm9ncmFtIG1heSBpbmRpY2F0ZQ0KPiBzaW1pbGFyIGlzc3Vlcz8NCj4N
Cj4gU2VlIGFsc28gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDExMzAyMTcxOS40
NjQ1Ny0yLQ0KPiBzYW11ZWxAc2hvbGxhbmQub3JnLw0KPg0KPiBHcntvZXRqZSxlZXRpbmd9cywN
Cj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4NCj4gLS0NCj4gR2VlcnQgVXl0
dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBs
aW51eC0NCj4gbTY4ay5vcmcNCj4NCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMg
VG9ydmFsZHMNCg0KDQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVh
ZG93LCBNaWxsYm9hcmQgUm9hZCwgQm91cm5lIEVuZCwgQnVja2luZ2hhbXNoaXJlLCBTTDggNUZI
LCBVSy4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kICYgV2FsZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4g
MDQ1ODY3MDkuDQo=
