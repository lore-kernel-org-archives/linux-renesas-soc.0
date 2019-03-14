Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82969C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 10:25:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99E202077B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 10:25:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="qPsC1yjC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbfCNKZb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 06:25:31 -0400
Received: from mail-eopbgr130122.outbound.protection.outlook.com ([40.107.13.122]:10342
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726737AbfCNKZa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 06:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kf3Z5GeZfeAjUQlDdo6iLfB5WLAOPNmds5MYA5molAE=;
 b=qPsC1yjCM8qM/raDo51kB44fJRQgg6gpZmdff9UJQ6RfVEepK6Fz/9zVTbiEJiiXK0kDQGqRAhkY76xCcKioWtiQcFslyyHMxLOruwSmeCvryOfAdHBsBX3sxlu7hVe1ZC3hPE9EPNdqPml1Lin39kvMDAALLbcFw++I2u3spj8=
Received: from VI1PR02MB4542.eurprd02.prod.outlook.com (20.178.12.74) by
 VI1PR02MB1311.eurprd02.prod.outlook.com (10.165.231.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Thu, 14 Mar 2019 10:25:25 +0000
Received: from VI1PR02MB4542.eurprd02.prod.outlook.com
 ([fe80::38db:37eb:b43e:e4c1]) by VI1PR02MB4542.eurprd02.prod.outlook.com
 ([fe80::38db:37eb:b43e:e4c1%6]) with mapi id 15.20.1686.021; Thu, 14 Mar 2019
 10:25:25 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v7 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Thread-Topic: [PATCH v7 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Thread-Index: AQHU2b2vWA4BAAcLsEOjwQVlZJY0jqYK7PmA
Date:   Thu, 14 Mar 2019 10:25:24 +0000
Message-ID: <a3fd63fb-0eec-78f3-992f-84194bf571dd@axentia.se>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <20190313165526.28588-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190313165526.28588-3-wsa+renesas@sang-engineering.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
x-originating-ip: [85.226.244.23]
x-clientproxiedby: HE1PR0901CA0046.eurprd09.prod.outlook.com
 (2603:10a6:3:45::14) To VI1PR02MB4542.eurprd02.prod.outlook.com
 (2603:10a6:803:b1::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c03d730b-b659-4e26-ebf7-08d6a8675e12
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);SRVR:VI1PR02MB1311;
x-ms-traffictypediagnostic: VI1PR02MB1311:
x-microsoft-antispam-prvs: <VI1PR02MB1311E920195569D79D9E8A25BC4B0@VI1PR02MB1311.eurprd02.prod.outlook.com>
x-forefront-prvs: 09760A0505
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(376002)(136003)(366004)(346002)(396003)(199004)(189003)(31696002)(106356001)(105586002)(54906003)(6486002)(110136005)(2501003)(81156014)(81166006)(74482002)(229853002)(8676002)(6512007)(6436002)(25786009)(36756003)(4326008)(2616005)(58126008)(53936002)(7736002)(508600001)(11346002)(2906002)(186003)(446003)(14454004)(316002)(486006)(65826007)(305945005)(65956001)(66066001)(476003)(71190400001)(71200400001)(386003)(102836004)(76176011)(53546011)(6506007)(65806001)(256004)(14444005)(26005)(6116002)(3846002)(68736007)(52116002)(31686004)(97736004)(99286004)(8936002)(86362001)(5660300002)(6246003)(64126003);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR02MB1311;H:VI1PR02MB4542.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +bP85LpH1JQeoC2p1Oone1pMdSbrQyyxjVxGNm6wSG0T2YaztKFI8k9FFuuHiRy5Y8eDJ0Mm8rwbc8KtW/32Dg7kPOFjjbV0vJD6axI1s8ETmb10+NbF4lHy/FOrYLn3P1RMkQVW8NewQyHSssHvdMPmY7kT8Hd7DcBM3TOUs5K5FCq9xcn/8L36L999OvjAl7e5HL89skfqMsbqyWwjpoC4dsThVTI7fT+BP2yyJoHoAiVtGbNwhHOTOtFBW9UYMWXkKc1AdQrhPnIyz0s9Np+es19fn3eXNcugHwd7dkPY6PS932Wu21pp37gR7w7kO3YQBlM/GEMkty7gW8u0o/phx//OPtSSiWC90ynL+G6ig4btkdbpJ3vk/iVfCAZcs6b96E0/nacAu1SqclRppA5kPTQDJ9Vjn2KBeeenX70=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87447DC3ABF2C442976ACC8F3CCDE2B3@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: c03d730b-b659-4e26-ebf7-08d6a8675e12
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2019 10:25:24.8340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB1311
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkhDQoNCkEgY29tbWVudCBmcm9tIHRoZSBwZWFudXQgZ2FsbGVyeS4uLg0KDQpPbiAyMDE5LTAz
LTEzIDE3OjU1LCBXb2xmcmFtIFNhbmcgd3JvdGU6DQo+IEZyb206IEhlaW5lciBLYWxsd2VpdCA8
aGthbGx3ZWl0MUBnbWFpbC5jb20+DQo+IA0KPiBpMmNfbmV3X2R1bW15IGlzIHR5cGljYWxseSBj
YWxsZWQgZnJvbSB0aGUgcHJvYmUgZnVuY3Rpb24gb2YgdGhlDQo+IGRyaXZlciBmb3IgdGhlIHBy
aW1hcnkgaTJjIGNsaWVudC4gSXQgcmVxdWlyZXMgY2FsbHMgdG8NCj4gaTJjX3VucmVnaXN0ZXJf
ZGV2aWNlIGluIHRoZSBlcnJvciBwYXRoIG9mIHRoZSBwcm9iZSBmdW5jdGlvbiBhbmQNCj4gaW4g
dGhlIHJlbW92ZSBmdW5jdGlvbi4NCj4gVGhpcyBjYW4gYmUgc2ltcGxpZmllZCBieSBpbnRyb2R1
Y2luZyBhIGRldmljZS1tYW5hZ2VkIHZlcnNpb24uDQo+IA0KPiBOb3RlIHRoZSBjaGFuZ2VkIGVy
cm9yIGNhc2UgcmV0dXJuIHZhbHVlIHR5cGU6DQo+IGkyY19uZXdfZHVtbXkgcmV0dXJucyBOVUxM
IHdoaWxzdCBkZXZtX25ld19pMmNfZHVtbXkgcmV0dXJucyBhbiBFUlJfUFRSLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4NCj4gW3dz
YTogcmVuYW1lIG5ldyBmdW5jdGlvbnMgdG8gJ2VycnB0cicgc3R5bGUgYW5kIGZpeCBtaW5vciBr
ZG9jIGlzc3Vlc10NCj4gU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0Bz
YW5nLWVuZ2luZWVyaW5nLmNvbT4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9uL2RyaXZlci1tb2Rl
bC9kZXZyZXMudHh0IHwgIDMgKysrDQo+ICBkcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMgICAg
ICAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGluY2x1
ZGUvbGludXgvaTJjLmggICAgICAgICAgICAgICAgICAgfCAgMyArKysNCj4gIDMgZmlsZXMgY2hh
bmdlZCwgNTAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZHJpdmVyLW1vZGVsL2RldnJlcy50eHQgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1tb2RlbC9kZXZy
ZXMudHh0DQo+IGluZGV4IGIyNzdjYWZjZTcxZS4uZTM2ZGM4MDQxODU3IDEwMDY0NA0KPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RyaXZlci1tb2RlbC9kZXZyZXMudHh0DQo+ICsrKyBiL0RvY3VtZW50
YXRpb24vZHJpdmVyLW1vZGVsL2RldnJlcy50eHQNCj4gQEAgLTI2Niw2ICsyNjYsOSBAQCBHUElP
DQo+ICAgIGRldm1fZ3Bpb19yZXF1ZXN0X29uZSgpDQo+ICAgIGRldm1fZ3Bpb19mcmVlKCkNCj4g
IA0KPiArSTJDDQo+ICsgIGRldm1faTJjX25ld19kdW1teV9lcnJwdHIoKQ0KPiArDQoNClRMO0RS
IENhbiB3ZSBjYWxsIHRoZSBuZXcgZnVuY3Rpb25zDQoNCmkyY19yZWdpc3Rlcl9kZXZpY2UNCmky
Y19yZWdpc3Rlcl9kdW1teQ0KZGV2bV9pMmNfcmVnaXN0ZXJfZHVtbXkNCg0Kb3INCg0KaTJjX2Fk
ZF9kZXZpY2UNCmkyY19hZGRfZHVtbXkNCmRldm1faTJjX2FkZF9kdW1teQ0KDQpvciBzb21ldGhp
bmc/IFBsZWFzZT8NCg0KSSBwZXJzb25hbGx5IHJlYWxseSBkaXNsaWtlIHRoZSBwcm9wb3NlZCBu
YW1lLiBJdCBpcyBha2luIHRvIHRoZSBhYm9taW5hdGlvbg0Kd2hlcmUgc29tZSBzb3J0IG9mIGFi
YnJldmlhdGlvbiBvZiB0aGUgdHlwZXMgb2YgdmFyaWFibGVzIGFyZSBpbmNsdWRlZCBhbHNvDQpp
biB0aGUgdmFyaWFibGUgbmFtZXMuIEl0J3MgdXNlbGVzcyBjbHV0dGVyLCBhdCBsZWFzdCB0byBt
ZS4NCg0KSSBjYW4gc2VlIHRoYXQgeW91IGRvIG5vdCB3YW50IHRvIGNoYW5nZSB0aGUgaTJjX25l
d197ZGV2aWNlLGR1bW15fSBuYW1lcw0Kc2luY2UgdGhleSBhcmUga2luZCBvZiB3aWRlc3ByZWFk
IGFuZCBJIGNhbiBhbHNvIHNlZSB0aGF0IHlvdSB3YW50IHRvDQptYXRjaCB0aGUgZGV2bV8gbmFt
ZSB3aXRoIHRoZSBub24tZGV2bV8gbmFtZS4gU28sIEkgc2VlICp3aHkqIHRoaXMgbmFtaW5nDQpp
cyBhcyBpdCBpcywgYnV0IEkganVzdCBkb24ndCBsaWtlIGl0Lg0KDQpJIGhhZCBhIGxvb2sgYXQg
YSBjb3VwbGUgb2YgdGhlIGkyY19uZXdfZHVtbXkgY2FsbCBzaXRlcywgYW5kIHNvbWUgb2YgdGhl
bQ0KY2FuIGJlIGVhc2lseSB1cGRhdGVkIHRvIHNpbXBseSBwYXNzIG9uIHRoZSBQVFJFUlIgaW5z
dGVhZCBvZiBoYXJkY29kaW5nDQpJTlZBTCAob3Igc29tZXRoaW5nKSBvbiBOVUxMLCBzb21lIG9m
IHRoZW0gaWdub3JlIHRoZSByZXR1cm4gdmFsdWUgKGFuZCBhcmUNCnRodXMgbm90IGFibGUgdG8g
Y2FsbCBpMmNfdW5yZWdpc3Rlcl9kZXZpY2UgY29ycmVjdGx5KSBhbmQgc29tZSBhcmUNCmRpZmZl
cmVudCBpbiBvdGhlciB3YXlzLiBJbiBzaG9ydCwgaXQgc2VlbXMgdGhhdCB0aGVyZSBhcmUgcGxl
bnR5IG9mIGdvb2QNCm9wcG9ydHVuaXRpZXMgdG8gdXBkYXRlIGxvdHMgb2YgY2FsbCBzaXRlcyB0
byB0aGUgbmV3IGludGVyZmFjZXMuDQoNCkhvd2V2ZXIsIGFmdGVyIG1vc3Qgb2YgdGhlIG1haW50
YWluZWQgdXNlcyBoYXZlIGJlZW4gdXBkYXRlZCB3ZSBhcmUgYm91bmQNCnRvIGhhdmUgYSB0YWls
IG9mIHVubWFpbnRhaW5lZCBjb2RlIHRoYXQgd2lsbCB1c2UgdGhlIG9sZCBpbnRlcmZhY2UuIEF0
DQpzb21lIHBvaW50LCBzb21lb25lIG1pZ2h0IGNvbnZlcnQgdGhlIHRhaWwgb2YgY2FsbCBzaXRl
cyB1c2luZyB0aGUgb2xkDQpOVUxMLXJldHVybmluZyBmdW5jdGlvbnMuIEF0IHRoYXQgcG9pbnQg
d2UgYXJlIHN0dWNrIHdpdGggYSBidW5jaCBvZiB1Z2x5DQpoeXN0ZXJpY2FsIGZvb19lcnJwdHIg
bmFtZXMuIEFuZCBhZ2FpbiBpdCB3aWxsIGJlIGEgZGF1bnRpbmcgc2VyaWVzIHRvDQpjaGFuZ2Ug
dGhlbSBhbGwgYXQgb25jZS4NCg0KQ2hlZXJzLA0KUGV0ZXINCg==
