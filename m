Return-Path: <SRS0=UKHE=Q4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF31C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 14:09:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83B8C2084D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 14:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="TM1kdAao"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbfBUOJR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Feb 2019 09:09:17 -0500
Received: from mail-eopbgr1400095.outbound.protection.outlook.com ([40.107.140.95]:26704
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725385AbfBUOJQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Feb 2019 09:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtPXcPmvjec/ByVGGvJiITpQ93j8pqdGRKl6Re1IDW8=;
 b=TM1kdAaosGPGwo3PPpWOyUbskNOgw6lgESuZLPmLGDC8QObI4EWFdr9OpL2bJ8o3tpoH4tWa9i/LmGmi3A4X0e8lPWuiiQ0gJgex7tulmB7qWXqVTdJ9ALCUmsvPqxaqrgYuN61GyWW0ZFN4EVUBBf9t/rL20e0OvFXCzFs+p9A=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1834.jpnprd01.prod.outlook.com (52.133.164.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Thu, 21 Feb 2019 14:09:12 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1643.014; Thu, 21 Feb 2019
 14:09:12 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774c0: Fix SCIF5 DMA channels
Thread-Topic: [PATCH] arm64: dts: renesas: r8a774c0: Fix SCIF5 DMA channels
Thread-Index: AQHUye5hW2aSi8xcKkqDPoIAbt2iKaXqScSQ
Date:   Thu, 21 Feb 2019 14:09:12 +0000
Message-ID: <TY1PR01MB1770B67191409067BBBDBF51C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190221140428.17411-1-geert+renesas@glider.be>
In-Reply-To: <20190221140428.17411-1-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11c4a25c-0e65-4a50-804c-08d6980627a6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1834;
x-ms-traffictypediagnostic: TY1PR01MB1834:
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1834;20:8ja9nVLzhj3IWAScm6VvrYxVauDZE4f/6B9WajiCTt+4wfJ5PEh+dzeywDZXPO5OcFLMeddjq/DcGR7i09s4BJZVTMyXixV5gdZM9WpFTLV/pHMl7j0j/8K+9YUlH8/tYWIJK6CkLm/Q8gfI7Tj67XTJMjSEt1Lr1kGWwVWQ+9s=
x-microsoft-antispam-prvs: <TY1PR01MB18349B3B66ADB5ECD32BDC56C07E0@TY1PR01MB1834.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09555FB1AD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(39860400002)(396003)(376002)(346002)(136003)(199004)(189003)(186003)(97736004)(102836004)(107886003)(106356001)(2906002)(86362001)(6246003)(76176011)(8936002)(26005)(316002)(55016002)(74316002)(9686003)(305945005)(7736002)(105586002)(7696005)(229853002)(6436002)(71200400001)(99286004)(71190400001)(8676002)(81156014)(81166006)(53936002)(54906003)(33656002)(476003)(44832011)(14454004)(446003)(3846002)(11346002)(110136005)(256004)(25786009)(6116002)(6506007)(53546011)(4326008)(14444005)(486006)(66066001)(5660300002)(478600001)(68736007);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1834;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hLstDL5pglcLPyDMbkXWc92uchwK49xzUaV0ESq2APZ8Y64aSK35exXlpIvpz9gDyHkbSPz3jN8Uxzu6+g2vrEyYEmJdzDs06aIp87pzjYZt/2mm9dFIgxPYzyZFHICXVx0w3j0e/3SeP0HuRBpF7LhR/njgiVg+om/YAcMU5/EEY0ONN9Fk0EH8sjhB5oJmwUDy2fG4P6+fsoY/+a1MJhY2a2bBK+twTzG4ajUQltA4Fx61pyg74u3/r4gMHYXkcij0FwwWnB+Gk8wvIcTQTeSBrQb1XC55qTiOMvErHxvJS+Ej+a6DasELfk0clrtBOd2FjXiKqmkb8tASN+k9FVenJZQKtZDVbDrUGLqz45n4zhxPO9WNe9Zwcwoez+kYYMzci/uxPziaKS2ZosKXopbCZ4ABu0F1Cl9jH5sMGUM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c4a25c-0e65-4a50-804c-08d6980627a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2019 14:09:12.0662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1834
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vg=
er.kernel.org> On Behalf Of Geert Uytterhoeven
> Sent: 21 February 2019 14:04
> Subject: [PATCH] arm64: dts: renesas: r8a774c0: Fix SCIF5 DMA channels
>=20
> Correct the DMA channels for SCIF5 from 16..47 to 0..15, as was done for
> R-Car E3.
>=20
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Fixes: 2660a6af690ebbb4 ("arm64: dts: renesas: r8a774c0: Add SCIF and HSC=
IF nodes")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> Untested due to lack of hardware.
> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774c0.dtsi
> index 61a0afb74e6310b2..1ea684af99c4a19b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -2,7 +2,7 @@
>  /*
>   * Device Tree Source for the RZ/G2E (R8A774C0) SoC
>   *
> - * Copyright (C) 2018 Renesas Electronics Corp.
> + * Copyright (C) 2018-2019 Renesas Electronics Corp.
>   */
>=20
>  #include <dt-bindings/clock/r8a774c0-cpg-mssr.h>
> @@ -1150,9 +1150,8 @@
>  				 <&cpg CPG_CORE R8A774C0_CLK_S3D1C>,
>  				 <&scif_clk>;
>  			clock-names =3D "fck", "brg_int", "scif_clk";
> -			dmas =3D <&dmac1 0x5b>, <&dmac1 0x5a>,
> -			       <&dmac2 0x5b>, <&dmac2 0x5a>;
> -			dma-names =3D "tx", "rx", "tx", "rx";
> +			dmas =3D <&dmac0 0x5b>, <&dmac0 0x5a>;
> +			dma-names =3D "tx", "rx";
>  			power-domains =3D <&sysc R8A774C0_PD_ALWAYS_ON>;
>  			resets =3D <&cpg 202>;
>  			status =3D "disabled";
> --
> 2.17.1

