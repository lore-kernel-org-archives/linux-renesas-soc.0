Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A786EC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:26:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BBEF20882
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:26:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="TrKaVmKo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfDCK0W (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:26:22 -0400
Received: from mail-eopbgr1400111.outbound.protection.outlook.com ([40.107.140.111]:63711
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726213AbfDCK0W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44UfSAoGMWl4bS6ItdcCCJRdkV3lY7TDshntYswE2B4=;
 b=TrKaVmKoM/2atKfFfBIskXPh70ot8HlPqOTg5cCSSG4HSouiQnJnfKs+nVf4Djg9K6Z+yb+VCRqS0+jQgWfKzRpU44EwsvwbQkZ0kzCTVGSEQAaZVOL0Sid00uLxZeC45ZBm1eOqT0MppuglCWyWEOoqmrY5kX0m/7z0r/4eIN4=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1530.jpnprd01.prod.outlook.com (52.133.161.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.13; Wed, 3 Apr 2019 10:26:19 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::b593:2e3c:aa50:2273%4]) with mapi id 15.20.1750.017; Wed, 3 Apr 2019
 10:26:19 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH 4/4] arm64: dts: renesas: r8a77995: draak: Remove hsusb
 node
Thread-Topic: [PATCH 4/4] arm64: dts: renesas: r8a77995: draak: Remove hsusb
 node
Thread-Index: AQHU0B7v4hT+m5UKe0ih0DJIKWdn7KYqbtzQ
Date:   Wed, 3 Apr 2019 10:26:18 +0000
Message-ID: <TY1PR01MB177003CB9BCE22BAC2FE83A9C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1551438348-22119-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1551438348-22119-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1551438348-22119-5-git-send-email-fabrizio.castro@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 724aba38-f96d-4b87-f495-08d6b81ecf8f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1530;
x-ms-traffictypediagnostic: TY1PR01MB1530:
x-microsoft-antispam-prvs: <TY1PR01MB15309DB31B79BCB00BD5DE23C0570@TY1PR01MB1530.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0996D1900D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39860400002)(366004)(346002)(376002)(396003)(199004)(189003)(256004)(5660300002)(99286004)(7696005)(74316002)(7736002)(305945005)(186003)(14454004)(26005)(102836004)(44832011)(486006)(476003)(11346002)(446003)(76176011)(478600001)(53546011)(6506007)(6116002)(3846002)(316002)(54906003)(97736004)(66066001)(4326008)(71190400001)(71200400001)(33656002)(229853002)(6246003)(9686003)(55016002)(105586002)(81166006)(81156014)(106356001)(2906002)(8676002)(6436002)(6916009)(68736007)(8936002)(52536014)(25786009)(53936002)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1530;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U3jZ9OMN/7n+L/pGOwsXTNLixCRK8O/iRrga8w/tMxGzdcSU8D7NjPXlFStG0CoYNWW2K8FcYW3b7sJxpEv44Vcpk2ppJJXd/xE1P66BMWfwuqPBM6T1unCOA4K1s51p6CRduNYjFfC6hu0NiqZnUp5doLQGzuOkl9tvcUn+CY2PAkASQC0XRP1q2uA+F6DaSbr/35vep8eq9Zmm1hqZHbH6u8ryscqGO1i3mGgpQQ9pIiSJjdQjfzdlluu43L5G5p88gk5bBfzd/IFAdt1RLt28/wDhL2nrJzT9LVZvQEO2z41CMUIxBM4YVe0xW1M1bOD2aINjUBgWQNVohd72krmNlzr4oxsAjp12b5MsdYW+HKRkPA1+0PRTdP24Zuij3s+ysbajYDVcrY43gyyVp5xeuO44b/+FVi+dFxR3a90=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724aba38-f96d-4b87-f495-08d6b81ecf8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2019 10:26:18.8049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1530
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Simon,

I would like to drop this patch.

Thanks,
Fab

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Sent: 01 March 2019 11:06
> Subject: [PATCH 4/4] arm64: dts: renesas: r8a77995: draak: Remove hsusb n=
ode
>=20
> Patch "usb: common: Consider only available nodes for dr_mode"
> fixes the way the DT gets parsed to identify the USB controller
> driving the PHY, as such we don't need hsusb to specify dr_mode,
> in fact we don't need to enable the hsusb node at all since
> the USB interface on the board works as USB host only.
>=20
> Fixes: 5c6479d9b25b ("arm64: dts: renesas: r8a7799{0|5}: add/enable USB2.=
0 peripheral")
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts b/arch/arm64/=
boot/dts/renesas/r8a77995-draak.dts
> index db2bed1..5f13b8b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> @@ -207,11 +207,6 @@
>  	clock-frequency =3D <48000000>;
>  };
>=20
> -&hsusb {
> -	dr_mode =3D "host";
> -	status =3D "okay";
> -};
> -
>  &i2c0 {
>  	pinctrl-0 =3D <&i2c0_pins>;
>  	pinctrl-names =3D "default";
> --
> 2.7.4

