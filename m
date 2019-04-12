Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F63AC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:03:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB2A42082E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 12:03:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="DXFfcJcP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfDLMDJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 08:03:09 -0400
Received: from mail-eopbgr1400135.outbound.protection.outlook.com ([40.107.140.135]:20944
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726702AbfDLMDJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 08:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PhqGi4DlslZ2Tz721eCtwVrCDMyQyoJnKuoXR5cLGc=;
 b=DXFfcJcP7Crroz/Gt3WfcbF+YPTAOiv1HZx41hb+ocyauBr84RePSO7U5p3WdbAqQOcBbNsfnERtKqRzAblA/SgTgDI3iQ305s0k7bmQ9+NO+lZlxePs7x8E2Jk3HXMdgQ0tX73KaZJYguijHLNrsA05UdjQ3LBy/bAnADvPsKU=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4390.jpnprd01.prod.outlook.com (20.179.180.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.19; Fri, 12 Apr 2019 12:03:03 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1792.009; Fri, 12 Apr 2019
 12:03:03 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 3/4] drm: rcar-du: Add R8A774A1 support
Thread-Topic: [PATCH 3/4] drm: rcar-du: Add R8A774A1 support
Thread-Index: AQHU8HSg272zkxlv40edpXIdgMjgWKY4ahCAgAAB4VA=
Date:   Fri, 12 Apr 2019 12:03:02 +0000
Message-ID: <OSBPR01MB2103DB9BB383483F120E082AB8280@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1554993271-29523-1-git-send-email-biju.das@bp.renesas.com>
 <1554993271-29523-4-git-send-email-biju.das@bp.renesas.com>
 <9476e97f-380a-7285-b169-72085dfe0eca@ideasonboard.com>
In-Reply-To: <9476e97f-380a-7285-b169-72085dfe0eca@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb995ee9-30d5-44cb-c18f-08d6bf3ed0c6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4390;
x-ms-traffictypediagnostic: OSBPR01MB4390:
x-microsoft-antispam-prvs: <OSBPR01MB43904AC59A5B391BEC1DC35AB8280@OSBPR01MB4390.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(376002)(396003)(366004)(346002)(189003)(199004)(51914003)(11346002)(486006)(446003)(74316002)(7736002)(476003)(26005)(256004)(14454004)(102836004)(53546011)(6506007)(6436002)(9686003)(229853002)(76176011)(7696005)(97736004)(33656002)(305945005)(186003)(44832011)(55016002)(71200400001)(71190400001)(52536014)(5660300002)(107886003)(4326008)(2906002)(6246003)(478600001)(53936002)(3846002)(6116002)(105586002)(66066001)(106356001)(86362001)(8936002)(81156014)(81166006)(110136005)(54906003)(8676002)(99286004)(316002)(25786009)(68736007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4390;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mw07nZ6fqHYzDnhGEhJ1Iu6nLm4920t7m094k+Wb1wAKTYJbyZWogIURlBBg19fNOPIp+yRfKJUSoytAh+q/wNj0tBe2khgTMx4xXq2kPe9cVrDudJEj21O9OrZIWmbH8JoGgViauYRV0rBFZaCnZdbATqlruZqz5NhTeUOGxeU7TTZfW16UPaAztWughsihPsVeVtp8SHYLNQkzVENpJrwlbO36hQx3TXYzoYtppLZrjYG3k93CnSNYaMx0QHVSjmf/9htZDVCmJr2hm8YDxLpWhsWWRyqpddVqDRWOf71OAYfZGJeVIhtAOvN8xGuog6KogF3JhAimVv2+Zpr3dNNt5/9HGJ9gvFL1OeU5775glHKsDxJ2UuMzbC1jBWVSmJ+jYc+l6wdP9WtoabVJts2Ss4mTwJhSGlgas3bblgk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb995ee9-30d5-44cb-c18f-08d6bf3ed0c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 12:03:02.7445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4390
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS2llcmFuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDMvNF0gZHJtOiByY2FyLWR1OiBBZGQgUjhBNzc0QTEgc3VwcG9ydA0KPiANCj4gSGkg
QmlqdSwNCj4gDQo+IE9uIDExLzA0LzIwMTkgMTU6MzQsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEFk
ZCBzdXBwb3J0IGZvciB0aGUgUjhBNzc0QTEgRFUgKHdoaWNoIGlzIHZlcnkgc2ltaWxhciB0byB0
aGUgUjhBNzc5Ng0KPiA+IERVKTsgaXQgaGFzIG9uZSBSR0Igb3V0cHV0LCBvbmUgTFZEUyBvdXRw
dXQgYW5kIG9uZSBIRE1JIG91dHB1dC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4NCj4gDQo+IEkgc2VlIEZpZ3VyZSAzNS4xYiBhY3Jv
c3MgdGhlIHR3byBkYXRhc2hlZXRzIGRvZXMgc2hvdyBzb21lIGRpZmZlcmVuY2VzDQo+IGJldHdl
ZW4gdGhlc2UgdHdvIHBhcnRzLCBidXQgdGhlIGxheW91dCBkZWZpbmVkIGJ5IHRoZQ0KPiByY2Fy
X2R1X3I4YTc3OTZfaW5mbyBzdHJ1Y3R1cmUgaXMgY29tcGF0aWJsZSBiYXNlZCBvbiB0aGUgY3Vy
cmVudCBzdGF0ZSBvZg0KPiB0aGUgZHJpdmVyLi4uDQo+IA0KPiBIb3dldmVyLCBpZiBzdXBwb3J0
IGZvciB0aGUgVENPTi9DTU0gaXMgYWRkZWQgdG8gdGhlIERVIGRyaXZlciAtIHRoZW4gSQ0KPiB0
aGluayB0aGlzIHdpbGwgbmVlZCB0byBiZSBzZXBhcmF0ZWQuDQoNCk9LLiBJIHdpbGwgc2VuZCBW
MiB3aXRoIHNlcGFyYXRlIGRhdGEgc3RydWN0dXJlICIgcmNhcl9kdV9yOGE3NzRhMV9pbmZvIg0K
Zm9yIFJaL0cyTS4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiBJIGhhdmUgc2VlbiBwYXRjaGVzIHRo
aXMgbW9udGggd2hpY2ggYXJlIHRyeWluZyB0byB1cHN0cmVhbSBhIENNTQ0KPiBpbXBsZW1lbnRh
dGlvbi4NCj4gDQo+IFdpdGggdGhhdCBpbiBtaW5kIC0gcGVyaGFwcyBpdCB3b3VsZCBiZSB3b3J0
aCBjcmVhdGluZyBhIG5ldyBzdHJ1Y3R1cmUgZm9yDQo+IHRoaXMgcGFydD8NCj4gDQo+IE90aGVy
d2lzZSB0aGUgQ01NIHdvdWxkIGVuZCB1cCBiZWluZyBlbmFibGVkIHdoZW4gaXQgZG9lc24ndCBl
eGlzdCBhbmQNCj4gY291bGQgY2F1c2UgcHJvYmxlbXMuDQoNCg0KIA0KPiA+IC0tLQ0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jIHwgMSArDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfZHVfZHJ2LmMNCj4gPiBpbmRleCA3NWFiMTdhLi5mN2E1MzE0IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMNCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jDQo+ID4gQEAgLTM4Niw2ICszODYsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCByY2FyX2R1X29mX3RhYmxlW10NCj4g
PSB7DQo+ID4gIAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMsZHUtcjhhNzc0NCIsIC5kYXRhID0N
Cj4gJnJ6ZzFfZHVfcjhhNzc0M19pbmZvIH0sDQo+ID4gIAl7IC5jb21wYXRpYmxlID0gInJlbmVz
YXMsZHUtcjhhNzc0NSIsIC5kYXRhID0NCj4gJnJ6ZzFfZHVfcjhhNzc0NV9pbmZvIH0sDQo+ID4g
IAl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMsZHUtcjhhNzc0NzAiLCAuZGF0YSA9DQo+ID4gJnJ6
ZzFfZHVfcjhhNzc0NzBfaW5mbyB9LA0KPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLGR1
LXI4YTc3NGExIiwgLmRhdGEgPQ0KPiAmcmNhcl9kdV9yOGE3Nzk2X2luZm8NCj4gPiArfSwNCj4g
PiAgCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxkdS1yOGE3NzRjMCIsIC5kYXRhID0NCj4gJnJj
YXJfZHVfcjhhNzc0YzBfaW5mbyB9LA0KPiA+ICAJeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLGR1
LXI4YTc3NzkiLCAuZGF0YSA9ICZyY2FyX2R1X3I4YTc3NzlfaW5mbw0KPiB9LA0KPiA+ICAJeyAu
Y29tcGF0aWJsZSA9ICJyZW5lc2FzLGR1LXI4YTc3OTAiLCAuZGF0YSA9ICZyY2FyX2R1X3I4YTc3
OTBfaW5mbw0KPiA+IH0sDQo+ID4NCg0K
