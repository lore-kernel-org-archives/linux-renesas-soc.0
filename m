Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1400121.outbound.protection.outlook.com ([40.107.140.121]:9267
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2409797AbeKWXQo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 18:16:44 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 3/5] drm: rcar-du: Add r8a77470 support
Date: Fri, 23 Nov 2018 12:32:38 +0000
Message-ID: <TY1PR01MB1770D0D19250BE1AC80FF4FEC0D40@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1539709139-20342-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <2608669.V0TntACJSi@avalon>
 <TY1PR01MB177016AB58C4AC9023F8F684C0DB0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <2887339.4V2sBHk5lD@avalon>
In-Reply-To: <2887339.4V2sBHk5lD@avalon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Thank you Laurent.

Cheers,
Fab

> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vg=
er.kernel.org> On Behalf Of Laurent Pinchart
> Sent: 23 November 2018 12:07
> Subject: Re: [PATCH v2 3/5] drm: rcar-du: Add r8a77470 support
>
> Hi Fabrizio,
>
> On Thursday, 22 November 2018 18:03:44 EET Fabrizio Castro wrote:
> > On 17 October 2018 07:52 Laurent Pinchart wrote:
> > > On Tuesday, 16 October 2018 19:58:59 EEST Fabrizio Castro wrote:
> > > > Add RZ/G1C (a.k.a. r8a77470) support to the R-Car DU driver.
> > >>
> > >> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >>
> > >> ---
> > >> v1->v2:
> > >> * Added flags RCAR_DU_FEATURE_INTERLACED and RCAR_DU_FEATURE_TVM_SYN=
C
> > >> * Reworked comment
> > >
> > > This looks all good, applied to my tree.
> >
> > It looks like I can't find the patch, which tree is it?
>
> The patch can be found in git://linuxtv.org/pinchartl/media.git drm/du/ne=
xt.
>
> > >>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 28 ++++++++++++++++++++++++=
++++
> > >>  1 file changed, 28 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > >> b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index 084f58d..d8a02c4 10064=
4
> > >> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > >> @@ -77,6 +77,33 @@ static const struct rcar_du_device_info
> > >> rzg1_du_r8a7745_info =3D { },
> > >>  };
> > >>
> > >> +static const struct rcar_du_device_info rzg1_du_r8a77470_info =3D {
> > >> +.gen =3D 2,
> > >> +.features =3D RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> > >> +  | RCAR_DU_FEATURE_EXT_CTRL_REGS
> > >> +  | RCAR_DU_FEATURE_INTERLACED
> > >> +  | RCAR_DU_FEATURE_TVM_SYNC,
> > >> +.channels_mask =3D BIT(1) | BIT(0),
> > >> +.routes =3D {
> > >> +/*
> > >> + * R8A77470 has two RGB outputs, one LVDS output, and
> > >> + * one (currently unsupported) analog video output
> > >> + */
> > >> +[RCAR_DU_OUTPUT_DPAD0] =3D {
> > >> +.possible_crtcs =3D BIT(0),
> > >> +.port =3D 0,
> > >> +},
> > >> +[RCAR_DU_OUTPUT_DPAD1] =3D {
> > >> +.possible_crtcs =3D BIT(1),
> > >> +.port =3D 1,
> > >> +},
> > >> +[RCAR_DU_OUTPUT_LVDS0] =3D {
> > >> +.possible_crtcs =3D BIT(0) | BIT(1),
> > >> +.port =3D 2,
> > >> +},
> > >> +},
> > >> +};
> > >> +
> > >>  static const struct rcar_du_device_info rcar_du_r8a7779_info =3D {
> > >>  .gen =3D 2,
> > >>  .features =3D RCAR_DU_FEATURE_INTERLACED
> > >> @@ -342,6 +369,7 @@ static const struct rcar_du_device_info
> > >> rcar_du_r8a7799x_info =3D { static const struct of_device_id
> > >> rcar_du_of_table[] =3D {
> > >>  { .compatible =3D "renesas,du-r8a7743", .data =3D &rzg1_du_r8a7743_=
info },
> > >>  { .compatible =3D "renesas,du-r8a7745", .data =3D &rzg1_du_r8a7745_=
info },
> > >> +{ .compatible =3D "renesas,du-r8a77470", .data =3D &rzg1_du_r8a7747=
0_info
> > >> },
> > >>  { .compatible =3D "renesas,du-r8a7779", .data =3D &rcar_du_r8a7779_=
info },
> > >>  { .compatible =3D "renesas,du-r8a7790", .data =3D &rcar_du_r8a7790_=
info },
> > >>  { .compatible =3D "renesas,du-r8a7791", .data =3D &rcar_du_r8a7791_=
info },
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
