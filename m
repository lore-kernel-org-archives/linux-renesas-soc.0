Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6FBC65BAE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 10:08:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F05320873
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 10:08:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="u0UUGAM6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F05320873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbeLMKIk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 05:08:40 -0500
Received: from mail-eopbgr1400137.outbound.protection.outlook.com ([40.107.140.137]:34176
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727489AbeLMKIk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 05:08:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UXwT0+qz803KgYfjaflK9bA/l7kauhuBALmWdQi5TU=;
 b=u0UUGAM6FVU3M25QL3Mfq54LkAe++zqONZqS5T8qGZRn0ri4nFGnVO99Wyp0wtV/DRAKaNbsiGZQ3SS5jowD22xg19Y+XJmhSXCnw2VfwRm9GrZc5M3/iCLvqgxA43aV0Xq1KOC2zURVr0MG37jb3XobQBb1+kw6c69KDLe08ko=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.241.22) by
 OSBPR01MB1720.jpnprd01.prod.outlook.com (52.134.227.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1404.23; Thu, 13 Dec 2018 10:08:36 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::f5b4:a8b6:2ad5:58b4]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::f5b4:a8b6:2ad5:58b4%5]) with mapi id 15.20.1404.021; Thu, 13 Dec 2018
 10:08:35 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Simon Horman <horms+renesas@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Fix EthernetAVB phy
 mode to rgmii
Thread-Topic: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Fix EthernetAVB
 phy mode to rgmii
Thread-Index: AQHUkgfiseqP7bX7AkmjFQWPEaubY6V8cfUw
Date:   Thu, 13 Dec 2018 10:08:35 +0000
Message-ID: <OSBPR01MB2103A2A3658390A4B7A04C38B8A00@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <20181212104552.27414-1-horms+renesas@verge.net.au>
In-Reply-To: <20181212104552.27414-1-horms+renesas@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB1720;20:WiheyiBxclmEC4DTwGpXd0+jAXCw+OgjD0lo5Qs1Zq1pmCz14ROI0c5OfR4lbHzWsMCl2YCsn7LKd4FHLQB2uJmG8E2lIBNvZZjX4g1mP22w0a2/1EogafVFf9Gbm0WojcOpUjcetSHl1QvXm6CKSsDGUsRqVgrhXmua4ngP8KM=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 1f4c4664-2a39-4d50-f0af-08d660e2f1e8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB1720;
x-ms-traffictypediagnostic: OSBPR01MB1720:
x-microsoft-antispam-prvs: <OSBPR01MB172084F3F3EF2BB7DBCF1523B8A00@OSBPR01MB1720.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(999002)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231475)(944501520)(52105112)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB1720;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB1720;
x-forefront-prvs: 088552DE73
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39860400002)(396003)(136003)(346002)(376002)(189003)(199004)(51914003)(53936002)(2501003)(86362001)(71190400001)(4326008)(478600001)(229853002)(105586002)(39060400002)(6246003)(106356001)(6116002)(74316002)(9686003)(66066001)(476003)(2906002)(55016002)(10126004)(3846002)(14454004)(97736004)(486006)(110136005)(5660300001)(7736002)(14444005)(11346002)(7696005)(8936002)(8676002)(81166006)(54906003)(446003)(26005)(71200400001)(81156014)(68736007)(99286004)(6436002)(102836004)(25786009)(6306002)(6506007)(33656002)(305945005)(256004)(316002)(76176011)(186003)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1720;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: cfiv6D8gyOn8dgq1uMbhw7nOY4QuEaqqA4S7OeGYE7w+rIcRY+EYiFk1Xdl/RIKDWD3HddnD1VEvQXiBC0Cup3TaEmJkCmwVndXuutebcv0nyeI7vqokJ2NUz+xtywADcRHYdiuWQ9pIOf3dm30ih1US5ktPybloYPYrq2WgVAdXOPSKJjtp+0nCDfTQ4vN0ccYgv0KxqNW6xCcWiYDNcGfvt6lp67jCr+68Wzvt107uKdjqWpb4ML/AYWkKFkVmaBSeQa78l9W/FJeGpXfWSfQYOAWvIPtqzbr84imlJ0Gg7KIp+/ZF4ZyMkdNV0ilP
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4c4664-2a39-4d50-f0af-08d660e2f1e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2018 10:08:35.5473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1720
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

Thanks for the  patch.

> Subject: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Fix EthernetAVB ph=
y
> mode to rgmii
>
> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
>
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of August
> 24, 2018, the TX clock internal delay mode doesn't support on R-Car E3. T=
his
> patch fixes EthernetAVB phy mode to rgmii.
>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
>  Based on renesas-devel-20181210-v4.20-rc6
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index 62bdddcbbae7..0c4df048a8cb 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -248,7 +248,7 @@
>  pinctrl-names =3D "default";
>  renesas,no-ether-link;
>  phy-handle =3D <&phy0>;
> -phy-mode =3D "rgmii-txid";
> +phy-mode =3D "rgmii";

The default value of phy-mode in 777990 SoC dtsi is "rgmii". So we don't ne=
ed to redefine this in board dtsi, I think.

Regards,
Biju


[https://www2.renesas.eu/media/email/unicef.jpg]

This Christmas, instead of sending out cards, Renesas Electronics Europe ha=
ve decided to support Unicef with a donation. For further details click her=
e<https://www.unicef.org/> to find out about the valuable work they do, hel=
ping children all over the world.
We would like to take this opportunity to wish you a Merry Christmas and a =
prosperous New Year.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
