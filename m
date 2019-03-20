Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AE8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 08:01:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F8FB21841
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 08:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="hp3ETR+e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727748AbfCTIB1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 04:01:27 -0400
Received: from mail-eopbgr1310107.outbound.protection.outlook.com ([40.107.131.107]:58784
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725942AbfCTIB0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 04:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K/mfTH++HOTHTFppyrGDAeRajqrokww8MBHH9gQ62U=;
 b=hp3ETR+emYle7c7xhGERGxh5oiSuNyrTfcja9xt77ANltS95zr76LY6oU4NjcTYSoc3jqg+RYzkUWEQcCFRfFgd11aEWerMBallFhBDR4cxobdUEb7ItdecMPi3w6eV5c/fZL1ah0yyV/BM6d7g2cRnVhbot8UhXwCKQI3ffQz0=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB4842.jpnprd01.prod.outlook.com (20.179.170.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Wed, 20 Mar 2019 08:01:19 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::f423:2ed8:938:c28d]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::f423:2ed8:938:c28d%5]) with mapi id 15.20.1709.015; Wed, 20 Mar 2019
 08:01:19 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: RE: [PATCH RFT] mmc: renesas_sdhi: limit block count to 16 bit for
 old revisions
Thread-Topic: [PATCH RFT] mmc: renesas_sdhi: limit block count to 16 bit for
 old revisions
Thread-Index: AQHU3jxcCr7eBsmz9U+j5hRVabs/WKYUKK7w
Date:   Wed, 20 Mar 2019 08:01:19 +0000
Message-ID: <TY2PR01MB4812EEF87FA3133EE9C6738ED8410@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <20190319101259.20078-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190319101259.20078-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3787187-7610-4ec8-7987-08d6ad0a3c59
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB4842;
x-ms-traffictypediagnostic: TY2PR01MB4842:
x-microsoft-antispam-prvs: <TY2PR01MB4842267ED9994BF49D7FCD26D8410@TY2PR01MB4842.jpnprd01.prod.outlook.com>
x-forefront-prvs: 098291215C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(396003)(366004)(346002)(136003)(189003)(199004)(71190400001)(86362001)(55016002)(7696005)(53936002)(2501003)(52536014)(97736004)(305945005)(478600001)(66066001)(7736002)(6246003)(25786009)(8936002)(71200400001)(9686003)(74316002)(33656002)(8676002)(107886003)(486006)(81156014)(14454004)(81166006)(6436002)(68736007)(106356001)(11346002)(2906002)(105586002)(476003)(256004)(186003)(6116002)(26005)(102836004)(316002)(110136005)(54906003)(446003)(76176011)(5660300002)(4326008)(6506007)(99286004)(3846002)(14444005)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB4842;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 413ZUJTBTpyQkZiec7+3fhYMh7gI7pIvkaK7gdrPiZsN/sgi1n0gK9mamA80c+qKUbbQZkHocqtJ8sfC8SoFTRtqobmDTkmz8Lyf7fS8S32bBbJE3qs7mJnZceUFyA3jBvFhNl0toAcK2VNYjoDCxZdiUWVT5u3qixPsD2PlgTA3nVWKw6ATxP2H3b+LKiKzLvCfIniwCrGb0D4s2c2OUDc9OAVYO9K1KK825OaD4gnUBzxh8L2l2VA+eNAKUOWF2ojC1Qvd4diYIypsrgO+zeNu26pz40cDQWeyM5TczTej71ffl3TZ6tbMI7LeWGRiAA600T6io7xF2xeZTZaDoDZyNGvgoN/mpCHrcwi4c/8IJZmApUyHBMlZM3N7YudedIaI1Hi6IwsGyLPulw/uTwAl13u4OmCN2dKCu98mHWE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3787187-7610-4ec8-7987-08d6ad0a3c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2019 08:01:19.2017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4842
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Tuesday, March 19, 2019 7:13 PM
>=20
> R-Car Gen2 has two different SDHI incarnations in the same chip. The
> older one does not support the recently introduced 32 bit register
> access to the block count register. Make sure we use this feature only
> after the first known version.
>=20
> Thanks to the Renesas Testing team for this bug report!
>=20
> Fixes:5603731a15ef ("mmc: tmio: fix access width of Block Count Register"=
)
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Thank you for the patch.
Since our test team tested this patch on R-Car H2 / Lager board and the iss=
ue disappeared.
So,

Tested-by: Phong Hoang <phong.hoang.wz@renesas.com>

Best regards,
Yoshihiro Shimoda

> I could reproduce the issue on my Renesas Lager board (R-Car H2) and this=
 patch
> fixes the issue for me. Still, if we could confirmation from the testing =
team,
> this would be awesome to have before applying, I think.
>=20
>  drivers/mmc/host/renesas_sdhi_core.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 71e13844df6c..8742e27e4e8b 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -641,6 +641,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  	struct renesas_sdhi *priv;
>  	struct resource *res;
>  	int irq, ret, i;
> +	u16 ver;
>=20
>  	of_data =3D of_device_get_match_data(&pdev->dev);
>=20
> @@ -773,12 +774,17 @@ int renesas_sdhi_probe(struct platform_device *pdev=
,
>  	if (ret)
>  		goto efree;
>=20
> +	ver =3D sd_ctrl_read16(host, CTL_VERSION);
> +	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
> +	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
> +		mmc_data->max_blk_count =3D U16_MAX;
> +
>  	ret =3D tmio_mmc_host_probe(host);
>  	if (ret < 0)
>  		goto edisclk;
>=20
>  	/* One Gen2 SDHI incarnation does NOT have a CBSY bit */
> -	if (sd_ctrl_read16(host, CTL_VERSION) =3D=3D SDHI_VER_GEN2_SDR50)
> +	if (ver =3D=3D SDHI_VER_GEN2_SDR50)
>  		mmc_data->flags &=3D ~TMIO_MMC_HAVE_CBSY;
>=20
>  	/* Enable tuning iff we have an SCC and a supported mode */
> --
> 2.11.0

