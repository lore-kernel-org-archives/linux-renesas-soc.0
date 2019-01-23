Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC04C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 15:08:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B7C720820
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 15:08:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Q44+6DvA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfAWPI4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 10:08:56 -0500
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:49712
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725871AbfAWPI4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 10:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2XE/FnFwB9gU/tj96y64gDwy7AVog4ACFa2rwZDqUI=;
 b=Q44+6DvA58ngj1/kprruxACk11rC4Ue1VHwn9aCJMDj2g6CfT6grhj0c9Nee7kUdhpopgx6bXv0J0T0NCk1YR7WxX2n0gKBYm51KmJdrK4sUSEKUI1Nvq3BBqXa9ucAsCyq5Ovbe0co5aiV+H1uFxabycpEDqc10ekXJe29N+Lo=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB1819.jpnprd01.prod.outlook.com (52.133.164.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Wed, 23 Jan 2019 15:08:50 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74fc:a361:eeec:1678]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74fc:a361:eeec:1678%5]) with mapi id 15.20.1537.032; Wed, 23 Jan 2019
 15:08:50 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: arm: renesas: Document RZ/A2M EVB
Thread-Topic: [PATCH] dt-bindings: arm: renesas: Document RZ/A2M EVB
Thread-Index: AQHUsyJkFshxCv8Ka02o2a3Na6PmfKW84W4AgAAA9RCAAA+2gIAAAMqg
Date:   Wed, 23 Jan 2019 15:08:50 +0000
Message-ID: <TY1PR01MB15628CEA7C9CB1202806F66C8A990@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190123134833.119031-1-chris.brandt@renesas.com>
 <CAL_JsqKuDzL2N_fihJzUEZ9uRK5HWd1ARD7DzZZM7Dy4C8M_BA@mail.gmail.com>
 <TYXPR01MB1568588CC80BDB074A4FADA08A990@TYXPR01MB1568.jpnprd01.prod.outlook.com>
 <CAMuHMdUsJ5dhH5Rz8iWW8ocbnwaEeSBL9ToKibb5Sj29Y0jRog@mail.gmail.com>
In-Reply-To: <CAMuHMdUsJ5dhH5Rz8iWW8ocbnwaEeSBL9ToKibb5Sj29Y0jRog@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1819;20:UFmvpGXoZ9n3JDJKzW24B57kUS5tWHAY43Vp1RcBM9dMQu035WgSE9F6NkE52WILWewE9wXMwwnpsPy1r5cPnMfBnrNKsWRn66SbSqlYdfG/lgUsFhHbdBcg1YCiGsJKHTbGFz4M+2opwa86oIKzfGxzP7vbQI0/nZjJi1WYCEg=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 3d203b8a-bdc0-4a9a-76be-08d68144ae92
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1819;
x-ms-traffictypediagnostic: TY1PR01MB1819:
x-microsoft-antispam-prvs: <TY1PR01MB1819BE424D3FBA8697BC06E68A990@TY1PR01MB1819.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(39850400004)(136003)(396003)(366004)(346002)(199004)(189003)(11346002)(105586002)(71200400001)(71190400001)(106356001)(446003)(476003)(25786009)(229853002)(81166006)(81156014)(8676002)(93886005)(8936002)(305945005)(102836004)(68736007)(7696005)(33656002)(76176011)(6506007)(7736002)(3846002)(86362001)(186003)(97736004)(26005)(6116002)(2906002)(53936002)(6246003)(486006)(54906003)(14454004)(478600001)(256004)(316002)(74316002)(99286004)(72206003)(9686003)(966005)(6306002)(66066001)(6436002)(4326008)(6916009)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1819;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DIEDoHntGWT8CPkmXfp4CF50zvILk4noXDyKC5Slr/sQyxuV/bZNSLAPhJ1dk+fRvGZDmkIXy/m/aoIE/OJY36X/5Kla76GhzdtqDyN42+vUe4h6dMtJirSGLDvb0GS+J7IUrDwqKOnbzurUvvybK0JF9G5EVchq7Kc09U7V/GLtCoku06OdNcQqfmcAc+Ghl16A24TUzHA2GOi17gCuR5Ojdf7F7ZcXC1DGaTK2nLpF+VQ0+xzLwlflEw2CrweBxBad29zs0uy662KvluZvcidGGG6mTL9ukss6ZbnokmhdmcK9do9PTmCenZS2mQCikdiMC6BL/90/T5Zyw9bgYYuf2MH+DI6OXVuR2wMNSphvZBDg6PM9mfX2TRLD0RsnPl0ARvCXxCBAu1nzU/YU1jjn+89BCe+xLXZWBknMaYY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d203b8a-bdc0-4a9a-76be-08d68144ae92
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 15:08:50.1723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1819
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIFdlZG5lc2RheSwgSmFudWFyeSAyMywgMjAxOSwgR2VlcnQgVXl0dGVy
aG9ldmVuIHdyb3RlOg0KPiA+IEkgY2FuJ3QgZmluZCAnZHRfYmluZGluZ19jaGVjaycgKEkgZ3Vl
c3MgaXQncyBvbmx5IGluIHRoZSBEVCB0cmVlKS4NCj4gDQo+IFRoaXMgc2VlbXMgdG8gYmUgYSBt
YWtlIHRhcmdldDogIm1ha2UgZHRfYmluZGluZ19jaGVjayINCj4gKGluY2x1ZGVkIGluIGxhc3Qg
cmVuZXNhcy1kcml2ZXJzKS4NCj4gDQo+IFRoaXMgbmVlZHMgImR0LW1rLXNjaGVtYSIsIHdoaWNo
IHlvdSBjYW4gZmluZCBpbg0KPiBodHRwczovL2dpdGh1Yi5jb20vcm9iaGVycmluZy95YW1sLWJp
bmRpbmdzDQo+IA0KPiBDbG9uZWQsIHBhdGNoIHNlbnQgZm9yIG1pc3NpbmcgcHl0aG9uMy1waXAg
ZGVwZW5kZW5jeSwgaW5zdGFsbGVkLCBwdXQgaW4NCj4gJFBBVEgsDQo+IGFuZCBub3cgaXQgc2Vl
bXMgdG8gbGlrZSB5b3VyIHYyLg0KDQpUaGFuayB5b3UhISENCg0KDQpDaHJpcw0K
