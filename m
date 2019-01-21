Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98475C31D64
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 07:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 539CD217F4
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 07:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="klARCU8Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbfAUHLq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 02:11:46 -0500
Received: from mail-eopbgr1310127.outbound.protection.outlook.com ([40.107.131.127]:42144
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725871AbfAUHLp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 02:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xR2AvCwI4gC4SMjljk44nmcBvldT14AQtwNCPu76dY=;
 b=klARCU8YRoMbqlj16SeGQX5algRpt5G78M2ehAhXmjpAlAMc2XZcZCmEehB3WW5FUlPUWhQabreSHECoLcGv73tc+YvoDjHELCFjsIbdJ+oRbsIIzmPnocveJIqZujfHVMOAnuJN2Ul3a6EtOKutGCDx247BqqQcnInTt+bXGGY=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB3977.jpnprd01.prod.outlook.com (20.178.142.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Mon, 21 Jan 2019 03:16:40 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e%3]) with mapi id 15.20.1537.031; Mon, 21 Jan 2019
 03:16:39 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "REE dirk.behme@de.bosch.com" <dirk.behme@de.bosch.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
CC:     "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "mfarooq@visteon.com" <mfarooq@visteon.com>,
        Achim Dahlhoff <Achim.Dahlhoff@de.bosch.com>,
        =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>
Subject: RE: [PATCHv2 1/4] dmaengine: rcar-dmac: use result of updated
 get_residue in tx_status
Thread-Topic: [PATCHv2 1/4] dmaengine: rcar-dmac: use result of updated
 get_residue in tx_status
Thread-Index: AQHUrNEYm+FPQ7LuUkOFNwPJij6LwqW5DcxQ
Date:   Mon, 21 Jan 2019 03:16:39 +0000
Message-ID: <TY2PR01MB481241E96C7D1D088C83355CD89F0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <20160630151518.32329-1-niklas.soderlund+renesas@ragnatech.se>
 <20160630151518.32329-2-niklas.soderlund+renesas@ragnatech.se>
 <22f3bf50-6241-5beb-0d6d-c556b6cfebb9@de.bosch.com>
In-Reply-To: <22f3bf50-6241-5beb-0d6d-c556b6cfebb9@de.bosch.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY2PR01MB3977;20:Jb/Y9P1fdKu11axaSpR7OKaK784BzaGZvNov+QMcxkDHWu/h8yDvflSgWd8f6sa4jhQ0V2AQMeFm3h53Q+v8J1/ipsOu1sbOA4zITT+77LWGgYbnV+Zgg5neRl0/3+KBNiR7Q4DlsHQqwHJ+J82FyBiUYpwpBd8Ap+QolkTHFH4=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: a04bd20e-b1ad-4203-4d41-08d67f4edc4d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB3977;
x-ms-traffictypediagnostic: TY2PR01MB3977:
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TY2PR01MB397719E8C923E43F063DFE67D89F0@TY2PR01MB3977.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0924C6A0D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(136003)(376002)(396003)(366004)(346002)(199004)(189003)(8936002)(66574012)(6116002)(478600001)(486006)(97736004)(86362001)(966005)(256004)(14444005)(14454004)(476003)(105586002)(106356001)(446003)(11346002)(26005)(186003)(2906002)(4326008)(6506007)(25786009)(53546011)(55016002)(71190400001)(102836004)(76176011)(7696005)(71200400001)(99286004)(9686003)(6306002)(66066001)(54906003)(110136005)(53936002)(6436002)(3846002)(316002)(81166006)(74316002)(305945005)(15650500001)(33656002)(8676002)(229853002)(81156014)(68736007)(7736002)(6246003)(2501003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB3977;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UImMY9aKkYun+lBbUWZ2Ar+PACXXmnJkrCkAe++dOqR9mvLbW0+wuAEOET1IbUx47kyXhsWGC+2xClxNZxLNdzeNnfKXhy96PrjTmAIeozyZErV+DTKwYgn3R5X02K9AnvS1bJdP9lpj9kZIuvY6GpthDECDiBWOWf3eDIUsaCHGqwDhzEIgBwbnXHLC4+6RUVdlqjOnBqf5+imzk6Og4/EsSlcNSs9FM64/uAVK9RkoSJmSkAc10eLqSNCxj56Gz5s2EEFEkMoYK1+LicJkRPGxIS106FtDrz3TCqUDws0aUDyIRU5DkxITqxr6U6trvGkCYNMrrxfaDX+KWrEG6PluDLb9/qS0bqsvqHggxvAemz9npf3fQiMFDYF4X/3n7gjKz54o/CipEYlS36zVYba/zcZLMN0QJVcGJ4rsUxQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04bd20e-b1ad-4203-4d41-08d67f4edc4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2019 03:16:39.7352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3977
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgRGlyaywNCihyZXZpc2VkIFZpbm9kJ3MgZW1haWwgYWRkcmVzcykNCg0KPiBGcm9tOiBEaXJr
IEJlaG1lLCBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDE1LCAyMDE5IDk6NDQgUE0NCj4gDQo+IE9u
IDMwLjA2LjIwMTYgMTc6MTUsIE5pa2xhcyBTw7ZkZXJsdW5kIHdyb3RlOg0KPiA+IEZyb206IE11
aGFtbWFkIEhhbXphIEZhcm9vcSA8bWZhcm9vcUB2aXN0ZW9uLmNvbT4NCj4gPg0KPiA+IFRoZSBo
YXJkd2FyZSBtaWdodCBoYXZlIGNvbXBsZXRlIHRoZSB0cmFuc2ZlciBidXQgdGhlIGludGVycnVw
dCBoYW5kbGVyDQo+ID4gbWlnaHQgbm90IGhhdmUgaGFkIGEgY2hhbmNlIHRvIHJ1bi4gSWYgcmNh
cl9kbWFjX2NoYW5fZ2V0X3Jlc2lkdWUoKQ0KPiA+IHdoaWNoIHJlYWRzIEhXIHJlZ2lzdGVycyBm
aW5kcyB0aGF0IHRoZXJlIGlzIG5vIHJlc2lkdWUgcmV0dXJuDQo+ID4gRE1BX0NPTVBMRVRFLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTXVoYW1tYWQgSGFtemEgRmFyb29xIDxtZmFyb29xQHZp
c3Rlb24uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4gW05pa2xhczogYWRkIGV4cGxhbmF0aW9uIGluIGNvbW1p
dCBtZXNzYWdlXQ0KPiA+IFNpZ25lZC1vZmYtYnk6IE5pa2xhcyBTw7ZkZXJsdW5kIDxuaWtsYXMu
c29kZXJsdW5kK3JlbmVzYXNAcmFnbmF0ZWNoLnNlPg0KPiA+IEFja2VkLWJ5OiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gLS0tDQo+ID4g
ICBkcml2ZXJzL2RtYS9zaC9yY2FyLWRtYWMuYyB8IDQgKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hL3No
L3JjYXItZG1hYy5jIGIvZHJpdmVycy9kbWEvc2gvcmNhci1kbWFjLmMNCj4gPiBpbmRleCBkZmIx
NzkyLi43OTFhMDY0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZG1hL3NoL3JjYXItZG1hYy5j
DQo+ID4gKysrIGIvZHJpdmVycy9kbWEvc2gvcmNhci1kbWFjLmMNCj4gPiBAQCAtMTIwMiw2ICsx
MjAyLDEwIEBAIHN0YXRpYyBlbnVtIGRtYV9zdGF0dXMgcmNhcl9kbWFjX3R4X3N0YXR1cyhzdHJ1
Y3QgZG1hX2NoYW4gKmNoYW4sDQo+ID4gICAJcmVzaWR1ZSA9IHJjYXJfZG1hY19jaGFuX2dldF9y
ZXNpZHVlKHJjaGFuLCBjb29raWUpOw0KPiA+ICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnJj
aGFuLT5sb2NrLCBmbGFncyk7DQo+ID4NCj4gPiArCS8qIGlmIHRoZXJlJ3Mgbm8gcmVzaWR1ZSwg
dGhlIGNvb2tpZSBpcyBjb21wbGV0ZSAqLw0KPiA+ICsJaWYgKCFyZXNpZHVlKQ0KPiA+ICsJCXJl
dHVybiBETUFfQ09NUExFVEU7DQo+ID4gKw0KPiA+ICAgCWRtYV9zZXRfcmVzaWR1ZSh0eHN0YXRl
LCByZXNpZHVlKTsNCj4gPg0KPiA+ICAgCXJldHVybiBzdGF0dXM7DQo+IA0KPiANCj4gV2UgaGF2
ZSBzb21lIGRvdWJ0cyBhYm91dCB0aGlzIGNoYW5nZSAobWFpbmxpbmUgY29tbWl0IFsxXSkuIE5v
dCBiZWluZyBhDQo+IERNQSBleHBlcnQsIGxldCBtZSB0cnkgdG8gZXhwbGFpbjoNCj4gDQo+IFdl
IGFyZSBjb25maWd1cmluZyBhIGN5Y2xpYywgbmV2ZXIgZW5kaW5nIERNQQ0KPiAoZG1hZW5naW5l
X3ByZXBfZG1hX2N5Y2xpYygpKS4gRm9yIHRoaXMgY3ljbGljIERNQSB3ZSBjb250aW51b3VzbHkg
cG9sbA0KPiB0aGUgcmVzaWR1ZSAodHhzdGF0ZS0+cmVzaWR1ZSkgdmlhIHJjYXJfZG1hY190eF9z
dGF0dXMoKS4gSGF2aW5nIGENCj4gY3ljbGljLCBuZXZlciBlbmRpbmcgRE1BIHdlIHRoaW5rIHRo
YXQgcmVzaWR1ZSA9PSAwIGlzIGEgdmFsaWQgdmFsdWUuDQo+IEhvd2V2ZXIsIHdpdGggYWJvdmUg
Y2hhbmdlLCBhIHJlc2lkdWUgdmFsdWUgb2YgMCBpcyAnZHJvcHBlZCcgYW5kIG5ldmVyDQo+IHdy
aXR0ZW4gdmlhIGRtYV9zZXRfcmVzaWR1ZSgpIHRvIHR4c3RhdGUuIFNvIGluIGNhc2Ugd2UgY29u
dGludW91c2x5DQo+IHBvbGwsIHRoaXMgdmFsdWUgaXMgbG9zdCwgcmVzdWx0aW5nIGluIHdyb25n
IGJlaGF2aW9yIG9mIHRoZSBjYWxsZXIuDQoNCkFjY29yZGluZyB0byB0aGUgRG9jdW1lbnRhdGlv
bi9kcml2ZXItYXBpL2RtYWVuZ2luZS9wcm92aWRlci5yc3QgWzFdLA0KZGV2aWNlX3R4X3N0YXR1
cyBzaG91bGQgcmVwb3J0IHRoZSBieXRlcyBsZWZ0LiBTbywgd2Ugc2hvdWxkIGZpeA0KdGhlIGN1
cnJlbnQgaW1wbGVtZW50YXRpb24gYXMgeW91IHNhaWQuDQotLS0NClsxXQ0KYGBkZXZpY2VfdHhf
c3RhdHVzYGANCg0KICAtIFNob3VsZCByZXBvcnQgdGhlIGJ5dGVzIGxlZnQgdG8gZ28gb3ZlciBv
biB0aGUgZ2l2ZW4gY2hhbm5lbA0KICA8c25pcD4NCiAgLSBJbiB0aGUgY2FzZSBvZiBhIGN5Y2xp
YyB0cmFuc2ZlciwgaXQgc2hvdWxkIG9ubHkgdGFrZSBpbnRvDQogICAgYWNjb3VudCB0aGUgY3Vy
cmVudCBwZXJpb2QuDQotLS0NCg0KPiBJbiBvdXIgY2FzZSB3aXRoIGN5Y2xpYywgbmV2ZXIgZW5k
aW5nIERNQSwgY2hhbmdpbmcgdGhpcyB0bw0KPiANCj4gLS0tIGEvZHJpdmVycy9kbWEvc2gvcmNh
ci1kbWFjLmMNCj4gKysrIGIvZHJpdmVycy9kbWEvc2gvcmNhci1kbWFjLmMNCj4gQEAgLTEzODgs
NyArMTM4OCw3IEBAIHN0YXRpYyBlbnVtIGRtYV9zdGF0dXMgcmNhcl9kbWFjX3R4X3N0YXR1cyhz
dHJ1Y3QNCj4gZG1hX2NoYW4gKmNoYW4sDQo+IA0KPiAgICAgICAgICAvKiBpZiB0aGVyZSdzIG5v
IHJlc2lkdWUsIHRoZSBjb29raWUgaXMgY29tcGxldGUgKi8NCj4gICAgICAgICAgaWYgKCFyZXNp
ZHVlKQ0KPiAtICAgICAgICAgICAgICAgcmV0dXJuIERNQV9DT01QTEVURTsNCj4gKyAgICAgICAg
ICAgICAgIHN0YXR1cyA9IERNQV9DT01QTEVURTsNCj4gDQo+ICAgICAgICAgIGRtYV9zZXRfcmVz
aWR1ZSh0eHN0YXRlLCByZXNpZHVlKTsNCj4gDQo+IHNlZW1zIHRvIGhlbHAuDQoNClNvLCBhdCBs
ZWFzdCwgd2Ugc2hvdWxkIGFwcGx5IHRoaXMgY29kZSBhYm92ZS4NCg0KPiAgICAgICAgICAgSWYg
d2UgaWdub3JlIHRoZSBzdGlsbCB3cm9uZyBETUFfQ09NUExFVEUgc3RhdHVzICh3aGljaA0KPiBp
biBjYXNlIG9mIGN5Y2xpYyBETUEgZG9lc24ndCBtYWtlIGFueSBzZW5zZT8pIHRoZSBjYWxsZXIg
Z2V0IHRoZQ0KPiBjb3JyZWN0IHR4c3RhdGUtPnJlc2lkdWUgdmFsdWVzIChub3QgZHJvcHBpbmcg
dGhlIDApLg0KPiANCj4gU28gbWF5YmUgd2UgbmVlZCBhbnl0aGluZyBsaWtlDQo+IA0KPiAtLS0g
YS9kcml2ZXJzL2RtYS9zaC9yY2FyLWRtYWMuYw0KPiArKysgYi9kcml2ZXJzL2RtYS9zaC9yY2Fy
LWRtYWMuYw0KPiBAQCAtMTM4Nyw3ICsxMzg3LDcgQEAgc3RhdGljIGVudW0gZG1hX3N0YXR1cyBy
Y2FyX2RtYWNfdHhfc3RhdHVzKHN0cnVjdA0KPiBkbWFfY2hhbiAqY2hhbiwNCj4gICAgICAgICAg
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcmNoYW4tPmxvY2ssIGZsYWdzKTsNCj4gDQo+ICAgICAg
ICAgIC8qIGlmIHRoZXJlJ3Mgbm8gcmVzaWR1ZSwgdGhlIGNvb2tpZSBpcyBjb21wbGV0ZSAqLw0K
PiAtICAgICAgIGlmICghcmVzaWR1ZSkNCj4gKyAgICAgICBpZiAoIXJlc2lkdWUgJiYgIWNoYW4t
PmRlc2MucnVubmluZy0+Y3ljbGljKQ0KPiAgICAgICAgICAgICAgICAgIHJldHVybiBETUFfQ09N
UExFVEU7DQo+IA0KPiAgICAgICAgICBkbWFfc2V0X3Jlc2lkdWUodHhzdGF0ZSwgcmVzaWR1ZSk7
DQo+IA0KPiA/DQoNCkkgY291bGQgbm90IGZpbmQgd2hldGhlciBhIGN5Y2xpYyB0cmFuc2ZlciBz
aG91bGQgbm90IHJldHVybiBETUFfQ09NUExFVEUgb24NCkRvY3VtZW50YXRpb25zLy4gSSBvbmx5
IGZvdW5kIHRoZSBmb2xsb3dpbmcgaW4gdGhlIGluY2x1ZGUvbGludXgvZG1hZW5naW5lLmg6DQoN
Ci8qKg0KICogZW51bSBkbWFfc3RhdHVzIC0gRE1BIHRyYW5zYWN0aW9uIHN0YXR1cw0KICogQERN
QV9DT01QTEVURTogdHJhbnNhY3Rpb24gY29tcGxldGVkDQoNCkJlc3QgcmVnYXJkcywNCllvc2hp
aGlybyBTaGltb2RhDQoNCj4gT3BpbmlvbnM/DQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gDQo+IERp
cmsNCj4gDQo+IFsxXQ0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0L2RyaXZlcnMvZG1hL3NoL3JjYXItZG1h
Yy5jP2g9djUuMC1yYzImaWQ9Mw0KPiA1NDRkMjg3ODgxN2JkMTM5ZGRhMjM4Y2RkODZhMTVlMWMw
M2QwMzcNCg==
