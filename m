Return-Path: <SRS0=AddW=QB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8E1C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 12:27:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0EEBE218D9
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 25 Jan 2019 12:27:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="VAKyYn4F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbfAYM1D (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 25 Jan 2019 07:27:03 -0500
Received: from mail-eopbgr1410122.outbound.protection.outlook.com ([40.107.141.122]:19635
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725909AbfAYM1D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jan 2019 07:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybUqz/fMDZU3aSwBWO/6O75QTRh7n29yF3HH3uVXlXk=;
 b=VAKyYn4FY33DmFuc9tD5FKMBSv8DpQRw3QuKEDfOCUSSrAIRy+zWaD1vN9DYz0Wjydrp2uC9eQR+39NsSDZQaKTfNIOXCy0QZ+tpLpekRBC3f3P/IRzt32661aV0/2acFsDtp2Uye95CsLOACuVZbd3XWuD8iFc5/WRUtsSDOps=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.241.22) by
 OSBPR01MB3030.jpnprd01.prod.outlook.com (52.134.254.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.18; Fri, 25 Jan 2019 12:26:55 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9cb9:6c95:2d20:7852]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::9cb9:6c95:2d20:7852%2]) with mapi id 15.20.1558.016; Fri, 25 Jan 2019
 12:26:55 +0000
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
Thread-Index: AQHUbQZ8TtZTW3QcxUq23D537RtyIaW+wYkAgAGiYjCAABHU8A==
Date:   Fri, 25 Jan 2019 12:26:54 +0000
Message-ID: <OSBPR01MB210397F6201DBAC36BFB0CB2B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdW-qt+3iNit1wVxN2JyRwCArJzBNvvjDZJyxYRjvDkLuA@mail.gmail.com>
 <OSBPR01MB21034B1D07C9BA05859AEA73B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21034B1D07C9BA05859AEA73B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB3030;20:KNq8X/W2XQQo4omtoEExRpXO1+mkV+SLpOlV/TpOyqldWl2A1fWNr+4eKSuQlBA3Ypf3n/O2jnbeacu8D1AY2SzsajsDkV/OiQBLuAUf+QCisNk0ecm8TvvL9Aa/i7+bek4ahcaHgISvfwz4W63tM8wjg0MoUeUbPO8MdDD5ePw=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: ede3e779-d033-4945-f4ba-08d682c064af
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB3030;
x-ms-traffictypediagnostic: OSBPR01MB3030:
x-microsoft-antispam-prvs: <OSBPR01MB30309B2EAD5B3345A28B7B3BB89B0@OSBPR01MB3030.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0928072091
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(366004)(346002)(396003)(39860400002)(51914003)(13464003)(199004)(189003)(53754006)(102836004)(2906002)(39060400002)(6506007)(68736007)(53546011)(66066001)(316002)(8676002)(26005)(7416002)(229853002)(186003)(99286004)(71190400001)(54906003)(106356001)(6246003)(105586002)(71200400001)(25786009)(478600001)(966005)(33656002)(2940100002)(110136005)(97736004)(55016002)(7696005)(14454004)(11346002)(446003)(81156014)(53936002)(14444005)(305945005)(256004)(486006)(86362001)(81166006)(44832011)(6306002)(476003)(4326008)(8936002)(3846002)(93156006)(76176011)(74316002)(7736002)(9686003)(6436002)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3030;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0k56v8MqlFuzx4EskSKdmsoVUpK5p1Xn/atmT82fdYvVL45Oe2BzJ/hG6GbvuL5ZUudf6FYbbHvEY8RN1RM+ytvALv2LY4bk46QNeLglxQvJ53TH9T2ZqCmA22+kYxgjgceR+dQfRp/Z7p9XYJFrIoVlg9Jx2TCP26250CQwDrRaA849NawWJGFIFYlHGGOB3TJjX2Gst2fJ9hRcQa9cpwvx0GA2pDIdTNZCt3KnbdbEkyoNbGomXHsOQwNHqHsx0TCq55x+x1EwQuDJQZ24ag3SgNHqpxCRR37eVlNT+NqRBD7YC3YrQWrwQ0eqcgaVQB9HUyKiDQRghflelIKAogO/sn6fJSbwr8q1U24OKYvIZErcfGxRYqXXM0q2EEClBH36dd7nHj67fc4+/zO6c59ypV1biuLl7asqFQKKXsg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede3e779-d033-4945-f4ba-08d682c064af
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2019 12:26:54.9713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3030
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQWxsLA0KDQpJIGhhdmUgZW5hYmxlZCBsb2NrIGRlYnVnZ2luZyAgYW5kIGl0IGlzIHNob3dp
bmcgInBvc3NpYmxlIHJlY3Vyc2l2ZSBsb2NraW5nIGRldGVjdGVkICJ3aXRoIHRoZSBwYXRjaCAo
IjgyMzRmNjczNGM1ZDc0YWM3OTRlNTUxNzQzN2Y1MWM1N2Q2NWY4NjUiICAgUE0tcnVudGltZTog
U3dpdGNoIGF1dG9zdXNwZW5kIG92ZXIgdG8gdXNpbmcgaHJ0aW1lcnMpDQoNCnJvb3RAc2FsdmF0
b3IteDp+IyBlY2hvICBlNjBmMDAwMC50aW1lciA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY2xvY2tz
b3VyY2UvY2xvY2tzb3VyY2UwL2N1cnJlbnRfY2xvY2tzb3VyY2UNClsgICA2Ny45OTU4NTRdDQpb
ICAgNjcuOTk3MzU0XSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KWyAgIDY4LjAwMjY2M10gV0FSTklORzogcG9zc2libGUgcmVjdXJzaXZlIGxvY2tpbmcgZGV0
ZWN0ZWQNClsgICA2OC4wMDc5NzRdIDUuMC4wLXJjMy1uZXh0LTIwMTkwMTI1LTAwMDA1LWczODI4
MjJiICMzMSBOb3QgdGFpbnRlZA0KWyAgIDY4LjAxNDE1MF0gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClsgICA2OC4wMTk0NTldIG1pZ3JhdGlvbi8wLzExIGlz
IHRyeWluZyB0byBhY3F1aXJlIGxvY2s6DQpbICAgNjguMDI0NTA5XSAwMDAwMDAwMDY1ZGU1ZmRm
ICh0a19jb3JlLnNlcSl7LS0tLX0sIGF0OiBycG1fcmVzdW1lKzB4NWYwLzB4N2E4DQpbICAgNjgu
MDMxNTcwXQ0KWyAgIDY4LjAzMTU3MF0gYnV0IHRhc2sgaXMgYWxyZWFkeSBob2xkaW5nIGxvY2s6
DQpbICAgNjguMDM3Mzk5XSAwMDAwMDAwMDY1ZGU1ZmRmICh0a19jb3JlLnNlcSl7LS0tLX0sIGF0
OiBtdWx0aV9jcHVfc3RvcCsweDhjLzB4MTQwDQpbICAgNjguMDQ0NzE0XQ0KWyAgIDY4LjA0NDcx
NF0gb3RoZXIgaW5mbyB0aGF0IG1pZ2h0IGhlbHAgdXMgZGVidWcgdGhpczoNClsgICA2OC4wNTEy
MzddICBQb3NzaWJsZSB1bnNhZmUgbG9ja2luZyBzY2VuYXJpbzoNClsgICA2OC4wNTEyMzddDQpb
ICAgNjguMDU3MTUzXSAgICAgICAgQ1BVMA0KWyAgIDY4LjA1OTU5NF0gICAgICAgIC0tLS0NClsg
ICA2OC4wNjIwMzRdICAgbG9jayh0a19jb3JlLnNlcSk7DQpbICAgNjguMDY1MjU4XSAgIGxvY2so
dGtfY29yZS5zZXEpOw0KWyAgIDY4LjA2ODQ4Ml0NClsgICA2OC4wNjg0ODJdICAqKiogREVBRExP
Q0sgKioqDQpbICAgNjguMDY4NDgyXQ0KWyAgIDY4LjA3NDQwMl0gIE1heSBiZSBkdWUgdG8gbWlz
c2luZyBsb2NrIG5lc3Rpbmcgbm90YXRpb24NClsgICA2OC4wNzQ0MDJdDQpbICAgNjguMDgxMTg4
XSA0IGxvY2tzIGhlbGQgYnkgbWlncmF0aW9uLzAvMTE6DQpbICAgNjguMDg1MzY2XSAgIzA6IDAw
MDAwMDAwNDYzYjY0NDYgKHRpbWVrZWVwZXJfbG9jayl7LS4tLn0sIGF0OiBjaGFuZ2VfY2xvY2tz
b3VyY2UrMHgyYy8weDExOA0KWyAgIDY4LjA5MzgxMl0gICMxOiAwMDAwMDAwMDY1ZGU1ZmRmICh0
a19jb3JlLnNlcSl7LS0tLX0sIGF0OiBtdWx0aV9jcHVfc3RvcCsweDhjLzB4MTQwDQpbICAgNjgu
MTAxNTU4XSAgIzI6IDAwMDAwMDAwOThiNDU1NTAgKCZjaC0+bG9jayl7Li4uLn0sIGF0OiBzaF9j
bXRfc3RhcnQrMHgyOC8weDIwMA0KWyAgIDY4LjEwODk2MV0gICMzOiAwMDAwMDAwMGRhMGY0ZTgw
ICgmKCZkZXYtPnBvd2VyLmxvY2spLT5ybG9jayl7LS4uLn0sIGF0OiBfX3JwbV9jYWxsYmFjaysw
eGJjLzB4MWU4DQpbICAgNjguMTE4MDExXQ0KWyAgIDY4LjExODAxMV0gc3RhY2sgYmFja3RyYWNl
Og0KWyAgIDY4LjEyMjM2OF0gQ1BVOiAwIFBJRDogMTEgQ29tbTogbWlncmF0aW9uLzAgTm90IHRh
aW50ZWQgNS4wLjAtcmMzLW5leHQtMjAxOTAxMjUtMDAwMDUtZzM4MjgyMmIgIzMxDQpbICAgNjgu
MTMxNDEyXSBIYXJkd2FyZSBuYW1lOiBSZW5lc2FzIFNhbHZhdG9yLVggMm5kIHZlcnNpb24gYm9h
cmQgYmFzZWQgb24gcjhhNzc5NiAoRFQpDQpbICAgNjguMTM5MjQwXSBDYWxsIHRyYWNlOg0KWyAg
IDY4LjE0MTY4N10gIGR1bXBfYmFja3RyYWNlKzB4MC8weDE3OA0KWyAgIDY4LjE0NTM0Nl0gIHNo
b3dfc3RhY2srMHgxNC8weDIwDQpbICAgNjguMTQ4NjYxXSAgZHVtcF9zdGFjaysweGIwLzB4ZWMN
ClsgICA2OC4xNTE5NzVdICBfX2xvY2tfYWNxdWlyZSsweGZiNC8weDFjMDgNClsgICA2OC4xNTU4
OTRdICBsb2NrX2FjcXVpcmUrMHhkMC8weDI2OA0KWyAgIDY4LjE1OTQ2N10gIGt0aW1lX2dldCsw
eDVjLzB4MTA4DQpbICAgNjguMTYyNzc5XSAgcnBtX3Jlc3VtZSsweDVmMC8weDdhOA0KWyAgIDY4
LjE2NjI2NV0gIF9fcG1fcnVudGltZV9yZXN1bWUrMHg1MC8weDk4DQpbICAgNjguMTcwMzU4XSAg
c2hfY210X3N0YXJ0KzB4ODQvMHgyMDANClsgICA2OC4xNzM5MzFdICBzaF9jbXRfY2xvY2tzb3Vy
Y2VfZW5hYmxlKzB4MjgvMHg0OA0KWyAgIDY4LjE3ODU0Nl0gIGNoYW5nZV9jbG9ja3NvdXJjZSsw
eDg0LzB4MTE4DQpbICAgNjguMTgyNjM5XSAgbXVsdGlfY3B1X3N0b3ArMHg4Yy8weDE0MA0KWyAg
IDY4LjE4NjM4NV0gIGNwdV9zdG9wcGVyX3RocmVhZCsweGFjLzB4MTIwDQpbICAgNjguMTkwNDgx
XSAgc21wYm9vdF90aHJlYWRfZm4rMHgxYWMvMHgyYzgNClsgICA2OC4xOTQ1NzRdICBrdGhyZWFk
KzB4MTJjLzB4MTMwDQpbICAgNjguMTk3ODAwXSAgcmV0X2Zyb21fZm9yaysweDEwLzB4MTgNCg0K
UmVnYXJkcywNCkJpanUNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBC
aWp1IERhcw0KPiBTZW50OiAyNSBKYW51YXJ5IDIwMTkgMTE6MjcNCj4gVG86ICdHZWVydCBVeXR0
ZXJob2V2ZW4nIDxnZWVydEBsaW51eC1tNjhrLm9yZz47IFZpbmNlbnQgR3VpdHRvdA0KPiA8dmlu
Y2VudC5ndWl0dG90QGxpbmFyby5vcmc+OyBTZXJnZWkgU2h0eWx5b3YNCj4gPHNlcmdlaS5zaHR5
bHlvdkBjb2dlbnRlbWJlZGRlZC5jb20+DQo+IENjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJu
ZWwub3JnPjsgTWFyayBSdXRsYW5kDQo+IDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT47IFNpbW9uIEhv
cm1hbiA8aG9ybXNAdmVyZ2UubmV0LmF1PjsgTWFnbnVzDQo+IERhbW0gPG1hZ251cy5kYW1tQGdt
YWlsLmNvbT47IExpbnV4LVJlbmVzYXMgPGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5l
bC5vcmc+OyBvcGVuIGxpc3Q6T1BFTiBGSVJNV0FSRSBBTkQgRkxBVFRFTkVEIERFVklDRQ0KPiBU
UkVFIEJJTkRJTkdTIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz47IEdlZXJ0IFV5dHRlcmhv
ZXZlbg0KPiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBDaHJpcyBQYXRlcnNvbg0KPiA8Q2hy
aXMuUGF0ZXJzb24yQHJlbmVzYXMuY29tPjsgRGFuaWVsIExlemNhbm8NCj4gPGRhbmllbC5sZXpj
YW5vQGxpbmFyby5vcmc+OyBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT47IEpv
aG4NCj4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPjsgRmFicml6aW8gQ2FzdHJvDQo+
IDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+OyBTYW11ZWwgSG9sbGFuZCA8c2FtdWVs
QHNob2xsYW5kLm9yZz4NCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gYXJtNjQ6IGR0czogcmVuZXNh
czogcjhhNzc5NjogQWRkIENNVCBkZXZpY2Ugbm9kZXMNCj4NCj4gSGkgR2VlcnQsDQo+DQo+IFRo
YW5rcyBmb3IgdGhlIGZlZWRiYWNrLiBJIHN0YXJ0ZWQgdGVzdGluZyBDTVQgb24gbGF0ZXN0IGtl
cm5lbChMaW51eC1uZXh0LQ0KPiAyMDE5MDEyNSBhbmQgYWxzbyByZW5lc2FzLWRldikgYW5kIGZv
dW5kIHRoYXQgaXQgaXMgYnJva2VuIG9uIFItQ2FyIE0zLVcNCj4gZGV2aWNlLg0KPg0KPiBPbiBm
dXJ0aGVyIGludmVzdGlnYXRpb24gdGhlIHBhdGNoICgiDQo+IDgyMzRmNjczNGM1ZDc0YWM3OTRl
NTUxNzQzN2Y1MWM1N2Q2NWY4NjUiICAgUE0tcnVudGltZTogU3dpdGNoDQo+IGF1dG9zdXNwZW5k
IG92ZXIgdG8gdXNpbmcgaHJ0aW1lcnMpICBpcyBjYXVzaW5nIHRoZSBpc3N1ZS4NCj4NCj4gRHVy
aW5nIGNsb2NrIHNvdXJjZSBzd2l0Y2hpbmcsIEl0IGNhbGxzIHRoZSBmdW5jdGlvbiAic2hfY210
X2VuYWJsZSIgIHdoaWNoDQo+IGNhbGxzICIgcG1fcnVudGltZV9nZXRfc3luYygmY2gtPmNtdC0+
cGRldi0+ZGV2KTsiICBhbmQgYWZ0ZXIgdGhhdA0KPiBjb25zb2xlIGZyZWV6ZXMuDQo+DQo+IFNl
cmdlaTogSGF2ZSB5b3Ugbm90aWNlZCB0aGlzIGlzc3VlICBvbiBSLUNhciBWM00gYW5kIFYzSCBi
b2FyZHMgd2l0aCBsYXRlc3QNCj4ga2VybmVsPw0KPg0KPiBSZWdhcmRzLA0KPiBCaWp1DQo+DQo+
ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBsaW51eC1yZW5lc2FzLXNv
Yy1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LXJlbmVzYXMtc29jLQ0KPiA+IG93bmVyQHZn
ZXIua2VybmVsLm9yZz4gT24gQmVoYWxmIE9mIEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiA+IFNlbnQ6
IDI0IEphbnVhcnkgMjAxOSAxMDoxNg0KPiA+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVu
ZXNhcy5jb20+DQo+ID4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBNYXJr
IFJ1dGxhbmQNCj4gPiA8bWFyay5ydXRsYW5kQGFybS5jb20+OyBTaW1vbiBIb3JtYW4gPGhvcm1z
QHZlcmdlLm5ldC5hdT47DQo+IE1hZ251cyBEYW1tDQo+ID4gPG1hZ251cy5kYW1tQGdtYWlsLmNv
bT47IExpbnV4LVJlbmVzYXMgPGxpbnV4LXJlbmVzYXMtDQo+ID4gc29jQHZnZXIua2VybmVsLm9y
Zz47IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVORUQgREVWSUNFDQo+ID4gVFJF
RSBCSU5ESU5HUyA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBHZWVydCBVeXR0ZXJob2V2
ZW4NCj4gPiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBDaHJpcyBQYXRlcnNvbg0KPiA+IDxD
aHJpcy5QYXRlcnNvbjJAcmVuZXNhcy5jb20+OyBEYW5pZWwgTGV6Y2Fubw0KPiA+IDxkYW5pZWwu
bGV6Y2Fub0BsaW5hcm8ub3JnPjsgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+
Ow0KPiA+IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPjsgRmFicml6aW8gQ2Fz
dHJvDQo+ID4gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT47IFNhbXVlbCBIb2xsYW5k
DQo+IDxzYW11ZWxAc2hvbGxhbmQub3JnPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFybTY0
OiBkdHM6IHJlbmVzYXM6IHI4YTc3OTY6IEFkZCBDTVQgZGV2aWNlDQo+ID4gbm9kZXMNCj4gPg0K
PiA+IEhpIEJpanUsDQo+ID4NCj4gPiBPbiBGcmksIE9jdCAyNiwgMjAxOCBhdCAxMDozMiBBTSBC
aWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gVGhpcyBw
YXRjaCBhZGRzIENNVHswfDF8MnwzfSBkZXZpY2Ugbm9kZXMgZm9yIHI4YTc3OTYgU29DLg0KPiA+
ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNv
bT4NCj4gPiA+IC0tLQ0KPiA+ID4gVGhpcyBwYXRjaCBpcyB0ZXN0ZWQgYWdhaW5zdCByZW5lc2Fz
LWRldg0KPiA+ID4NCj4gPiA+IEkgaGF2ZSBleGVjdXRlZCBvbiBpbmNvbnNpc3RlbmN5LWNoZWNr
LCBuYW5vc2xlZXAgYW5kDQo+ID4gPiBjbG9ja3NvdXJjZV9zd2l0Y2ggc2VsZnRlc3RzIG9uIHRo
aXMgYXJtNjQgU29DLiBUaGUNCj4gPiA+IGluY29uc2lzdGVuY3ktY2hlY2sgYW5kIG5hbm9zbGVl
cCB0ZXN0cyBhcmUgd29ya2luZyBmaW5lLlRoZQ0KPiA+ID4gY2xvY2tzb3VyY2Vfc3dpdGNoIGFz
eW5jaHJvbm91cyB0ZXN0IGlzIGZhaWxpbmcgZHVlIHRvDQo+ID4gPiBpbmNvbnNpc3RlbmN5LWNo
ZWNrDQo+ID4gZmFpbHVyZSBvbiAiYXJjaF9zeXNfY291bnRlciIuDQo+ID4gPg0KPiA+ID4gQnV0
IGlmIGkgc2tpcCB0aGUgY2xvY2tzb3VyY2Vfc3dpdGNoaW5nIG9mICJhcmNoX3N5c19jb3VudGVy
IiwgdGhlDQo+ID4gPiBhc3luY2hyb25vdXMgdGVzdCBpcyBwYXNzaW5nIGZvciBDTVQwLzEvMi8z
IHRpbWVyLg0KPiA+ID4NCj4gPiA+IEhhcyBhbnkgb25lIG5vdGljZWQgdGhpcyBpc3N1ZT8NCj4g
Pg0KPiA+IGNsb2NrZXZlbnRzL25leHQgbm93IGhhcyBjb21taXQgN2NkNmRjYTM2MDBkOGQ3MQ0K
PiA+ICgiY2xvY2tzb3VyY2UvZHJpdmVycy9hcmNoX3RpbWVyOiBXb3JrYXJvdW5kIGZvciBBbGx3
aW5uZXIgQTY0IHRpbWVyDQo+ID4gaW5zdGFiaWxpdHkiKS4gIFBlcmhhcHMgdGhpcyBpcyByZWxh
dGVkLCBhbmQgdGhlIHNhbWUgdGVzdCBwcm9ncmFtIG1heQ0KPiA+IGluZGljYXRlIHNpbWlsYXIg
aXNzdWVzPw0KPiA+DQo+ID4gU2VlIGFsc28gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8y
MDE5MDExMzAyMTcxOS40NjQ1Ny0yLQ0KPiA+IHNhbXVlbEBzaG9sbGFuZC5vcmcvDQo+ID4NCj4g
PiBHcntvZXRqZSxlZXRpbmd9cywNCj4gPg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0DQo+ID4NCj4gPiAtLQ0KPiA+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0NCj4gPiBnZWVydEBsaW51eC0gbTY4ay5vcmcNCj4gPg0K
PiA+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGENCj4gPiBoYWNrZXIuIEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxp
c3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yDQo+IHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KDQoN
Cg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgTHRkLCBEdWtlcyBNZWFkb3csIE1pbGxib2Fy
ZCBSb2FkLCBCb3VybmUgRW5kLCBCdWNraW5naGFtc2hpcmUsIFNMOCA1RkgsIFVLLiBSZWdpc3Rl
cmVkIGluIEVuZ2xhbmQgJiBXYWxlcyB1bmRlciBSZWdpc3RlcmVkIE5vLiAwNDU4NjcwOS4NCg==
