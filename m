Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB73C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B919206DD
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:29:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="NhdCqemj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbfDCK3p (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:29:45 -0400
Received: from mail-eopbgr1410099.outbound.protection.outlook.com ([40.107.141.99]:61579
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726183AbfDCK3p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0n3v5/uLbeXrHpA0fVcV0V4TyNCu90yP++w+DKa/GDI=;
 b=NhdCqemjelxAXfnP3P7Fk3FJ4onQayM+a3RHTgxJb+6zOoLF96LUvoFKPzlyRiVZ+6W3PNR6PLB2bxLWkp4Ocxl9fdpXofXN6PtcH9lLLEXnv1nZ7g+v/vnKpACPCdcyQKehZyK3rtc/SH6mSKCAXctPCEYq5CaH5kCWueZ/oQI=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1593.jpnprd01.prod.outlook.com (52.133.163.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.22; Wed, 3 Apr 2019 10:29:39 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273%4]) with mapi id 15.20.1750.017; Wed, 3 Apr 2019
 10:29:39 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
Subject: RE: [PATCH 3/4] arm64: dts: renesas: r8a774c0-cat874: Add USB-HOST
 support
Thread-Topic: [PATCH 3/4] arm64: dts: renesas: r8a774c0-cat874: Add USB-HOST
 support
Thread-Index: AQHU0B7p+vPIUY0iy0avwu3PuKjSvaYqb1ng
Date:   Wed, 3 Apr 2019 10:29:39 +0000
Message-ID: <TY1PR01MB1770C64F41C77DAED3556E58C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-4-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1551438348-22119-4-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2377cac4-8392-4caa-f8c7-08d6b81f46e6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TY1PR01MB1593;
x-ms-traffictypediagnostic: TY1PR01MB1593:
x-microsoft-antispam-prvs: <TY1PR01MB1593B6342BDB1FDE038884E6C0570@TY1PR01MB1593.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0996D1900D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(136003)(39860400002)(346002)(366004)(189003)(199004)(97736004)(54906003)(476003)(106356001)(99286004)(74316002)(53936002)(44832011)(7696005)(25786009)(52536014)(5660300002)(55016002)(9686003)(66066001)(486006)(86362001)(4326008)(68736007)(446003)(3846002)(6116002)(186003)(6246003)(6436002)(26005)(105586002)(11346002)(110136005)(305945005)(316002)(7736002)(81166006)(256004)(8676002)(102836004)(8936002)(478600001)(6506007)(71200400001)(71190400001)(14454004)(2906002)(76176011)(33656002)(229853002)(53546011)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1593;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:3;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PBTCbtq1Znhe8JVEGrW0/kVaAHHTVLvs60X1B5PYWMgJOnMX4PpK9hWgrYwlkhoBrwTjoal1Sg9g5SZGHLmJZN0SvyRRLiuq90zCZeqROcrFs79QD+9gQOXom7hUD5rMwPguxFTWx/qrwKp+jOEbAsdxkMb+X/n/a+iMCu5X8bvudPSxKkr2HbTCI0aeWVMRIe0a3iF2bJYQLgYEwvjzuCU686/YuvrTLqh017EGVGfxwqmOpTMizq2XZQCUdOz6NAuUI9cxAux7iQHeDCnH1ywHbiJ1LT//k/yiHWLCJzvtMsFOKiQNdc3lrD6YItTnWUnQfS8sjMVV6EtuMM9ZT3qAVgoDoqyq8J8jDAUF7VupPEgFRMaq1mMfStUMnywPtRLoJq4hUzerk4S3ShcMomVLIzwlNtJsu9r0Wswux4I=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2377cac4-8392-4caa-f8c7-08d6b81f46e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2019 10:29:39.0261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1593
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

Patch "usb: common: Consider only available nodes for dr_mode" has been tak=
en,
and that is enough to get USB 2.0 host to work on the EK874, do you think y=
ou
can take this patch now?

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 01 March 2019 11:06
> Subject: [PATCH 3/4] arm64: dts: renesas: r8a774c0-cat874: Add USB-HOST s=
upport
>=20
> This patch adds USB 2.0 HOST support to the CAT874 board.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64=
/boot/dts/renesas/r8a774c0-cat874.dts
> index f86b3628..7d3b76f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
> @@ -76,10 +76,20 @@
>  	};
>  };
>=20
> +&ehci0 {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
>  &extal_clk {
>  	clock-frequency =3D <48000000>;
>  };
>=20
> +&ohci0 {
> +	dr_mode =3D "host";
> +	status =3D "okay";
> +};
> +
>  &pcie_bus_clk {
>  	clock-frequency =3D <100000000>;
>  };
> @@ -128,3 +138,8 @@
>  	sd-uhs-sdr104;
>  	status =3D "okay";
>  };
> +
> +&usb2_phy0 {
> +	renesas,no-otg-pins;
> +	status =3D "okay";
> +};
> --
> 2.7.4

