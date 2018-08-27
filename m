Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58573 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbeH0QYH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 12:24:07 -0400
Subject: Re: [PATCH v2 2/2] can: rcar: use SPDX identifier for Renesas drivers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        "David S. Miller" <davem@davemloft.net>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180823133456.4748-1-wsa+renesas@sang-engineering.com>
 <20180823133456.4748-3-wsa+renesas@sang-engineering.com>
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <89e744d5-8739-5215-1b37-fbd2f4be7aee@pengutronix.de>
Date: Mon, 27 Aug 2018 12:00:03 +0200
MIME-Version: 1.0
In-Reply-To: <20180823133456.4748-3-wsa+renesas@sang-engineering.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="G2iTwuV0UANMH3XyAu9tp9rHB9KUEGXR2"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--G2iTwuV0UANMH3XyAu9tp9rHB9KUEGXR2
Content-Type: multipart/mixed; boundary="0NxWczXz8t5d6QTdhSrgxet4tpRa0hh4O";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 "David S. Miller" <davem@davemloft.net>, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <89e744d5-8739-5215-1b37-fbd2f4be7aee@pengutronix.de>
Subject: Re: [PATCH v2 2/2] can: rcar: use SPDX identifier for Renesas drivers
References: <20180823133456.4748-1-wsa+renesas@sang-engineering.com>
 <20180823133456.4748-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180823133456.4748-3-wsa+renesas@sang-engineering.com>

--0NxWczXz8t5d6QTdhSrgxet4tpRa0hh4O
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 08/23/2018 03:34 PM, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to linux-can-next. Please add a patch description to the patch.
My $UPSTREAM doesn't like empty patch descriptions :) I've shamelessly
used Fabio Estevam patch description from his flexcan SPDX patch.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--0NxWczXz8t5d6QTdhSrgxet4tpRa0hh4O--

--G2iTwuV0UANMH3XyAu9tp9rHB9KUEGXR2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEENrCndlB/VnAEWuH5k9IU1zQoZfEFAluDy6MACgkQk9IU1zQo
ZfEsNAf+PMNVA840Fl4Tx3mHiyNiNMEEyywL5XHdDcg2cHba2J2ax+gZdkQm9BBX
nWK0qXcvPw2un31rXYt0Oh9DLGVrxdmNMcwNADQKiGQYFpm0QRgrbvgWqvfS6R+W
P9OQZOVfzCss3dRXQwAN++jR40rFM2anFEGWWCwC263b5aKL4c4eBEe70O6F6y8O
D4XfFMZIm2Twb6hIEH/7HbNjcP1hj8K/dLrJhm8UxmH6sGcVYXVkaIenSCWwbPWm
A3Il8HKuf3JsleB0VTfkZQY/a4r8o8VKOZ29PrpPhf1VIDAh3WyuuOlJfsDyUgKm
90wlDTvgoqxfb8/SHLv1QM/4o8Prbw==
=zbO9
-----END PGP SIGNATURE-----

--G2iTwuV0UANMH3XyAu9tp9rHB9KUEGXR2--
