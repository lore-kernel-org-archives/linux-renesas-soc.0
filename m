Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:42024 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731347AbeKWKLJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 05:11:09 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hoan <na-hoan@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
Subject: Re: [PATCH] drm: rcar-du: Re-update the DSYSR register value for start/stop
Date: Fri, 23 Nov 2018 01:29:43 +0200
Message-ID: <3349301.P10tNOHi3G@avalon>
In-Reply-To: <8c596c7e-608b-dc99-cead-f2fb85c6d132@jinso.co.jp>
References: <1540189854-14726-1-git-send-email-na-hoan@jinso.co.jp> <35008313.pubLakprOv@avalon> <8c596c7e-608b-dc99-cead-f2fb85c6d132@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Hoan,

On Tuesday, 23 October 2018 04:01:19 EET Hoan wrote:
> On 2018/10/22 20:23, Laurent Pinchart wrote:
> > On Monday, 22 October 2018 09:30:54 EEST Nguyen An Hoan wrote:
> >> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> >>=20
> >>  From previous commit 0521ccb "drm: rcar-du: Cache DSYSR value to ensu=
re
> >>=20
> >> known initial value"
> >=20
> > What exact commit are you referring to ? The mainline commit that has t=
his
> > subject is 9144adc5e5a99577bce0d4ee2ca3615f53b9d296.
>=20
> Seems I have cited the wrong Commit-ID=E3=80=81it is
>=20
> 9144adc5e5a99577bce0d4ee2ca3615f53b9d296
> drm: rcar-du: Cache DSYSR value to ensure known initial value
>=20
> >> We only need to update DSYSR0, DSYSR2 for start/stop.
> >> So using rgrp-> mmio_offset is enough, the change back from rcar_du_cr=
tc
> >> ->rcar_du_group -> rcar_du_crtc leading to mmio addresses for DSYSR may
> >> be different.
> >=20
> > Is this fixing an actual problem ? If you look at the code, the line
> >=20
> > 	struct rcar_du_crtc *rcrtc =3D &rgrp->dev->crtcs[rgrp->index * 2];
> >=20
> > makes sure that we select DU0 or DU2 only, so the register write
> >=20
> > 	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
> > 				   start ? DSYSR_DEN : DSYSR_DRES);
> >=20
> > should only access DSYSR0 and DSYSR2.
>=20
> This seems I think to fix the rcar-du problem with M3N-r8a77965,
>=20
> With M3N-R8a77965 we have DU0, DU1, DU3
> So, when Laurent-san divide objetcs into rcar_du_group, rcar_du_crtc.
>=20
> DU0, DU1 -> du_group[0]  rgrp-> mmio_offset =3D DU0_REG_OFFSET
> DU3->du_group[1] and rgrp-> mmio_offset =3D DU2_REG_OFFSET, but=20
> rcrtc->mmio_offset=3DDU3_REG_OFFSET (with M3N)
>=20
> M3N-R8a77965 not have DU2, So after the command:
>=20
> struct rcar_du_crtc *rcrtc =3D &rgrp->dev->crtcs[rgrp->index * 2];
>=20
> So in fact, with M3N we are updating DSYSR3 (In this my TC, this
> reference to start/stop DU3-RGB)
>=20
> This will not affect H3, since the H3 lines always have enough DU0,
> DU1,DU2,DU3.

You're absolutely right. I'm sorry for introducing the bug in the first pla=
ce,=20
and for failing to understand your patch.

I would however prefer a different fix, as switching back to=20
rcar_du_group_write() defeats the purpose of the "drm: rcar-du: Cache DSYSR=
=20
value to ensure known initial value" patch. I will submit a patch and CC yo=
u.

=2D-=20
Regards,

Laurent Pinchart
