Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33547 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750885AbdADHRs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 02:17:48 -0500
Received: by mail-wm0-f67.google.com with SMTP id u144so90045930wmu.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Jan 2017 23:16:38 -0800 (PST)
Date: Wed, 4 Jan 2017 08:09:19 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 05/13] drm: panels: Constify device node argument to
 of_drm_find_panel()
Message-ID: <20170104070919.GC5729@ulmo.ba.sec>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-6-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline
In-Reply-To: <1479526093-7014-6-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2016 at 05:28:05AM +0200, Laurent Pinchart wrote:
> The argument is never modified by the function, make it const.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/gpu/drm/drm_panel.c | 2 +-
>  include/drm/drm_panel.h     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlhsn58ACgkQ3SOs138+
s6H+4A/9HUCYaI4v+0cjnRG+SQyaUU2Rw1Poq6QuoX8KjDWccQGMsV5sYZPSoCEb
pFwNrEhH+5mxi12pAV5XpViVKdHhppGJGgCmoVuqhvYrQAuE4fNO0sl/eSvQANl1
Da5Sg+ianylGjujwy8cz39jq0W5752bemhBgsefjFmS9cdw3C+mf72t9881T5anp
7oTIfy/lhAAhMt0+neoq+6exgXsdgekaaj73hGTIa8XJDsY7oAznTxclGpxS6G8S
5d8x5mK3NUYPIA6pBjfaCXeRSsHY/b4UPVRc3vK4zkf4J6AaNmxGMMk6780dHLIo
u+VNUqqcf4MkrjHP1kXE/q5ljGwaHLylnBVfgfIecFdyrCohgS7bhCCcUdRz09/l
aFeXGLYNpCBEflgVHZk3UnGxe1YoAN07in+5E7q3vjm/dEOQybBQBF61APmR6H/c
wUH7SwZe0K6h0zY1WRHP/3q/FGN6lTbomXFB8zDj0tMQ4jVLwgBtWdDu7jGhlbVX
IoBn6+crVHW2QaVsdhfv7oEKCXy9YXLHITDczvk49Hq2PT+8tYrItXJT4fGP1ZrN
N2gfgAwuLLJ1kfs6oKhOdOP9RJs2Iw3NbZcp6D6MHTxQl2hijT7mRxs7LMXgigdf
ssi+IaCUNHjrPgsmhuRefhI+6Twgj6m0OpoDvcvSd6xrcMak96I=
=vuJB
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
