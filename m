Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:31836 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727216AbeH1MvS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 08:51:18 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
CC: Fengguang Wu <fengguang.wu@intel.com>,
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
Date: Tue, 28 Aug 2018 09:00:33 +0000
Message-ID: <OSBPR01MB2103E0823C2C53C3D572F41DB80A0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1535105808-11401-1-git-send-email-biju.das@bp.renesas.com>
 <OSBPR01MB229391181806670F0A150B88D80B0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB229391181806670F0A150B88D80B0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH] usb: host: xhci-rcar: Add support for r8a774a1
>
> Hi Biju-san,
>
> Thank you for the patch!
>
> > From: Biju Das, Sent: Friday, August 24, 2018 7:17 PM
> >
> > This patch adds support for r8a774a1 (RZ/G2M).
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  drivers/usb/host/xhci-rcar.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/usb/host/xhci-rcar.c
> > b/drivers/usb/host/xhci-rcar.c index f33ffc2..c906b13 100644
> > --- a/drivers/usb/host/xhci-rcar.c
> > +++ b/drivers/usb/host/xhci-rcar.c
> > @@ -72,6 +72,10 @@
> MODULE_FIRMWARE(XHCI_RCAR_FIRMWARE_NAME_V3);
> >
> >  static const struct soc_device_attribute rcar_quirks_match[]  =3D {
> >  {
> > +.soc_id =3D "r8a774a1",
> > +.data =3D (void *)RCAR_XHCI_FIRMWARE_V3,
> > +},
> > +{
>
> I also don't think you need this patch actually because you submitted add=
ing
> a bindings patch for usb-xhci [1] and it had "renesas,rcar-gen3-xhci" for
> RZ/G2.
> In other words, if a xhci node of RZ/G2 dtsi has "renesas,rcar-gen3-xhci"
> compatible, this can probe the xhci-plat/rcar driver with the firmware V3=
.

 I agree. We don't need this patch, after the introduction of   ed8603e1112=
4
(" usb: host: xhci-rcar: Simplify getting the firmware name for R-Car Gen3"=
)  and  fc72aa83b4a7
("usb: host: xhci-plat: add firmware_name for R-Car Gen3") which is present=
 in renesas-devel-20180827-4.19-rc1.

This above patch was missing in our internal development branch which is ba=
sed on renesas-dev-20180810.

> [1]
> https://patchwork.kernel.org/patch/10574887/
>
> Best regards,
> Yoshihiro Shimoda
>
> >  .soc_id =3D "r8a7795", .revision =3D "ES1.*",
> >  .data =3D (void *)RCAR_XHCI_FIRMWARE_V2,
> >  },
> > --
> > 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
