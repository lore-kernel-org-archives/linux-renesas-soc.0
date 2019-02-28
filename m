Return-Path: <SRS0=CNOd=RD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603F6C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 11:36:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D084214D8
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Feb 2019 11:36:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="Gc/juJJY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731146AbfB1Lgd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Feb 2019 06:36:33 -0500
Received: from mail-eopbgr1400117.outbound.protection.outlook.com ([40.107.140.117]:37376
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730883AbfB1Lgd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Feb 2019 06:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDm595BJWoUxKUVm2puAh10zqDcm+1p64fnE4YbXMGI=;
 b=Gc/juJJYhYZ1VQQRE6QhwnGA/Xx0IL07aLbq7NnrtpWdS97lrsDejLWNlKb7E31G8sXLpH90BhvxzbfgMx2QKJezC/m2NT5j1XaKRLdEFRL4nMdC2n6+fk0l29EpeSaAfYLu3d63S8UcfZUTe+HB+C2jBuAklPSyEcnGGsiOd7A=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1706.jpnprd01.prod.outlook.com (52.133.160.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.18; Thu, 28 Feb 2019 11:36:29 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1643.022; Thu, 28 Feb 2019
 11:36:29 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2] dt-bindings: power: r8a77965: Remove non-existent A3IR
 power domain
Thread-Topic: [PATCH v2] dt-bindings: power: r8a77965: Remove non-existent
 A3IR power domain
Thread-Index: AQHUz1ONnb4/wdnlaUaGwlg6WkTsDqX1FGzA
Date:   Thu, 28 Feb 2019 11:36:28 +0000
Message-ID: <TY1PR01MB1770F8D490EB33636F24954AC0750@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190228105119.548-1-geert+renesas@glider.be>
In-Reply-To: <20190228105119.548-1-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bbf09f9-66a5-422c-9b25-08d69d70faf4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1706;
x-ms-traffictypediagnostic: TY1PR01MB1706:
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1706;20:+R6v7p6CI04HS0bHnCh2yvtEGh68h+yhZX8d4Vwx7l+v6PhSQXwE7KadKOlNZbGl2eDXKe9NSWE+PElbiIG3inzvux0XNprJtkZSxTz9wvu1sX2h54pb1eL7MLmKnZcnzSaklYx04TgpJTGvLm7xuDTdGj4foFq0sYizVfYcKhk=
x-microsoft-antispam-prvs: <TY1PR01MB1706020A087BAF4ED785CD1BC0750@TY1PR01MB1706.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0962D394D2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(396003)(136003)(346002)(39860400002)(199004)(189003)(6506007)(316002)(105586002)(76176011)(99286004)(6246003)(14444005)(71200400001)(8676002)(186003)(71190400001)(256004)(7696005)(53936002)(55016002)(5660300002)(446003)(11346002)(53546011)(486006)(52536013)(7736002)(6436002)(26005)(476003)(305945005)(54906003)(44832011)(110136005)(25786009)(229853002)(106356001)(2906002)(9686003)(14454004)(81166006)(86362001)(3846002)(8936002)(68736007)(81156014)(102836004)(4326008)(33656002)(74316002)(6116002)(66066001)(97736004)(478600001)(32563001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1706;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V8YpeujxL7rv7N51ZE6PtPr/SM+WNAA1700GTKtuPTK6/VfRHuShsZZzPYSkVCiuISL7+vb7g78lrbWInBtZwmWNJ+15UXsa4idAu8V4xuUTuInMSyKjIh2TB9bHxFdOQPHEzBqTH4XRBBkDUzhn9ihE9otfsVqERMkn9n6g9twfm37/VbyE6eRl+cGQFbSLYUh5xZ+xqF2JlamMK6JO3TzdNoXTdXBLMyIev2tqCF7xnNksnS/wmbVYiHOh3B5UZxWDG0U7Hf77KidFrSYCOfqC7VTqbuasqELNiV3En1qST3NEd8ejJNZFycux0y3mjQJ1JaZYI4j2Xhnso8BmrtLmk/OMIStCLpYfNf3zyrTZtx2wm77tLxXY2gq4fBxxU4JhkzumEshNDHI77F3VZM2IFk0DhTfrzs/0jr/0Kt0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbf09f9-66a5-422c-9b25-08d69d70faf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2019 11:36:28.9474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1706
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 28 February 2019 10:51
> Subject: [PATCH v2] dt-bindings: power: r8a77965: Remove non-existent A3I=
R power domain
>=20
> The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
> removed the A3IR power domain on R-Car M3-N, as this SoC does not have
> an Image Processing Unit (IMP-X5).
>=20
> As of commit d8c6557bc93be73e ("arm64: dts: renesas: r8a77965: Remove
> non-existent IPMMU-IR"), this definition is no longer used from DT, and
> thus can be removed.
>=20
> Fixes: a527709b78b3c997 ("soc: renesas: rcar-sysc: Add R-Car M3-N support=
")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> v2:
>   - Drop RFC, as the dependency is part of v5.0-rc1.
> ---
>  include/dt-bindings/power/r8a77965-sysc.h | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/include/dt-bindings/power/r8a77965-sysc.h b/include/dt-bindi=
ngs/power/r8a77965-sysc.h
> index 05a4b5917314791a..de82d8a15ea13a85 100644
> --- a/include/dt-bindings/power/r8a77965-sysc.h
> +++ b/include/dt-bindings/power/r8a77965-sysc.h
> @@ -21,7 +21,6 @@
>  #define R8A77965_PD_A3VC		14
>  #define R8A77965_PD_3DG_A		17
>  #define R8A77965_PD_3DG_B		18
> -#define R8A77965_PD_A3IR		24
>  #define R8A77965_PD_A2VC1		26
>=20
>  /* Always-on power area */
> --
> 2.17.1

