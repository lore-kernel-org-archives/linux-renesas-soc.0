Return-Path: <SRS0=WuQX=PD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABE8C43444
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 26 Dec 2018 06:49:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB67E21720
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 26 Dec 2018 06:49:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="SonTwleP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbeLZGtV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 26 Dec 2018 01:49:21 -0500
Received: from mail-eopbgr1300117.outbound.protection.outlook.com ([40.107.130.117]:27431
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726001AbeLZGtV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Dec 2018 01:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noKqJxUfqYundPMCD+MOwdYLYHBv9HkEm8J7d3iVsO8=;
 b=SonTwlePK32858ozJrakufp9sjaJbwnSyas7RVLncOKRkR68esTwZeg1lfjfGfFjqCI5gyx5/z84k7K1EgL3WzbJLCsNeSFGcS07E3ju+j6SMWCryAclf7yuIb8G1zkSxZOBjDyPM5I/oYnNdRRvxykPQxdhvzPfPPo8f2fn+Vw=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB2457.jpnprd01.prod.outlook.com (20.177.97.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1446.23; Wed, 26 Dec 2018 06:46:33 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::4dae:714d:66b1:2d58]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::4dae:714d:66b1:2d58%4]) with mapi id 15.20.1446.027; Wed, 26 Dec 2018
 06:46:31 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
Subject: RE: [PATCH/RFC] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL bit numbering
Thread-Topic: [PATCH/RFC] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL bit numbering
Thread-Index: AQHUmGyyI8AfRnZNR0uizNn5fpFdzaWQm2+A
Date:   Wed, 26 Dec 2018 06:46:31 +0000
Message-ID: <TY2PR01MB48120531E7D6A66AF2DFD030D8B50@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <20181220140241.20442-1-geert+renesas@glider.be>
In-Reply-To: <20181220140241.20442-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY2PR01MB2457;20:fQ9KI6ug+hQCR78rmG8zhhy4aeKfLkbmN57tLGVutnEMmn6yM40VVMJzbIhxvuuXWq+144aA8xulX3QQmkUnNwkURj3+DJus+7sjqc65DtkLht7XL8Gf2H8eY73KJopVfdEpqXQa6Vc7UO8uBMsPVTsXn8pJQTM37KPeo0ZBNoI=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI;SCL:-1;SFV:NSPM;SFS:(10019020)(979002)(346002)(39860400002)(366004)(136003)(376002)(396003)(199004)(189003)(9686003)(102836004)(6506007)(71190400001)(71200400001)(25786009)(229853002)(107886003)(26005)(345774005)(105586002)(53936002)(476003)(66066001)(2906002)(486006)(99286004)(76176011)(11346002)(55016002)(6246003)(4326008)(7696005)(68736007)(33656002)(316002)(74316002)(446003)(6116002)(3846002)(256004)(54906003)(14454004)(106356001)(186003)(97736004)(8936002)(305945005)(8676002)(6436002)(5660300001)(478600001)(81156014)(86362001)(7736002)(81166006)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB2457;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-office365-filtering-correlation-id: 1f5121e7-a687-4aae-6577-08d66afddeb1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB2457;
x-ms-traffictypediagnostic: TY2PR01MB2457:
x-microsoft-antispam-prvs: <TY2PR01MB245786FE445D8CC88DF5EF36D8B50@TY2PR01MB2457.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(2401047)(8121501046)(3231475)(944501520)(52105112)(93006095)(93001095)(3002001)(10201501046)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201708071742011)(7699051)(76991095);SRVR:TY2PR01MB2457;BCL:0;PCL:0;RULEID:;SRVR:TY2PR01MB2457;
x-forefront-prvs: 0898A6E028
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LMDBcmwQEdNEe/mfPwZNXRelu+zFcGenup/G8EPaZk6Kxor/FoO7ZA7uo6DBAylJH2AqMmuWntaZNFcixWRHSsCIEFBxixt1rrKCjvxOI4www+k0rqWkXxOcLboAiCeHCuxH2gJqZylfq7vV95AwgQQ8DpF66MJT37O1uPw/E5DUoaYRxDcThiaYZolIbiP6KHJqCLHWBc+0VybOpv2RQ0FOs48L69L4lIlzZ2K6wHECAdgtptkKdTXZ7npya6w5eZJpnEk8GKAh95eUh9VxnjrodI4xxeZGS6m9oIsVgaEdx50h+mslBPwb7/5yp9RD
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5121e7-a687-4aae-6577-08d66afddeb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2018 06:46:31.2870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2457
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Thursday, December 20, 2018 11:03 PM
>=20
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> MOD_SEL register bit numbering was different from R-Car E3 SoC and
> R-Car H3/M3-[WN] SoCs.
>=20
> MOD_SEL 1-bit      H3/M3-[WN]  E3
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D
> Set Value =3D H'0    b'0         b'0
> Set Value =3D H'1    b'1         b'1
>=20
> MOD_SEL 2-bits     H3/M3-[WN]  E3
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D
> Set Value =3D H'0    b'00        b'00
> Set Value =3D H'1    b'01        b'10
> Set Value =3D H'2    b'10        b'01
> Set Value =3D H'3    b'11        b'11
>=20
> MOD_SEL 3-bits     H3/M3-[WN]  E3
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D  =3D=3D=3D=3D=3D
> Set Value =3D H'0    b'000       b'000
> Set Value =3D H'1    b'001       b'100
> Set Value =3D H'2    b'010       b'010
> Set Value =3D H'3    b'011       b'110
> Set Value =3D H'4    b'100       b'001
> Set Value =3D H'5    b'101       b'101
> Set Value =3D H'6    b'110       b'011
> Set Value =3D H'7    b'111       b'111
>=20
> This patch replaces the #define name and value of MOD_SEL.
>=20
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Fixes: 6d4036a1e3b3 ("pinctrl: sh-pfc: Initial R8A77990 PFC support")
> [shimoda: Split a patch per SoC and revise the commit log]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> [geert: Use macros to do the actual reordering]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Using a macro makes the code easier to writ, read, and maintain.
> Use "git show --color-words" to see the difference.
>=20
> I'd love to handle the reversal in the PINMUX_CFG_REG_VAR()
> descriptions, but I can't use e.g. REV8(MOD_SEL0_19_18_17) there, as
> MOD_SEL0_19_18_17 is a single parameter, not 8 parameters.
>=20
> Can this be improved?

Thank you for updating the patch to use the macros!
I think this patch can improve readability.

So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 32 +++++++++++++++------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-p=
fc/pfc-r8a77990.c
> index a733534610b36035..d44959d373603f45 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> @@ -391,29 +391,33 @@ FM(IP12_23_20)	IP12_23_20	FM(IP13_23_20)	IP13_23_20=
	FM(IP14_23_20)	IP14_23_20
> 	FM
>  FM(IP12_27_24)	IP12_27_24	FM(IP13_27_24)	IP13_27_24	FM(IP14_27_24)	IP14_=
27_24	FM(IP15_27_24)
> 	IP15_27_24 \
>  FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_=
31_28	FM(IP15_31_28)
> 	IP15_31_28
>=20
> +/* The bit numbering in MOD_SEL fields is reversed */
> +#define REV4(f0, f1, f2, f3)			f0 f2 f1 f3
> +#define REV8(f0, f1, f2, f3, f4, f5, f6, f7)	f0 f4 f2 f6 f1 f5 f3 f7
> +
>  /* MOD_SEL0 */			/* 0 */				/* 1 */				/* 2 */
> 		/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */
> -#define MOD_SEL0_30_29		FM(SEL_ADGB_0)			FM(SEL_ADGB_1)			FM(SEL_ADGB_2)
> 		F_(0, 0)
> +#define MOD_SEL0_30_29	   REV4(FM(SEL_ADGB_0),			FM(SEL_ADGB_1),			FM(SE=
L_ADGB_2),
> 		F_(0, 0))
>  #define MOD_SEL0_28		FM(SEL_DRIF0_0)			FM(SEL_DRIF0_1)
> -#define MOD_SEL0_27_26		FM(SEL_FM_0)			FM(SEL_FM_1)			FM(SEL_FM_2)
> 		F_(0, 0)
> +#define MOD_SEL0_27_26	   REV4(FM(SEL_FM_0),			FM(SEL_FM_1),			FM(SEL_FM=
_2),
> 		F_(0, 0))
>  #define MOD_SEL0_25		FM(SEL_FSO_0)			FM(SEL_FSO_1)
>  #define MOD_SEL0_24		FM(SEL_HSCIF0_0)		FM(SEL_HSCIF0_1)
>  #define MOD_SEL0_23		FM(SEL_HSCIF1_0)		FM(SEL_HSCIF1_1)
>  #define MOD_SEL0_22		FM(SEL_HSCIF2_0)		FM(SEL_HSCIF2_1)
> -#define MOD_SEL0_21_20		FM(SEL_I2C1_0)			FM(SEL_I2C1_1)			FM(SEL_I2C1_2)
> 		FM(SEL_I2C1_3)
> -#define MOD_SEL0_19_18_17	FM(SEL_I2C2_0)			FM(SEL_I2C2_1)			FM(SEL_I2C2_=
2)
> 		FM(SEL_I2C2_3)		FM(SEL_I2C2_4)		F_(0, 0)	F_(0, 0)	F_(0, 0)
> +#define MOD_SEL0_21_20	   REV4(FM(SEL_I2C1_0),			FM(SEL_I2C1_1),			FM(SE=
L_I2C1_2),
> 		FM(SEL_I2C1_3))
> +#define MOD_SEL0_19_18_17  REV8(FM(SEL_I2C2_0),			FM(SEL_I2C2_1),
> 	FM(SEL_I2C2_2),			FM(SEL_I2C2_3),		FM(SEL_I2C2_4),		F_(0, 0),	F_(0, 0),
> 	F_(0, 0))
>  #define MOD_SEL0_16		FM(SEL_NDFC_0)			FM(SEL_NDFC_1)
>  #define MOD_SEL0_15		FM(SEL_PWM0_0)			FM(SEL_PWM0_1)
>  #define MOD_SEL0_14		FM(SEL_PWM1_0)			FM(SEL_PWM1_1)
> -#define MOD_SEL0_13_12		FM(SEL_PWM2_0)			FM(SEL_PWM2_1)			FM(SEL_PWM2_2)
> 		F_(0, 0)
> -#define MOD_SEL0_11_10		FM(SEL_PWM3_0)			FM(SEL_PWM3_1)			FM(SEL_PWM3_2)
> 		F_(0, 0)
> +#define MOD_SEL0_13_12	   REV4(FM(SEL_PWM2_0),			FM(SEL_PWM2_1),			FM(SE=
L_PWM2_2),
> 		F_(0, 0))
> +#define MOD_SEL0_11_10	   REV4(FM(SEL_PWM3_0),			FM(SEL_PWM3_1),			FM(SE=
L_PWM3_2),
> 		F_(0, 0))
>  #define MOD_SEL0_9		FM(SEL_PWM4_0)			FM(SEL_PWM4_1)
>  #define MOD_SEL0_8		FM(SEL_PWM5_0)			FM(SEL_PWM5_1)
>  #define MOD_SEL0_7		FM(SEL_PWM6_0)			FM(SEL_PWM6_1)
> -#define MOD_SEL0_6_5		FM(SEL_REMOCON_0)		FM(SEL_REMOCON_1)		FM(SEL_REMOC=
ON_2)
> 		F_(0, 0)
> +#define MOD_SEL0_6_5	   REV4(FM(SEL_REMOCON_0),		FM(SEL_REMOCON_1),		FM(=
SEL_REMOCON_2),
> 		F_(0, 0))
>  #define MOD_SEL0_4		FM(SEL_SCIF_0)			FM(SEL_SCIF_1)
>  #define MOD_SEL0_3		FM(SEL_SCIF0_0)			FM(SEL_SCIF0_1)
>  #define MOD_SEL0_2		FM(SEL_SCIF2_0)			FM(SEL_SCIF2_1)
> -#define MOD_SEL0_1_0		FM(SEL_SPEED_PULSE_IF_0)	FM(SEL_SPEED_PULSE_IF_1)
> 	FM(SEL_SPEED_PULSE_IF_2)	F_(0, 0)
> +#define MOD_SEL0_1_0	   REV4(FM(SEL_SPEED_PULSE_IF_0),	FM(SEL_SPEED_PULS=
E_IF_1),
> 	FM(SEL_SPEED_PULSE_IF_2),	F_(0, 0))
>=20
>  /* MOD_SEL1 */			/* 0 */				/* 1 */				/* 2 */
> 		/* 3 */			/* 4 */			/* 5 */		/* 6 */		/* 7 */
>  #define MOD_SEL1_31		FM(SEL_SIMCARD_0)		FM(SEL_SIMCARD_1)
> @@ -422,18 +426,18 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28=
	FM(IP14_31_28)	IP14_31_28
> 	FM
>  #define MOD_SEL1_28		FM(SEL_USB_20_CH0_0)		FM(SEL_USB_20_CH0_1)
>  #define MOD_SEL1_26		FM(SEL_DRIF2_0)			FM(SEL_DRIF2_1)
>  #define MOD_SEL1_25		FM(SEL_DRIF3_0)			FM(SEL_DRIF3_1)
> -#define MOD_SEL1_24_23_22	FM(SEL_HSCIF3_0)		FM(SEL_HSCIF3_1)		FM(SEL_HSC=
IF3_2)
> 		FM(SEL_HSCIF3_3)	FM(SEL_HSCIF3_4)	F_(0, 0)	F_(0, 0)	F_(0, 0)
> -#define MOD_SEL1_21_20_19	FM(SEL_HSCIF4_0)		FM(SEL_HSCIF4_1)		FM(SEL_HSC=
IF4_2)
> 		FM(SEL_HSCIF4_3)	FM(SEL_HSCIF4_4)	F_(0, 0)	F_(0, 0)	F_(0, 0)
> +#define MOD_SEL1_24_23_22  REV8(FM(SEL_HSCIF3_0),		FM(SEL_HSCIF3_1),		FM=
(SEL_HSCIF3_2),
> 		FM(SEL_HSCIF3_3),	FM(SEL_HSCIF3_4),	F_(0, 0),	F_(0, 0),	F_(0, 0))
> +#define MOD_SEL1_21_20_19  REV8(FM(SEL_HSCIF4_0),		FM(SEL_HSCIF4_1),		FM=
(SEL_HSCIF4_2),
> 		FM(SEL_HSCIF4_3),	FM(SEL_HSCIF4_4),	F_(0, 0),	F_(0, 0),	F_(0, 0))
>  #define MOD_SEL1_18		FM(SEL_I2C6_0)			FM(SEL_I2C6_1)
>  #define MOD_SEL1_17		FM(SEL_I2C7_0)			FM(SEL_I2C7_1)
>  #define MOD_SEL1_16		FM(SEL_MSIOF2_0)		FM(SEL_MSIOF2_1)
>  #define MOD_SEL1_15		FM(SEL_MSIOF3_0)		FM(SEL_MSIOF3_1)
> -#define MOD_SEL1_14_13		FM(SEL_SCIF3_0)			FM(SEL_SCIF3_1)			FM(SEL_SCIF3=
_2)
> 		F_(0, 0)
> -#define MOD_SEL1_12_11		FM(SEL_SCIF4_0)			FM(SEL_SCIF4_1)			FM(SEL_SCIF4=
_2)
> 		F_(0, 0)
> -#define MOD_SEL1_10_9		FM(SEL_SCIF5_0)			FM(SEL_SCIF5_1)			FM(SEL_SCIF5_=
2)
> 		F_(0, 0)
> +#define MOD_SEL1_14_13	   REV4(FM(SEL_SCIF3_0),		FM(SEL_SCIF3_1),		FM(SE=
L_SCIF3_2),
> 		F_(0, 0))
> +#define MOD_SEL1_12_11	   REV4(FM(SEL_SCIF4_0),		FM(SEL_SCIF4_1),		FM(SE=
L_SCIF4_2),
> 		F_(0, 0))
> +#define MOD_SEL1_10_9	   REV4(FM(SEL_SCIF5_0),		FM(SEL_SCIF5_1),		FM(SEL=
_SCIF5_2),
> 		F_(0, 0))
>  #define MOD_SEL1_8		FM(SEL_VIN4_0)			FM(SEL_VIN4_1)
>  #define MOD_SEL1_7		FM(SEL_VIN5_0)			FM(SEL_VIN5_1)
> -#define MOD_SEL1_6_5		FM(SEL_ADGC_0)			FM(SEL_ADGC_1)			FM(SEL_ADGC_2)
> 		F_(0, 0)
> +#define MOD_SEL1_6_5	   REV4(FM(SEL_ADGC_0),			FM(SEL_ADGC_1),			FM(SEL_=
ADGC_2),
> 		F_(0, 0))
>  #define MOD_SEL1_4		FM(SEL_SSI9_0)			FM(SEL_SSI9_1)
>=20
>  #define PINMUX_MOD_SELS	\
> --
> 2.17.1

