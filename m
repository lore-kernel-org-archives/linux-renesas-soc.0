Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221A6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:18:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D723320851
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:18:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="dIhewAxX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfAQKSk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:18:40 -0500
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:62891
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726948AbfAQKSj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:18:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIZwJLH/iXXl61j6WiaWByVozWf+eGxsihCm32lZeck=;
 b=dIhewAxXBOkUT1AFke96peb+rjGo4dZgaiy/bfDJ8ghUpv5ByXBeqcJi3XqOiFVoewkwSKbmSUn94lisCt3Y2oVYvhsgv/pg6vr8W+1gwjXeTujxF/VHWoorYGaAh1XKorYT8dwHC1HcHOhaFnttbePLajy7DEi3fWFlA+djm+Q=
Received: from OSBPR01MB4807.jpnprd01.prod.outlook.com (20.179.182.211) by
 OSBPR01MB3303.jpnprd01.prod.outlook.com (20.178.5.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Thu, 17 Jan 2019 10:18:34 +0000
Received: from OSBPR01MB4807.jpnprd01.prod.outlook.com
 ([fe80::4dfd:d4c6:ed1a:dae0]) by OSBPR01MB4807.jpnprd01.prod.outlook.com
 ([fe80::4dfd:d4c6:ed1a:dae0%3]) with mapi id 15.20.1537.018; Thu, 17 Jan 2019
 10:18:31 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Vinod Koul <vinod.koul@intel.com>,
        "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        Phuong Nguyen <phuong.nguyen.xw@renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM list <linux-pm@vger.kernel.org>
Subject: RE: [PATCH] dmaengine: usb-dmac: Make DMAC system sleep callbacks
 explicit
Thread-Topic: [PATCH] dmaengine: usb-dmac: Make DMAC system sleep callbacks
 explicit
Thread-Index: AQHUrg6SJ5NBG/A6VUuNOj6d/H2S2qWzKtiAgAATsmA=
Date:   Thu, 17 Jan 2019 10:18:30 +0000
Message-ID: <OSBPR01MB480771BF7304F4C42FFE0C5BD8830@OSBPR01MB4807.jpnprd01.prod.outlook.com>
References: <1547692896-2362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdU_dbRp2Yqjjd4Vi-1bV4vSQe=UOEcrvCumfoYifzQzxw@mail.gmail.com>
In-Reply-To: <CAMuHMdU_dbRp2Yqjjd4Vi-1bV4vSQe=UOEcrvCumfoYifzQzxw@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB3303;20:XiS124rezBEhD87yPo5DMpHfeyLvkB6TPR78YMyOFO8DU38kfAKoXtBFGe5GcUdzoZPcZpHeFCWSTsw84UEyrJPOUwFydFPvB1uA9/PX4qx4cD73D3e/hlkz52Jc3NfZhMlXaOTReehaVFPc9bUIx6G4A3J3SjQ2S9P21teameE=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(39860400002)(376002)(346002)(366004)(396003)(136003)(189003)(199004)(52314003)(97736004)(71200400001)(71190400001)(6916009)(54906003)(86362001)(68736007)(8676002)(345774005)(478600001)(446003)(25786009)(3846002)(8936002)(66066001)(9686003)(11346002)(6116002)(6246003)(81166006)(81156014)(7736002)(53936002)(102836004)(316002)(76176011)(6506007)(14454004)(55016002)(33656002)(4326008)(486006)(229853002)(106356001)(305945005)(105586002)(6436002)(186003)(99286004)(7696005)(74316002)(5660300001)(256004)(14444005)(476003)(2906002)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3303;H:OSBPR01MB4807.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-office365-filtering-correlation-id: f22d6275-4351-4a2a-eff7-08d67c652145
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB3303;
x-ms-traffictypediagnostic: OSBPR01MB3303:
x-microsoft-antispam-prvs: <OSBPR01MB3303585419852BD98E74F81AD8830@OSBPR01MB3303.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0920602B08
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PlepqCUuXdiHAcVd+DG8Xi+amC/HLR7xpUn5nTH17zbUv2tTZtDlCMvcxzkULHVV5ZVZukQ04tqQp7Se/vkxUPamWe823PcfehbdplEhCZORaIKqIDExVhRsL2loJqxvckgISLN9n5v0kS4LCK5ex6ryGjefk0BiY+/Nrs6AY8wzmtc53ngquSi8J//KJUTblC+m8322MBlZJ4a8AeCZ0d3utSx2sZw06O35d0V7cJh3JxdZY6pex9UvVIavkTj6popZrvaQhl1GKps7rYCgm+kVPmUUq5J5yjzYOdWtyW05mtBbpky2aU2eqksVYuep9mBEJaic2/ighQKzaIKe0ZM2731EcrS/aTziieRnbxJMD0aQhkU09RGjhhggGiNsnDyUoOa6yZoelIYcDqV4UtVQDjNZS6E9kR8HxZeYTXg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f22d6275-4351-4a2a-eff7-08d67c652145
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 10:18:30.9305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3303
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVGh1cnNk
YXksIEphbnVhcnkgMTcsIDIwMTkgNjowMyBQTQ0KPiANCj4gSGkgU2hpbW9kYS1zYW4sDQo+IA0K
PiBDQyBsaW51eC1wbSBwZW9wbGUNCjxzbmlwPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQ0KPiANCj4gVGhpcyBpcyBzaW1pbGFyIGluIHNwaXJpdCB0byBjb21taXRzIDExMzFiMGE0YWY5
MTFkZTUgKCJkbWFlbmdpbmU6DQo+IHJjYXItZG1hYzogTWFrZSBETUFDIHJlaW5pdCBkdXJpbmcg
c3lzdGVtIHJlc3VtZSBleHBsaWNpdCIpIGFuZA0KPiA3M2RjYzY2NmQ2YmQwZGI1ICgiZG1hZW5n
aW5lOiByY2FyLWRtYWM6IEZpeCB0b28gZWFybHkvbGF0ZSBzeXN0ZW0NCj4gc3VzcGVuZC9yZXN1
bWUgY2FsbGJhY2tzIikgZm9yIHJjYXItZG1hYy4NCj4gDQo+IEknbSBvbmx5IHdvbmRlcmluZyBp
ZiB0aGUgImxhdGUiIHZhcmlhbnQgd291bGQgYmUgc3VmZmljaWVudCBoZXJlLg0KDQpJIHRyaWVk
IHRvIHVzZSBTRVRfTEFURV8uLi4gKCkgaW5zdGVhZCBvZiBTRVRfTk9JUlFfLi4uLCBpdCBhbHNv
IHdvcmtlZCBjb3JyZWN0bHkuDQoNCj4gRG9lcyBnX3NlcmlhbCBzdXBwb3J0IHdha2UtdXA/DQoN
CkkgYmVsaWV2ZSBhbnkgVVNCIGdhZGdldHMgZG9uJ3Qgc3VwcG9ydCBvd24gc3lzdGVtIHdha2Ut
dXAgYmVjYXVzZSB0aGV5DQphcmUgYWdhaW5zdCBVU0IgaG9zdC4NCg0KPiBBbnl3YXksIHVzaW5n
IHRoZSAibm9pcnEiIHZhcmlhbnQsIGxpa2UgeW91IGRpZCwgaXMgcHJvYmFibHkgdGhlIHNhZmVz
dC4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNA
Z2xpZGVyLmJlPg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQpCZXN0IHJlZ2FyZHMs
DQpZb3NoaWhpcm8gU2hpbW9kYQ0KDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZG1hL3NoL3VzYi1k
bWFjLmMgfCAyICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS9zaC91c2ItZG1hYy5jIGIvZHJpdmVycy9kbWEv
c2gvdXNiLWRtYWMuYw0KPiA+IGluZGV4IDdmNzE4NGMuLjU5NDAzZjYgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9kbWEvc2gvdXNiLWRtYWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZG1hL3NoL3Vz
Yi1kbWFjLmMNCj4gPiBAQCAtNjk0LDYgKzY5NCw4IEBAIHN0YXRpYyBpbnQgdXNiX2RtYWNfcnVu
dGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICAjZW5kaWYgLyogQ09ORklHX1BN
ICovDQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHVzYl9kbWFjX3Bt
ID0gew0KPiA+ICsgICAgICAgU0VUX05PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMocG1fcnVudGlt
ZV9mb3JjZV9zdXNwZW5kLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcG1fcnVudGltZV9mb3JjZV9yZXN1bWUpDQo+ID4gICAgICAgICBTRVRfUlVOVElNRV9QTV9P
UFModXNiX2RtYWNfcnVudGltZV9zdXNwZW5kLCB1c2JfZG1hY19ydW50aW1lX3Jlc3VtZSwNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMKQ0KPiA+ICB9Ow0KPiANCj4gR3J7b2V0
amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4g
LS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0
aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0K
PiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMNCg==
