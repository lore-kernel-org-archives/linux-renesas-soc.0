Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:53981 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753171AbeB0NJA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 08:09:00 -0500
Date: Tue, 27 Feb 2018 14:08:58 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Keith Packard <keithp@keithp.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        Shashank Sharma <shashank.sharma@intel.com>,
        Stefan Agner <stefan@agner.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Manfred Schlaegl <manfred.schlaegl@gmx.at>,
        Marek Vasut <marex@denx.de>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Alison Wang <alison.wang@freescale.com>,
        Eric Anholt <eric@anholt.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC][PATCH 04/11] drm: Split the display info into static and
 dynamic parts
Message-ID: <20180227130858.mupq5ha2mac677u6@flea>
References: <20180227125700.6527-1-ville.syrjala@linux.intel.com>
 <20180227125700.6527-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nmoifjnn4ltvtnba"
Content-Disposition: inline
In-Reply-To: <20180227125700.6527-5-ville.syrjala@linux.intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--nmoifjnn4ltvtnba
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2018 at 02:56:53PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> Currently we have a mix of static and dynamic information stored in
> the display info structure. That makes it rather difficult to repopulate
> the dynamic parts when a new EDID appears. Let's make life easier by
> splitting the structure up into static and dynamic parts.
>=20
> The static part will consist of subpixel_order, panel_orientation,
> and bus_formats.
>=20
> Actually I'm not sure where bus_formats & co. fit in all this. For some
> drivers those seem to be static, even though they might fill them out
> from .get_modes(). For other drivers this stuff even gets frobbed at
> runtime, making it more some kind of a bastard encoder/connector state.
> I'll just stick it into the static side so that the behaviour doesn't
> change when I start clear out the entire dynamic state with memset().
>=20
> Cc: Keith Packard <keithp@keithp.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@intel.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Manfred Schlaegl <manfred.schlaegl@gmx.at>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Alison Wang <alison.wang@freescale.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>

For sun4i,
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--nmoifjnn4ltvtnba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqVWGkACgkQ0rTAlCFN
r3S5Tw/7B6MxoagDQBqZ90GgYuiQTQOr8Z13ySDoGIs5wKAheYcTumjOjF5dX3H6
RvfOj+zl7YQcut3qqcBE3LeWmQ1zKdiVk7SC1bPtbzhhaP1T9GCKtnuaVid0hAQn
qLmBxzzFrvNcZKyuggLcXbfN+ZIE6i0zo1HZ3Sl+vcSisQ+GpWm0EF+ww5S4Oboi
lAtUGNOHPOUgSYDuxoVPbyh/gUpgF6sRelZkIodFMMGHj3Hbq6oIQqcylZeFRuzs
ayQ4+wiuSPXYj4rfuDvpJq4hzCd4gJPW9QXFmlOU3WnWQcKcpkbltjLFxpU+uggA
365r4uAqGmEzUp/vcjkmwN7vAmmWONMW8xsli3vejVf8Z3F9uwrjvsmhjqjMdtWf
WFRtbk0Qsmr2cdfV4YEKWXtsuL7cJxxr268pOYR+PuQGsHyLZiyzDRULf9QrYEdT
xWFlsmpCAu+QjeqDKoy6u2yCI1azKg8AqKHgMrrOYN38w9aa5Y2uShK6grQzYBto
fxvKAoefIpT8Bcq2AY39I1IVYXv/GbYbCM+0ucfBSZZF4jxxDmF136R7+80gShGc
8O96mMMFEiyszZQFB/sXv4HYehFrM2hUctA7CfZXYrDm1Vz5GAb1mw4MZuiDZIyN
4xFVpGCRzuXpH8G/gHgTMD0/OCswIrB5DKsbj7lTDRn2Mzk48/4=
=NCsj
-----END PGP SIGNATURE-----

--nmoifjnn4ltvtnba--
