Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AB8C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 08:31:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28F522083E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 08:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="ALS8c1g3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbfDKIbA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 04:31:00 -0400
Received: from mail-eopbgr1410102.outbound.protection.outlook.com ([40.107.141.102]:17269
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726139AbfDKIbA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 04:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=detYyWQlEJR33bbdpZQSE8MRVQZRdrTQR5qW1i39GVU=;
 b=ALS8c1g3Upd5rLaK7RKoZv5o7MsAHdP31f/JIgN63hLNA9KtUSqlHxtk10wimomom+e/Wj6NXxS/wpFdF45L7NZha8/h528rndC7KJyz4AQZx51lfGIVqp8iEeNYFZB/oAu1DDxxRbKnkPd3tTel2zwUgpQgTnsDggwmEP3vKzM=
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com (52.133.177.145) by
 TYAPR01MB2942.jpnprd01.prod.outlook.com (20.177.101.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.18; Thu, 11 Apr 2019 08:30:54 +0000
Received: from TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::7d5b:d367:41c0:ae25]) by TYAPR01MB2285.jpnprd01.prod.outlook.com
 ([fe80::7d5b:d367:41c0:ae25%5]) with mapi id 15.20.1771.016; Thu, 11 Apr 2019
 08:30:54 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Cao Van Dong <cv-dong@jinso.co.jp>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>
CC:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        hideo inayoshi <h-inayoshi@jinso.co.jp>,
        "nv-dung@jinso.co.jp" <nv-dung@jinso.co.jp>,
        "na-hoan@jinso.co.jp" <na-hoan@jinso.co.jp>
Subject: RE: [PATCH v2 00/20] Add more support to the RZ/G1C (r8a77470) SoC
Thread-Topic: [PATCH v2 00/20] Add more support to the RZ/G1C (r8a77470) SoC
Thread-Index: AQHU8DvMVIyBgfind0KZ9DPJwiPSkqY2mifQ
Date:   Thu, 11 Apr 2019 08:30:54 +0000
Message-ID: <TYAPR01MB2285FDDBEC874A3A0621C3CEB72F0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Paterson2@renesas.com; 
x-originating-ip: [90.253.71.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e764c99c-44e6-4f43-ab74-08d6be5803a5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TYAPR01MB2942;
x-ms-traffictypediagnostic: TYAPR01MB2942:
x-ms-exchange-purlcount: 1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-microsoft-antispam-prvs: <TYAPR01MB29424B0B2BDB63275105054BB72F0@TYAPR01MB2942.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(39860400002)(396003)(366004)(136003)(189003)(199004)(3846002)(8676002)(55016002)(478600001)(106356001)(66066001)(14454004)(105586002)(110136005)(8936002)(966005)(256004)(71200400001)(71190400001)(476003)(486006)(6116002)(102836004)(14444005)(54906003)(68736007)(316002)(26005)(6506007)(186003)(229853002)(74316002)(446003)(2201001)(7696005)(9686003)(72206003)(33656002)(6436002)(5660300002)(305945005)(2501003)(86362001)(76176011)(6306002)(97736004)(11346002)(2906002)(81156014)(4326008)(81166006)(53936002)(99286004)(6246003)(25786009)(7736002)(52536014);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB2942;H:TYAPR01MB2285.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tRFvLfG7edXBdsIQz9H8hXtQ6g8EfTEM0hp9v4TLZd141Ja3de29P+DTEi//ML5DyJpz6TC0REOuDXN+kWA5pCrhRQNSZJDSmYIYRi4zh/cg2ouEeiAep5yy9C3gIMhvdFZvJENBrVCEW+EHqQ+lQnIT+OS7DNi59TBczMdVtvpBNX7gHb1nlAWgdhigmMnUPMOvPJoA4GTzBf9aSNFSWfd4NyLMdgRcan0313t6Oztn14192aX6Er3bOGEfG6arDKyvQC3oTQEiLWFcnMabpraCsFPWF5TH2ZYVtf98/Qh+Ht+RPwckfawPrtu4mvaYoonDuINaVz6bbQm5xkOylszzZV63iu6laoK+dvbx5Giz7/tFTj1nlcO3YGVOUDVxQHt5vltD80Pe1I8xiI5qgpIOXAbIMtkVbULvpwM7ufg=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e764c99c-44e6-4f43-ab74-08d6be5803a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2019 08:30:54.5411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2942
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Cao,

> From: devicetree-owner@vger.kernel.org <devicetree-owner@vger.kernel.org>
> On Behalf Of Cao Van Dong
> Sent: 11 April 2019 08:54
>=20
> Dear everyone,
>=20
> This series adds HSCIF,MSIOF,PWM,CAN,VIN,Audio,Audio-
> DMAC,Ether,VSP,FDP1,LVDS support
> for the RZ/G1C (r8a77470) SoC. It is based on the renesas-drivers-2019-04=
-02-
> v5.1-rc3 tag

Thank you for your work to upstream more support for the RZ/G1C!

> of renesas-drivers tree. Currently, I only add patches to the tree and co=
mpiled.
> Unfortunately, RZ/G1C board is not available, so I have not tested these =
patches
> on this board yet.
>=20
> cc Biju,
> I know it is very difficult. however I still want to ask if you can help =
me test
> them?
The problem here is that Biju and the team only have iwg23s-sbc boards [1],=
 which only expose these interfaces on external headers, in many cases with=
out the require transceivers etc., meaning that testing is difficult.

This is why we omitted them from the initial RZ/G1C upstreaming.

Some interfaces are pretty low risk, so the maintainers may well accept som=
e of your patches without testing I guess?

[1] https://www.iwavesystems.com/product/single-board-computer/rzg1c/rz-g1c=
-single-board-computer.html

> If possible, I will send the .dts file separately to you.
I think you'd also need PFC changes.

Kind regards, Chris

> Because I am known you can be available this board. Thanks!
>=20
> Cao Van Dong (20):
>   ARM: dts: r8a77470: Add HSCIF support
>   ARM: dts: r8a77470: Add MSIOF support
>   ARM: dts: r8a77470: Add PWM support
>   ARM: dts: r8a77470: Add CAN support
>   ARM: dts: r8a77470: Add VIN support
>   ARM: dts: r8a77470: Add Audio support
>   ARM: dts: r8a77470: Add Audio-DMAC support
>   ARM: dts: r8a77470: Add Ether support
>   ARM: dts: r8a77470: Add VSP support
>   ARM: dts: r8a77470: Add FDP1 support
>   ARM: dts: r8a77470: Add LVDS support
>   ARM: dts: r8a77470: Add audio clocks
>   ARM: dts: r8a77470: Add can clocks
>   dt-bindings: display: renesas: lvds: Add r8a77470 support
>   media: dt-bindings: media: rcar_vin: Document r8a77470 bindings
>   ASoC: rsnd: Document r8a77470 bindings
>   dt-bindings: pwm: Document r8a77470 bindings
>   sh_eth: Document r8a77470 bindings
>   spi: sh-msiof: Document r8a77470 bindings
>   dt-bindings: can: rcar_can: Document r8a77470 bindings
>=20
>  .../bindings/display/bridge/renesas,lvds.txt       |   1 +
>  .../devicetree/bindings/media/rcar_vin.txt         |   1 +
>  .../devicetree/bindings/net/can/rcar_can.txt       |   1 +
>  Documentation/devicetree/bindings/net/sh_eth.txt   |   1 +
>  .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   |   1 +
>  .../devicetree/bindings/sound/renesas,rsnd.txt     |   1 +
>  Documentation/devicetree/bindings/spi/sh-msiof.txt |   1 +
>  arch/arm/boot/dts/r8a77470.dtsi                    | 608 +++++++++++++++=
++++++
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                |   1 +
>  9 files changed, 616 insertions(+)
>=20
> --
> 2.7.4

