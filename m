Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DDAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 09:16:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6D5720643
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 09:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="O6tDX+cW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfCNJQv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 05:16:51 -0400
Received: from mail-eopbgr1320122.outbound.protection.outlook.com ([40.107.132.122]:26720
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726421AbfCNJQv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 05:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZZ/yKyWZKjRY2r0zt1j/QF90kO/lPPzTCZRROaQFQo=;
 b=O6tDX+cWVbQqcsMXtQdruw3E5m1Div8l7WdwDL/4RHEwYT0WGSd4lh84xCqkbPWitr8OjDBaqngqOvmZpa0GfpZ4gUxiuvqOIspgqaa04ijDeY+E32ZrthlS7/DkJ02ixhv+bc2FixFS/mabBR4Sx7OiPgxpeEOuZ04wU8vqxfQ=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB4201.jpnprd01.prod.outlook.com (20.178.132.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.20; Thu, 14 Mar 2019 09:16:42 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::f423:2ed8:938:c28d]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::f423:2ed8:938:c28d%5]) with mapi id 15.20.1709.011; Thu, 14 Mar 2019
 09:16:42 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add
 usb-role-switch property
Thread-Topic: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add
 usb-role-switch property
Thread-Index: AQHU2kJRCs+fPz9CLUusBnrU8h7F2qYK2G3w
Date:   Thu, 14 Mar 2019 09:16:42 +0000
Message-ID: <TY2PR01MB4812BACA4673786E867C253FD84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
 <1552552775-51667-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1552552775-51667-3-git-send-email-biju.das@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb5cd1ea-7e74-430f-10a4-08d6a85dc5db
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB4201;
x-ms-traffictypediagnostic: TY2PR01MB4201:
x-microsoft-exchange-diagnostics: 1;TY2PR01MB4201;20:GSemxqW62jhdsxNLqKcpD7bPcgIielnaQpHeX1yTXmTbmB7/XTT7BCSurWrho6Y4On2mbyPQO9yn5e1ytHSOQudSFqcVsCx46PfnevR0bovuDmWHvyCROYSc/8c0dg/dfJ7X2kr/EX71miki7AMrqbRTpPvcOQJHsoqNi3rWYwF7LQGlPXjXwZRwg6wJl0o4FRNQd+MGhtTopqDrifMuK6lECgpjEISVNwpSjYj8b9kS2asQ02X/Pqw2/SuKsBIJ
x-microsoft-antispam-prvs: <TY2PR01MB42015DD54A6A68C6C7D5CF23D84B0@TY2PR01MB4201.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09760A0505
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39850400004)(136003)(366004)(346002)(189003)(199004)(71190400001)(76176011)(229853002)(7696005)(4326008)(5660300002)(14454004)(25786009)(7736002)(99286004)(86362001)(6436002)(6116002)(256004)(55236004)(52536014)(6506007)(3846002)(316002)(97736004)(54906003)(110136005)(7416002)(9686003)(106356001)(11346002)(446003)(74316002)(2906002)(6246003)(476003)(102836004)(55016002)(105586002)(81166006)(486006)(305945005)(26005)(53936002)(81156014)(33656002)(66066001)(68736007)(186003)(478600001)(8936002)(71200400001)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB4201;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bktx+R+jGRXwltsxvnNkyuO90UDcx+J4EXeoFolxmZVLRFerQmUmpJHj9r496zQHvLeDZprJc153KeCjdHHpIV645YkY5kg03wWiTeB1YBFg4lNtP3klnI9pDPx/ZCEjewvSJ1Gb+wBe8d0y/xU0uTU+HuaSELLZX4SmTzpyjfyrFiLidSunW09jPbBot/HXHEgUN+aG2lKxkXI29TbvyAMXd0eDMaE016fhCFjyTcG61Pq4Ae41kTbAvg+tigLl14fZakQ4qvs1m3PGVDY+7uY9BM7FPcUeosTs30ud3petEDHuKfD6QMBh9fFMYeZE6tJMTbZC8WUmH6/mEHTAwwmdUZIkCZCDK1Thouh+PaJbnIJv6olg7r3fU63MakodjPTEqRLoMroEiSRkIJ1+rXYBVeI9ljk+MPTlSX1erlM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5cd1ea-7e74-430f-10a4-08d6a85dc5db
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2019 09:16:42.1965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4201
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Thursday, March 14, 2019 5:40 PM
>=20
> Add support for renesas_usb3 to support dual role switch
> using usb role switch class framework.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  V1-->V2
>   * Added usb-role-switch-property
>   * Updated the example with usb-role-switch property.
> ---
>  .../devicetree/bindings/usb/renesas_usb3.txt       | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> index 35039e7..eecaf4c 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> @@ -22,6 +22,7 @@ Required properties:
>  Optional properties:
>    - phys: phandle + phy specifier pair
>    - phy-names: must be "usb"
> +  - usb-role-switch: use USB role switch to support dual-role switch

I don't think we can add such a property. At least, we have to add "renesas=
," prefix.

Best regards,
Yoshihiro Shimoda

>  Example of R-Car H3 ES1.x:
>  	usb3_peri0: usb@ee020000 {
> @@ -39,3 +40,24 @@ Example of R-Car H3 ES1.x:
>  		interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks =3D <&cpg CPG_MOD 327>;
>  	};
> +
> +Example of RZ/G2E:
> +	usb3_peri0: usb@ee020000 {
> +		compatible =3D "renesas,r8a774c0-usb3-peri",
> +			     "renesas,rcar-gen3-usb3-peri";
> +		reg =3D <0 0xee020000 0 0x400>;
> +		interrupts =3D <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks =3D <&cpg CPG_MOD 328>;
> +		companion =3D <&xhci0>;
> +		usb-role-switch;
> +
> +		port {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			usb3peri_role_switch: endpoint@0 {
> +				reg =3D <0>;
> +				remote-endpoint =3D <&hd3ss3220_ep>;
> +			};
> +		};
> +	};
> --
> 2.7.4

