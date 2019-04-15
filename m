Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219E1C10F12
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 10:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D010E2075B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 10:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Pol7j7CC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfDOKMo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 06:12:44 -0400
Received: from mail-eopbgr1410094.outbound.protection.outlook.com ([40.107.141.94]:41664
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727179AbfDOKMn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 06:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3PBZHSANfSMONrj+PFTYiWhSq5UTKee0w+eYk9UCMg=;
 b=Pol7j7CCCjztsd4g4+C4Hfj7woKK62WOrESmohF24zH5twQ1Y8TlPx4/VeG2kd1h1RXKwdLEIQLajHLQSiLxQbuYWAXEme6kfhQVDni28MdYE5+xjhRNsenwQrdOGj82juWSGlfqm9aYFR2XYmQA3RJP4gvod3h/AExyeapiadY=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1513.jpnprd01.prod.outlook.com (52.133.161.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.17; Mon, 15 Apr 2019 10:12:35 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9b4:609a:1271:478f]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9b4:609a:1271:478f%3]) with mapi id 15.20.1792.018; Mon, 15 Apr 2019
 10:12:34 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: Color Keying
Thread-Topic: Color Keying
Thread-Index: AdTxFsn9K2T76xs8STW7FzhVEIAvkQAE624AAAAviYAAkgPbYA==
Date:   Mon, 15 Apr 2019 10:12:34 +0000
Message-ID: <TY1PR01MB1770F89FE97FF36D799BFD4AC02B0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <TY1PR01MB1770CA2D8AFEEAAF55045AD0C0280@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <f643b00d-b6d7-5710-dbbe-37a0beb75189@ideasonboard.com>
 <acf4d133-19f9-9493-d2b2-3815664763b0@ideasonboard.com>
In-Reply-To: <acf4d133-19f9-9493-d2b2-3815664763b0@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d71b7bcb-bd91-4d34-4bbb-08d6c18ae156
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TY1PR01MB1513;
x-ms-traffictypediagnostic: TY1PR01MB1513:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <TY1PR01MB1513560BFA81CBFB4240296AC02B0@TY1PR01MB1513.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(136003)(39860400002)(346002)(366004)(199004)(189003)(3846002)(25786009)(7696005)(14444005)(107886003)(6116002)(86362001)(5660300002)(102836004)(256004)(7736002)(6506007)(53546011)(66066001)(81156014)(54906003)(26005)(4326008)(9686003)(74316002)(76176011)(6306002)(53936002)(221733001)(55016002)(6246003)(186003)(110136005)(305945005)(14454004)(81166006)(2906002)(97736004)(486006)(476003)(7116003)(8936002)(44832011)(71190400001)(71200400001)(52536014)(6436002)(478600001)(11346002)(106356001)(966005)(8676002)(33656002)(68736007)(105586002)(316002)(446003)(229853002)(3480700005)(99286004);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1513;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: B1hPhkHYApGde+Ca9w4zSrqDveWx9zk+IQXzGUlNvxWm68I5CvsYivl+R++mNLxiqWPdLb7dviLhGsDmg6apKcgJClsBsuf4ASbnwGrXVRJ2d/H0LpfBZw2ANFeMaISQl3NDk3sOxbzFu8zZ1mHdWoPsHXWiL5hzcDoQYr5lyk5/6wc4F7nJkHLgQE4t5VhSzIVIJwCbJ4R8RSPeaCAwNVM3zICKPtKFdxH+pSU+mHwZE/7bRITMaB5nma8orMHvWFhH05Q8F25vvtn0ZJ+HFy23hjmubld07IGsD+O48rduVDTWUN5O+PAJDtRxmEmhg9Ia0z4faukM5WeEZ/Sphnvcj/rLIgm+WkOjpRuRpEEW+bJTdo+RZa2P8sut8TsNkklOpuuG3w4FdlZcMODa346I5r9F77MOwzj5zr/qgx0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d71b7bcb-bd91-4d34-4bbb-08d6c18ae156
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 10:12:34.9110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1513
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gS2llcmFuLA0KDQpUaGFuayB5b3Ugc28gbXVjaCBmb3IgdGhlIGJhY2tncm91bmQhDQoN
CkkgdGhpbmsgd2UgYXJlIGdvaW5nIHRvIGxpdmUgd2l0aG91dCBjb2xvdXIga2V5aW5nIGZvciBu
b3csIEknbGwgbGV0IHlvdSBrbm93IGlmIHdlIGRlY2lkZSB0byBwaWNrIHRoaXMgdXAsIHNvIHRo
YXQgd2UgZG9uJ3Qgc3RlcCBvbiBlYWNoIG90aGVyJ3MgdG9lcy4NCg0KVGhhbmtzIQ0KDQpGYWIN
Cg0KPiBGcm9tOiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29u
Ym9hcmQuY29tPg0KPiBTZW50OiAxMiBBcHJpbCAyMDE5IDEzOjI4DQo+IFN1YmplY3Q6IFJlOiBD
b2xvciBLZXlpbmcNCj4gDQo+IEhlbGxvIEFnYWluLA0KPiANCj4gSXQgbG9va3MgbGlrZSBzb21l
b25lIGVsc2UgaGFzIGFsc28gdHJpZWQgdG8gcmVqdXZlbmF0ZSB0aGUgRFJNIGdlbmVyaWMNCj4g
Y29sb3JrZXkgc3VwcG9ydCBmcm9tIExhdXJlbnQgYXQ6DQo+IA0KPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yZW5lc2FzLXNvYy8yMDE4MDgwNzE3MjIwMi4xOTYxLTItZGlnZXR4QGdt
YWlsLmNvbS8NCj4gDQo+IFNvIHRoYXQgbWF5IG9yIG1heSBub3QgY29uZmxpY3QuIEJ1dCBpdCBz
dWdnZXN0cyB0aGF0IGlmIHlvdSBjYW4gZ2V0DQo+IExhdXJlbnQncyBvbGQgcGF0Y2hlcyB3b3Jr
aW5nIHRoZW4gaXQgd2lsbCBoZWxwIHlvdXIgdXNlIGNhc2UgLSBidXQNCj4gcHJvYmFibHkgbmVl
ZHMgbW9yZSBjb25zaWRlcmFibGUgd29yayBiZWZvcmUgd2UgY2FuIGludGVncmF0ZSBpbnRvIG1h
aW5saW5lLg0KPiANCj4gLS0NCj4gS2llcmFuDQo+IA0KPiANCj4gDQo+IE9uIDEyLzA0LzIwMTkg
MTM6MjMsIEtpZXJhbiBCaW5naGFtIHdyb3RlOg0KPiA+IEhpIEZhYnJpemlvLA0KPiA+DQo+ID4g
T24gMTIvMDQvMjAxOSAxMToxMiwgRmFicml6aW8gQ2FzdHJvIHdyb3RlOg0KPiA+PiBIZWxsbyBM
YXVyZW50LA0KPiA+Pg0KPiA+PiBoYXMgY29sb3VyIGtleWluZyBldmVyIGJlZW4gdGVzdGVkIG9u
IFItQ2FyIEdlbjM/DQo+ID4+IEkgYW0gd29ya2luZyBvbiBIRE1JIHN1cHBvcnQgZm9yIHRoZSBS
Wi9HMkUsIGFuZCBJIHdhbnRlZCB0byB0ZXN0ICJjb2xvcmtleSIsIGJ1dCBpdA0KPiA+PiBsb29r
cyBsaWtlIHRoYXQgb25jZSB5b3UgaGF2ZSBSQ0FSX0RVX0ZFQVRVUkVfVlNQMV9TT1VSQ0UgZGVm
aW5lZCB3aXRoaW4gdGhlDQo+ID4+IGZlYXR1cmVzIG1lbWJlciBvZiB0aGUgU29DIHNwZWNpZmlj
IHJjYXJfZHVfZGV2aWNlX2luZm8gc3RydWN0LCByY2FyX2R1X21vZGVzZXRfaW5pdA0KPiA+PiB3
b24ndCBjYWxsIHJjYXJfZHVfcGxhbmVzX2luaXQuDQo+ID4+DQo+ID4+IElzIG15IHVuZGVyc3Rh
bmRpbmcgY29ycmVjdD8NCj4gPj4gSXMgdGhpcyBiZWhhdmlvdXIgZGVzaXJlZD8NCj4gPj4gSXMg
dGhlcmUgYW55dGhpbmcgSSBjYW4gZG8gdG8gcXVpY2tseSB0ZXN0IGl0IG9uIG15IFJaL0cyRT8N
Cj4gPg0KPiA+IEl0IGxvb2tzIGxpa2UgdGhpcyBoYXMgYmVlbiBhdHRlbXB0ZWQgYSBjb3VwbGUg
b2YgdGltZXMgYnV0IG1pZ2h0IG5vdA0KPiA+IHlldCBiZSBjb21wbGV0ZWQuIFBlcmhhcHMgeW91
IGhhdmUgdGhlIHJlcXVpcmVkIG5lY2Vzc2l0eSB0byByZWZyZXNoIHRoZQ0KPiA+IHBhdGNoZXM/
IElmIG5vdCwgbGV0IHVzIGtub3cgYW5kIHdlJ2xsIHNlZSB3aGF0IHdlIGNhbiB3aXRoIG91ciBu
ZXh0DQo+ID4gYmF0Y2ggb2YgdGFza3MuDQo+ID4NCj4gPiBBdCBbMF0gSSBzZWUgdGhhdCB0aGVy
ZSB3YXMgYSBwdWxsIHJlcXVlc3QgdG8gaW5jb3Jwb3JhdGUgR2VuMyBjb2xvcg0KPiA+IGtleWlu
ZyBzdXBwb3J0IGludG8gdGhlIHJlbmVzYXMgZHJpdmVycywgYnV0IGl0IHdhcyByZW1vdmVkIHNv
bWUgdGltZQ0KPiA+IGFmdGVyIGR1ZSB0byBjb25mbGljdHMgWzFdLg0KPiA+DQo+ID4gWzBdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJlbmVzYXMtc29jLzUxNTE1MTQub3NYV1FOSFQ0
UUBhdmFsb24vDQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmVu
ZXNhcy1zb2MvQ0FNdUhNZFU3RmpaNDMrTVRnV1FmWlg2Zng2enlhRnl3K1NZLVVvUFo1R3gyaERP
TDdBQG1haWwuZ21haWwuY29tLw0KPiA+DQo+ID4gWW91IGNvdWxkIHRyeSBmZXRjaGluZyB0aGUg
Y29tbWl0cyBmcm9tDQo+ID4gICBnaXQ6Ly9saW51eHR2Lm9yZy9waW5jaGFydGwvbWVkaWEuZ2l0
DQo+ID4gICAgICAgdGFncy9kcm0tbmV4dC1jb2xvcmtleS12MS0yMDE3MTIxNQ0KPiA+DQo+ID4g
QW5kIHRyeSB0byBjaGVycnktcGljayB0aGVtIHRvIG1haW5saW5lIHRvIHNlZSBpZiB0aGF0IGJy
aW5ncyB0aGUNCj4gPiBmdW5jdGlvbmFsaXR5IHlvdSByZXF1aXJlLg0KPiA+DQo+ID4NCj4gPiBB
IHBhdGNoIHdhcyBwcm92aWRlZCBmb3Iga21zLXRlc3RzIGF0IFsyXSB3aGljaCBtaWdodCBoZWxw
IHlvdSB2YWxpZGF0ZQ0KPiA+IHRoZSBwYXRjaGVzLg0KPiA+DQo+ID4gWzJdDQo+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmVuZXNhcy1zb2MvMjAxNzEyMTUxMzQ4NDguMTk2ODAt
MS1sYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20vDQo+ID4NCj4gPg0KPiA+IElmIHlv
dSBzdWNjZXNzZnVsbHkgcmViYXNlIGFuZCB0ZXN0IHRoZSBwYXRjaGVzLCBwbGVhc2UgY29uc2lk
ZXINCj4gPiByZXBvc3RpbmcgdGhlbSBmcm9tIHRoZSBuZXcgYmFzZSB0byByZWp1dmVuYXRlIHRo
ZSBlZmZvcnQgdG8gZ2V0IHRoZW0NCj4gPiBpbnRlZ3JhdGVkLg0KPiA+DQo+ID4gSWYgeW91IGhh
dmUgYW55IGRpZmZpY3VsdGllcyBwbGVhc2UgbGV0IHVzIGtub3csIGJ1dCBJJ20gYWZyYWlkIEkn
bSBvbg0KPiA+IGhvbGlkYXkgbmV4dCB3ZWVrIHNvIHRoZXJlIGlzIG5vdCBtdWNoIEkgY2FuIGRv
IHVudGlsIGFmdGVyIEkgcmV0dXJuLg0KPiA+DQo+ID4gLS0NCj4gPiBSZWdhcmRzDQo+ID4NCj4g
PiBLaWVyYW4NCj4gPg0KPiA+DQo+ID4NCj4gPj4gVGhhbmtzLA0KPiA+PiBGYWINCj4gPj4NCj4g
Pj4NCj4gPj4NCj4gPj4NCj4gPg0KDQo=
