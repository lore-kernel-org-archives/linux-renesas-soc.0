Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B16C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 09:31:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BA0620651
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 09:31:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Yk/nSaFb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbfAHJb1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 04:31:27 -0500
Received: from mail-eopbgr1310092.outbound.protection.outlook.com ([40.107.131.92]:51976
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727295AbfAHJb1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 04:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IPevHuIndYIQWvTsKtJRGB5i59L8IQO0a5t1vKozoo=;
 b=Yk/nSaFbADI8i2/wVaKfhWsABbxYN/OOEElpt0rZhebJSC25wZZuHnHnePsAHSpXLmWd8Ws331RoJDB5knLl74z9/UZCcZiqEdybLPYnUp7vCxOhAQaDEMMQAo7cdJ6SFgjLwgPiuwFCB9iK+jpSodvmMTBLkeFEXV+Dwo6XxF0=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB3484.jpnprd01.prod.outlook.com (20.178.132.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.8; Tue, 8 Jan 2019 09:30:39 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e%3]) with mapi id 15.20.1495.011; Tue, 8 Jan 2019
 09:30:39 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Thierry Reding <thierry.reding@gmail.com>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 4/4] pwm: rcar: improve calculation of divider
Thread-Topic: [PATCH v2 4/4] pwm: rcar: improve calculation of divider
Thread-Index: AQHUpwKXJ5RiX2asNUSJEpCJohi3m6WlCGuAgAAS4eA=
Date:   Tue, 8 Jan 2019 09:30:38 +0000
Message-ID: <TY2PR01MB4812A3D8A3E8A2938F147E71D88A0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <1546918094-13960-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1546918094-13960-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVZXjFoY7J-1_WfL3xz1cO5XUEi8YnFK9W8gGfMdLDnhw@mail.gmail.com>
In-Reply-To: <CAMuHMdVZXjFoY7J-1_WfL3xz1cO5XUEi8YnFK9W8gGfMdLDnhw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY2PR01MB3484;20:SmaVb19dyrE0Rm2MiLHDfekYJ8iPEKN+o5mgYb0bwsalYHF/ukZsC83MCD6c0OP1a0UG55B9dBnfsmtUwVW7z34THgPlKbX2XCMI0SamOpRjI0QxHpzdGXhYXqQq1eMVrh922AfpVxr7brofRnVfFo7RgKgnKoSNMx86N9dQ+nA=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 42b94460-09ca-4636-248f-08d6754bf3c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB3484;
x-ms-traffictypediagnostic: TY2PR01MB3484:
x-microsoft-antispam-prvs: <TY2PR01MB3484C0513409EA5B56B2E3E1D88A0@TY2PR01MB3484.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(93006095)(93001095)(10201501046)(3231475)(944501520)(52105112)(3002001)(6055026)(6041310)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:TY2PR01MB3484;BCL:0;PCL:0;RULEID:;SRVR:TY2PR01MB3484;
x-forefront-prvs: 0911D5CE78
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(39860400002)(396003)(366004)(346002)(199004)(189003)(6246003)(486006)(186003)(14454004)(478600001)(102836004)(74316002)(14444005)(53936002)(33656002)(345774005)(5660300001)(446003)(11346002)(2906002)(476003)(39060400002)(66066001)(316002)(54906003)(25786009)(9686003)(55016002)(8676002)(97736004)(7696005)(106356001)(105586002)(4326008)(81156014)(305945005)(99286004)(7736002)(71190400001)(71200400001)(76176011)(6506007)(53546011)(256004)(3846002)(6436002)(86362001)(6116002)(68736007)(81166006)(229853002)(66574012)(26005)(6916009)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB3484;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2PWkPTdb6ETjif95LcxGojl/J8CTM8QNI4/HDwJ4aSa/J1GgT8iJNu3S1LW/FUDqqU/j3xhF4wUXzkdIeDGUx31AMUm/FT/QgggOkN6WqakLy59eGOUmtzfdJBTVY1dHr2kg8mNkXv2MIdA+Sn8zNceSyxPkCmKR4MfSXArgEDFRciLt+oA3sY6/5G+0k4WHFyNtqZjd8azqWXa1vDfYEzTjKqRDuqy078r4euDuDMRHl24osUvI5Xc6r5D4a/qJGJ9n61Z+J+q6A7OZ/o4jVReOeRiyVs1lla8rvNPdgSfr+vXiK8De9IP6DioYoJt9
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b94460-09ca-4636-248f-08d6754bf3c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2019 09:30:39.0081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3484
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgSmFudWFyeSA4LCAyMDE5IDU6MjIgUE0NCj4gDQo+IEhpIFNoaW1vZGEtc2FuLA0KPiANCj4g
T24gVHVlLCBKYW4gOCwgMjAxOSBhdCA0OjMxIEFNIFlvc2hpaGlybyBTaGltb2RhDQo+IDx5b3No
aWhpcm8uc2hpbW9kYS51aEByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhlIHJjYXJfcHdtX2dl
dF9jbG9ja19kaXZpc2lvbigpIGhhcyBhIGxvb3AgdG8gY2FsY3VsYXRlIHRoZSBkaXZpZGVyLA0K
PiA+IGJ1dCB0aGUgdmFsdWUgb2YgZGl2IHNob3VsZCBiZSBjYWxjdWxhdGFibGUgd2l0aG91dCBh
IGxvb3AuIFNvLA0KPiA+IHRoaXMgcGF0Y2ggaW1wcm92ZXMgaXQuDQo+ID4NCj4gPiBUaGlzIGFs
Z29yaXRobSBpcyBzdWdnZXN0ZWQgYnkgVXdlIEtsZWluZS1Lw7ZuaWcgYW5kIExhdXJlbnQgUGlu
Y2hhcnQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvcHdtL3B3
bS1yY2FyLmMgfCAxNiArKysrKysrLS0tLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wd20vcHdtLXJjYXIuYyBiL2RyaXZlcnMvcHdtL3B3bS1yY2FyLmMNCj4gPiBpbmRleCA2ZGJi
NzBjLi4wNDk4YTkzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1yY2FyLmMNCj4g
PiArKysgYi9kcml2ZXJzL3B3bS9wd20tcmNhci5jDQo+ID4gQEAgLTgsNiArOCw4IEBADQo+ID4g
ICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+
ICAjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2xvZzIuaD4NCj4g
PiArI2luY2x1ZGUgPGxpbnV4L21hdGg2NC5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcGxh
dGZvcm1fZGV2aWNlLmg+DQo+ID4gQEAgLTY4LDE5ICs3MCwxNSBAQCBzdGF0aWMgdm9pZCByY2Fy
X3B3bV91cGRhdGUoc3RydWN0IHJjYXJfcHdtX2NoaXAgKnJwLCB1MzIgbWFzaywgdTMyIGRhdGEs
DQo+ID4gIHN0YXRpYyBpbnQgcmNhcl9wd21fZ2V0X2Nsb2NrX2RpdmlzaW9uKHN0cnVjdCByY2Fy
X3B3bV9jaGlwICpycCwgaW50IHBlcmlvZF9ucykNCj4gPiAgew0KPiA+ICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBjbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShycC0+Y2xrKTsNCj4gPiAtICAgICAgIHVu
c2lnbmVkIGxvbmcgbG9uZyBtYXg7IC8qIG1heCBjeWNsZSAvIG5hbm9zZWNvbmRzICovDQo+ID4g
LSAgICAgICB1bnNpZ25lZCBpbnQgZGl2Ow0KPiA+ICsgICAgICAgdTY0IGRpdiwgdG1wOw0KPiA+
DQo+ID4gICAgICAgICBpZiAoY2xrX3JhdGUgPT0gMCkNCj4gPiAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQo+ID4NCj4gPiAtICAgICAgIGZvciAoZGl2ID0gMDsgZGl2IDw9IFJDQVJf
UFdNX01BWF9ESVZJU0lPTjsgZGl2KyspIHsNCj4gPiAtICAgICAgICAgICAgICAgbWF4ID0gKHVu
c2lnbmVkIGxvbmcgbG9uZylOU0VDX1BFUl9TRUMgKiBSQ0FSX1BXTV9NQVhfQ1lDTEUgKg0KPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICgxIDw8IGRpdik7DQo+ID4gLSAgICAgICAgICAgICAg
IGRvX2RpdihtYXgsIGNsa19yYXRlKTsNCj4gPiAtICAgICAgICAgICAgICAgaWYgKHBlcmlvZF9u
cyA8PSBtYXgpDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gLSAgICAg
ICB9DQo+ID4gKyAgICAgICBkaXYgPSBOU0VDX1BFUl9TRUMgKiBSQ0FSX1BXTV9NQVhfQ1lDTEU7
DQo+IA0KPiBBcyB3ZSBoYXZlOg0KPiANCj4gICAgICNkZWZpbmUgTlNFQ19QRVJfU0VDICAgIDEw
MDAwMDAwMDBMDQo+ICAgICAjZGVmaW5lIFJDQVJfUFdNX01BWF9DWUNMRSAgICAgIDEwMjMNCj4g
DQo+IE5TRUNfUEVSX1NFQyBpcyA2NC1iaXQgb24gYXJtNjQsIGFuZCAzMi1iaXQgb24gYXJtMzIu
DQo+IA0KPiBIZW5jZSB5b3Ugc2hvdWxkIHVzZQ0KPiANCj4gICAgIGRpdiA9ICh1NjQpTlNFQ19Q
RVJfU0VDICogUkNBUl9QV01fTUFYX0NZQ0xFOw0KPiANCj4gdG8gYXZvaWQgb3ZlcmZsb3cgb24g
YXJtMzIuDQoNClRoYW5rIHlvdSBmb3IgdGhlIGNvbW1lbnQhIEknbGwgZml4IHRoaXMuDQoNCkJl
c3QgcmVnYXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCj4gPiArICAgICAgIHRtcCA9ICh1NjQp
cGVyaW9kX25zICogY2xrX3JhdGUgKyBkaXYgLSAxOw0KPiA+ICsgICAgICAgdG1wID0gZGl2NjRf
dTY0KHRtcCwgZGl2KTsNCj4gPiArICAgICAgIGRpdiA9IGlsb2cyKHRtcCAtIDEpICsgMTsNCj4g
Pg0KPiA+ICAgICAgICAgcmV0dXJuIChkaXYgPD0gUkNBUl9QV01fTUFYX0RJVklTSU9OKSA/IGRp
diA6IC1FUkFOR0U7DQo+ID4gIH0NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0
Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
