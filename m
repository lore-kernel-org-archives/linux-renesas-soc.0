Return-Path: <SRS0=jOjt=SM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A82C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCDC720820
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 10 Apr 2019 09:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="MScjvw/M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbfDJJtk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 10 Apr 2019 05:49:40 -0400
Received: from mail-eopbgr1410108.outbound.protection.outlook.com ([40.107.141.108]:44160
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728543AbfDJJtk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Apr 2019 05:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TsoDhtmnrzR9+24SupWvh1A2CyIYtqH9qNE5riz5Cs=;
 b=MScjvw/MAU8CHTfdqH//1ezouGEvnDO1SNOVKahDHmqxT3ow8UJdDzYKGon/aBlDzbrIkVBBsTin7velRvVcqcCvpfk/2U94i7Gn7LcEYs+T78ddsps+Qo09skJWp8qymKnGz4ToXVUbclPKvjaMcHTuKPgRWJbCSIuxPUzB17k=
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com (20.178.139.148) by
 TYAPR01MB4782.jpnprd01.prod.outlook.com (20.179.175.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.21; Wed, 10 Apr 2019 09:49:36 +0000
Received: from TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70]) by TYAPR01MB4271.jpnprd01.prod.outlook.com
 ([fe80::cda2:4f20:84e4:de70%4]) with mapi id 15.20.1771.016; Wed, 10 Apr 2019
 09:49:36 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH V4 02/13] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Thread-Topic: [PATCH V4 02/13] phy: renesas: phy-rcar-gen2: Add support for
 r8a77470
Thread-Index: AQHU73WIcHT6sD/wdkO+01ODIzrH7aY1JUGA
Date:   Wed, 10 Apr 2019 09:49:35 +0000
Message-ID: <TYAPR01MB427138C68589972EB9385E95D82E0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554883715-41725-1-git-send-email-biju.das@bp.renesas.com>
 <1554883715-41725-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554883715-41725-3-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fcd5ec6-1edd-4212-af8f-08d6bd99d772
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB4782;
x-ms-traffictypediagnostic: TYAPR01MB4782:
x-microsoft-antispam-prvs: <TYAPR01MB47825B0E3212B864A1AE2BF7D82E0@TYAPR01MB4782.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(39860400002)(376002)(346002)(396003)(199004)(189003)(26005)(2906002)(52536014)(81156014)(81166006)(3846002)(74316002)(229853002)(76176011)(186003)(86362001)(102836004)(6116002)(68736007)(7736002)(8676002)(66066001)(6506007)(8936002)(305945005)(5660300002)(9686003)(25786009)(14454004)(6436002)(99286004)(478600001)(7696005)(4326008)(71200400001)(53936002)(55016002)(71190400001)(110136005)(6246003)(446003)(486006)(105586002)(476003)(97736004)(11346002)(33656002)(4744005)(316002)(54906003)(106356001)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4782;H:TYAPR01MB4271.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mgXyIM1fUO/2hmGS8PrSVB2+U10D1rw1cFY90v9TbpkBrEdSnvO56R46/NdcNBp+QkfaruMBlNHzq5dU2DDYUUm1YZ5RTC7AW2lsuschRegdK8k7Tktzf9XU7hGtAf3ORAHue+2fp1ukAZRXozmNVsxKMpQSodyN4x1MPfLbvWui0zW6hM/4G5mCYpLej2If9leBCENMwVmZ/Y9BnfqkC2Wqfr4r6mqBGZW3CSGo56dg8Ud60laBcB9wolsuBIVBKO5KO7WMArhCicnUiR9VhrCA+uUemqmJGkFFrcvlhKL4cL3yQtIIvSXavMTBOcFp8sECYEu7ndUkG7fGGa4BAPpkbG5pTia1fCLc/7dofzyhyUqROkEbuRzsE3y/uw4xubWL3GBaBHdJ9nOe5aSeMNS/UQpdAAGWVRbeLwVtrgA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fcd5ec6-1edd-4212-af8f-08d6bd99d772
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 09:49:36.0036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4782
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

Thank you for the patch!

> From: Biju Das, Sent: Wednesday, April 10, 2019 5:08 PM
<snip>
>  static int rcar_gen2_phy_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -238,6 +313,8 @@ static int rcar_gen2_phy_probe(struct platform_device=
 *pdev)
>  	struct resource *res;
>  	void __iomem *base;
>  	struct clk *clk;
> +	const struct phy_ops *gen2_phy_ops =3D &rcar_gen2_phy_ops;
> +	const u32 (*select_value)[PHYS_PER_CHANNEL]  =3D pci_select_value;
>  	int i =3D 0;
>=20
>  	if (!dev->of_node) {
> @@ -266,6 +343,11 @@ static int rcar_gen2_phy_probe(struct platform_devic=
e *pdev)
>  	drv->clk =3D clk;
>  	drv->base =3D base;
>=20
> +	if (soc_device_match(soc_r8a77470)) {

I'm not sure, but this driver also should not use the soc_device_match() li=
ke phy-rcar-gen3-usb2 driver?
If we add a special data struct and has phy_ops and select_value members, w=
e can achieve not to use the soc_device_match().

Best regards,
Yoshihiro Shimoda

