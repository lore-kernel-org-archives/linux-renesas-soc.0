Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46019C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 11:37:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13A3C20652
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 11:37:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Ej3rtZdQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730894AbfAILhs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 06:37:48 -0500
Received: from mail-eopbgr1410124.outbound.protection.outlook.com ([40.107.141.124]:32192
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730873AbfAILhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 06:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teDnmvgoE3K9lWAgq8/Ley/7wHVmauLKsk6ThEpubFs=;
 b=Ej3rtZdQ/hboTdRgbHX4QjiBmv7HvQeHIpfET0QNRpLyzV3RgirIpZqDE52WIYUn7zqrwbPlOaW7GS7xr9bpaou6JC65WgUyiULtl3/w9Tuh5NSlNc4aFFHeirHGGIyk/0jQsKy9BiLdjdS4eTm7wP7xToYBxoFD6L+Hv0irB6Q=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1497.jpnprd01.prod.outlook.com (52.133.161.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.14; Wed, 9 Jan 2019 11:37:45 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4a9:6014:ec1d:1122]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::4a9:6014:ec1d:1122%5]) with mapi id 15.20.1516.010; Wed, 9 Jan 2019
 11:37:45 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH LOCAL 2/2] arm64: dts: renesas: r8a774c0: Add dummy board
 DTS
Thread-Topic: [PATCH LOCAL 2/2] arm64: dts: renesas: r8a774c0: Add dummy board
 DTS
Thread-Index: AQHUpA2/NmddGis12EaYFp1Y5RXbgKWm102A
Date:   Wed, 9 Jan 2019 11:37:45 +0000
Message-ID: <TY1PR01MB17701C4B35C57E6015961BB9C08B0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190104091316.12716-1-geert+renesas@glider.be>
 <20190104091316.12716-3-geert+renesas@glider.be>
In-Reply-To: <20190104091316.12716-3-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1497;20:S+3gCiRESm6M83WxihjD5jAxbKoO4MT2doeuFLjI/+tRvXqEIN02j0985ECh6Mod12QV5Xl+FisZcpLuVu1MzDwuoXNz1THdvqMW9JvC4Ns0pPqMiqqvJRBDt+C9dNtiK5E5END1mWaNfYemPquYqchLVKNul1a+uHvJwVhfMQk=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 130c1d01-deed-4a47-9f87-08d67626dfc3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1497;
x-ms-traffictypediagnostic: TY1PR01MB1497:
x-microsoft-antispam-prvs: <TY1PR01MB1497B2BCCDE2215D37F90A55C08B0@TY1PR01MB1497.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3002001)(3231475)(944501520)(52105112)(93006095)(93001095)(10201501046)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);SRVR:TY1PR01MB1497;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB1497;
x-forefront-prvs: 0912297777
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(136003)(366004)(346002)(39860400002)(189003)(199004)(33656002)(486006)(66066001)(44832011)(76176011)(7696005)(106356001)(105586002)(26005)(6506007)(53546011)(102836004)(74316002)(186003)(99286004)(14454004)(5660300001)(316002)(305945005)(7736002)(11346002)(478600001)(476003)(110136005)(2906002)(53936002)(9686003)(6246003)(25786009)(39060400002)(4326008)(6116002)(3846002)(256004)(68736007)(217873002)(71190400001)(71200400001)(446003)(229853002)(97736004)(55016002)(8676002)(81156014)(81166006)(8936002)(86362001)(6436002)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1497;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fvLY1tqHQDZ2AoE7ItWWkC6gvr3gKS8YTbAdPjyXG0/mb46/x+p6MlO6WPE8pvSrC9YieWvc025Tzy2scNb0iSCs+DHcK17sHR/4iFidTDr7xjDuYIaWZHRcum5vEelyFbDQOLMZRXKMhxVg6nwbMdA4Xby6SwtOmeIsW30645etAKHFr839DncdsQ4zqvSiaU4cxt3HP/YHQPJZ2f846Kl3TyXLaxYCD0JoAQxzDqCyUj9vc1+5PCK/wss1ItuDULnNlnDecbXS7/4DxwvDj9NhOsB0pMj+SsYnZK+1yTiJmQI8+FPHvfvOu7zBZJsr
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130c1d01-deed-4a47-9f87-08d67626dfc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2019 11:37:45.3127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1497
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 04 January 2019 09:13
> Subject: [PATCH LOCAL 2/2] arm64: dts: renesas: r8a774c0: Add dummy board=
 DTS
>
> Improve build coverage until a real board DTS surfaces.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  arch/arm64/boot/dts/renesas/Makefile           | 1 +
>  arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts | 2 ++
>  2 files changed, 3 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts
>
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/r=
enesas/Makefile
> index b4a006313cb66048..2514cd67c3028659 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -17,3 +17,4 @@ dtb-$(CONFIG_ARCH_R8A77995) +=3D r8a77995-draak.dtb
>
>  # SoCs lacking upstream board support
>  dtb-$(CONFIG_ARCH_R8A774A1) +=3D r8a774a1-dummy.dtb
> +dtb-$(CONFIG_ARCH_R8A774C0) +=3D r8a774c0-dummy.dtb
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts b/arch/arm64/=
boot/dts/renesas/r8a774c0-dummy.dts
> new file mode 100644
> index 0000000000000000..e608e052456ed017
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-dummy.dts
> @@ -0,0 +1,2 @@
> +/dts-v1/;
> +#include "r8a774c0.dtsi"
> --
> 2.17.1




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
