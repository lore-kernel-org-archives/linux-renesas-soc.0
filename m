Return-Path: <SRS0=hHdZ=SZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D12BC10F14
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 09:45:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5D0920843
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Apr 2019 09:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="enozb6Qh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfDWJpW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Apr 2019 05:45:22 -0400
Received: from mail-eopbgr1410112.outbound.protection.outlook.com ([40.107.141.112]:57888
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725990AbfDWJpW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Apr 2019 05:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+SUmuq999FSwxavwoxKp0XfclRXpmoQb5Tmjr07pTU=;
 b=enozb6QhKy2iRclkyOW2dNc5GqV6yXXa84OaSWDjYbiMKzJyBmbmCDrVLvg8CHjkYRMRqIl7tvcl5C+YPddZOunPqNr6LEBDCSWia8iwFV8UHKSb8Mvwa1xkFG8sFj8d2vumzcpfbQ/Wp9qEZlqCHIYFBMdpwvOmUC9q80wzS3s=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4599.jpnprd01.prod.outlook.com (20.179.181.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Tue, 23 Apr 2019 09:45:18 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::6d2c:bd11:88b0:c53a%3]) with mapi id 15.20.1813.017; Tue, 23 Apr 2019
 09:45:18 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 4/5] ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in
 shmobile_defconfig
Thread-Topic: [PATCH 4/5] ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in
 shmobile_defconfig
Thread-Index: AQHU9rz9FuofFE88mEGRIB/Ak5dpWaZJfjqAgAAFG9A=
Date:   Tue, 23 Apr 2019 09:45:18 +0000
Message-ID: <OSBPR01MB2103BC726501AF1339531D0DB8230@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <cover.1555654474.git.horms+renesas@verge.net.au>
 <0cd4f4f10245d1d9616e00245093f46acd198141.1555654474.git.horms+renesas@verge.net.au>
 <CAMuHMdVQZbVCGhc==bvV6N-R4NuBwnwUShvL1S9xaHcSJY5B7w@mail.gmail.com>
In-Reply-To: <CAMuHMdVQZbVCGhc==bvV6N-R4NuBwnwUShvL1S9xaHcSJY5B7w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11089587-dfe4-4ff7-bf69-08d6c7d0652a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB4599;
x-ms-traffictypediagnostic: OSBPR01MB4599:
x-microsoft-antispam-prvs: <OSBPR01MB45993048E24580584DF71A3FB8230@OSBPR01MB4599.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0016DEFF96
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(366004)(376002)(346002)(136003)(13464003)(189003)(51914003)(199004)(305945005)(7736002)(74316002)(54906003)(110136005)(6116002)(76176011)(9686003)(97736004)(86362001)(229853002)(3846002)(7696005)(25786009)(4326008)(14454004)(53936002)(55016002)(6246003)(99286004)(2906002)(64756008)(44832011)(476003)(76116006)(33656002)(66446008)(66946007)(66476007)(66556008)(256004)(68736007)(5660300002)(8676002)(486006)(73956011)(81156014)(6436002)(6506007)(53546011)(81166006)(52536014)(478600001)(8936002)(71190400001)(102836004)(66066001)(316002)(11346002)(446003)(186003)(71200400001)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4599;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lBIkLzNmY5QeCu0D9C5Iy1XXn/lrtOzWX1pF27/vQKhB0YmBpinLbpXtb0h6s2PmY4/bJojM7BVkqEv10F9NSlXbiWVYdvCtKE2zelfJSb4KD59lhwQ4LfzfSX58nvOwrbUMR3IR6uoE97jok/2tX4JZO/khksJ1uRMAd8QzWiYqiFoq7tcESjVBEKiXbixgHeQUkJWOqiuSqgWwbDzokjL7o8FS2ktfGkjvd1C/aO6TOqmM4+/LKz9kJqcLTpVEKf8Cxj1ZWn27znMSM73u3Hb+WKAGEthexG/tVwbcFrrRcC6++P+cc+63iW3NSTyMIMtz3HZDO/vqRoHqM9x8FvjZipIU6UH3CBz62j9vCsPRQcY6GBDzlYoTBPcnsuR7RnzEBM8IX/0cS6NIIVv6IVta3Za8H0Xhc5kZe7k5n44=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11089587-dfe4-4ff7-bf69-08d6c7d0652a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2019 09:45:18.2548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4599
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQpTaW1vbiwNCiANCkhvdyBk
byB5b3Ugd2FudCB0byBhZGRyZXNzIHRoaXM/IEEgbmV3IHBhdGNoIGZvciAgdGFraW5nIG91dCAi
Q09ORklHX0dFTkVSSUNfUEhZPXkiDQpmcm9tIHNobW9iaWxlX2RlZmNvbmZpZyAgPz8gUGxlYXNl
IGxldCB1cyBrbm93Lg0KDQpSZWdhcmRzLA0KQmlqdQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogbGludXgtcmVuZXNhcy1zb2Mtb3duZXJAdmdlci5rZXJuZWwub3Jn
IDxsaW51eC1yZW5lc2FzLXNvYy0NCj4gb3duZXJAdmdlci5rZXJuZWwub3JnPiBPbiBCZWhhbGYg
T2YgR2VlcnQgVXl0dGVyaG9ldmVuDQo+IFNlbnQ6IDIzIEFwcmlsIDIwMTkgMTA6MjENCj4gVG86
IFNpbW9uIEhvcm1hbiA8aG9ybXMrcmVuZXNhc0B2ZXJnZS5uZXQuYXU+OyBCaWp1IERhcw0KPiA8
YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+IENjOiBMaW51eC1SZW5lc2FzIDxsaW51eC1yZW5l
c2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc+OyBNYWdudXMgRGFtbQ0KPiA8bWFnbnVzLmRhbW1AZ21h
aWwuY29tPjsgTGludXggQVJNIDxsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQu
b3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDQvNV0gQVJNOiBzaG1vYmlsZTogRW5hYmxlIFBI
WV9SQ0FSX0dFTjNfVVNCMiBpbg0KPiBzaG1vYmlsZV9kZWZjb25maWcNCj4gDQo+IEhpIFNpbW9u
LCBCaWp1LA0KPiANCj4gT24gRnJpLCBBcHIgMTksIDIwMTkgYXQgNDozNiBQTSBTaW1vbiBIb3Jt
YW4NCj4gPGhvcm1zK3JlbmVzYXNAdmVyZ2UubmV0LmF1PiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1
IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBFbmFibGUgUEhZX1JDQVJf
R0VOM19VU0IyIGluIHNobW9iaWxlX2RlZmNvbmZpZyBzbyB0aGF0IGJvYXJkcw0KPiBiYXNlZA0K
PiA+IG9uIFJaL0cxQyBTb0MgZGVzaWduIGNhbiB1c2UgdGhlIGNvcnJlc3BvbmRpbmcgZHJpdmVy
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIEhvcm1hbiA8aG9ybXMrcmVuZXNhc0B2ZXJn
ZS5uZXQuYXU+DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtL2NvbmZpZ3Mvc2htb2JpbGVfZGVmY29u
ZmlnIHwgMSArDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3Mvc2htb2JpbGVfZGVmY29uZmlnDQo+ID4gYi9h
cmNoL2FybS9jb25maWdzL3NobW9iaWxlX2RlZmNvbmZpZw0KPiA+IGluZGV4IDI5MWFiZGQ2NTBl
ZC4uMzBhYmQ4MTc2MDEwIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtL2NvbmZpZ3Mvc2htb2Jp
bGVfZGVmY29uZmlnDQo+ID4gKysrIGIvYXJjaC9hcm0vY29uZmlncy9zaG1vYmlsZV9kZWZjb25m
aWcNCj4gPiBAQCAtMTk3LDYgKzE5Nyw3IEBAIENPTkZJR19QV01fUkVORVNBU19UUFU9eQ0KPiA+
IENPTkZJR19SRVNFVF9DT05UUk9MTEVSPXkgIENPTkZJR19HRU5FUklDX1BIWT15DQo+ID4gQ09O
RklHX1BIWV9SQ0FSX0dFTjI9eQ0KPiA+ICtDT05GSUdfUEhZX1JDQVJfR0VOM19VU0IyPXkNCj4g
DQo+IEFzIFBIWV9SQ0FSX0dFTjNfVVNCMiBzZWxlY3RzIEdFTkVSSUNfUEhZLCB0aGUgbGluZQ0K
PiANCj4gICAgIENPTkZJR19HRU5FUklDX1BIWT15DQo+IA0KPiBzaG91bGQgYmUgcmVtb3ZlZCBm
cm9tIHNobW9iaWxlX2RlZmNvbmZpZy4NCg0KPiA+ICAjIENPTkZJR19ETk9USUZZIGlzIG5vdCBz
ZXQNCj4gPiAgQ09ORklHX01TRE9TX0ZTPXkNCj4gPiAgQ09ORklHX1ZGQVRfRlM9eQ0KPiANCj4g
R3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0K
PiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
