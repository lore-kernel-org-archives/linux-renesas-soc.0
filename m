Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C1AC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 08:44:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29D2220851
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 08:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="d9VzBKiO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbfAQIoa (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 03:44:30 -0500
Received: from mail-eopbgr1300102.outbound.protection.outlook.com ([40.107.130.102]:43040
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725884AbfAQIoa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 03:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWawQs3fkXjHgn5cd1qtnZfnYWo7jT/tQEKW5969gzE=;
 b=d9VzBKiOVd/hLUcr6wwYgf9DFDuRswozj53wJXnvGgrhv3X/8ODenV/uJkcko4i9IZ/L2h9y+mWhLgvBo5Z6Z0eB0fr82DCKOD+6LyRbDNSFuaTb73sVuxkK2ZgtABDXhzt/AVa8/ErNjkq0vAZO9R+ShGyMJZ+3YnKTbvAvvnI=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB3579.jpnprd01.prod.outlook.com (20.178.141.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.19; Thu, 17 Jan 2019 08:44:25 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e%3]) with mapi id 15.20.1516.019; Thu, 17 Jan 2019
 08:44:24 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>,
        Phuong Nguyen <phuong.nguyen.xw@renesas.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: RE: [PATCH] dmaengine: usb-dmac: Make DMAC system sleep callbacks
 explicit
Thread-Topic: [PATCH] dmaengine: usb-dmac: Make DMAC system sleep callbacks
 explicit
Thread-Index: AQHUrg6SJ5NBG/A6VUuNOj6d/H2S2qWzIPCAgAAEU+A=
Date:   Thu, 17 Jan 2019 08:44:23 +0000
Message-ID: <TY2PR01MB48128C13D1D1EDFA750BA299D8830@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <1547692896-2362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <b922383c-51d8-e9ac-21ad-cf3c1e8fbbb6@cogentembedded.com>
In-Reply-To: <b922383c-51d8-e9ac-21ad-cf3c1e8fbbb6@cogentembedded.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY2PR01MB3579;20:3bEtrq2jJ7FmIbppP0+eWQebdibmmldNBahQoJZkmEPUouQh04OwtSIqtG1o7LAQr0diSShTELkl1yc5ss0IPv3zQugti886SgWVHn/bsiy4W/kMR+BlHxonfJSHCYGAnM6qUbeurKREWYRXsJmmxhGswAWAVmumUUAmnrkgDGQ=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(366004)(396003)(376002)(39860400002)(136003)(346002)(199004)(189003)(97736004)(25786009)(81166006)(106356001)(8676002)(55016002)(6916009)(53936002)(316002)(81156014)(99286004)(6246003)(54906003)(8936002)(345774005)(68736007)(66066001)(305945005)(4326008)(6436002)(9686003)(7736002)(486006)(229853002)(2906002)(105586002)(6116002)(11346002)(33656002)(53546011)(6506007)(14454004)(14444005)(446003)(478600001)(7696005)(5660300001)(3846002)(476003)(76176011)(74316002)(256004)(71200400001)(71190400001)(86362001)(26005)(186003)(102836004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB3579;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-office365-filtering-correlation-id: 57328eb7-5bbb-4a86-ada3-08d67c57fb78
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB3579;
x-ms-traffictypediagnostic: TY2PR01MB3579:
x-microsoft-antispam-prvs: <TY2PR01MB3579D2DEC801E8EB6B8616E3D8830@TY2PR01MB3579.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0920602B08
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wzcaKPE1bx2GYEk1f+lkpvSswMBkpnJhJYwL1iIiuqM/bMW4io2lI062J0tKb1f1yYVFOJiy5ZDtzzTvU/hAMvY4ZOrAP2Hdf4fhHtqbUbatYSHRjgCkshwVMyacPRgWEQT4c4gV7WCsLXfXx1s1w9C8sn1BZIgsFYxkyboF1cC5/YdirVVQsw0HqJpxWBQR55SbWV5OUwU1uSi//612nnAAnUHGRaRJ9wgUQe3MC82oscOLqH+twch0nvUNnDzkqfRFfW7xwLWbLSXeu3V2alf/klVapbQnwNGUsy/0aNDTjPbKfHdi3jWET3cWrIyHozkzsVNZCCQTlCCdEZxUEp1MCjyPh0Gy0cUC4E2OpopXwqb/cv51UnNaoYHpHbJomf7/VkjW/FEZrUc9Qg44hWCeMYLPCy0GypyYd2/vcIg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57328eb7-5bbb-4a86-ada3-08d67c57fb78
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 08:44:24.0111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3579
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgU2VyZ2VpLA0KDQo+IEZyb206IFNlcmdlaSBTaHR5bHlvdiwgU2VudDogVGh1cnNkYXksIEph
bnVhcnkgMTcsIDIwMTkgNToyOCBQTQ0KPiANCj4gT24gMTcuMDEuMjAxOSA1OjQxLCBZb3NoaWhp
cm8gU2hpbW9kYSB3cm90ZToNCjxzbmlwPg0KPiA+IFRvIHNvbHZlIHRoaXMsIG1ha2Ugc3lzdGVt
IHN1c3BlbmQgcmVzdW1lIGV4cGxpY2l0IGJ5IHVzaW5nDQo+ID4gcG1fcnVudGltZV9mb3JjZV97
c3VzcGVuZCxyZXN1bWV9KCkgYXMgdGhlIHN5c3RlbSBzbGVlcCBjYWxsYmFja3MuDQo+ID4gU0VU
X05PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMoKWlzIHVzZWQgdG8gbWFrZSBzdXJlIFVTQi1ETUFD
IHN1c3BlbmRlZA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiBzcGFjZSBt
aXNzaW5nIGhlcmUNCg0KVGhhbmsgeW91IGZvciB0aGUgcG9pbnRlZCBpdCBvdXQhIEknbGwgcmV2
aXNlIGl0IG9uIHYyLg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo=
