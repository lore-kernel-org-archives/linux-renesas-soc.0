Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:32025 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726826AbeH0Itm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 04:49:42 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
CC: Biju Das <biju.das@bp.renesas.com>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: host: xhci-rcar: Add support for r8a774a1
Date: Mon, 27 Aug 2018 05:04:29 +0000
Message-ID: <OSBPR01MB229391181806670F0A150B88D80B0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1535105808-11401-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1535105808-11401-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju-san,

Thank you for the patch!

> From: Biju Das, Sent: Friday, August 24, 2018 7:17 PM
>=20
> This patch adds support for r8a774a1 (RZ/G2M).
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  drivers/usb/host/xhci-rcar.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> index f33ffc2..c906b13 100644
> --- a/drivers/usb/host/xhci-rcar.c
> +++ b/drivers/usb/host/xhci-rcar.c
> @@ -72,6 +72,10 @@ MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V3);
>=20
>  static const struct soc_device_attribute rcar_quirks_match[]  =3D {
>  	{
> +		.soc_id =3D "r8a774a1",
> +		.data =3D (void *)RCAR_XHCI_FIRMWARE_V3,
> +	},
> +	{

I also don't think you need this patch actually because
you submitted adding a bindings patch for usb-xhci [1]
and it had "renesas,rcar-gen3-xhci" for RZ/G2.
In other words, if a xhci node of RZ/G2 dtsi has "renesas,rcar-gen3-xhci" c=
ompatible,
this can probe the xhci-plat/rcar driver with the firmware V3.

[1]
https://patchwork.kernel.org/patch/10574887/

Best regards,
Yoshihiro Shimoda

>  		.soc_id =3D "r8a7795", .revision =3D "ES1.*",
>  		.data =3D (void *)RCAR_XHCI_FIRMWARE_V2,
>  	},
> --
> 2.7.4
