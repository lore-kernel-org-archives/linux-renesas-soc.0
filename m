Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410093.outbound.protection.outlook.com ([40.107.141.93]:38133
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725993AbeLGBZi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 20:25:38 -0500
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>, Ulrich Hecht <uli@fpond.eu>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        KOJI MATSUOKA <koji.matsuoka.xm@renesas.com>
Subject: Re: [PATCH v2 07/16] drm: rcar-du: Use LVDS PLL clock as dot clock
 when possible
Date: Fri, 7 Dec 2018 01:25:34 +0000
Message-ID: <87k1kmnnlj.wl-kuninori.morimoto.gx@renesas.com>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
        <20180914091046.483-8-laurent.pinchart+renesas@ideasonboard.com>
        <87pnur1ho1.wl-kuninori.morimoto.gx@renesas.com>        <2156355.nrP3YJkyIb@avalon>
In-Reply-To: <2156355.nrP3YJkyIb@avalon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4226E063979ECB41936387064C0A736C@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Hi Laurent

> > > +	didsr =3D DIDSR_CODE;
> > > +	for (i =3D 0; i < num_crtcs; ++i, ++rcrtc) {
> > > +		if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index))
> > > +			didsr |=3D DIDSR_LCDS_LVDS0(i)
> > > +			      |  DIDSR_PDCS_CLK(i, 0);
> > > +		else
> > > +			didsr |=3D DIDSR_LCDS_DCLKIN(i)
> > > +			      |  DIDSR_PDCS_CLK(i, 0);
> > > +	}
> >=20
> > Here, this is for DU pin settings, and fixed for
> >=20
> > 	DU_DOTCLKIN0 -> DU0
> > 	DU_DOTCLKIN1 -> DU1
> >=20
> > But on E3 (Ebisu) board, it has only DU_DOTCLKIN0.
> > We might use like this
> >=20
> > 	DU_DOTCLKIN0 -> DU0
> > 	DU_DOTCLKIN0 -> DU1
> >=20
> > It is possible to adjust to this situation ?
> > DIDSR :: PDCSn allows only 0
>=20
> I think this would make sense. I'm not sure how to implement that, but I'=
ll=20
> give it a try. What is the priority ?

Normal priority is very OK, so far.
Thank you

Best regards
---
Kuninori Morimoto
