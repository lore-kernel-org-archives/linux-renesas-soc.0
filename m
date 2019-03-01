Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344FDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 12:00:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0308E20818
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 12:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="IKvardPX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732946AbfCAMAp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 07:00:45 -0500
Received: from mail-eopbgr1400135.outbound.protection.outlook.com ([40.107.140.135]:40352
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727199AbfCAMAp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 07:00:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eUNCJcpBpauAqKq2ACbj66ZZJmIwDVXgLrOcEFTT9Y=;
 b=IKvardPX//sI4WHNSDzB+GswmqpysY+Ah9fc5/NC6lPVAMe4BbeNtPAMFpebX+tdIXMTs04+i1iaXDPlD+cXFydB24yT/NhQWz8GJmPj/ERckJLQIFzXijawAtK3ZApT27dpwhAoYESYMIoVDTYj72vKX13SldgTt8YW8Ew7s0U=
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com (52.133.168.140) by
 TYXPR01MB1535.jpnprd01.prod.outlook.com (52.133.166.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.20; Fri, 1 Mar 2019 12:00:39 +0000
Received: from TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::88d2:545c:9212:c8cf]) by TYXPR01MB1775.jpnprd01.prod.outlook.com
 ([fe80::88d2:545c:9212:c8cf%5]) with mapi id 15.20.1665.015; Fri, 1 Mar 2019
 12:00:39 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
Thread-Topic: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
Thread-Index: AQHUxSm1CsxtJv28DEmeE+oHt44YZKX2wjcQ
Date:   Fri, 1 Mar 2019 12:00:39 +0000
Message-ID: <TYXPR01MB17752BA491B4A41F1257EB61C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1550233589-13891-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1550233589-13891-1-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0715cc6-3a67-49fd-e61e-08d69e3d8619
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYXPR01MB1535;
x-ms-traffictypediagnostic: TYXPR01MB1535:
x-microsoft-exchange-diagnostics: 1;TYXPR01MB1535;20:qclIAfLIdL3p8JMPjJm2hhubfRs1EasM4QcKzdIwLbo1ZZ0A1tRPgwo+o+N9vYiemxUJwS08TwA6h/P7ydJWieHetDHXBYf+qFdz7NA9Fz4BwJar/nJUkW5FIFofvW0+OWkbyUoW1u8ZejCt3A/GfFfdvsQbGNIbQHsJqVvgAuo=
x-microsoft-antispam-prvs: <TYXPR01MB15355D25CCE8820801B6F561C0760@TYXPR01MB1535.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(39860400002)(376002)(396003)(366004)(189003)(199004)(106356001)(11346002)(446003)(52536013)(186003)(66066001)(7736002)(305945005)(8936002)(486006)(68736007)(476003)(44832011)(74316002)(86362001)(25786009)(81156014)(81166006)(97736004)(256004)(8676002)(5660300002)(3846002)(6116002)(71200400001)(71190400001)(4326008)(53936002)(102836004)(26005)(7696005)(76176011)(9686003)(229853002)(55016002)(316002)(54906003)(6436002)(6246003)(33656002)(99286004)(105586002)(6916009)(53546011)(6506007)(2906002)(14454004)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYXPR01MB1535;H:TYXPR01MB1775.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y0EwQInOpB4cA6Pb7IoCQxDCHiX5Wme3siAkPj90xcXXECnYxFxdAZYo7iXD7vlM3BrE8/HDJOZf5eSb1kbzITd/iWAM9K2UWEt2bssWpkRxH1O7sdNCa94q9DhOGh8Fb58JZgKWbB3OdYjHsDOMfeBvqIRZZdztqttncv7vzBNe2U4A69GMUa6jXlHsg3+rrfy4Rm+V2t1ryU+2LX+H5yY3CpIDuZ5dcZirG28FLA8oJn02Mg90i3aNc6J0UQLT69hfGMhhCIiCfYr59u+NfAwiEPjkGwb8+HGPDAvlibSHLHEseLcq55aaa/SeWxieWFdOaGFa/1gydQNCdPksCuI7tdA+0m8HTgNoIWxIX8PWw0E9ZBJDAiNO++wzDTKzv+7vi8QdbPIu+rAzPOJQI+fF2ovTjAqCDJtQTLhpgdM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0715cc6-3a67-49fd-e61e-08d69e3d8619
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 12:00:39.8210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1535
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

Are you happy with this patch?

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 15 February 2019 12:26
> Subject: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
>=20
> We usually leave a space between "=3D" and the value of device
> tree properties, but unfortunately that was overlooked for the
> "clocks" property of cpu@0 and cpu@1.
> This patch fixes the spacing with the "clocks" property of
> cpu@0 and cpu@1.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a774c0.dtsi
> index 61a0afb..0bbcaf1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -76,7 +76,7 @@
>  			power-domains =3D <&sysc R8A774C0_PD_CA53_CPU0>;
>  			next-level-cache =3D <&L2_CA53>;
>  			enable-method =3D "psci";
> -			clocks =3D<&cpg CPG_CORE R8A774C0_CLK_Z2>;
> +			clocks =3D <&cpg CPG_CORE R8A774C0_CLK_Z2>;
>  			operating-points-v2 =3D <&cluster1_opp>;
>  		};
>=20
> @@ -87,7 +87,7 @@
>  			power-domains =3D <&sysc R8A774C0_PD_CA53_CPU1>;
>  			next-level-cache =3D <&L2_CA53>;
>  			enable-method =3D "psci";
> -			clocks =3D<&cpg CPG_CORE R8A774C0_CLK_Z2>;
> +			clocks =3D <&cpg CPG_CORE R8A774C0_CLK_Z2>;
>  			operating-points-v2 =3D <&cluster1_opp>;
>  		};
>=20
> --
> 2.7.4

