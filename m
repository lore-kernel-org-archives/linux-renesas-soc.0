Return-Path: <SRS0=pEya=RU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BF8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 21:32:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F14620857
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 21:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="ZQmP72Vq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbfCQVcX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Mar 2019 17:32:23 -0400
Received: from mail-eopbgr80090.outbound.protection.outlook.com ([40.107.8.90]:58243
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726229AbfCQVcX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Mar 2019 17:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmNeqRSYYMNeAtlKTOTxpYRvw1r5Yg92eB9Ra/6Ah4w=;
 b=ZQmP72VqQ1F6Ri3Aim5mEtBdQU0yXcPj2xTxb1kvmskgflAytETHADu2X+oVrF6DssAHK9ADrM8bBEGKBdkbbrq0I2Ipvbvsc6XazJIfPsvLZFZKIwoJbx3IH2T3qvPMGz8GGCdiEQZQGn8S1C3IKpWtigFde2fbpCqfyNfkbnY=
Received: from VI1PR02MB4542.eurprd02.prod.outlook.com (20.178.12.74) by
 VI1PR02MB3886.eurprd02.prod.outlook.com (52.134.25.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Sun, 17 Mar 2019 21:32:17 +0000
Received: from VI1PR02MB4542.eurprd02.prod.outlook.com
 ([fe80::38db:37eb:b43e:e4c1]) by VI1PR02MB4542.eurprd02.prod.outlook.com
 ([fe80::38db:37eb:b43e:e4c1%6]) with mapi id 15.20.1709.011; Sun, 17 Mar 2019
 21:32:17 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v7 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Thread-Topic: [PATCH v7 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Thread-Index: AQHU2b2vWA4BAAcLsEOjwQVlZJY0jqYK/byAgAN9cwCAAeMbAA==
Date:   Sun, 17 Mar 2019 21:32:17 +0000
Message-ID: <93ded6d5-1688-896a-f42e-0bbeda446c1d@axentia.se>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <20190313165526.28588-3-wsa+renesas@sang-engineering.com>
 <a3fd63fb-0eec-78f3-992f-84194bf571dd@axentia.se>
 <20190316164308.GA1747@kunai>
In-Reply-To: <20190316164308.GA1747@kunai>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
x-originating-ip: [85.226.244.23]
x-clientproxiedby: HE1PR0202CA0010.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::20) To VI1PR02MB4542.eurprd02.prod.outlook.com
 (2603:10a6:803:b1::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23914ba1-d612-436c-d5d9-08d6ab200761
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);SRVR:VI1PR02MB3886;
x-ms-traffictypediagnostic: VI1PR02MB3886:
x-microsoft-antispam-prvs: <VI1PR02MB3886F6279E89F625828C79AABC460@VI1PR02MB3886.eurprd02.prod.outlook.com>
x-forefront-prvs: 09796A1B83
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39830400003)(376002)(396003)(346002)(136003)(52314003)(199004)(189003)(55674003)(106356001)(6436002)(6486002)(105586002)(65826007)(2616005)(68736007)(11346002)(54906003)(58126008)(508600001)(7736002)(71190400001)(81166006)(81156014)(8676002)(71200400001)(31696002)(14454004)(65956001)(93886005)(66066001)(31686004)(65806001)(2906002)(97736004)(86362001)(486006)(316002)(446003)(476003)(256004)(99286004)(305945005)(186003)(74482002)(6512007)(26005)(6506007)(386003)(102836004)(53936002)(52116002)(36756003)(25786009)(76176011)(5660300002)(6916009)(53546011)(229853002)(4326008)(64126003)(8936002)(6246003)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR02MB3886;H:VI1PR02MB4542.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kRe19T61Ycfo19uO4E/WZsu+PCMV8l6132dF/ZXYDx4IfSn9FFpXHvBy5YXa21PyxOWnW17h5i9R3/0ALbhATG6OhpFJnxoEL+AtFCZc6C9q4P1ja0mO0HcO8kwk1iPzfr11iRy8nlibsxBLfKm5g4bCsh3P3LB7XEI2qtcSXef1DDxbl5zir+LMcQUdGMfPM6ijicYgJZ+Po1gODz79WCmYydCuDTMKzqUJJBP5RL8vYVdTiLUkxbF4uATDbR5h/EVZ4gMFZjaVIw9+VC+cpDW5dvPA71X0oPduW/bieNIvggsygROb8Wktl7MKdqL15xEQYPV+8/0O2clDTxf8kiKANzbBwVS66sYbXRWg3n4INSuTdbcwqzl6DwpxzgjKauvLh5LP296DGwEYnwMz4Dj4jQKB+a0fbXJvwA9MSkg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB1A716C2674C540B705A78D3689E760@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 23914ba1-d612-436c-d5d9-08d6ab200761
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2019 21:32:17.2520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB3886
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gMjAxOS0wMy0xNiAxNzo0MywgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiANCj4+IEkgcGVyc29u
YWxseSByZWFsbHkgZGlzbGlrZSB0aGUgcHJvcG9zZWQgbmFtZS4gSXQgaXMgYWtpbiB0byB0aGUg
YWJvbWluYXRpb24NCj4+IHdoZXJlIHNvbWUgc29ydCBvZiBhYmJyZXZpYXRpb24gb2YgdGhlIHR5
cGVzIG9mIHZhcmlhYmxlcyBhcmUgaW5jbHVkZWQgYWxzbw0KPj4gaW4gdGhlIHZhcmlhYmxlIG5h
bWVzLiBJdCdzIHVzZWxlc3MgY2x1dHRlciwgYXQgbGVhc3QgdG8gbWUuDQo+IA0KPiBJbiBnZW5l
cmFsLCBJIGFncmVlIHdpdGggeW91Li4uDQo+IA0KPj4gSSBjYW4gc2VlIHRoYXQgeW91IGRvIG5v
dCB3YW50IHRvIGNoYW5nZSB0aGUgaTJjX25ld197ZGV2aWNlLGR1bW15fSBuYW1lcw0KPj4gc2lu
Y2UgdGhleSBhcmUga2luZCBvZiB3aWRlc3ByZWFkIGFuZCBJIGNhbiBhbHNvIHNlZSB0aGF0IHlv
dSB3YW50IHRvDQo+PiBtYXRjaCB0aGUgZGV2bV8gbmFtZSB3aXRoIHRoZSBub24tZGV2bV8gbmFt
ZS4gU28sIEkgc2VlICp3aHkqIHRoaXMgbmFtaW5nDQo+PiBpcyBhcyBpdCBpcywgYnV0IEkganVz
dCBkb24ndCBsaWtlIGl0Lg0KPiANCj4gLi4uIHlldCwgdGhlcmUgaXMgYW5vdGhlciByZWFzb24g
d2hpY2ggaXMgY29uc2lzdGVuY3kuIGkyY19uZXdfe2RldmljZSxkdW1teX0NCj4gcmV0dXJuIE5V
TEwgaWYgc29tZXRoaW5nIHdlbnQgd3JvbmcsIGFuZCBpZiB0aGUgZGV2bV8qIHZhcmlhbnRzIHJl
dHVybg0KPiBhbiBFUlJQVFIsIHRoaXMgaXMgc3VwZXIgY29uZnVzaW5nIGFuZCBlcnJvciBwcm9u
ZSBJTU8uIEFuZCB0aGUNCj4gZGlmZmVyZW5jZSBiZXR3ZWVuICdpMmNfbmV3X2R1bW15JyBhbmQg
J2kyY19yZWdpc3Rlcl9kdW1teScgZG9lc24ndCBtYWtlDQo+IHRoYXQgbW9yZSBjbGVhciwgSSB0
aGluay4NCj4gDQo+IEkgd291bGQgbG92ZSB0byBjb252ZXJ0IGFsbCBvZiB0aG9zZSBmdW5jdGlv
bnMgdG8gcmV0dXJuIGFuIGVycnB0ciBhdA0KPiBzb21lIHRpbWUuIEhvd2V2ZXIsIHRoZXkgYXJl
IHNvIHdpZGVzcHJlYWQgdGhhdCB0aGlzIGlzIGRpZmZpY3VsdC4gSQ0KPiBhY3R1YWxseSBoYWQg
YSBsb29rIHRvIGNvbnZlcnQgdGhlIHVzZXJzIHdpdGggY29jY2luZWxsZSwgYnV0IGhhbmRsaW5n
DQo+IHRoZSBlcnJvciBjYXNlcyBpcyBzbyBkaXZlcnNlIHRoYXQgSSBkb24ndCB0aGluayB0aGlz
IGlzIGEgd2F5IGZvcndhcmQuDQoNCk9rLCBpdCdzIHlvdXIgY2FsbCBvYnZpb3VzbHksIGFuZCBk
b2luZyBhIHJlbmFtZSBhd2F5IGZyb20gdGhlIF9wdHJlcnINCnN1ZmZpeCB3aGVuIHRoZSBvbGQg
bmFtZSBpcyBubyBsb25nZXIgaW4gdXNlIGlzIGVhc2llciB0aGFuIGNoYW5naW5nDQp0aGUgcmV0
dXJuIHZhbHVlIGNvbnZlbnRpb24uIFlvdSBqdXN0IGhhdmUgdG8gd2FpdCBhIGNvdXBsZSBvZiBy
ZWxlYXNlcw0Kc28gdGhhdCBzdHJhZ2dsZXJzIHRoYXQgYXJlIHNsb3cgdG8gdXBzdHJlYW0gZG9u
J3QgZ2V0IGNhdWdodCBieSB0aGUNCmNoYW5nZWQgc2VtYW50aWNzIHdoZW4gaXQgZXZlbnR1YWxs
eSBoYXBwZW5zLiBIb3dldmVyLCBteSBwb2ludCBpcyB0aGF0DQp0aGVzZSBjb252ZXJzaW9ucyB0
ZW5kIHRvIGRyYWcgb3V0LCBhbmQgaW4gdGhlIG1lYW50aW1lIHdlIGFyZSBzdHVjaw0Kd2l0aCB3
aGF0ZXZlciBuYW1lcyB3ZSBjaG9zZS4NCg0KUGVyaGFwcyBhZGQgYSBydWxlIHRvIGNoZWNrcGF0
Y2ggdG8gYXZvaWQgbmV3IGluc3RhbmNlcyBvZiB0aGUgbm93DQppbmZlcmlvciBpMmNfbmV3X3tk
ZXZpY2UsZHVtbXl9Pw0KDQpBbnl3YXksIHdoYXQgaGFwcGVucyBmb3IgdGhlIGNhbGxlcnMgdGhh
dCBpZ25vcmUgdGhlIHJldHVybiB2YWx1ZSBvZg0KdGhlc2UgZnVuY3Rpb25zPyBJcyB0aGF0IGFs
d2F5cyBhIGxlYWsgb3IgYXJlIHRoZXJlIGNhc2VzIHdoZW4gaXQgaXMgb2s/DQpfX211c3RfY2hl
Y2s/PyAobm90IGFwcGxpY2FibGUgZm9yIGRldm1fLi4uIG9mIGNvdXJzZSkNCg0KQ2hlZXJzLA0K
UGV0ZXINCg==
