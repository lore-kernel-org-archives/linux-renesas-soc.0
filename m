Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:54810 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726714AbeH0Ioh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 04:44:37 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: RE: [PATCH] usb: renesas_usbhs: Add a compatible string for r8a774a1
Date: Mon, 27 Aug 2018 04:59:33 +0000
Message-ID: <OSBPR01MB2293F924765AEA743B5A1D69D80B0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1535105369-63810-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1535105369-63810-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju-san,

Thank you for the patch!

> From: Biju Das, Sent: Friday, August 24, 2018 7:09 PM
>=20
> This patch adds support for r8a774a1 (RZ/G2M).
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  drivers/usb/renesas_usbhs/common.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usb=
hs/common.c
> index 4310df4..f1a1694 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -458,6 +458,10 @@ static int usbhsc_drvcllbck_notify_hotplug(struct pl=
atform_device *pdev)
>   */
>  static const struct of_device_id usbhs_of_match[] =3D {
>  	{
> +		.compatible =3D "renesas,usbhs-r8a774a1",
> +		.data =3D (void *)USBHS_TYPE_RCAR_GEN3,
> +	},
> +	{

I don't think you need this adding entry for r8a774a1 actually because
you also submitted a bindings patch [1] and it had "renesas,rcar-gen3-usbhs=
" for RZ/G2.

[1]
 https://patchwork.kernel.org/patch/10574875/

Best regards,
Yoshihiro Shimoda

>  		.compatible =3D "renesas,usbhs-r8a7790",
>  		.data =3D (void *)USBHS_TYPE_RCAR_GEN2,
>  	},
> --
> 2.7.4
