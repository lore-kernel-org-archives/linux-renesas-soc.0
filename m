Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26ED9C37120
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 21:17:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB1612085A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 21:17:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="a96QfAQh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfAUVR0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 16:17:26 -0500
Received: from mail-eopbgr1400112.outbound.protection.outlook.com ([40.107.140.112]:9277
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727169AbfAUVR0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 16:17:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exkaJxUe0giAnV7uv87DGJsyzhE6kLVslGYBZKc6fiY=;
 b=a96QfAQh2OkLMvz3aqNlHjns+cHsfI/uTpNPmhuU2LUHS2fYqv5qQpMuZU8wOpz8twkk0VHa0bIhGnssob2magN/YjBxcMhDjr3q9EYdKQLmB8HinXTZBO83cumyWmztmB/cltae5oUKLsb629VeNWW1IOvklH/RegTfWO1SefU=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB1818.jpnprd01.prod.outlook.com (52.133.163.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Mon, 21 Jan 2019 21:17:20 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74fc:a361:eeec:1678]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74fc:a361:eeec:1678%5]) with mapi id 15.20.1537.031; Mon, 21 Jan 2019
 21:17:20 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 0/2] Add Initial Device Tree for RZ/A2
Thread-Topic: [PATCH v4 0/2] Add Initial Device Tree for RZ/A2
Thread-Index: AQHUlvP2uoJIw09J20a0AZMaUfWSL6W6bYSA
Date:   Mon, 21 Jan 2019 21:17:20 +0000
Message-ID: <TY1PR01MB1562E0657C155C47620BF6F68A9F0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20181218170555.121673-1-chris.brandt@renesas.com>
In-Reply-To: <20181218170555.121673-1-chris.brandt@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [24.206.39.126]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1818;20:v6Wm0YGJgDpMGJqSPY2/o5dTQjoyc4XokDh1zpRKr5JwoPYcK6j52DAEti9RNhihA+fI4nfj8mclv7uo8UOfKt/jxkHhZrpQr7DIteS6NPyboPV/ikoo1jbSlBe/wQdz1Hud7GEcN40NmFnOfE6Ww4/DGT9E3yo7FTl/WWB40j4=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: b1930cb7-2e39-4468-5f94-08d67fe5d452
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1818;
x-ms-traffictypediagnostic: TY1PR01MB1818:
x-microsoft-antispam-prvs: <TY1PR01MB18185E265E3B62904EF2D3248A9F0@TY1PR01MB1818.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0924C6A0D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(39860400002)(136003)(396003)(366004)(189003)(199004)(55016002)(6436002)(2906002)(229853002)(68736007)(97736004)(105586002)(86362001)(106356001)(14454004)(33656002)(71190400001)(71200400001)(66066001)(72206003)(478600001)(54906003)(4326008)(8936002)(8676002)(6246003)(81156014)(3846002)(81166006)(6116002)(99286004)(316002)(74316002)(25786009)(110136005)(486006)(76176011)(11346002)(53936002)(256004)(7736002)(9686003)(305945005)(102836004)(6506007)(26005)(186003)(7696005)(476003)(446003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1818;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Te2nQT5UZIFJ9OiJA353ZN2F96ZaUWnO1T7ER1XNdf3Q/+8E1o/+eB+rOvgQtWgOZsnMdYeTInjIi/PE3Gwvoe23F/+0fK7a73gyAz8QyvkYAhKpI8D/kNMifPOPS9wIH4//7PvSE6MB+757xO3hkYumNPTbbvW5694wGaErChs/71ezm+6vbYAsmukb5HJ6wcLwiGryK4Rd1BfqlbYbfdU0qRN7fNlXQsav+fOBVkuhWGjK8tYvMCs1H06D2ma1IYE8DmZObAxOBojheBThwGxZawrbsYhR2AFJb7AtbYGXI/K9KkLwBSCi9VqCzEnOoX9K34fwEtWhbEA8mVRDiWp+5LpQpbEuupfCFriVRn+4R7z1LQJHtmWNWfhTHwfzcK/kHC2s67k0+h62I+BrJTdyQoZGgAmq/cYPmuOkjd4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1930cb7-2e39-4468-5f94-08d67fe5d452
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2019 21:17:20.3097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1818
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Tuesday, December 18, 2018, Chris Brandt wrote:
> Add a Device Tree for RZ/A2 and the existing eval board.
>=20
> Once these get approved, I'll start piling on the other drivers in
> another patch series
>=20
> NOTE:
> Since Rob is currently converting shmobile.txt to renesas.yaml,
> I'll wait till renesas.yaml hits -next, then add this RZ/A2M EVB
> board (it's too confusing to me to figure out how to make a patch
> series using multiple different trees)
>=20
> Chris Brandt (2):
>   ARM: dts: r7s9210: Initial SoC device tree
>   ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
>=20
>  arch/arm/boot/dts/Makefile             |   1 +
>  arch/arm/boot/dts/r7s9210-rza2mevb.dts |  82 +++++++++++++
>  arch/arm/boot/dts/r7s9210.dtsi         | 218
> +++++++++++++++++++++++++++++++++
>  3 files changed, 301 insertions(+)
>  create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts
>  create mode 100644 arch/arm/boot/dts/r7s9210.dtsi


What ever happened to these patches?

I didn't see any negative feedback after V4, but I also never saw=20
anything get queued up.


Chris

