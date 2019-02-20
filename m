Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35396C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 20:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DFC6E20880
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 20:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="BGi/7Npc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfBTUjx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 15:39:53 -0500
Received: from mail-eopbgr1400103.outbound.protection.outlook.com ([40.107.140.103]:44971
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726003AbfBTUjx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 15:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JAHPu5zBtjLpBRmllWRZzqJr5xM7uFmMsEJ4+DhjUs=;
 b=BGi/7Npcxdkpwj/s6M7wiHv2BefSsNAsEX34EXzCQInnrxsLBpUfBI+GoJ4iRGoE8d24WYo1ofW6RIDMwxVp7DFH4lkea+iRlRABsrThzjSCuSzhgQ6GqOIpneZEIIpOlpwThvQN4VrSJCGsiafNrm2G1frjvb33K46hEBF9Sx8=
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com (52.133.177.145) by
 TYAPR01MB2589.jpnprd01.prod.outlook.com (20.177.102.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Wed, 20 Feb 2019 20:39:49 +0000
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::6c2e:174b:112c:cc5]) by TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::6c2e:174b:112c:cc5%5]) with mapi id 15.20.1622.020; Wed, 20 Feb 2019
 20:39:49 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] pinctrl: sh-pfc: r8a77990: move CANFD pin groups and
 functions
Thread-Topic: [PATCH] pinctrl: sh-pfc: r8a77990: move CANFD pin groups and
 functions
Thread-Index: AQHUyTbKsEbvI5Pto0O9Kzf9oeQNE6XpJleg
Date:   Wed, 20 Feb 2019 20:39:49 +0000
Message-ID: <TYAPR01MB2285278AC6B896B64E186176B77D0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <1550679018-1380-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1550679018-1380-1-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Paterson2@renesas.com; 
x-originating-ip: [90.255.186.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9ebfcba-d96e-4a73-7bcf-08d697738f31
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYAPR01MB2589;
x-ms-traffictypediagnostic: TYAPR01MB2589:
x-microsoft-exchange-diagnostics: 1;TYAPR01MB2589;20:HOBAK7HQvIxluMUGzcV6c/CHFMv1Tbw1xs/a4kPbcwFaQMTiuf9I7ch4sGhzeNM/Hdaib7M0bzHFMEXP7RO7tainFdsEeYwOGyfKE/gRXuhrKeMWPEAHS2uBJbxvSl7lUHac0hHpSCLuvYXSstt0C4ll3PcZy14ifRGRvOFPyWg=
x-microsoft-antispam-prvs: <TYAPR01MB2589D3D93623E34384EA9C61B77D0@TYAPR01MB2589.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0954EE4910
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(396003)(39850400004)(199004)(189003)(55016002)(102836004)(446003)(71200400001)(11346002)(9686003)(186003)(6246003)(66066001)(6506007)(256004)(99286004)(7736002)(305945005)(33656002)(53546011)(76176011)(97736004)(26005)(5660300002)(486006)(6116002)(3846002)(71190400001)(7696005)(6436002)(53936002)(229853002)(476003)(107886003)(110136005)(478600001)(316002)(54906003)(72206003)(86362001)(68736007)(4326008)(14454004)(105586002)(25786009)(74316002)(81166006)(106356001)(8936002)(8676002)(2906002)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2589;H:TYAPR01MB2285.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wWLKA/dagtEw9fMw1C0BL4Hx8c+f87RHo+IcwGndWDXAPBJqywkD2yZV42SADtxyZBvi10haVZ36eD6H4lSIUmqUBxfXy6G5mJ/eOMRrHeavcHOtbWWPopDnFBMrtmTjR9q4rRMmnO5sh8YO4JRhVfLVTE6s5cUZpzLezRKt4bFLogeu9R8Dm0+v+SC9VXcOdMN9sg2phNDkyFrFyheDVSr84P3yJz1Z4LgNq4qBQ++8lYz50DlQIKKWZg+edAHLgRSaSqrJRllyv5IE4iHUzbLa7RudA41flmrWn6vWnHoLUUWM+8PafCmwiPdhj66Ok+cTT0N0AlzaecplmZ53aHEIb/rml8LrCFNUzQOMNC6bnFGyVtWMUF2jpVDyZPOig0p0cFEi6S8FYK+9eht7RJPmBiLN9JctzkW37bvN1tk=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ebfcba-d96e-4a73-7bcf-08d697738f31
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2019 20:39:49.7901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2589
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 20 February 2019 16:10
> To: Geert Uytterhoeven <geert+renesas@glider.be>; Linus Walleij
> <linus.walleij@linaro.org>
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; linux-renesas-
> soc@vger.kernel.org; linux-gpio@vger.kernel.org; Simon Horman
> <horms@verge.net.au>; Chris Paterson <Chris.Paterson2@renesas.com>;
> Biju Das <biju.das@bp.renesas.com>
> Subject: [PATCH] pinctrl: sh-pfc: r8a77990: move CANFD pin groups and
> functions
>=20
> CANFD is found also on the R8A774C0, therefore move CANFD pin
> groups and functions to "common".
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-p=
fc/pfc-
> r8a77990.c
> index 52daa56..d3b1cd6 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> @@ -3767,8 +3767,8 @@ static const unsigned int vin5_clk_b_mux[] =3D {
>  };
>=20
>  static const struct {
> -	struct sh_pfc_pin_group common[245];
> -	struct sh_pfc_pin_group automotive[23];
> +	struct sh_pfc_pin_group common[247];
> +	struct sh_pfc_pin_group automotive[21];
>  } pinmux_groups =3D {
>  	.common =3D {
>  		SH_PFC_PIN_GROUP(audio_clk_a),
> @@ -3799,6 +3799,8 @@ static const struct {
>  		SH_PFC_PIN_GROUP(can0_data),
>  		SH_PFC_PIN_GROUP(can1_data),
>  		SH_PFC_PIN_GROUP(can_clk),
> +		SH_PFC_PIN_GROUP(canfd0_data),
> +		SH_PFC_PIN_GROUP(canfd1_data),
>  		SH_PFC_PIN_GROUP(du_rgb666),
>  		SH_PFC_PIN_GROUP(du_rgb888),
>  		SH_PFC_PIN_GROUP(du_clk_in_0),
> @@ -4018,8 +4020,6 @@ static const struct {
>  		SH_PFC_PIN_GROUP(vin5_clk_b),
>  	},
>  	.automotive =3D {
> -		SH_PFC_PIN_GROUP(canfd0_data),
> -		SH_PFC_PIN_GROUP(canfd1_data),
>  		SH_PFC_PIN_GROUP(drif0_ctrl_a),
>  		SH_PFC_PIN_GROUP(drif0_data0_a),
>  		SH_PFC_PIN_GROUP(drif0_data1_a),
> @@ -4466,8 +4466,8 @@ static const char * const vin5_groups[] =3D {
>  };
>=20
>  static const struct {
> -	struct sh_pfc_function common[45];
> -	struct sh_pfc_function automotive[6];
> +	struct sh_pfc_function common[47];
> +	struct sh_pfc_function automotive[4];
>  } pinmux_functions =3D {
>  	.common =3D {
>  		SH_PFC_FUNCTION(audio_clk),
> @@ -4475,6 +4475,8 @@ static const struct {
>  		SH_PFC_FUNCTION(can0),
>  		SH_PFC_FUNCTION(can1),
>  		SH_PFC_FUNCTION(can_clk),
> +		SH_PFC_FUNCTION(canfd0),
> +		SH_PFC_FUNCTION(canfd1),
>  		SH_PFC_FUNCTION(du),
>  		SH_PFC_FUNCTION(hscif0),
>  		SH_PFC_FUNCTION(hscif1),
> @@ -4517,8 +4519,6 @@ static const struct {
>  		SH_PFC_FUNCTION(vin5),
>  	},
>  	.automotive =3D {
> -		SH_PFC_FUNCTION(canfd0),
> -		SH_PFC_FUNCTION(canfd1),
>  		SH_PFC_FUNCTION(drif0),
>  		SH_PFC_FUNCTION(drif1),
>  		SH_PFC_FUNCTION(drif2),
> --
> 2.7.4

