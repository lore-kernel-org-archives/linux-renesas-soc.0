Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:50973 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbeINTNT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 15:13:19 -0400
Date: Fri, 14 Sep 2018 15:58:37 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, ulrich.hecht+renesas@gmail.com,
        kieran.bingham@ideasonboard.com,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/4] drm: rcar-du: Update to SoC manual revision 1.00
Message-ID: <20180914135837.GB16851@w540>
References: <1535037134-373-1-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline
In-Reply-To: <1535037134-373-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Thu, Aug 23, 2018 at 05:12:10PM +0200, Jacopo Mondi wrote:
> Hello Laurent,
>    Revision 1.00 has brought several updates on how to handle some registers
> in the DU. In particular
>
> - ESCR cannot be written for channels with a DPLL
> - OTAR cannot be written for channels without a digital output pad
> - routing superimposition processor output to pincontrollers through DORCR2
>   register cannot be performed for channels of group 1
> - The plane super-imposition register PnMR can be written to groups with more
>   than 1 channel.
>
> Patches applied on top of your latest drm/du/next branch.

Could you please consider including this series in your tree?

Thanks
  j
>
> Tested on Salvator-X M3-W with VGA and HDMI output.
> Tested on Salvator-XS M3-N with VGA and HDMI output.
> No visible regression, but if you have ideas on how to better verify this
> please let me know.
>
> Thanks
>    j
>
> Jacopo Mondi (4):
>   drm: rcar-du: Do not write ESCR for DPLL channels
>   drm: rcar-du: Write OTAR for DPAD channels only
>   drm: rcar-du: Fix handling of DORCR for group 1
>   drm: rcar-du: Fix handling of PnMR register
>
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 18 +++++++++++-------
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 19 ++++++++++++++++---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 13 +++++++++++--
>  3 files changed, 38 insertions(+), 12 deletions(-)
>
> --
> 2.7.4
>

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbm76NAAoJEHI0Bo8WoVY8CYUP/jAx8TG3N3aHQviKBiZNm0Tl
/Fu5rqPh5lZXbuDPpZcgrsuVee9S6O/wyKc6IVKgtKD11c/FzpZL/Hwg88suU1Sx
r6yBoU41CxAieVcCSX+azGTYjdrMlhsq1498nCWqZ1cxmMf3SBSrbIybbpgsXs48
tMfHMlExgyoRzKS0UTeryRQcn/STQzM5PY/mOGxp0DFT8pttodILOnxSwtO4Cxbo
RLXlz7EhOrhycyjHJduKmb1yLM7XtIj9Ma2WzhFXPwTIEIJnCG7CkYE2GIc+tjZU
vY8rVir2syx2m+onVug/MjzVWT7af7f329aBDbb7tTKel7Cp59pNABfM1Few5R98
XkohUttBcSA3tKZgSOlm9Ngw/JnZZ/Yle4xBm5S3EamoKgeORGRDATTeEqejNa1E
FWenChwWOyzgqpOWRHDy2jqWxLuyXiK6M4kUvY5IOYfR1jtUdy6eKRY1yGS1e4Jc
E/W/l6zMsEkkkAgRPi83X8sZnsOHor7TLI6+02qnkiOLPlXPJySDSyWjrzijSK0r
aauMioY8+y2OA5KM5bU3dFqd8SrjlPAiwX0/WW9xwvOobJMFkuyR9Tspt2rO0dRe
tBuMnsC/g6lHOTfOZkeqX7Q12vmsVTL6aVzMN0H1VaJ/lGNsATT/YRXKE4VZxwG9
bP4UruB5OGs1jcX8yxgl
=kbnB
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
