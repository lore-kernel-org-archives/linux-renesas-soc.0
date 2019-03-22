Return-Path: <SRS0=lsYt=RZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAC7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 11:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8ED52075C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Mar 2019 11:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="KVQLpoHn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727925AbfCVLEj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Mar 2019 07:04:39 -0400
Received: from mail-eopbgr1410099.outbound.protection.outlook.com ([40.107.141.99]:25409
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727713AbfCVLEj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Mar 2019 07:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKQBdSeu5x/TsiG/L4WJMtC+ObXzpr79l0uyNpxvEJY=;
 b=KVQLpoHn7P5MEW2CpocJeVEYxOg91um2lX9Ri/otZT8C/njw/7o3Tw/hY5/teL+y5OhHkSvT9EBek9W0MrTfm830mnBG4qKvRT8KlVgC2BuTGvlF1ykLVfJTvFmnVmPVmNbtYJ9yK9RRjSvxyHPqINd1HfTRRitSk6mX9pZ+bTI=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB1772.jpnprd01.prod.outlook.com (52.133.163.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.17; Fri, 22 Mar 2019 11:04:35 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::195b:1385:70ae:194c]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::195b:1385:70ae:194c%2]) with mapi id 15.20.1709.015; Fri, 22 Mar 2019
 11:04:35 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/2] ARM: dts: rskrza1: Add I2C and remaining LEDs
Thread-Topic: [PATCH 0/2] ARM: dts: rskrza1: Add I2C and remaining LEDs
Thread-Index: AQHU31VQE49rVXGiT0GAAZ+LlWgMvaYU+PoggADi4YCAAXZxgIAAKsxA
Date:   Fri, 22 Mar 2019 11:04:35 +0000
Message-ID: <TY1PR01MB156259D3A98DC7A29890B02C8A430@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190320194410.14870-1-geert+renesas@glider.be>
 <TY1PR01MB15627B138E7BE709BC483E2A8A410@TY1PR01MB1562.jpnprd01.prod.outlook.com>
 <CAMuHMdXG2wD9sbZY-1LY3d+AVA3BBjpjsn3zd3dJEi2r2BVEfg@mail.gmail.com>
 <CAMuHMdUSxx94+-M6OR+2BOO0NgAdP27o1Af7c_xeufv1b1Hp5A@mail.gmail.com>
In-Reply-To: <CAMuHMdUSxx94+-M6OR+2BOO0NgAdP27o1Af7c_xeufv1b1Hp5A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1682383-af71-4f39-67aa-08d6aeb62b5f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1772;
x-ms-traffictypediagnostic: TY1PR01MB1772:
x-microsoft-antispam-prvs: <TY1PR01MB1772BAF851BF3A6A332E4B788A430@TY1PR01MB1772.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09840A4839
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(376002)(396003)(346002)(366004)(199004)(189003)(6246003)(478600001)(186003)(105586002)(26005)(446003)(11346002)(52536014)(5660300002)(486006)(476003)(8936002)(14454004)(72206003)(71200400001)(81166006)(4744005)(81156014)(8676002)(106356001)(86362001)(6506007)(102836004)(71190400001)(25786009)(256004)(68736007)(54906003)(316002)(99286004)(76176011)(93886005)(7696005)(97736004)(6916009)(55016002)(66066001)(229853002)(6116002)(53936002)(3846002)(9686003)(6436002)(2906002)(7736002)(305945005)(4326008)(74316002)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1772;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uzZ90EQ05ty8UEh37HS9Nd1gcsmozR9blwz9uo9ICT7V27r1VPiYmpvzirXw5Ulm9W5KOZgxjQqqGqv3xIctMEvzzBda5sWmhzT/nmUYD3iHecSkmOmEzkxrMyG5H0dRLRXukFqxmQxfwc02dVrmW46Wub6CAdwnfJ7hIwiCuC5dwuSvvaQ7qEJbEHf/b409eyi+7uGG54nltvULK5exn6L7Gx1qBOK0B9N+1Vq7DryBEA1RzjDogyYPbcFjGdOIQJtggNEYH9OVe8f/Zlya4k4RilNx+O+aq9hiSt1Jjks1TmFRHRmiB9s6YXqbJufksvMViylGSBZABhAmG2R1/qK+lS5uqZJmxVWkW9kyKg2rejzHwj1JXIBZfuRt1Vm9dGRT31ypCClDEvr/mDf2s5/ZHw3Mb9yoMVW0kHZbDJE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1682383-af71-4f39-67aa-08d6aeb62b5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2019 11:04:35.3837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1772
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIEZyaSwgTWFyIDIyLCAyMDE5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6DQo+ID4gWWVhaCwgSSd2ZSBzZWVuIHRoYXQgY29kZS4gTm90IGZpdCBmb3IgdXBzdHJlYW0g
Oy0pDQo+IA0KPiBUaGUgcHJvcGVyIHdheSBpcyB0byB1c2UgdGhhdCBzdGFuZGFyZCBoZWFydGJl
YXQgTEVEIHRyaWdnZXINCj4gQ09ORklHX0xFRFNfVFJJR0dFUl9IRUFSVEJFQVQ9eSwgY29uZmln
dXJhYmxlIGZyb20NCj4gc3lzZnMuDQo+IA0KPiBGb3IgeW91ciBzYW1wbGUgRFRTOiB5b3UgY2Fu
IGV2ZW4gc3BlY2lmeSBhbiBMRUQgdHJpZ2dlciBmcm9tIERULCBjZnIuDQo+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2NvbW1vbi50eHQ6DQo+IA0KPiAgICAgbGludXgs
ZGVmYXVsdC10cmlnZ2VyID0gImhlYXJ0YmVhdCINCg0KDQpXb3csIEkgYW0gc3VjaCBhIGhhY2sg
d2hlbiBpdCBjb21lcyB0byBMaW51eCENCg0KSSdtIGdvaW5nIHRvIGFkZCB0aGlzIHRvIG15IFRP
RE8gbGlzdCBhbG9uZyB3aXRoIHlvdXIgb3RoZXIgc3VnZ2VzdGlvbiANCm9mIHRoZSBpcnFjaGlw
IGRyaXZlciBmb3IgdGhlIGludGVycnVwdCBwaW5zLg0KDQoNClRoYW5rcywNCkNocmlzDQo=
