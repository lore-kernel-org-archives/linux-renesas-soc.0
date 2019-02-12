Return-Path: <SRS0=s4Ke=QT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A47EC282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 10:17:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E48622077B
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 10:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="OBWjNrKa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfBLKRX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Feb 2019 05:17:23 -0500
Received: from mail-eopbgr1410090.outbound.protection.outlook.com ([40.107.141.90]:36799
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726003AbfBLKRX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Feb 2019 05:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdmMsbianKXkspwuWCtU9nuwYrWu1pU0S2DX37sxgVM=;
 b=OBWjNrKakZA41fnHjDdXf+TfUVpyf7s6iCr9FKJEkjmkrNFeMMQ945QlLpfOBVGiU9QCwrAXDvGKOzovN5U6rMhA5pzjaXGv7onkZWWCezjuQyiJhN7ckdQW1ixlWxvk940N6AIZZXcfRVx7MWxqc6gV9CV1QifeXyc+qBYhk/Y=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.241.22) by
 OSBPR01MB1973.jpnprd01.prod.outlook.com (52.134.240.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.17; Tue, 12 Feb 2019 10:17:14 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::5de1:aceb:57be:16c3]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::5de1:aceb:57be:16c3%5]) with mapi id 15.20.1601.023; Tue, 12 Feb 2019
 10:17:14 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/5] Add CMT/TMU support for RZ/G2E
Thread-Topic: [PATCH v2 0/5] Add CMT/TMU support for RZ/G2E
Thread-Index: AQHUvGuLaoUcjJaFB0qwHb8WGGML76Xb+48AgAACojA=
Date:   Tue, 12 Feb 2019 10:17:14 +0000
Message-ID: <OSBPR01MB210392463D9EB86AE0BE8C36B8650@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1549272007-33471-1-git-send-email-biju.das@bp.renesas.com>
 <86c16302-8f7e-52b6-d183-5a90c8a0fc85@linaro.org>
In-Reply-To: <86c16302-8f7e-52b6-d183-5a90c8a0fc85@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB1973;20:b7MTWaFyl6e4nIgqWxEBZ+eA9WBFt9RDQ9zEtPqKcp5/omxv7NVLa9kbgQSNZ02/luMPo/VqAjY2UehZ+Ek+h4zEg3ijHx08XijA7tV49FDvpiiefN7p/9DOvuf9V93EeisvS2ynlGgjoFLHAyYExq9m295JfK0AtwpZrhaX0/g=
x-ms-office365-filtering-correlation-id: d17a5a2e-6141-4a08-8e0e-08d690d34283
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB1973;
x-ms-traffictypediagnostic: OSBPR01MB1973:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <OSBPR01MB197337C9EE8C1238EF7E368EB8650@OSBPR01MB1973.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0946DC87A1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(396003)(39860400002)(136003)(366004)(51914003)(199004)(189003)(13464003)(6436002)(76176011)(7696005)(68736007)(71190400001)(81156014)(81166006)(74316002)(71200400001)(53376002)(476003)(2906002)(99286004)(446003)(44832011)(53936002)(486006)(4326008)(11346002)(33656002)(305945005)(8936002)(66066001)(6246003)(316002)(3846002)(55016002)(256004)(54906003)(110136005)(229853002)(8676002)(26005)(25786009)(9686003)(7736002)(105586002)(97736004)(6116002)(6306002)(53546011)(186003)(6506007)(86362001)(106356001)(14454004)(102836004)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1973;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Cu9zeoOcfIUeEw4yQu7IntBtr0c5h8UOFOFGfDm5tT8wTDT9CJC4skPXBIpqVvkWQUYNBwnNCxlcv9M1+psYiMKwAoJeVE1cKwU3LUaP8eNlr0QfeyZWSOyFz7t9l8S7aXuaLs6JZD8WRbr8iIHJNRL6j2T3OHDFDXKHyDYV3x3acJgdJL16p23OoFyeWhUGJ9UsQpnrM08VRdX1VfBUsHndb/kXstuGtLCebIfZMD79xSwf7C77M7AEAbv1QF+46RWcSGfJKSJL6jNBrlDF4/u0CGJLDM5cgwaBRkhmheKKpYEgygUbtyQOPqiNMddkUnx2QYSJnVkBuRQedwDcdCfmRMMkfzsaDQjMD3iBpJLem9qv/Y0O2F0IOKqVf/E9pcbXEOxgrkCLay4+uo6QXHUAESz4BCBNw5ymvUWKVuY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17a5a2e-6141-4a08-8e0e-08d690d34283
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2019 10:17:14.6499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1973
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgRGFuaWVsLA0KDQpUaGFua3MgIGZvciAgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0Bs
aW5hcm8ub3JnPg0KPiBTZW50OiAxMiBGZWJydWFyeSAyMDE5IDEwOjAzDQo+IFRvOiBCaWp1IERh
cyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+OyBSb2IgSGVycmluZw0KPiA8cm9iaCtkdEBrZXJu
ZWwub3JnPjsgTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4NCj4gQ2M6IFRob21h
cyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7DQo+IFNpbW9uIEhvcm1hbiA8aG9ybXNAdmVyZ2UubmV0LmF1PjsgR2VlcnQgVXl0dGVyaG9l
dmVuDQo+IDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IENocmlzIFBhdGVyc29uDQo+IDxDaHJp
cy5QYXRlcnNvbjJAcmVuZXNhcy5jb20+OyBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNh
c3Ryb0BicC5yZW5lc2FzLmNvbT47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAvNV0gQWRkIENNVC9UTVUgc3VwcG9ydCBmb3IgUlov
RzJFDQo+DQo+IE9uIDA0LzAyLzIwMTkgMTA6MjAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IFRoaXMg
cGF0Y2ggc2VyaWVzIGFpbXMgdG8gYWRkIENNVC9UTVUgdGltZXIgc3VwcG9ydCBmb3IgUlovRzJF
IFNvQy4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIHRlc3RlZCBhZ2FpbnN0IHJlbmVz
YXMtZGV2IGFuZCBsaW51eC1uZXh0Lg0KPg0KPiBEbyB5b3Ugd2FudCBtZSB0byB0YWtlIHRoZSBw
YXRjaCAxLzUgYW5kIDQvNSB0aHJvdWdoIG15IHRyZWUgPw0KDQpZZXMsIHBsZWFzZS4NCg0KPiA+
IC0tLS0tDQo+ID4gVjEgLS0+VjIgSW5jb3BvcmF0ZWQgR2VlcnQncyByZXZpZXcgY29tbWVudCBm
b3IgVE1VIGNsb2NrDQo+ID4NCj4gPiBCaWp1IERhcyAoNSk6DQo+ID4gICBkdC1iaW5kaW5nczog
dGltZXI6IHJlbmVzYXMsIGNtdDogRG9jdW1lbnQgcjhhNzc0YzAgQ01UIHN1cHBvcnQNCj4gPiAg
IGFybTY0OiBkdHM6IHJlbmVzYXM6IHI4YTc3NGMwOiBBZGQgQ01UIGRldmljZSBub2Rlcw0KPiA+
ICAgY2xrOiByZW5lc2FzOiByOGE3NzRjMDogQWRkIFRNVSBjbG9jaw0KPiA+ICAgZHQtYmluZGlu
Z3M6IHRpbWVyOiByZW5lc2FzOiB0bXU6IERvY3VtZW50IHI4YTc3NGMwIGJpbmRpbmdzDQo+ID4g
ICBhcm02NDogZHRzOiByZW5lc2FzOiByOGE3NzRjMDogQWRkIFRNVSBkZXZpY2Ugbm9kZXMNCj4g
Pg0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yZW5lc2FzLGNtdC50eHQgICAg
ICB8ICAgMiArDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3JlbmVzYXMsdG11
LnR4dCAgICAgIHwgICAxICsNCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I4YTc3
NGMwLmR0c2kgICAgICAgICAgfCAxMzUNCj4gKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGRy
aXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc0YzAtY3BnLW1zc3IuYyAgICAgICAgICAgIHwgICA1ICsN
Cj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNDMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+DQo+DQo+IC0t
DQo+ICA8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFSTSBTb0NzDQo+DQo+IEZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5m
YWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8DQo+IDxodHRwOi8vdHdpdHRlci5j
b20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwgPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8t
DQo+IGJsb2cvPiBCbG9nDQoNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBHbWJILEdl
c2NoYWVmdHNmdWVocmVyL1ByZXNpZGVudCA6IE1pY2hhZWwgSGFubmF3YWxkLCBTaXR6IGRlciBH
ZXNlbGxzY2hhZnQvUmVnaXN0ZXJlZCBvZmZpY2U6IER1ZXNzZWxkb3JmLCBBcmNhZGlhc3RyYXNz
ZSAxMCwgNDA0NzIgRHVlc3NlbGRvcmYsIEdlcm1hbnksSGFuZGVsc3JlZ2lzdGVyL0NvbW1lcmNp
YWwgUmVnaXN0ZXI6IER1ZXNzZWxkb3JmLCBIUkIgMzcwOCBVU3QtSUROci4vVGF4IGlkZW50aWZp
Y2F0aW9uIG5vLjogREUgMTE5MzUzNDA2IFdFRUUtUmVnLi1Oci4vV0VFRSByZWcuIG5vLjogREUg
MTQ5Nzg2NDcNCg==
