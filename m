Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410129.outbound.protection.outlook.com ([40.107.141.129]:50180
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391889AbeKWCjf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 21:39:35 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 4/5] drm: rcar-du: Add R8A7744 support
Date: Thu, 22 Nov 2018 15:59:32 +0000
Message-ID: <TY1PR01MB17707049DE6A8FD71E032157C0DB0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537553311-8831-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537553311-8831-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <5135719.5JoeYGyzrK@avalon>
In-Reply-To: <5135719.5JoeYGyzrK@avalon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Laurent,

> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Sent: 15 October 2018 23:25
> Subject: Re: [PATCH 4/5] drm: rcar-du: Add R8A7744 support
>
> Hi Fabrizio,
>
> Thank you for the patch.
>
> On Friday, 21 September 2018 21:08:30 EEST Fabrizio Castro wrote:
> > From: Biju Das <biju.das@bp.renesas.com>
> >
> > Add support for the R8A7744 DU (which is very similar to the R8A7743 DU=
);
> > it has 1 DPAD (RGB) output and 1 LVDS output.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_drv.c index c07d3f1..2c3d0e5 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -321,6 +321,7 @@ static const struct rcar_du_device_info
> > rcar_du_r8a77970_info =3D {
> >
> >  static const struct of_device_id rcar_du_of_table[] =3D {
> >  { .compatible =3D "renesas,du-r8a7743", .data =3D &rzg1_du_r8a7743_inf=
o },
> > +{ .compatible =3D "renesas,du-r8a7744", .data =3D &rzg1_du_r8a7743_inf=
o },
> >  { .compatible =3D "renesas,du-r8a7745", .data =3D &rzg1_du_r8a7745_inf=
o },
> >  { .compatible =3D "renesas,du-r8a77470", .data =3D &rzg1_du_r8a77470_i=
nfo },
> >  { .compatible =3D "renesas,du-r8a7779", .data =3D &rcar_du_r8a7779_inf=
o },
>
> This looks good to me. I would also apply this change:
>
> @@ -41,7 +41,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7743=
_info
> =3D {
>         .channels_mask =3D BIT(1) | BIT(0),
>         .routes =3D {
>                 /*
> -                * R8A7743 has one RGB output and one LVDS output
> +                * R8A774[34] has one RGB output and one LVDS output
>                  */
>                 [RCAR_DU_OUTPUT_DPAD0] =3D {
>                         .possible_crtcs =3D BIT(1) | BIT(0),
>
> With this,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> There's no need to resubmit, I've applied the patch to my tree with the a=
bove
> change.

I was expecting to see this patch at least on linux-next by now but it look=
s like it's not in there, could you please double check what happened to it=
?

Thanks,
Fab

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
