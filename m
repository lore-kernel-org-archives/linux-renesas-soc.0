Return-Path: <SRS0=/KHX=RY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E229C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 12:16:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09F4F218D8
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 12:16:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Hy+Tj3Da"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbfCUMQq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Mar 2019 08:16:46 -0400
Received: from mail-eopbgr1400128.outbound.protection.outlook.com ([40.107.140.128]:18944
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727986AbfCUMQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Mar 2019 08:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6j0OpLweY0DMeKOvl6zUfP4IaKvTRJZO8SR6VVZDlY=;
 b=Hy+Tj3Da7xvHcv3jdZvrKedbsEExo1EJN1NYH/VKciX1NFKdUXJHdNZjRu/a3Lu7TPW7bA/MOiiipP70Mspspl8kj1DgX1d7YNdAVYOaqW6f/BDON/0L/NPZqLk0v2UUOjLSkVTKmBdXxbu6pl94PFrzTTHLslKfGKbqU7dS5no=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB1499.jpnprd01.prod.outlook.com (52.133.161.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Thu, 21 Mar 2019 12:16:42 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::195b:1385:70ae:194c]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::195b:1385:70ae:194c%2]) with mapi id 15.20.1709.015; Thu, 21 Mar 2019
 12:16:42 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] ARM: dts: rskrza1: Add I2C and remaining LEDs
Thread-Topic: [PATCH 0/2] ARM: dts: rskrza1: Add I2C and remaining LEDs
Thread-Index: AQHU31VQE49rVXGiT0GAAZ+LlWgMvaYU+PoggADi4YCAABXVoA==
Date:   Thu, 21 Mar 2019 12:16:42 +0000
Message-ID: <TY1PR01MB156269186D28360C36DAED0B8A420@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190320194410.14870-1-geert+renesas@glider.be>
 <TY1PR01MB15627B138E7BE709BC483E2A8A410@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdXG2wD9sbZY-1LY3d+AVA3BBjpjsn3zd3dJEi2r2BVEfg@mail.gmail.com>
In-Reply-To: <CAMuHMdXG2wD9sbZY-1LY3d+AVA3BBjpjsn3zd3dJEi2r2BVEfg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0174e2d-2b0b-410e-d505-08d6adf71439
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1499;
x-ms-traffictypediagnostic: TY1PR01MB1499:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <TY1PR01MB14999A50F726AE165AD202AB8A420@TY1PR01MB1499.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(346002)(39860400002)(136003)(376002)(189003)(199004)(106356001)(305945005)(478600001)(66066001)(446003)(316002)(33656002)(76176011)(2906002)(86362001)(11346002)(72206003)(3846002)(486006)(14454004)(8676002)(105586002)(966005)(6116002)(14444005)(256004)(71190400001)(8936002)(99286004)(71200400001)(7696005)(68736007)(4326008)(6246003)(26005)(186003)(81166006)(102836004)(476003)(74316002)(55016002)(81156014)(6506007)(6436002)(53936002)(6306002)(229853002)(9686003)(97736004)(25786009)(5660300002)(6916009)(52536014)(7736002)(54906003)(21314003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1499;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Smu9gGYDDXXxUWNOhcFg7z/oUQFTwTk4jVt9DTiiv6RAdn1+0aJFF++Vp2K7kGJG/4eHOJ7gfrZKLgLjWnTM/X/+3Juss/bjswJMvDB+qBvHnk7k2twFgT6ZgU3csfXUsBx16xz1PEAHH6Dk6LYim6B/fK3UEKkXFRmXNwG5OMrThfUzasA41v31oPRy2wD0Sm+QHVAjRZokS0n4iDhvJI1djEmpXTuGa8wHbC0nd3yjQgJx9iPeTusyJ0tY/PIWy6CZje4kT3gfsWEtb0ZEQhonXMHlfMq5mrF5NqboOiBse6STbrO+WkTZajc3P0dJ60uxf2X+qUug/NREFWmvoq2E3ozmFsN26xJxUpLdUuAHiFc+bAgg37/T4qXIexS2JmeBzCmY6c4APabx+SgKfR3cwkpRIn6nQWNPIWZ+rtE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0174e2d-2b0b-410e-d505-08d6adf71439
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 12:16:42.5514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1499
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCkxvb2sgd2hhdCBmdW4geW91IGFyZSBoYXZpbmcgd2l0aCBhbiBSWi9BMSBi
b2FyZCENCllvdSBtaWdodCBoYXZlIGV2ZW4gbW9yZSBmdW4gd2l0aCBhIFJaL0EyIGJvYXJkIDsp
DQoNCj4gSG93ZXZlciwgdGhhdCBhbHNvIGRvZXNuJ3Qgd29yaywgYXMgdGhlIFBMMzkwIEdJQyBz
dXBwb3J0cyByaXNpbmcgZWRnZQ0KPiBhbmQgaGlnaC1sZXZlbCBpbnRlcnJ1cHRzIG9ubHkuICBG
YWxsaW5nIGVkZ2UgYW5kIGxvdy1sZXZlbCBpbnRlcnJ1cHRzDQo+IG9uIHRoZSBJUlEgcGlucyBz
ZWVtIHRvIGJlIGFuIFJaL0ExLXNwZWNpZmljIEdJQyBleHRlbnNpb24sDQoNClllcy4gSSBnZXQg
dGhpcyBxdWVzdGlvbiBhIGNvdXBsZSB0aW1lcyBhIHllYXIuDQoNCkFuZCBubyBvbmUgd2FudHMg
cmlzaW5nIG9yIGxldmVsIGhpZ2gsIHNvIHRoZSBHUElPIGludGVycnVwdHMgd291bGQgbm90IA0K
d29yayBmb3IgdGhlbSBhbnl3YXkuDQoNClNvLCBhcyB5b3UgZm91bmQ6DQoNCj4gSSd2ZSBqdXN0
IGRpc2NvdmVyZWQgY29tbWl0IDIwN2MxMGI1NGNhODExMjkgKCJpcnEtZ2ljOiBhZGQgc3VwcG9y
dCBmb3INCj4gcGlucyBJUlEwLUlSUTciKSBpbiByemFfbGludXgtNC4xNCwgYnV0IHdoZW4gdXNp
bmcgdGhhdCwgdGhlIHN5c3RlbQ0KPiBsb2NrcyB1cCB3aGVuIHByZXNzaW5nIGEgc3dpdGNoIDot
KA0KDQpJdCBtaWdodCBiZSBiZWNhdXNlIHRoZSBpbnRlcnJ1cHQgcm91dGluZSBuZWVkcyB0byBn
byBpbiBhbmQgY2xlYXIgdGhlIA0KaW50ZXJydXB0IGJ5IHdyaXRpbmcgdG8gdGhlICdJUlEgSW50
ZXJydXB0IFJlcXVlc3QgUmVnaXN0ZXInIChJUlFSUikuDQpGcm9tIHRoZSBIVyBtYW51YWw6DQoN
CiJJUlFSUiBpcyBhIDE2LWJpdCByZWdpc3RlciB0aGF0IGluZGljYXRlcyBpbnRlcnJ1cHQgcmVx
dWVzdHMgZnJvbSANCmV4dGVybmFsIGlucHV0IHBpbnMgSVJRNyB0byBJUlEwLiBJZiBlZGdlIGRl
dGVjdGlvbiBpcyBzZXQgZm9yIHRoZSBJUlE3IHRvIA0KSVJRMCBpbnRlcnJ1cHRzLCB3cml0aW5n
IDAgdG8gdGhlIElSUTdGIHRvIElSUTBGIGJpdHMgYWZ0ZXIgcmVhZGluZyBJUlE3RiANCnRvIElS
UTBGID0gMSBjYW5jZWxzIHRoZSByZXRhaW5lZCBpbnRlcnJ1cHRzLiINCg0KDQpUaGUgdG91Y2hz
Y3JlZW4gZHJpdmVyIGZvciB0aGUgTENEIHVzZXMgSVJRX1RZUEVfTEVWRUxfTE9XLiANCkluIHRo
ZSBpbnRlcnJ1cHQgcm91dGluZSBmdDV4MDZfdHNfaXNyLCBkaXNhYmxlX2lycV9ub3N5bmMoaXJx
KSBpcyBjYWxsZWQgaW1tZWRpYXRlbHkuDQpUaGVuIGFmdGVyIHRoZSB0b3VjaCBwb2ludCBpcyBy
ZWFkIG91dCwgZW5hYmxlX2lycSh0cy0+Y2xpZW50LT5pcnEpIGlzIGNhbGxlZCBpbiBmdDV4MDZf
dHNfcG9zY2hlY2suDQpodHRwczovL2dpdGh1Yi5jb20vcmVuZXNhcy1yei9yemFfbGludXgtNC4x
OS9ibG9iL21hc3Rlci9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2Z0NXgwNl90cy5jI0wyMzIN
Cg0KDQo+IFdoYXQgYW0gSSBkb2luZyB3cm9uZz8NCj4gRG8geW91IGhhdmUgYSBiZXR0ZXIgc29s
dXRpb24/DQo+IFRoZSBJUlF4IHN1cHBvcnQgbG9va3MgbW9zdCBwcm9taXNpbmcsIGJ1dCBuZWVk
cyBzb21lIHdvcmsgKHNlcGFyYXRlDQo+IGNvbXBhdGlibGUgdmFsdWUsIHNtYWxsIGRyaXZlciB3
aXRoIGEgY3VzdG9tIC5pcnFfc2V0X3R5cGUsIGRlZmVycmluZw0KPiB0aGUgcmVzdCB0byB0aGUg
bm9ybWFsIEdJQyBkcml2ZXIpLg0KDQpJIG5vdCBzdXJlIGFib3V0IGEgJ2JldHRlcicgc29sdXRp
b24uLi5qdXN0IHRoZSBvbmUgSSB0ZWxsIHBlb3BsZSANCihhbHRob3VnaCBJIG5lZWQgdG8gbWFr
ZSBzb21lIEFwcCBOb3RlIHNvbWVkYXkpLg0KDQpCYXNpY2FsbHksIEkgdGVsbCBwZW9wbGUgdGhl
eSBuZWVkIHRvIGRlc2NyaWJlIHRoZSBJUlEgaW4gdGhlIERldmljZSANClRyZWUgc29tZXdoZXJl
IChzbyBpdCBjYW4gZ2V0IGFsbG9jYXRlZCBhbiBpbnRlcnJ1cHQgSUQpLg0KVGhlbiwgdGhleSBj
YW4gY2FsbCByZXF1ZXN0X2lycSgpIGZyb20gaW5zaWRlIGEgY3VzdG9tIGRyaXZlciBpZiB0aGV5
IA0Kd2FudCB0by4NCk9yLCB0aGV5IGp1c3QgbWFrZSBhIHZlcnkgc2ltcGxlIHNoaW0tZHJpdmVy
IGluIHRoZWlyIGJvYXJkLXh4eC5jIGZpbGUgDQp0aGF0IHJlZ2lzdGVycyB0aGUgaW50ZXJydXB0
IGFuZCBoYXMgYSBzaW1wbGUgaW50ZXJydXB0IHJvdXRpbmUuIE1hbnkgDQp0aW1lcyBhbGwgcGVv
cGxlIHdhbnQgdG8gZG8gaXMgc2ltcGx5IHdpcmUgdXAgYW4gaW50ZXJydXB0IHRoYXQgdGhlIA0K
YXBwbGljYXRpb24gY2FuIHdhaXQgb24uIE9yLCB1c2UgYW4gSVJRIHBpbiB0byBzdGFydCBhbiBB
REMgY29udmVyc2lvbi4gUHJldHR5IA0Kc2ltcGxlIHN0dWZmLg0KDQpPZiBjb3Vyc2UgdGhleSBj
YW4gYWxzbyB1c2UgYSBVSU8gZHJpdmVyIHRvIGRvIHRoZXNlIGtpbmRzIG9mIHRoaW5ncyBhcyAN
CndlbGwuDQpBcyB5b3Uga25vdywgdGhlIFVJTyBzdWJzeXN0ZW0gd2lsbCBhdXRvbWF0aWNhbGx5
IHR1cm4gb2YgdGhlIGludGVycnVwdCANCmVhY2ggdGltZSwgYnV0IHVzZXJzIHN0aWxsIG5lZWQg
dG8gd3JpdGUgdG8gdGhlIElSUVJSIHJlZ2lzdGVyIGJlZm9yZSANCnR1cm5pbmcgdGhlIGludGVy
cnVwdCBiYWNrIG9uIGlmIHVzaW5nIGVkZ2UgaW50ZXJydXB0cy4NCg0KSSBhbHdheXMgdGhvdWdo
dCB3aGF0IEkgcmVhbGx5IG5lZWQgdG8gZG8gaXMgaW5zdGVhZCBqdXN0IG1ha2UgYSANCnNlcGFy
YXRlIGRyaXZlciBsaWtlIHlvdSBzdWdnZXN0ZWQgYWJvdmUgYmVjYXVzZSB0ZWNobmljYWwsIHRo
ZSAiSVJRIiBibG9jayBpcyANCm5vdCByZWFsbHkgcGFydCBvZiB0aGUgR0lDLCBpdCBpcyBhIHNl
cGFyYXRlIGJsb2NrIHRoYXQgZmVlZHMgaW50ZXJydXB0cw0KaW50byB0aGUgR0lDIGp1c3QgbGlr
ZSBhbGwgdGhlIG90aGVyIHBlcmlwaGVyYWxzLCBzbyBpdCBzaG91bGQgYmUgDQpyZXByZXNlbnRl
ZCBhcyBhIHNlcGFyYXRlIHBpZWNlIG9mIGhhcmR3YXJlIChpZSwgaXRzIG93biBkcml2ZXIgYW5k
IA0KY2FwYWJpbGl0eSBzdHJpbmcpLg0KDQoNCkZvciB3aGF0IGl0J3Mgd29ydGgsIHRoZSBSWi9B
MiBoYXMgdGhlIGV4YWN0IHNhbWUgSVJRcywgc28gaWYgSSBldmVyIGdvdA0KYXJvdW5kIGZvciBk
b2luZyBpdCBmb3IgUlovQTEsIGl0IGNvdWxkIGFsc28gYmUgdXNlZCBmb3IgUlovQTIuDQoNCkNo
cmlzDQo=
