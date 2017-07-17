Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:39251 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751256AbdGQGcj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 02:32:39 -0400
Date: Mon, 17 Jul 2017 08:32:37 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: kieran.bingham@ideasonboard.com
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Setup planes before enabling CRTC to avoid
 flicker
Message-ID: <20170717063237.cozr3wednozvprxn@flea>
References: <20170628185055.16379-1-laurent.pinchart+renesas@ideasonboard.com>
 <9120be80-cefe-e52a-e512-15145ded1e82@ideasonboard.com>
 <92490bac-1731-41b0-ac1c-93699963959c@ideasonboard.com>
 <4f6ab180-efbb-432d-a765-82f766da32c9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="567l5am7nhwtpmwj"
Content-Disposition: inline
In-Reply-To: <4f6ab180-efbb-432d-a765-82f766da32c9@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--567l5am7nhwtpmwj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2017 at 05:25:08PM +0100, Kieran Bingham wrote:
> >>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/=
rcar-du/rcar_du_kms.c
> >>> index 82b978a5dae6..c2f382feca07 100644
> >>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> >>> @@ -255,9 +255,9 @@ static void rcar_du_atomic_commit_tail(struct drm=
_atomic_state *old_state)
> >>> =20
> >>>  	/* Apply the atomic update. */
> >>>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> >>> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> >>>  	drm_atomic_helper_commit_planes(dev, old_state,
> >>>  					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> >>
> >> Except for DRM_PLANE_COMMIT_ACTIVE_ONLY, this function now looks very =
much like
> >> the default drm_atomic_helper_commit_tail() code.
> >>
> >> Reading around other uses /variants of commit_tail() style functions i=
n other
> >> drivers has left me confused as to how the ordering affects things her=
e.
> >>
> >> Could be worth adding a comment at least to describe why we can't use =
the
> >> default helper...
> >=20
> > Or better still ... Use Maxime's new :
> >=20
> > [PATCH 1/4] drm/atomic: implement drm_atomic_helper_commit_tail for run=
time_pm users
>=20
> Never mind - I've just looked again, and seen that this new helper functi=
on is
> the ordering previous to *this* patch, and therefore isn't the same.
>=20
> However - it's worth noting that Maxime's patch converts this function to=
 the
> new helper - which contradicts this patch's motivations.

So I guess I should drop the renesas modifications in my serie then?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--567l5am7nhwtpmwj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbFoFAAoJEBx+YmzsjxAgPiUQAJ81sGK5Cd1AbmQCSi8QYTGk
cK7Zk8GCtT6HIR7xs26phKjY8mITBwZb4BJHOnHaVSL8ISk5XMJNQBbncApki1un
C7TrSRh1ObIjgwjFPwQtNV7cwOpj4dmVPxOrE3FMfhtw4zOWICav4Y97+RtxMNsY
ZQRxGziaD9ZYF/aTu4L+yuJMqaZUJb4VGQq94HJqRgTR5hEnaKboiC8llUmv+puy
UsvTt8PzxzTWMl9CgbH8M+sPnEcsqEjLfmFXitwK/yAOZuwu4sVMWQiNERITaZnR
6+twYopK/N6v3t5vs3vaMgGk+jUGcsQrJAKs3v15GAXI584IqBnkwumJFA96a1Rr
q4GHNRqd0D5N1kZdMKf8hTySJs9tsEhqdcZf+Y7nv368s2YF6vv9F4l291VpxHOi
ESCcVTVdRUzZepIrA55Wx0C33I5pdMI34G5EHrFQhbvi+5pbHx4Sg7P9Pr+b28Gt
GcHqGBiQyIP0wTOxqvvNsCoOet5OVkzRBOMSxy6HuFk3CH64QKEMLS8q9YMduJQh
apwVftOI4nL9z7KbFMCYkMJCNHJUiWs8n241jz7XPr+NTC17Md9Ma9UB86PKm8Rg
PtmGUnGzyWH8Xnr27yleICnRCiFiUWDulDQA6PwZjlHf3GLsluUPHvuvqqabbb8g
NcqqcZh5IKFZ1Go8J4tl
=8GDM
-----END PGP SIGNATURE-----

--567l5am7nhwtpmwj--
