Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:37622 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727072AbeH1L2i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 07:28:38 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: RE: [PATCH] usb: renesas_usbhs: Add a compatible string for r8a774a1
Date: Tue, 28 Aug 2018 07:38:11 +0000
Message-ID: <OSBPR01MB21038AF7DFA84991CEE1C6E8B80A0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1535105369-63810-1-git-send-email-biju.das@bp.renesas.com>
 <OSBPR01MB2293F924765AEA743B5A1D69D80B0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB2293F924765AEA743B5A1D69D80B0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

Thanks for the feedback

> Subject: RE: [PATCH] usb: renesas_usbhs: Add a compatible string for
> r8a774a1
>
> Hi Biju-san,
>
> Thank you for the patch!
>
> > From: Biju Das, Sent: Friday, August 24, 2018 7:09 PM
> >
> > This patch adds support for r8a774a1 (RZ/G2M).
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  drivers/usb/renesas_usbhs/common.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/usb/renesas_usbhs/common.c
> > b/drivers/usb/renesas_usbhs/common.c
> > index 4310df4..f1a1694 100644
> > --- a/drivers/usb/renesas_usbhs/common.c
> > +++ b/drivers/usb/renesas_usbhs/common.c
> > @@ -458,6 +458,10 @@ static int usbhsc_drvcllbck_notify_hotplug(struct
> platform_device *pdev)
> >   */
> >  static const struct of_device_id usbhs_of_match[] =3D {
> >  {
> > +.compatible =3D "renesas,usbhs-r8a774a1",
> > +.data =3D (void *)USBHS_TYPE_RCAR_GEN3,
> > +},
> > +{
>
> I don't think you need this adding entry for r8a774a1 actually because yo=
u
> also submitted a bindings patch [1] and it had "renesas,rcar-gen3-usbhs" =
for
> RZ/G2.

I agree. It is not needed, since fallback is present in the driver.  Someho=
w I missed this.

> [1]
>  https://patchwork.kernel.org/patch/10574875/
>
> Best regards,
> Yoshihiro Shimoda
>
> >  .compatible =3D "renesas,usbhs-r8a7790",
> >  .data =3D (void *)USBHS_TYPE_RCAR_GEN2,
> >  },
> > --
> > 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
