Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7696C10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 09:25:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0ECA206A3
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 09:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="JCvGAVkr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727501AbfDXJZQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 05:25:16 -0400
Received: from mail-eopbgr1410132.outbound.protection.outlook.com ([40.107.141.132]:50477
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726598AbfDXJZP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 05:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP0tEaJI9WnwPQ4KclzDagkJEpXB8KpbR9odSyqS4+Y=;
 b=JCvGAVkrWcIeQVRegPSFMlDFN7VXYYqGMxZj9RAtZVn5N+Bl64hONAOIxdyx7iITwKMrVfr1ydJLqFBn8KrLfm2voEamMusqhkEFyXOPLXDQel9ybc2eBHQR+ZXA8yrKBFbN3J4ydpt+5gCK0Wie7Szw1bUwhVb5vURPjE30xow=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1817.jpnprd01.prod.outlook.com (52.133.162.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Wed, 24 Apr 2019 09:25:08 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::60bb:89e4:1a58:e901]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::60bb:89e4:1a58:e901%2]) with mapi id 15.20.1813.017; Wed, 24 Apr 2019
 09:25:08 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
Subject: RE: [PATCH net-next v3] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Thread-Topic: [PATCH net-next v3] ravb: Avoid unsupported internal delay mode
 for R-Car E3/D3
Thread-Index: AQHU+dT6S1BccQLk3k6pC0jMerumc6ZLCwFQ
Date:   Wed, 24 Apr 2019 09:25:08 +0000
Message-ID: <TY1PR01MB1770C460826708D039918F24C03C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190423130153.17295-1-horms+renesas@verge.net.au>
In-Reply-To: <20190423130153.17295-1-horms+renesas@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f18c5fff-1c77-4df8-3f7a-08d6c896be8f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:TY1PR01MB1817;
x-ms-traffictypediagnostic: TY1PR01MB1817:
x-microsoft-antispam-prvs: <TY1PR01MB18176A85EA8B0B75DCB24F98C03C0@TY1PR01MB1817.jpnprd01.prod.outlook.com>
x-forefront-prvs: 00179089FD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(346002)(396003)(39860400002)(376002)(54534003)(199004)(189003)(478600001)(66556008)(66446008)(66476007)(74316002)(66946007)(305945005)(76116006)(64756008)(73956011)(86362001)(6506007)(256004)(14454004)(6436002)(5660300002)(55016002)(52536014)(7736002)(14444005)(68736007)(71200400001)(71190400001)(66066001)(44832011)(486006)(11346002)(9686003)(446003)(476003)(53936002)(6246003)(53546011)(316002)(6116002)(4326008)(229853002)(8676002)(110136005)(2906002)(8936002)(99286004)(26005)(25786009)(81166006)(186003)(81156014)(33656002)(97736004)(7696005)(76176011)(3846002)(102836004)(54906003);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1817;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DBN4ffd/xcgFbkR1WepOdSB4M8J5kzN1LsOBgdyaQz8NvU6zPBT3fOebxSQvZ+9GQrdSgE9MZDDASweuaBHqoq65R9iAfBPWNdNP2wtgTnXGQ7MV5Y8EU4go2vcmqQjoqKzMYfzYftNkTgMXghqq1xCbWByHuWWzh+4EM7MBc0YhUH3RdcUOQ7FLh7N6MfmkKao10gmveno0u01ELUnOUgrJWpZ/GwCe0BpYVYZk7CmRJL8K6jLzZSWOJ5dPwz5Caznu0I3QYvqDMR5ULJHY++bEhkHhmMb8+xB3Aks5hfFa8tPR8E+biF21dBOfQpxDiO/hGIrnT32Wrt/dHHvt5RFENNSMffz+nh6I5+99Wys8arZXJzHmlE9eHmqK126iFcg663BNAccx38/AAm8vhbbiZY2QP4/urrpMiHTEMnA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f18c5fff-1c77-4df8-3f7a-08d6c896be8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2019 09:25:08.3940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1817
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vg=
er.kernel.org> On Behalf Of Simon Horman
> Sent: 23 April 2019 14:02
> Subject: [PATCH net-next v3] ravb: Avoid unsupported internal delay mode =
for R-Car E3/D3
>=20
> According to the R-Car Gen3 Hardware Manual Rev 1.50 of Nov 30, 2018, the
> TX clock internal delay mode isn't supported on R-Car E3 (r8a77990) or D3
> (r8a77995). And by extension it is also not supported by RZ/G2E (r9a774c0=
).

s/ r9a774c0/ r8a774c0/g

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

>=20
> This matches all ES versions of the affected SoCs as it is
> not clear if this problem will be resolved in newer chips.
> This can be revisited, as necessary.
>=20
> This patch does not error-out if PHY_INTERFACE_MODE_RGMII_ID or
> PHY_INTERFACE_MODE_RGMII_TXID are used on SoCs where TX clock delay
> mode is not supported as there is a risk of introducing a regression
> when used in conjunction with older DT blobs present in the field.
> Rather, a warning is logged in such cases.
>=20
> Based on work by Kazuya Mizuguchi.
>=20
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> v3
> * Log warning if unsupported phy-mode is used
>=20
> v2
> * Dropped RFC designation
> * Also correct RZ/G2E (r8a774c0)
> * Remove revision (ES version) portion of soc match
>   as it is not clear this problem will be resolved in newer chips.
> * Refer to user manual v1.50 rather than errata for v1.00 in changelog
> * Note absence of error handling in Changelog
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> index 4f648394e645..9618c4881c83 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1969,6 +1969,13 @@ static void ravb_set_config_mode(struct net_device=
 *ndev)
>  	}
>  }
>=20
> +static const struct soc_device_attribute ravb_delay_mode_quirk_match[] =
=3D {
> +	{ .soc_id =3D "r8a774c0" },
> +	{ .soc_id =3D "r8a77990" },
> +	{ .soc_id =3D "r8a77995" },
> +	{ /* sentinel */ }
> +};
> +
>  /* Set tx and rx clock internal delay modes */
>  static void ravb_set_delay_mode(struct net_device *ndev)
>  {
> @@ -1980,8 +1987,12 @@ static void ravb_set_delay_mode(struct net_device =
*ndev)
>  		set |=3D APSR_DM_RDM;
>=20
>  	if (priv->phy_interface =3D=3D PHY_INTERFACE_MODE_RGMII_ID ||
> -	    priv->phy_interface =3D=3D PHY_INTERFACE_MODE_RGMII_TXID)
> -		set |=3D APSR_DM_TDM;
> +	    priv->phy_interface =3D=3D PHY_INTERFACE_MODE_RGMII_TXID) {
> +		if (!WARN(soc_device_match(ravb_delay_mode_quirk_match),
> +			  "phy-mode %s requires TX clock internal delay mode which is not sup=
ported by this hardware revision. Please
> update device tree",
> +			  phy_modes(priv->phy_interface)))
> +			set |=3D APSR_DM_TDM;
> +	}
>=20
>  	ravb_modify(ndev, APSR, APSR_DM, set);
>  }
> --
> 2.11.0

