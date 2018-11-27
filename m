Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1400112.outbound.protection.outlook.com ([40.107.140.112]:17713
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727445AbeK0LlD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Nov 2018 06:41:03 -0500
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>, Ulrich Hecht <uli@fpond.eu>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        KOJI MATSUOKA <koji.matsuoka.xm@renesas.com>
Subject: Re: [PATCH v2 07/16] drm: rcar-du: Use LVDS PLL clock as dot clock
 when possible
Date: Tue, 27 Nov 2018 00:44:58 +0000
Message-ID: <87pnur1ho1.wl-kuninori.morimoto.gx@renesas.com>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
        <20180914091046.483-8-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180914091046.483-8-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <39A687DBE437D8489ACDA13E5C39C0CA@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Hi Laurent

Sorry for super late response.
I got opinion from BSP team about this patch.

> On selected SoCs, the DU can use the clock output by the LVDS encoder
> PLL as its input dot clock. This feature is optional, but on the D3 and
> E3 SoC it is often the only way to obtain a precise dot clock frequency,
> as the other available clocks (CPG-generated clock and external clock)
> usually have fixed rates.
>=20
> Add a DU model information field to describe which DU channels can use
> the LVDS PLL output clock as their input clock, and configure clock
> routing accordingly.
>=20
> This feature is available on H2, M2-W, M2-N, D3 and E3 SoCs, with D3 and
> E3 being the primary targets. It is left disabled in this commit, and
> will be enabled per-SoC after careful testing.
>=20
> At the hardware level, clock routing is configured at runtime in two
> steps, first selecting an internal dot clock between the LVDS PLL clock
> and the external DOTCLKIN clock, and then selecting between the internal
> dot clock and the CPG-generated clock. The first part requires stopping
> the whole DU group in order for the change to take effect, thus causing
> flickering on the screen. For this reason we currently hardcode the
> clock source to the LVDS PLL clock if available, and allow flicker-free
> selection of the external DOTCLKIN clock or CPG-generated clock
> otherwise. A more dynamic clock selection process can be implemented
> later if the need arises.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
(snip)
> +	didsr =3D DIDSR_CODE;
> +	for (i =3D 0; i < num_crtcs; ++i, ++rcrtc) {
> +		if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index))
> +			didsr |=3D DIDSR_LCDS_LVDS0(i)
> +			      |  DIDSR_PDCS_CLK(i, 0);
> +		else
> +			didsr |=3D DIDSR_LCDS_DCLKIN(i)
> +			      |  DIDSR_PDCS_CLK(i, 0);
> +	}

Here, this is for DU pin settings, and fixed for

	DU_DOTCLKIN0 -> DU0
	DU_DOTCLKIN1 -> DU1

But on E3 (Ebisu) board, it has only DU_DOTCLKIN0.
We might use like this

	DU_DOTCLKIN0 -> DU0
	DU_DOTCLKIN0 -> DU1

It is possible to adjust to this situation ?
DIDSR :: PDCSn allows only 0

Best regards
---
Kuninori Morimoto
