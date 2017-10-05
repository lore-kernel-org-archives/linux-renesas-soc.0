Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40713 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751446AbdJEUsz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 16:48:55 -0400
Date: Thu, 5 Oct 2017 22:48:52 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC][PATCH 0/4] Audio/SSI pin supprt for r8a7795/r8a77995
Message-ID: <20171005204852.y2efkudzpxgibooh@ninjato>
References: <87efqlou4w.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="liwdhhu3uxj7gj37"
Content-Disposition: inline
In-Reply-To: <87efqlou4w.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--liwdhhu3uxj7gj37
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Morimoto-san,

> But, I2C is not yet supported on H3 ES2.0 "PFC",

This is out now:

[PATCH] pinctrl: sh-pfc: r8a7795: add I2C pin support

and Geert already picked it up.

Regards,

   Wolfram


--liwdhhu3uxj7gj37
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlnWmrAACgkQFA3kzBSg
KbZYJg//cwVIM53EG6NcUbug4jDzZRdtq12jDDOknAnAhxfgGIfu8D7BeHSwsuSc
2laU8iPteXxEAmee0CeHWv3mE9TkvA+l7qRRvzL0LhLh+xe9GSe18jNJY9irP3XL
MELxRwHNTvVIr56NAuProxcuE5XHtpQKSoX0FUtQJkbgR+kS4fQm/qAzAv8tMP7o
XKkLiDQJkPu7JRVOVL7LfSmT1SHQD/skqzB4qOVSRhwJxaOW64LoUmCJf5AKN6jP
jbc5Hm525YWAsNY1eaISQeyLQq9bk+Oki/P/vsmrYDOsrghI5aZwxLmHwEo4r6dZ
19PDWHX4+RS76PVqY+4uUyuXuoC6lE3yVPa7S0TuRDEVDYjED+0LEsnXDyjATyU7
U1hj5gGyTi0IbdwQivOAXMUrN8JXideehEYW7MMfgCOCfjIbYZSUc8MAbb4cR2QT
1bGdJ64p7fv6PwdGora25g99jhLwasrwR4i3Iv8ssUlBWP59IoVQpuQrihgq5+Kp
18xYNEfdUSVlELLwe2ZkAx8HmxHQwNY6izcA/QzhxmHvea0DzB5bjr+/hBViFNDt
3uDYMRrb26noCiMkkYqkn9Yg33cZ7Ry+8Dj+gKxLpJsryE/V1zk5w9ZO0tmFVCjv
DZ5ONLZe5xvlMZZvONqpi6SOV+cktVo8rnvItZlGPiuST24IDQs=
=L0uY
-----END PGP SIGNATURE-----

--liwdhhu3uxj7gj37--
