Return-Path: <SRS0=UKHE=Q4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2DEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 13:17:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C9212084D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 13:17:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="pAERYxLU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfBUNRv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Feb 2019 08:17:51 -0500
Received: from mail-eopbgr1400119.outbound.protection.outlook.com ([40.107.140.119]:29342
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725845AbfBUNRv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Feb 2019 08:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgK09tRAXRhRAMjmB2XuKwpdcct/8JAerN+MXTF8q8A=;
 b=pAERYxLUq7/G6usAEOr2xlVK09pw92QMEHB22r66IZ+nCa43JkaacoJuE+glCsrsa/7kRC5brq8DBEDGI2y7ivtL01BCuZEK0WIZN9uDSfBW9CX582ZTYT5toFV/9aM4n1TReJm8qQI+9xpnCsnBPh9JiANB9xV8BE1vyo12u0A=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1482.jpnprd01.prod.outlook.com (52.133.161.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.16; Thu, 21 Feb 2019 13:17:47 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1643.014; Thu, 21 Feb 2019
 13:17:47 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a77990: Fix SCIF5 DMA channels
Thread-Topic: [PATCH] arm64: dts: renesas: r8a77990: Fix SCIF5 DMA channels
Thread-Index: AQHUyeVVaDnncK1OVUGT1xcywSerOqXqOk8g
Date:   Thu, 21 Feb 2019 13:17:47 +0000
Message-ID: <TY1PR01MB177015CEE83F9802C50FC6F7C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190221125938.12279-1-geert+renesas@glider.be>
In-Reply-To: <20190221125938.12279-1-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: faa66cd1-3593-4aa4-c169-08d697fef933
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1482;
x-ms-traffictypediagnostic: TY1PR01MB1482:
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1482;20:vsvZEOGTlKtXscpVn20TJZDO74hZCVvLpkL+C+PVh/53HR3WmCwQAJa4mX3T2gCK48ivLajDWG2qfj5Nf2ZyXlwNeQR7kXy1TPRvqBymLgAuhAB8Ml5mt8KWMyOHeVBqZ98vgX03zSG+kBMANAWSr7r5NwXhjvRRisDyAD1aIeg=
x-microsoft-antispam-prvs: <TY1PR01MB14828FD17DFA0BBA5AB747BDC07E0@TY1PR01MB1482.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(346002)(376002)(136003)(39860400002)(189003)(199004)(68736007)(6506007)(53546011)(14444005)(71200400001)(110136005)(486006)(446003)(11346002)(44832011)(71190400001)(86362001)(256004)(7696005)(102836004)(66066001)(6436002)(14454004)(97736004)(107886003)(8936002)(81156014)(81166006)(25786009)(76176011)(26005)(99286004)(7736002)(305945005)(33656002)(54906003)(74316002)(6246003)(229853002)(55016002)(478600001)(6116002)(186003)(5660300002)(53936002)(476003)(4326008)(2906002)(9686003)(106356001)(8676002)(316002)(105586002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1482;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PROdlYpDeboqQj6yNNVlJRqbBFIHAs1MspiTpFhQklq/vZpbw75uVrkYJDFNA6YAnOLTraZQsa6ltzdjtZ/vXP70M7FeDdSoiOMHwQmopaE6zCmNnx5sd14hd07hNCx+e8jQdWiIhwEjAZ8IBUilqN3q83xnxZk0HFtUgzZbcthqtr7HWsGteRRF9haD8X2/qWMiBRTvAR6ce/T6GWUKAPu7voVvt1RXlOdHi02b2engaM5spo5fWylvQrgQTyfAxrJX+HNBQfwIOi/VCa98ZU3ZS/LAVHpPRyI/mMm234DefuVFOzKsfY3JwJmrmfotIRrzcMyRQ7DlzBkLmUKbjCpyo6EmKdGd6HhxNHuCMm5SIIZBo0x0l+U/JYzrGJ5VSOg08CzZAj6Nuw9gvbBfKaFFdoXS/O6hqCL/0PQIbPE=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faa66cd1-3593-4aa4-c169-08d697fef933
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 13:17:47.5698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1482
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Geert,

Thank you for your patch!

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 21 February 2019 13:00
> Subject: [PATCH] arm64: dts: renesas: r8a77990: Fix SCIF5 DMA channels
>=20
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> According to the R-Car Gen3 Hardware Manual Errata for Rev 1.50 of Feb
> 12, 2019, the DMA channels for SCIF5 are corrected from 16..47 to 0..15
> on R-Car E3.
>=20
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Fixes: a5ebe5e49a862e21 ("arm64: dts: renesas: r8a77990: Add SCIF-{0,1,3,=
4,5} device nodes")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> Verified on Ebisu-4D using an oscilloscope probing the right pad for
> unpopulated R631 (I couldn't find CP45).
> ---
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/=
dts/renesas/r8a77990.dtsi
> index f8f48a262200aba1..a16ffeecad30b653 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * Device Tree Source for the R-Car E3 (R8A77990) SoC
>   *
> - * Copyright (C) 2018 Renesas Electronics Corp.
> + * Copyright (C) 2018-2019 Renesas Electronics Corp.
>   */
>=20
>  #include <dt-bindings/clock/r8a77990-cpg-mssr.h>
> @@ -1067,9 +1067,8 @@
>  				 <&cpg CPG_CORE R8A77990_CLK_S3D1C>,
>  				 <&scif_clk>;
>  			clock-names =3D "fck", "brg_int", "scif_clk";
> -			dmas =3D <&dmac1 0x5b>, <&dmac1 0x5a>,
> -			       <&dmac2 0x5b>, <&dmac2 0x5a>;
> -			dma-names =3D "tx", "rx", "tx", "rx";
> +			dmas =3D <&dmac0 0x5b>, <&dmac0 0x5a>;
> +			dma-names =3D "tx", "rx";

This should be the same for the r8a774c0 as well, but unfortunately we can'=
t test it.
Do you want to send the patch for the r8a774c0 yourself or do you prefer me=
 to do it?

Thanks,
Fab

>  			power-domains =3D <&sysc R8A77990_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 202>;
>  			status =3D "disabled";
> --
> 2.17.1

