Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AD3C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 11:06:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5DD820879
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 11:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="hQ1+nrPs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbfAVLGR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 06:06:17 -0500
Received: from mail-eopbgr1310099.outbound.protection.outlook.com ([40.107.131.99]:40992
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727898AbfAVLGR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 06:06:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p61xHobQDks7TXncXS9w5WQLqti5d7tsGoGbNZI8l9k=;
 b=hQ1+nrPsBUsNxR4TzVl117PJQKOcP9Qd44GnuKnpb9Nzn0aknScn2jpULFAX5s03VFs/YQZE8e5PJq5j+KmtThpEI5a+U5wJjNhH5srEZDN1zVu+fFOzEB3Zwo/yYUqA6ScXYBaf7mFJ0QUXZ4fgIYLxcLKXxDyUoC3Zbzs2jvw=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB2570.jpnprd01.prod.outlook.com (20.177.98.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.27; Tue, 22 Jan 2019 11:06:12 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e%3]) with mapi id 15.20.1537.031; Tue, 22 Jan 2019
 11:06:12 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: BUG report on next-20190122: could not probe the ravb driver
Thread-Topic: BUG report on next-20190122: could not probe the ravb driver
Thread-Index: AdSyPCR41ZhYSHzPTU6yOzTiVkr33wABUTWAAAAg7RA=
Date:   Tue, 22 Jan 2019 11:06:12 +0000
Message-ID: <TY2PR01MB4812614B9FFE4EA11A010DF9D8980@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <TY2PR01MB4812D22909738F4D981B359ED8980@TY2PR01MB4812.jpnprd01.prod.outlook.com>
 <CAMuHMdUXKCzr33WNAznQN9v699vxg3sic2s78RxhVXfJePL1wg@mail.gmail.com>
In-Reply-To: <CAMuHMdUXKCzr33WNAznQN9v699vxg3sic2s78RxhVXfJePL1wg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY2PR01MB2570;20:bEke+KLKx0+W9AU6WnRcCiKo8QYcK4vPvmJoGlHjrkUWRnHW8H1lGUckTEO3umE8LCUHF4lCl+/8NlN4nptx1mTj0vS9tYS+Y9wrD0uUTLYP9u2Mo1a/K48KNIvY+W5SUuGOXFLTqJskr8A2XzLJC4k6TQQxsygl56eB7UDM+vM=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 904e3e10-46c7-4eac-dcfd-08d680599ed9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB2570;
x-ms-traffictypediagnostic: TY2PR01MB2570:
x-microsoft-antispam-prvs: <TY2PR01MB25703DA4E5EEA971153FCBC8D8980@TY2PR01MB2570.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39860400002)(376002)(136003)(346002)(396003)(199004)(189003)(74316002)(53546011)(476003)(71200400001)(66066001)(6436002)(102836004)(25786009)(97736004)(478600001)(186003)(68736007)(86362001)(71190400001)(6506007)(7696005)(6916009)(256004)(305945005)(7736002)(76176011)(81166006)(229853002)(486006)(14454004)(81156014)(8936002)(3846002)(6116002)(8676002)(2906002)(106356001)(33656002)(105586002)(316002)(446003)(26005)(53936002)(11346002)(9686003)(4326008)(6246003)(99286004)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB2570;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AB25Nz7Czz/fm19jFhDzGPHR6BnB7m/mWu6LrIVYf0q+7YnwCv6fda3Fj1dxypLOeABU7w3twF+MGdcCpkXi3e+XZIJhMImQeHAGhiT4GJfJr24j4Z1keQBOtNFwtv0pqGtvhkdo1XRwpOgQvNZrQhuDdAVfbpmWnB/PAfsnK5ffi0c69PZM5C22n6KA4SuAE3AHL4GwpuZ5cctu9BBdmBcezfTl1NM1EwZfAGEl8PG+uv9b8D9yC+npVTupMkO4XYowOFNQjmjIkTZjxcIILKzL8+UUV4hj4PBnScaTxubH+mldhSTY6Sa7mTXFwiVOR5zE9LYXMDrBiClDF3bFi3BNJ9zyRghmXK+AGVcgl+2tZFFH4/RoS+SydO/rJ9avBfk8cupvO5dpjiXyRORiBpxC4A0DBZA5PtPJSShqdVA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904e3e10-46c7-4eac-dcfd-08d680599ed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 11:06:12.3135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2570
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgSmFudWFyeSAyMiwgMjAxOSA3OjU5IFBNDQo+IA0KPiBIaSBTaGltb2RhLXNhbiwNCj4gDQo+
IE9uIFR1ZSwgSmFuIDIyLCAyMDE5IGF0IDExOjIzIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5
b3NoaWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gSSBnb3QgYSByZXBv
cnQgZnJvbSB0ZXN0IHRlYW0gdGhhdCBuZXh0LTIwMTkwMTIyIGNvdWxkIG5vdCBwcm9iZSB0aGUg
cmF2YiBkcml2ZXIgYXMgdGhlIGZvbGxvd2luZy4NCj4gPiBUaGUgdGVzdCB0ZWFtIGlzIHVzaW5n
IEgzIEVTMy4wIFNhbHZhdG9yLVhTIGFuZCBJIGNvdWxkIGFsc28gcmVwcm9kdWNlIHRoaXMgaXNz
dWUgb24gTTMtTiBTYWx2YXRvci1YUy4NCj4gPg0KPiA+IFsgMy4wMDU1NTddIHJhdmIgZTY4MDAw
MDAuZXRoZXJuZXQ6IGlnbm9yaW5nIGRlcGVuZGVuY3kgZm9yIGRldmljZSwgYXNzdW1pbmcgbm8g
ZHJpdmVyDQo+ID4gWyAzLjAxMzg2M10gbGlicGh5OiByYXZiX21paTogcHJvYmVkDQo+ID4gWyAz
LjAxNzc0M10gbWRpb19idXMgZTY4MDAwMDAuZXRoZXJuZXQtZmZmZmZmZmY6MDA6IGVycm9yIC0y
IGxvYWRpbmcgUEhZIGRyaXZlciBtb2R1bGUgZm9yIElEIDB4MDAyMjE2MjINCj4gPiBbIDMuMDI3
MjgzXSByYXZiIGU2ODAwMDAwLmV0aGVybmV0OiBmYWlsZWQgdG8gaW5pdGlhbGl6ZSBNRElPDQo+
ID4gWyAzLjAzMzE1N10gcmF2YjogcHJvYmUgb2YgZTY4MDAwMDAuZXRoZXJuZXQgZmFpbGVkIHdp
dGggZXJyb3IgLTINCj4gPg0KPiA+ICMgSSBkaWRuJ3QgaW52ZXN0aWdhdGUgdGhpcyBpc3N1ZSB5
ZXQgdGhvdWdoLi4uDQo+IA0KPiBMb29rcyBsaWtlIG90aGVyIHBlb3BsZSBzZWUgdGhpcyBvbiBv
dGhlciBTb0NzLCB0b28uDQo+IEJ1dCBJIGRpZG4ndCBzZWUgYSBzb2x1dGlvbiBtZW50aW9uZWQg
aW4gdGhvc2UgdGhyZWFkcy4NCg0KT2gsIEkgZ290IGl0Lg0KDQo+IEZXSVcsIEknbSBub3Qgc2Vl
aW5nIGl0IHdpdGggdGhlIHNvb24tdG8tYmUtcmVsZWFzZWQgcmVuZXNhcy1kcml2ZXJzIG9mDQo+
IHRvZGF5LCBzbyB0aGUgYnJlYWthZ2UgaXMgbm90IGluIG5ldC1uZXh0Lg0KDQpJdCdzIGdvb2Qg
bmV3cyEgSSBoYWQgd29ycmllZCBhYm91dCB0aGlzIHJlbmVzYXMtZHJpdmVycyA6KQ0KDQpCZXN0
IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
