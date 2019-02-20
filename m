Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA997C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 20:39:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B3A6420880
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 20:39:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="nKqIGPz8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbfBTUjh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 15:39:37 -0500
Received: from mail-eopbgr1400134.outbound.protection.outlook.com ([40.107.140.134]:54708
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726003AbfBTUjh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 15:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGMZdsms7AvxdWWL+9cmdzxMtfN/AoLGgNNhNBwIH3M=;
 b=nKqIGPz8IzNaJwo/c+Hk7wE62WOfWm+maROFOg1EEB0sgjEVTnoL0Hh7lNFd6Jr23VHpNLbHMVn/wEXBXp5B+Bmk9Y//StRD5cSdqlja3TtwbPC3JAiLpgqfUIU067YAC3DgexgwqThfQkeDgxwq6MLxFvXCRu+pGU4+Se+sapA=
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com (52.133.177.145) by
 TYAPR01MB2589.jpnprd01.prod.outlook.com (20.177.102.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Wed, 20 Feb 2019 20:39:33 +0000
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::6c2e:174b:112c:cc5]) by TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::6c2e:174b:112c:cc5%5]) with mapi id 15.20.1622.020; Wed, 20 Feb 2019
 20:39:33 +0000
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
Subject: RE: [PATCH] pinctrl: sh-pfc: r8a7796: move CANFD pin groups and
 functions
Thread-Topic: [PATCH] pinctrl: sh-pfc: r8a7796: move CANFD pin groups and
 functions
Thread-Index: AQHUyTa7hg4pzaOZakabIJfeD3Zf8qXpJkZQ
Date:   Wed, 20 Feb 2019 20:39:33 +0000
Message-ID: <TYAPR01MB2285DCD8AA880833E7A96AF8B77D0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <1550678985-1316-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1550678985-1316-1-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Paterson2@renesas.com; 
x-originating-ip: [90.255.186.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f99a0ae-e0a0-4fdb-ce45-08d69773856a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TYAPR01MB2589;
x-ms-traffictypediagnostic: TYAPR01MB2589:
x-microsoft-exchange-diagnostics: 1;TYAPR01MB2589;20:phzOZRNetvFmhKyGgIFhzf4PHf30763uA7TsKobQHb1eSKxiWolTGARwJPpC4nUuaJHEy1wKf29HP/z1+8tJAtfS5d3DrULkgOuc+28OQQXp6H+NyG0UESudhv1BPLUOLtQrO4WikzT4ZX+ZrYAGyYY0U+z6cCzzy7jvVKXGxH0=
x-microsoft-antispam-prvs: <TYAPR01MB25890B012D2CE64403941093B77D0@TYAPR01MB2589.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0954EE4910
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(396003)(39850400004)(199004)(189003)(55016002)(102836004)(446003)(71200400001)(11346002)(9686003)(186003)(6246003)(66066001)(6506007)(256004)(99286004)(7736002)(305945005)(33656002)(53546011)(76176011)(97736004)(26005)(5660300002)(486006)(6116002)(3846002)(71190400001)(7696005)(6436002)(53936002)(229853002)(476003)(107886003)(110136005)(478600001)(316002)(54906003)(72206003)(86362001)(68736007)(4326008)(14454004)(105586002)(25786009)(74316002)(81166006)(106356001)(8936002)(8676002)(2906002)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2589;H:TYAPR01MB2285.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l1le+ef0c1NzJYnGucQyAiy2kAw72xAu7U0CEL9ENBukNlM/HiVciG/oJKRhzmcyEOcZshMm5cKPA9WfgcYcBNs4y1BXQmD7dZ2nMNdJjZpo9EuiH6E0/p31gq3RcXJBQK4WAU2Ytn2bMitMX0EMv6a9qYKqrYZWTm0scaHk2gpMeaC+fS6WwvlHUOmgqkTEHTBz1kAmOjfH78WnQ84maoTUcAcNn1pu/dVKx1f9hlkonTzjniBL/c5qAXqqfFFmb5cAK2CXAzw1fE7a3WSzMdQnhnSG/GMdANeyL/GBovA8avEwOOj9pyvmajx6WU+kTa+P8Gi7/kKDr0dg2bHyNGA+tfBmqkLcLE9x1y75DM5S+lXKDu/3wM5df/u7/KUu1Hs0GN3AUrLkRqwy1amXFC/NxKICdu7gm/06E4wfLK4=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f99a0ae-e0a0-4fdb-ce45-08d69773856a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2019 20:39:33.4536
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
> Subject: [PATCH] pinctrl: sh-pfc: r8a7796: move CANFD pin groups and
> functions
>=20
> CANFD is found also on the R8A774A1, therefore move CANFD pin
> groups and functions to "common".
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pf=
c/pfc-
> r8a7796.c
> index 7e33035..30d4ffc 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> @@ -4163,8 +4163,8 @@ static const unsigned int vin5_clk_mux[] =3D {
>  };
>=20
>  static const struct {
> -	struct sh_pfc_pin_group common[310];
> -	struct sh_pfc_pin_group automotive[33];
> +	struct sh_pfc_pin_group common[313];
> +	struct sh_pfc_pin_group automotive[30];
>  } pinmux_groups =3D {
>  	.common =3D {
>  		SH_PFC_PIN_GROUP(audio_clk_a_a),
> @@ -4199,6 +4199,9 @@ static const struct {
>  		SH_PFC_PIN_GROUP(can0_data_b),
>  		SH_PFC_PIN_GROUP(can1_data),
>  		SH_PFC_PIN_GROUP(can_clk),
> +		SH_PFC_PIN_GROUP(canfd0_data_a),
> +		SH_PFC_PIN_GROUP(canfd0_data_b),
> +		SH_PFC_PIN_GROUP(canfd1_data),
>  		SH_PFC_PIN_GROUP(du_rgb666),
>  		SH_PFC_PIN_GROUP(du_rgb888),
>  		SH_PFC_PIN_GROUP(du_clk_out_0),
> @@ -4479,9 +4482,6 @@ static const struct {
>  		SH_PFC_PIN_GROUP(vin5_clk),
>  	},
>  	.automotive =3D {
> -		SH_PFC_PIN_GROUP(canfd0_data_a),
> -		SH_PFC_PIN_GROUP(canfd0_data_b),
> -		SH_PFC_PIN_GROUP(canfd1_data),
>  		SH_PFC_PIN_GROUP(drif0_ctrl_a),
>  		SH_PFC_PIN_GROUP(drif0_data0_a),
>  		SH_PFC_PIN_GROUP(drif0_data1_a),
> @@ -5021,8 +5021,8 @@ static const char * const vin5_groups[] =3D {
>  };
>=20
>  static const struct {
> -	struct sh_pfc_function common[48];
> -	struct sh_pfc_function automotive[6];
> +	struct sh_pfc_function common[50];
> +	struct sh_pfc_function automotive[4];
>  } pinmux_functions =3D {
>  	.common =3D {
>  		SH_PFC_FUNCTION(audio_clk),
> @@ -5030,6 +5030,8 @@ static const struct {
>  		SH_PFC_FUNCTION(can0),
>  		SH_PFC_FUNCTION(can1),
>  		SH_PFC_FUNCTION(can_clk),
> +		SH_PFC_FUNCTION(canfd0),
> +		SH_PFC_FUNCTION(canfd1),
>  		SH_PFC_FUNCTION(du),
>  		SH_PFC_FUNCTION(hdmi0),
>  		SH_PFC_FUNCTION(hscif0),
> @@ -5075,8 +5077,6 @@ static const struct {
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

