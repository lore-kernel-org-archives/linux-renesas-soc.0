Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AEBC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 14:22:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4DFF02084F
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 14:22:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="VISvgamc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387538AbfCAOWS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 09:22:18 -0500
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:30637
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728395AbfCAOWR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 09:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlrgLYu34ch1LQWmPL9Ny2KWvOGuh/BjcubkS6A6pc8=;
 b=VISvgamcCnjszId/sEi50Uk7UCH7G2PnIUGbxvHHBUSnByDyYZzXVFjeT3Rmgd7Ik0W9/uzVoo5AvlAA25mKB0Sgw1VXjK0oQKvr5FPPN9Db1AiG58eVkfv8P2pFG62UZMBv1HxB9a6T/nFwwDGZz+Vxi8vlfurmd+PI4qmeuLg=
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com (52.133.168.140) by
 TY2SPR01MB0009.jpnprd01.prod.outlook.com (20.177.76.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1665.16; Fri, 1 Mar 2019 14:22:10 +0000
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::88d2:545c:9212:c8cf]) by TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::88d2:545c:9212:c8cf%5]) with mapi id 15.20.1665.015; Fri, 1 Mar 2019
 14:22:10 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC v3 1/2] pinctrl: core: Add pinctrl_mux_gpio_request_enable
Thread-Topic: [RFC v3 1/2] pinctrl: core: Add pinctrl_mux_gpio_request_enable
Thread-Index: AQHUgORuD24LfHgI30yEBXhimmFOGaVwxh2AgADHGECAhdYMAIAADrsQ
Date:   Fri, 1 Mar 2019 14:22:10 +0000
Message-ID: <TYXPR01MB17759188A1AF01DB4444BC29C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1542727156-31432-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1542727156-31432-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CACRpkdbf+MpB24etuXUGypOwHUW_w4ECu-iFFT3aEB10wG0Huw@mail.gmail.com>
 <TY1PR01MB177090970EE98AC699E22E3CC0A90@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdUxcxRJv_H+_25pavjeJOKoEihrjBQTxjWR-fe9x5rBNw@mail.gmail.com>
In-Reply-To: <CAMuHMdUxcxRJv_H+_25pavjeJOKoEihrjBQTxjWR-fe9x5rBNw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bb9a272-4039-4e26-3cea-08d69e514b11
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2SPR01MB0009;
x-ms-traffictypediagnostic: TY2SPR01MB0009:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: 1;TY2SPR01MB0009;20:DL6QA7wFvgs2Pp9OPbMgIFnG5TkLv6qCaDsSKBI5VJDx/qknsT3aHO8g/TAIE0YxgOW8f/B5ka8CCrm8pran9BFBv9OWVYUI5Q99e4thuXIO0xm+KsyXvCFalUScCD7XeeeuSqwdFayElAWtD6EEMTfh8Qjz3Lo2NttTT9Znjwk=
x-microsoft-antispam-prvs: <TY2SPR01MB00094E49439953FC8B1CE8E8C0760@TY2SPR01MB0009.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(366004)(346002)(39860400002)(396003)(199004)(189003)(2906002)(9686003)(305945005)(68736007)(6306002)(446003)(4326008)(66066001)(55016002)(106356001)(7736002)(54906003)(44832011)(229853002)(476003)(5660300002)(53936002)(3846002)(6116002)(105586002)(486006)(11346002)(81156014)(81166006)(97736004)(6916009)(52536013)(26005)(6436002)(93886005)(8936002)(74316002)(186003)(966005)(478600001)(8676002)(316002)(99286004)(6246003)(86362001)(25786009)(71200400001)(71190400001)(7696005)(14444005)(6506007)(33656002)(14454004)(76176011)(102836004)(53546011)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2SPR01MB0009;H:TYXPR01MB1775.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: q0uzAHN6UrUKolArhCxU6PFN2IfYeigb0P9SR1lQj3tFP5vjp6F0jD3Y6t3bhbOojfzQL+Nb9zbshScb9gOx7/XCcbIUQiTjY7Qnf8j2bCvxjCzvidLUW3QxifyjJMKUp/Y/CeHkU+yJtNJa16Ez3rbxo9iHPqZwcXXvkhLl9DTFK8w1PlcKut9UjtxM78ciKYdCdcMA051KiP9rJWUwDLFNoF74UujAw9Le/u4orcVcuWNmEedQRfN2/iBFsE5BfJWuhs7qMVDUGc3blzagTYMn0tTsLpth/3EGQtLtCKXeaeDn0bYmKCb8ZhtVfMOXl+N+tJINeDz2Gpt4Pq5e2mecYpiyGGAYNIXbYKiHq9QXHg45hIl/IFxraKN+knOSNECKgIM7hf3HYnRrYr09hm7EihZoS3iJJBor/zV5L30=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb9a272-4039-4e26-3cea-08d69e514b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 14:22:10.6262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2SPR01MB0009
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBs
aW51eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LXJlbmVzYXMtc29j
LW93bmVyQHZnZXIua2VybmVsLm9yZz4gT24gQmVoYWxmIE9mIEdlZXJ0IFV5dHRlcmhvZXZlbg0K
PiBTZW50OiAwMSBNYXJjaCAyMDE5IDEzOjI4DQo+IFN1YmplY3Q6IFJlOiBbUkZDIHYzIDEvMl0g
cGluY3RybDogY29yZTogQWRkIHBpbmN0cmxfbXV4X2dwaW9fcmVxdWVzdF9lbmFibGUNCj4gDQo+
IEhpIEZhYnJpemlvLA0KPiANCj4gT24gVGh1LCBEZWMgNiwgMjAxOCBhdCAxMDo0NyBBTSBGYWJy
aXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+
ID4gPiBGcm9tOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+ID4g
PiBTZW50OiAwNSBEZWNlbWJlciAyMDE4IDIxOjQ2DQo+ID4gPiBTdWJqZWN0OiBSZTogW1JGQyB2
MyAxLzJdIHBpbmN0cmw6IGNvcmU6IEFkZCBwaW5jdHJsX211eF9ncGlvX3JlcXVlc3RfZW5hYmxl
DQo+ID4gPg0KPiA+ID4gT24gVHVlLCBOb3YgMjAsIDIwMTggYXQgNDoxOSBQTSBGYWJyaXppbyBD
YXN0cm8NCj4gPiA+IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
ID4NCj4gPiA+ID4gU29tZXRpbWVzIHRoZXJlIGlzIHRoZSBuZWVkIHRvIGNoYW5nZSB0aGUgbXV4
aW5nIG9mIGEgcGluIHRvIG1ha2UgaXQNCj4gPiA+ID4gYSBHUElPIHdpdGhvdXQgZ29pbmcgdGhy
b3VnaCBncGlvbGliLg0KPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgcGluY3RybF9tdXhfZ3Bpb19y
ZXF1ZXN0X2VuYWJsZSB0byBkZWFsIHdpdGggdGhpcyBuZXcNCj4gPiA+ID4gdXNlIGNhc2UgZnJv
bSBjb2RlIHRoYXQgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBwaW5jdHJsLg0KPiA+ID4NCj4gPiA+
IEl0IGhhcyBhIGxvdCB0byBkbyB3aXRoIHBpbmN0cmwgSSB0aGluaywgc28gSSBnZXQgY29uZnVz
ZWQgYnkgdGhpcw0KPiA+ID4gY29tbWl0IG1lc3NhZ2UuDQo+ID4NCj4gPiBJIGNhbiBpbXByb3Zl
IHRoYXQNCj4gPg0KPiA+ID4NCj4gPiA+ID4gIGV4dGVybiBpbnQgcGluY3RybF9ncGlvX3JlcXVl
c3QodW5zaWduZWQgZ3Bpbyk7DQo+ID4gPiA+ICtleHRlcm4gaW50IHBpbmN0cmxfbXV4X2dwaW9f
cmVxdWVzdF9lbmFibGUodW5zaWduZWQgZ3Bpbyk7DQo+ID4gPg0KPiA+ID4gV2hhdCdzIHdyb25n
IHdpdGgganVzdCB1c2luZyB0aGUgZXhpc3RpbmcgY2FsbA0KPiA+ID4gcGluY3RybF9ncGlvX3Jl
cXVlc3QoKSByaWdodCBhYm92ZSB5b3VyIG5ldyBvbmU/DQo+ID4gPg0KPiA+ID4gSXQncyBub3Qg
bGlrZSB3ZSdyZSByZWZlcmVuY2UgY291bnRpbmcgb3Igc29tZXRoaW5nLCBpdCdzIGp1c3QNCj4g
PiA+IGEgY2FsbGJhY2suIFNwcmlua2xlIHNvbWUgY29tbWVudHMgdG8gc2hvdyB3aGF0J3MgZ29p
bmcNCj4gPiA+IG9uLg0KPiA+DQo+ID4gSSB0cmllZCB0aGF0LCBhbmQgaXQgd2FzIHdvcmtpbmcg
Zm9yIG1lLCB0aGVuIHNvbWV0aGluZyBjaGFuZ2VkIGxhdGVseQ0KPiA+IGluIGdwaW9saWIgdGhh
dCBicm9rZSB0aGF0IHNvbHV0aW9uLCBhbmQgR2VlcnQgcGlja2VkIGl0IHVwIG9uIGhpcyBlbmQu
DQo+ID4gUGxlYXNlIHNlZSB0aGlzOg0KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cGF0Y2gvMTA2NzEzMjUvDQo+ID4NCj4gPiBUaGlzIHBhdGNoIHdhcyBtYWRlIHRvIG92ZXJjb21l
IHRoZSBwcm9ibGVtcyBvZiB0aGUgcHJldmlvdXMgcGF0Y2guDQo+ID4NCj4gPiA+DQo+ID4gPiBJ
ZiB5b3UgZm9yIHNvbWUgcmVhc29uIG5lZWQgYSBuZXcgY2FsbCBmb3IgdGhpcyBzcGVjaWZpYw0K
PiA+ID4gdXNlIGNhc2UsIGl0IG5lZWRzIHRvIGJlIG5hbWVkIGFmdGVyIHRoZSB1c2UgY2FzZSwN
Cj4gPiA+IGxpa2UgcGluY3RybF9ncGlvX3JlcXVlc3RfZm9yX2lycSgpDQo+ID4gPiBzbyBpdCBp
cyBvYnZpb3VzIHdoYXQgdGhlIGZ1bmN0aW9uIGlzIGRvaW5nLg0KPiA+DQo+ID4gSSBjYW4gZG8g
dGhhdCwgYnV0IEkgd291bGQgbGlrZSB0byBoZWFyIGZyb20gR2VlcnQgZmlyc3QsIG5vIHBvaW50
IGluIGdvaW5nDQo+ID4gYXJvdW5kIGluIGNpcmNsZSBpZiB0aGlzIHNvbHV0aW9uIGlzIG5vdCBh
Y2NlcHRhYmxlIHRvIGhpbS4NCj4gPg0KPiA+IEdlZXJ0LCB3aGF0IGRvIHlvdSB0aGluaz8NCj4g
DQo+IC9tZSBnaXZlcyB2MyBhIHRyeSBvbiBLb2Vsc2NoLCBTYWx2YXRvci1YUywgYW5kIEViaXN1
LTREOg0KPiANCj4gICAgIEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxp
ZCBjb250ZXh0DQo+IA0KPiBmb3IgbW1jLCBhZHY3NTExLCBncGlvLWtleXMsIGFuZCBFdGhlcm5l
dCBQSFkuDQoNCkRvaCEgSXQgd2FzIHJ1bm5pbmcgc21vb3RobHkgb24gbXkgaXdnMjNzIHdoZW4g
SSB0ZXN0ZWQgaXQsIEkgYW0gZ29pbmcgdG8NCmhhdmUgYW5vdGhlciBsb29rIGF0IHRoaXMgYXQg
YSBsYXRlciBzdGFnZS4NCg0KVGhhbmsgeW91IGZvciBsb29raW5nIGludG8gdGhpcyENCg0KQ2hl
ZXJzLA0KRmFiDQoNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQNCj4gDQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
DQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
