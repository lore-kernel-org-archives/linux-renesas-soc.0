Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A392C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:37:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CCDA20818
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 10:37:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="gXPqyxNU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbfDIKhG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 06:37:06 -0400
Received: from mail-eopbgr1410111.outbound.protection.outlook.com ([40.107.141.111]:59296
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726066AbfDIKhG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 06:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VcMxbXgyh4GjBK+sQKeDXAORPQc+YcTrtf4vE6WtPuY=;
 b=gXPqyxNUYGH0zsd+9B7QNPPzPfcEz7mdupjB2ZrDNgWK+Zv361+oLgSVt98XIZzRp4Br2x46xTCEuY8H4s8wbVJoF6j0XqSk2NSHjFiUHhPSI2A50NeZs4cWSl066aFikUVal+PUC3wm/ciXKFcZV4RTWyv1FxbxfAcvehQGStc=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB4160.jpnprd01.prod.outlook.com (20.178.140.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Tue, 9 Apr 2019 10:37:02 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 10:37:02 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: [PATCH V3 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
Thread-Topic: [PATCH V3 04/13] phy: rcar-gen3-usb2: Add support for r8a77470
Thread-Index: AQHU6gjyRq4RfgfvsEO3eg6xx8AMIKYzp43A
Date:   Tue, 9 Apr 2019 10:37:01 +0000
Message-ID: <TYAPR01MB42715DF4B56F97FA83AB68AED82D0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554287324-22312-5-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f6a1ccf-eb64-4e42-1814-08d6bcd74d4b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4160;
x-ms-traffictypediagnostic: TYAPR01MB4160:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <TYAPR01MB4160E6F00576594974D51E0CD82D0@TYAPR01MB4160.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(39860400002)(396003)(366004)(136003)(376002)(346002)(189003)(199004)(229853002)(7736002)(76176011)(102836004)(14454004)(6306002)(6246003)(186003)(26005)(55016002)(25786009)(6436002)(4326008)(486006)(6506007)(53936002)(476003)(11346002)(446003)(966005)(7696005)(110136005)(305945005)(316002)(8936002)(9686003)(86362001)(3846002)(6116002)(2906002)(54906003)(33656002)(99286004)(52536014)(68736007)(5660300002)(105586002)(74316002)(106356001)(71190400001)(71200400001)(256004)(97736004)(66066001)(81156014)(81166006)(8676002)(478600001)(6606295002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4160;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fr3aJyY+XCZXNNnlLbEt+lB9mgJDkj/uhEBAttSW5wI0ozm6XvGDjHiZhrFzFgY7JVKbaDjdaOPoraCm4DbLAv0+F+dhbuqOy8vKcxe+j4mJRVC9URACY0QnBIxybtvwN3xRzY3E1VzRUt1c9oHZx30hBb+ezQtB/L94zPgw7i0Q7GymqYrz8qfJ1vmFxhTe0ypNib2lEIc45rQnAlw7f3DRGfJqXaCRRgo9me5oYP7oa4s3ZxvGP8tljBLTIzu30Q1rDCOfupjKwBVAEBaULL5gs13iMhyAn4OKE38oPC92pr7gns2Gkq2oLdk+Pxrb6Zsi+dTRWbrW4jRdR1McWuIg4zpB39iEVagNp9wBKJhnqFn+EmBSe4yPtMeYKSvatQmMwPqmOt1AEb6AwovL3u9gBsyq17hSYkOS4b0M3kQ=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6a1ccf-eb64-4e42-1814-08d6bcd74d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 10:37:01.8079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4160
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

Thank you for the patch!

> From: Biju Das, Sent: Wednesday, April 3, 2019 7:29 PM
>=20
> This patch adds support for r8a77470 (RZ/G1C). We can reuse this driver f=
or
> initializing timing/interrupt generation registers.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---

It seems good to me. However, since Fabrizio-san and I have submitted patch=
(es)
for the driver around the same time, I'm confusing how to handle this patch=
.

< At March 1, 2019, 11:05 a.m. UTC >
https://patchwork.kernel.org/patch/10834975/

- Kishon-san said "merged" at April 1, but I mentioned this patch breaks R-=
Car D3.
- I checked today's his repo, but it doesn't seem to merge it.
- I don't get any feedback.

< At April 1, 2019, 12:01 p.m. UTC >
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D99561

- Got Simon-san and Fabrizio-san's review.

and then,=20

< At April 3, 2019, 10:28 a.m. UTC >
https://patchwork.kernel.org/patch/10883265/

> V1-->V2
>  * Incorporated shimoda-san's review comment
>  Ref: https://patchwork.kernel.org/patch/10655855/
> ---
>  drivers/phy/renesas/Kconfig              |  2 +-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 19 ++++++++++++++++++-
>  2 files changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> index e340a92..961ccb1 100644
> --- a/drivers/phy/renesas/Kconfig
> +++ b/drivers/phy/renesas/Kconfig
> @@ -19,7 +19,7 @@ config PHY_RCAR_GEN3_PCIE
>  config PHY_RCAR_GEN3_USB2
>  	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
>  	depends on ARCH_RENESAS
> -	depends on EXTCON
> +	depends on EXTCON || ARCH_R8A77470

If EXTCON=3Dm, build error might happen like below.
https://marc.info/?l=3Dlinux-renesas-soc&m=3D154220057305761&w=3D2

Is it enough about "depends on EXTCON || !EXTCON" for your environment?

Best regards,
Yoshihiro Shimoda

