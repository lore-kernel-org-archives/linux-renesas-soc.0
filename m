Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B80C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 14:09:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06C7721726
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 14:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="R0sp1lzt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfAWOJi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 09:09:38 -0500
Received: from mail-eopbgr1400100.outbound.protection.outlook.com ([40.107.140.100]:26000
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726684AbfAWOJi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 09:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGTmiH5Pjdo9dTR9P5BjfEm8iLqu+ySOnA4ztAJ4Dyk=;
 b=R0sp1lztOEZTwYjYNHh4BcuWZhS6BWHDVfV4lpsJDM9I/Gz0M0zlWaTwFnZUfSz8DQG33wTba6rkOTlS/yAic0QQXWDt7kqBdLNtc3nql62v4TZxb9wGt5tXa2oXLTdnMELT0ldFZSuAnY4nvPk81PMmBv1ZrRlOTXwze/dJQ9M=
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com (52.133.166.145) by
 TYXPR01MB1854.jpnprd01.prod.outlook.com (52.133.165.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.16; Wed, 23 Jan 2019 14:09:35 +0000
Received: from TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::d62:1ccd:ff3d:f2a]) by TYXPR01MB1568.jpnprd01.prod.outlook.com
 ([fe80::d62:1ccd:ff3d:f2a%5]) with mapi id 15.20.1558.016; Wed, 23 Jan 2019
 14:09:34 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: arm: renesas: Document RZ/A2M EVB
Thread-Topic: [PATCH] dt-bindings: arm: renesas: Document RZ/A2M EVB
Thread-Index: AQHUsyJkFshxCv8Ka02o2a3Na6PmfKW84W4AgAAA9RA=
Date:   Wed, 23 Jan 2019 14:09:34 +0000
Message-ID: <TYXPR01MB1568588CC80BDB074A4FADA08A990@TYXPR01MB1568.jpnprd01.prod.outlook.com>
References: <20190123134833.119031-1-chris.brandt@renesas.com>
 <CAL_JsqKuDzL2N_fihJzUEZ9uRK5HWd1ARD7DzZZM7Dy4C8M_BA@mail.gmail.com>
In-Reply-To: <CAL_JsqKuDzL2N_fihJzUEZ9uRK5HWd1ARD7DzZZM7Dy4C8M_BA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TYXPR01MB1854;20:IIuIUR5s1Lb5DiV0bkqmJP4pfoFaMw/+c4xPf1lHbqY66eYm9ImHEDNMGotlVYcHxD9pui1HEOP0NY5Wiu+OFcvhc5UjASwvGmgzXisrgayZ7m8L5Fs8HTYU9ZyYl6VkFWdChSIBr0m7BtFoxMX60VMsOMkErBQNimCeQYBjF+0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: f9404e7e-28cf-45d8-2a9f-08d6813c6743
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:TYXPR01MB1854;
x-ms-traffictypediagnostic: TYXPR01MB1854:
x-microsoft-antispam-prvs: <TYXPR01MB1854645940F8983B5A1067A78A990@TYXPR01MB1854.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(346002)(39850400004)(376002)(366004)(189003)(199004)(74316002)(81156014)(81166006)(86362001)(71190400001)(71200400001)(8936002)(6436002)(229853002)(9686003)(305945005)(55016002)(68736007)(2906002)(97736004)(72206003)(476003)(486006)(8676002)(7736002)(478600001)(446003)(66066001)(11346002)(256004)(33656002)(14454004)(6506007)(54906003)(6246003)(7696005)(76176011)(25786009)(105586002)(102836004)(99286004)(26005)(6116002)(186003)(316002)(53936002)(3846002)(106356001)(4326008)(4744005);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1854;H:TYXPR01MB1568.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7m8/fU5dcGGpM0Gm6VrXpbnHILf5DrmTkg5YnIXOFbYVlHNwhBofpTstbWwEVxPzLPWfDov0NEJa3XMCmjXYWXDzEYaQa7fvuUBdUT+Y4XOz2hxxIllybNix3HZOcPySVUJ6RSo+VKDgHrBYiHm2iYyiDSW3Lav7aAhxa4ovAqYoZuk+yOiCt6dh42NCGxanY3JSG8wWjfAJsAL77gMt8g+QMn4uoxsWY2NzE9YmK8nmVLWZjOhsEp3xAlrZyCb4vuxro47ikapZszrA9BRtSOU152VOTle7nrDFO8MmU39yr497YXlPM22GfwR9ScqYsne6995Pj9wffxiF9WRkNqgGKqoDgSQtHxLDHVoO3kE2VSS9QyVwfZr2qmo+BBUowg9oYiHQIT41k1UWzdmu1OPgUVxv63gMa2ZicWmxMrM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9404e7e-28cf-45d8-2a9f-08d6813c6743
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 14:09:34.6386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1854
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gV2VkbmVzZGF5LCBKYW51YXJ5IDIzLCAyMDE5LCBSb2IgSGVycmluZyB3cm90ZToNCj4gUGxl
YXNlIGNoZWNrIHlvdXIgY2hhbmdlcyB3aXRoICdkdF9iaW5kaW5nX2NoZWNrJyB0YXJnZXQuIFRo
aXMgd2lsbA0KPiBmYWlsLiAnZGVzY3JpcHRpb24nIGFscmVhZHkgaGFzIGEgdmFsdWUsIHNvIHlv
dSBjYW4ndCBhZGQgYSBsaXN0IHRvDQo+IGl0LiBBbmQgZGVzY3JpcHRpb24gaGFzIHRvIGJlIGEg
c3RyaW5nLg0KPiANCj4gPiAgICAgICAgICBpdGVtczoNCj4gDQo+IE1vdmUgdGhlIDIgbGluZXMg
aGVyZS4NCj4gDQo+ID4gICAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHI3czkyMTANCg0KSSBj
YW4ndCBmaW5kICdkdF9iaW5kaW5nX2NoZWNrJyAoSSBndWVzcyBpdCdzIG9ubHkgaW4gdGhlIERU
IHRyZWUpLg0KDQpCdXQsIEkgY2FuIHNlZSBteSBtaXN0YWtlIChub3cgdGhhdCB5b3UgcG9pbnRl
ZCBpdCBvdXQpLg0KDQpDaHJpcw0KDQo=
