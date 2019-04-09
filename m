Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28106C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:48:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB20E206B7
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:48:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="bJhu5hL1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfDIKsh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 06:48:37 -0400
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:6048
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726079AbfDIKsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 06:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJevm2vYGTfd3lop+MFVJ4qyr9Air+ZP3vlLCq81cYs=;
 b=bJhu5hL15FTG/s9QYj04vN5SMkJLq6TaGlBr5qU6ISnJhUYAM9iqlcAcFCkeozW1aKGiv8eqQ5dkvtd3pXAyj+ci10/lGtjcTbrEEXDXn5jzL3JofsENq7Sldnd8q0sWj/Fa7klnmuMH989Xs/cpRQIp0Bzqm46bcEvXMhNBEyo=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB2879.jpnprd01.prod.outlook.com (20.177.103.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.18; Tue, 9 Apr 2019 10:48:33 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 10:48:33 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: core: retry CMD1 in mmc_send_op_cond() even if the
 ocr = 0
Thread-Topic: [PATCH] mmc: core: retry CMD1 in mmc_send_op_cond() even if the
 ocr = 0
Thread-Index: AQHU5Uf6vHgGCBNugUCeV5Xpfa5BU6Yqc2eAgAlD1gA=
Date:   Tue, 9 Apr 2019 10:48:33 +0000
Message-ID: <TYAPR01MB42716D9C185D25F70E610C7CD82D0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1553764807-5778-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190403131309.mlj5twiymmjw24rr@ninjato>
In-Reply-To: <20190403131309.mlj5twiymmjw24rr@ninjato>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0eef5b4-43d1-4143-5997-08d6bcd8e950
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TYAPR01MB2879;
x-ms-traffictypediagnostic: TYAPR01MB2879:
x-microsoft-antispam-prvs: <TYAPR01MB287921D62104A518F5E6C02DD82D0@TYAPR01MB2879.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(39860400002)(376002)(346002)(396003)(199004)(189003)(6436002)(486006)(106356001)(52536014)(476003)(2906002)(446003)(11346002)(229853002)(5660300002)(105586002)(66066001)(7696005)(71190400001)(76176011)(86362001)(8676002)(81156014)(8936002)(71200400001)(81166006)(68736007)(6916009)(3846002)(9686003)(6116002)(55016002)(6506007)(99286004)(97736004)(6246003)(14454004)(53936002)(74316002)(102836004)(478600001)(4326008)(7736002)(186003)(33656002)(26005)(256004)(5024004)(25786009)(316002)(305945005)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2879;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qtPO3dKywhqjpf4RMKr63ASisQrPkT7M9KLIGSkdIpf7fdo7c+YJBHZtoswGCjqZwWT/D13thNVuOm8+pe0nCEH8EQarTmAljPwu7CTK/QXNGdSB5QQRnwAGRO/uDyCoI/9witIZ8oC6dKIAfp/q9OOWwHEfB7i2EcbLaglEs0JRZUif+0oQvo/Udt57lVWuvhSzaniywuxXdS7qhNDFmAnYz131TaE8dp45PQCaYFqnzo3o/BLX77GL76utwBWQTrwIYWHuaCj8MAY+TTyjjb4df7/Mw5vcoG+hYC+zxA+Wo+lSx5TZ5pdiu+3h4Ssda5w/hOQ86u0VOtGsOaQ2mGzbHwQsfCh3JTC384ctjTTFoJtlz7Q3q5dcBcHKOD484yUuYqqib0CbVkNcVlVIwvoLMUbTMstKXsyRUyXKomU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0eef5b4-43d1-4143-5997-08d6bcd8e950
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 10:48:33.0777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2879
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for your review!

> From: Wolfram Sang, Sent: Wednesday, April 3, 2019 10:13 PM
>=20
> Hi Shimoda-san,
>=20
> thank you for this bugfix! Looks like a nice catch.
>=20
> > +
> > +		/*
> > +		 * According to eMMC specification, we should issue CMD1
>=20
> Maybe it is good to specify where? I found it in the standard v5.1,
> section 6.4.3.

I got it. I'll add such a comment.

> > +		 * repeatidly in the idle state until the eMMC is ready even if
>=20
> "repeatedly"

Oops. I'll revise it.

> > +		 * the mmc_attach_mmc() calls this function with ocr =3D 0.
>=20
> I would suggest to remove the "if ..." part from the comment. Because
> you remove the 'if (ocr =3D=3D 0)' code, so it becomes less obvious what
> that part of the comment relates to.

I got it. I'll remove it.

> > +		 * Otherwise some eMMC devices seem to enter the inactive mode
> > +		 * after mmc_init_card() issued CMD0 when the eMMC device is
> > +		 * busy.
> > +		 */
>=20
> Other than that, good documentation!
>=20
> > +		if (!ocr && !mmc_host_is_spi(host))
> > +			cmd.arg =3D cmd.resp[0] | BIT(30);
>=20
> I think BIT(30) is okay for this bugfix. But as a follow up, we should
> turn this into a define. It could be used in mmc_init_card() as well and
> will make the code way more readable.

I think so. I found hardcoded value in ./drivers/mmc/core like below
(I don't check all the lines are related to the bit though):

$ git grep -e "1 << 30" -e "BIT(30)" ./drivers/mmc/core/
drivers/mmc/core/mmc.c: err =3D mmc_send_op_cond(host, ocr | (1 << 30), &ro=
cr);
drivers/mmc/core/mmc.c:         if (rocr & BIT(30))
drivers/mmc/core/mmc_ops.c:     cmd.arg =3D highcap ? (1 << 30) : 0;
drivers/mmc/core/sd_ops.c:              cmd.arg =3D ocr & (1 << 30); /* SPI=
 only defines one bit */

Best regards,
Yoshihiro Shimoda

> All the best,
>=20
>    Wolfram

