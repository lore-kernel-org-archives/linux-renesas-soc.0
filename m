Return-Path: <SRS0=NjMp=ST=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URG_BIZ
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FD0C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 13:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A47220872
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 13:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="SLbq52VJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729453AbfDQNpo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 17 Apr 2019 09:45:44 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:13437 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbfDQNpo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Apr 2019 09:45:44 -0400
X-IronPort-AV: E=Sophos;i="5.60,362,1549954800"; 
   d="scan'208";a="27600763"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES128-SHA; 17 Apr 2019 06:45:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.37) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Wed, 17 Apr 2019 06:45:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0V77M8hieuLKACRjtfaajjiQmifZxq3IlhBFUDXACII=;
 b=SLbq52VJJ9xEnerJl0taOfns12kdNkTMyycmplwoCNgZ+6z1idIMNKKOP1vB8obxBgu+CLzHGFY2QLueFIH9xnZxUUX1xTdOLfMcr9sBRuzFYj0CHK2yWQeke+zB39YXZfCCEabgU24qkr9tqING3QvczzIpCpRMj9LXuiSi3nc=
Received: from MN2PR11MB3710.namprd11.prod.outlook.com (20.178.252.215) by
 MN2PR11MB3790.namprd11.prod.outlook.com (20.178.253.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.19; Wed, 17 Apr 2019 13:45:41 +0000
Received: from MN2PR11MB3710.namprd11.prod.outlook.com
 ([fe80::8dab:655a:59a2:ba40]) by MN2PR11MB3710.namprd11.prod.outlook.com
 ([fe80::8dab:655a:59a2:ba40%4]) with mapi id 15.20.1792.018; Wed, 17 Apr 2019
 13:45:41 +0000
From:   <Christian.Gromm@microchip.com>
To:     <erosca@de.adit-jv.com>, <andrey.shvetsov@k2l.de>
CC:     <roscaeugeniu@gmail.com>, <driverdev-devel@linuxdriverproject.org>,
        <linux-renesas-soc@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <vladimir.barinov@cogentembedded.com>,
        <external.sudipi@jp.adit-jv.com>, <tfranzen@de.adit-jv.com>
Subject: Re: [PATCH v4 12/12] staging: most: Documentation: update driver
 documentation
Thread-Topic: [PATCH v4 12/12] staging: most: Documentation: update driver
 documentation
Thread-Index: AQHU6iAGWlC7Oldw20yoSRja3120DKY9zhEAgAKmCAA=
Date:   Wed, 17 Apr 2019 13:45:41 +0000
Message-ID: <1555508882.2878.12.camel@microchip.com>
References: <20190415212116.GA3568@vmlxhi-102.adit-jv.com>
In-Reply-To: <20190415212116.GA3568@vmlxhi-102.adit-jv.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Gromm@microchip.com; 
x-originating-ip: [62.154.213.229]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4b28da3-423e-4322-dd2f-08d6c33afbc5
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MN2PR11MB3790;
x-ms-traffictypediagnostic: MN2PR11MB3790:
x-microsoft-antispam-prvs: <MN2PR11MB37905B567A07645AB4E19E8BF8250@MN2PR11MB3790.namprd11.prod.outlook.com>
x-forefront-prvs: 0010D93EFE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(366004)(136003)(189003)(199004)(7736002)(6436002)(25786009)(6512007)(478600001)(72206003)(76176011)(8936002)(26005)(14454004)(6116002)(68736007)(186003)(6506007)(102836004)(6486002)(3846002)(4326008)(36756003)(305945005)(53936002)(110136005)(54906003)(316002)(103116003)(81156014)(105586002)(86362001)(229853002)(6246003)(486006)(81166006)(8676002)(476003)(71200400001)(106356001)(71190400001)(99286004)(2906002)(2616005)(256004)(11346002)(2501003)(446003)(97736004)(14444005)(5660300002)(66066001);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR11MB3790;H:MN2PR11MB3710.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a8DuscbKctRn7dycLcXvXETshoAr2FP47T+HSBoa1b5vIwJXGCJ6CVXPzsFttMqsXVPM90XUe+3WFpJXqkln11pna3KXbHN+blZoxIhzsAMni4dIEnA/HL4jaCWXGA0vzedRF43wtG4WFMAQL2e1FUnkrRx4GuAlNTaCkkYw/NvZNmbEwnddXeH2Ust/qnxpEG7iLapm/lbCMvXBzsPMK3gniQSvcH5QR7coCufd8hJQFznmfItLGQLyFioHFmXgJMG5hY2Xlpq8RhMSgvQKqyj9YySmbOy2oX4mlcW9Co2n/b3j77wzwfRHJmp0mF+2kZEfrIfgUlBYxQqaEQhYEDmRiABdEkoGz2xmnSHD5MMiKxJDTGUHGvxILegziJxxCpVL2UGsp6JA4+1MseoWX4ILi8TL7NXl2ILitWgyVDU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98BEE1757583F347B7CA46762B918BB2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b28da3-423e-4322-dd2f-08d6c33afbc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2019 13:45:41.7880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3790
X-OriginatorOrg: microchip.com
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gTW8sIDIwMTktMDQtMTUgYXQgMjM6MjEgKzAyMDAsIEV1Z2VuaXUgUm9zY2Egd3JvdGU6DQo+
IEV4dGVybmFsIEUtTWFpbA0KPiANCj4gDQo+IEhlbGxvIENocmlzdGlhbiwgaGVsbG8gQW5kcmV5
LA0KPiBjYzogVmxhZGltaXIgQmFyaW5vdg0KPiBjYzogbGludXgtcmVuZXNhcy1zb2MNCj4gDQo+
IE91ciB0ZWFtIGN1cnJlbnRseSBoYXMgdGhlIHJlcXVpcmVtZW50IG9mIGFkZGluZyBNT1NUIHN1
cHBvcnQgdG8NCj4gdGhlIHY0LjE0LWJhc2VkIFItQ2FyMyBrZXJuZWwgWzFdLCBtYXRjaGluZyB0
aGUgbGV2ZWwgb2YgZmVhdHVyZXMNCj4gYW5kIGludGVyZmFjZXMgb2YgbWxkLTEuOC4wIFsyXSBy
ZWxlYXNlLg0KPiANCj4gQmFzZWQgb24gYSBxdWljayBjaGVjayBbM10sIHRoZSBtbGQtMS44LjAg
cmVsZWFzZSBjb250YWlucyAyMjEgbm9uLQ0KPiBtZXJnZQ0KPiBub24tbWFpbmxpbmUgY29tbWl0
cy4gSXQgc2VlbXMgbGlrZSBhdCBsZWFzdCBzb21lIChtb3N0Pykgb2YgdGhlbQ0KPiBoYXZlDQo+
IGJlZW4gcmV3b3JrZWQgZHVyaW5nIHVwc3RyZWFtaW5nIGFuZCBhcmUgbm93IHBhcnQgb2YgdmFu
aWxsYSwgdGhhbmtzDQo+IHRvDQo+IHlvdXIgZWZmb3J0cy4NCj4gDQo+IFNpbmNlIHlvdSd2ZSBh
Y3RpdmVseSBwYXJ0aWNpcGF0ZWQgaW4gcHVzaGluZyB0aGUgb3V0LW9mLXRyZWUgZHJpdmVycw0K
PiB0byBtYWlubGluZSwgY291bGQgeW91IHBsZWFzZSBzaGFyZSB5b3VyIGd1dCBmZWVsaW5nIHdo
ZXRoZXIgdGhlDQo+IGN1cnJlbnQgbWFpbmxpbmUgc3RhdGUgb2YgdGhlIE1PU1Qgc3Vic3lzdGVt
IG1hdGNoZXMgdGhlIG1sZC0xLjguMA0KPiByZWxlYXNlIGluIHRlcm1zIG9mIGZlYXR1cmVzIGFu
ZCBpbnRlcmZhY2VzPw0KPiANCg0KTm8sIGl0IGRvZXNuJ3QuIFRoZSB2ZXJzaW9uIHVwc3RyZWFt
IGRvZXMgbm90IGhhdmUgYWxsIHRoZSBiZWxscw0KYW5kIHdoaXN0bGVzIHRoZSBtbGQtMS44LjAg
dmVyc2lvbiBoYXMsIHlldC4gRm9jdXMgb2YgdGhlIGxhdGVzdA0KbWFpbmxpbmUgY29tbWl0cyB3
YXMgb24gdGhlIGRyaXZlciBtb2RlbCBhbmQgdGhlIHN3aXRjaCB0byBjb25maWdmcy4NCg0KPiBB
dCBmaXJzdCBnbGFuY2UsIHN1Y2ggbWxkLTEuOC4wIGZ1bmN0aW9uYWxpdGllcyBsaWtlICJmbGV4
aWJsZSBQQ00NCj4gcmF0ZSBzdXBwb3J0IiBbNF0sIGFzIHdlbGwgYXMgYSBudW1iZXIgb2YgZGlt
MiBzeXNmcyBlbnRyaWVzIFs1LThdDQo+IGFwcGVhciB0byBiZSBtaXNzaW5nIGluIHY1LjEtcmM1
LiBDb3VsZCB5b3UgcGxlYXNlIGZlZWRiYWNrIGlmIHRoZXNlDQo+IGhhdmUgYmVlbiBkZWxpYmVy
YXRlbHkgZHJvcHBlZCBvciBkaWRuJ3QgbWFrZSB0aGVpciB3YXkgZm9yIGFub3RoZXINCj4gcmVh
c29uPyBXaGF0IHdvdWxkIGJlIHlvdXIgcmVjb21tZW5kYXRpb24gYmV0d2VlbiBnb2luZyB0aGUg
bWxkLTEuOC4wDQo+IGFuZCBnb2luZyB0aGUgdjUuMS1yYzUgd2F5IGZvciBNT1NUPw0KPiANCg0K
VGhlIGZ1bmN0aW9uYWxpdGllcyB5b3UncmUgcmVmZXJyaW5nIHRvIGhhdmUgX25vdF8gaW50ZW50
aW9uYWxseSBiZWVuDQpkcm9wcGVkLiBUaGV5IHdpbGwgZmluZCB0aGVpciB3YXkgaW50byBtYWlu
bGluZS4gSWYgdGhlcmUgYXJlIHVyZ2VudA0KZmVhdHVyZSByZXF1ZXN0cywgd2UgY291bGQgcHJp
b3JpdGl6ZSB0aGVtLg0KDQpCb3R0b20gbGluZSBpcywgdGhlIHVwc3RyZWFtIHZlcnNpb24gaXMg
dGhlIG9uZSB5b3Ugc2hvdWxkIGJlIHVzaW5nLA0KYXMgaXQgaXMgZ29pbmcgdG8gcmVwbGFjZSB0
aGUgbWxkLTEueCBicmFuY2guIFRoaXMgaXMgZXhhY3RseSB3aGF0IHdlDQp3aWxsIHNvb24gYmUg
ZG9pbmcgZm9yIEFHTCBieSB0aGUgd2F5Lg0KDQp0aGFua3MsDQpDaHJpcw0K
