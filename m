Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:7515 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727006AbeJPXKj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 19:10:39 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 3/5] drm: rcar-du: Add r8a77470 support
Date: Tue, 16 Oct 2018 15:19:36 +0000
Message-ID: <TY1PR01MB177079522CBA3E2B4180C923C0FE0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537553311-8831-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <1733512.u0bX59egiB@avalon>
In-Reply-To: <1733512.u0bX59egiB@avalon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Laurent,

Thank you for your feedback.

> Subject: Re: [PATCH 3/5] drm: rcar-du: Add r8a77470 support
>
> Hi Fabrizio,
>
> Thank you for the patch.
>
> On Friday, 21 September 2018 21:08:29 EEST Fabrizio Castro wrote:
> > Add RZ/G1C (a.k.a. r8a77470) support to the R-Car DU driver.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 02aee6c..c07d3f1 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -77,6 +77,31 @@ static const struct rcar_du_device_info
> > rzg1_du_r8a7745_info =3D { },
> >  };
> >
> > +static const struct rcar_du_device_info rzg1_du_r8a77470_info =3D {
> > +.gen =3D 2,
> > +.features =3D RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> > +  | RCAR_DU_FEATURE_EXT_CTRL_REGS,
>
> The DU driver has recently gained two new feature flags,
> RCAR_DU_FEATURE_INTERLACED and RCAR_DU_FEATURE_TVM_SYNC. I believe that b=
oth
> should be set here. Could you please confirm (and test) ?

I can confirm that both feature flags need to be set and all the test pass.
Will send a new version for this.

>
> > +.channels_mask =3D BIT(1) | BIT(0),
> > +.routes =3D {
> > +/*
> > + * R8A77470 has two RGB outputs, one LVDS output, and
> > + * one analog video output (unsupported)
>
> I'd write this "and one (currently unsupported) analog video output" to m=
atch
> the other device entries. With this fixed,

Will fix this as well.

Thanks,
Fab

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > + */
> > +[RCAR_DU_OUTPUT_DPAD0] =3D {
> > +.possible_crtcs =3D BIT(0),
> > +.port =3D 0,
> > +},
> > +[RCAR_DU_OUTPUT_DPAD1] =3D {
> > +.possible_crtcs =3D BIT(1),
> > +.port =3D 1,
> > +},
> > +[RCAR_DU_OUTPUT_LVDS0] =3D {
> > +.possible_crtcs =3D BIT(0) | BIT(1),
> > +.port =3D 2,
> > +},
> > +},
> > +};
> > +
> >  static const struct rcar_du_device_info rcar_du_r8a7779_info =3D {
> >  .gen =3D 2,
> >  .features =3D 0,
> > @@ -297,6 +322,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a77970_info =3D { static const struct of_device_id
> > rcar_du_of_table[] =3D {
> >  { .compatible =3D "renesas,du-r8a7743", .data =3D &rzg1_du_r8a7743_inf=
o },
> >  { .compatible =3D "renesas,du-r8a7745", .data =3D &rzg1_du_r8a7745_inf=
o },
> > +{ .compatible =3D "renesas,du-r8a77470", .data =3D &rzg1_du_r8a77470_i=
nfo },
> >  { .compatible =3D "renesas,du-r8a7779", .data =3D &rcar_du_r8a7779_inf=
o },
> >  { .compatible =3D "renesas,du-r8a7790", .data =3D &rcar_du_r8a7790_inf=
o },
> >  { .compatible =3D "renesas,du-r8a7791", .data =3D &rcar_du_r8a7791_inf=
o },
>
> --
> Regards,
>
> Laurent Pinchart
>
>




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
