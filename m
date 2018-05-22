Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58828 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751192AbeEVMeg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 08:34:36 -0400
Date: Tue, 22 May 2018 14:34:34 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/9] ARM: dts: koelsch: Drop MTD partitioning from DT
Message-ID: <20180522123434.abrarobrigx7h4bs@ninjato>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
 <20180522120257.13232-4-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mbkd4pyt2xxonq6w"
Content-Disposition: inline
In-Reply-To: <20180522120257.13232-4-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--mbkd4pyt2xxonq6w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2018 at 02:02:52PM +0200, Marek Vasut wrote:
> Drop the MTD partitioning from DT, since it does not describe HW
> and to give way to a more flexible kernel command line partition
> passing.
>=20
> To retain the original partitioning, assure you have enabled
> CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
> following to your kernel command line:
>=20
>   mtdparts=3Dspi0.0:512k@0(loader),5632k(user),-(flash)
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--mbkd4pyt2xxonq6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsEDloACgkQFA3kzBSg
KbbIcBAAh6ISCT3+7KIJSJZ8aRmrZ4BbXyoXAK8VA5NMMf3f2mQKVCheApVeSxq4
8tth/rvqb5sprj8l4h+LMWst0NPvqjlMIopYIQDs9Jeh528rzqDDf6GpZ4D7WNQq
htAHLe+LnHl3NRTlUcV7+5vBgqLyg6SNGAEt9pk/Y/tQ5LWP4uyHQlQ2yqMrOwkb
2oP4HLLwrmXqRj93b65qnuCLFg2PGJyo0dX/1EooEh881WvV2+ZWCtwtdSYTA0Kz
AyRFtRnPpEGGu5rbFQ2HhBms3KzsXRwwueacWNoY8bsxaEn/DgNYRK6oTZw1Lox0
Tb3S3Jf8qk2JePYWzTxeMZkmC5SY72gBZ/ZanMX4Ce4ilHtTfzDrfvRf1Rb5DJGh
Gf3scK7t2YdPpbiUn5AJlhnV08GesLYqUdr++8ltOuQERpO/ayIFa+Cr1W59jBY3
UZZV2oa+NpAowLP4JEXv+FbV70zq4m35dpbu2025b1uGGAuGqssZFqpeNZRi4f+a
/VNnJHCMQyPsW7SR2qvak25WxzzocyQz0h6tCQWWih4MFhkcioGe3jWYGbEMYS+t
siLYYXanQQNCTubiyemPhZTreFFUgkCyniP05WfJ5LSqTbQGkmRRZ6UbZPKks4ua
aEMRpBBtwh/03Xo8wbu/CN60YFQxjUuZKaC1xf0RuOANuV2Fpgs=
=ctHU
-----END PGP SIGNATURE-----

--mbkd4pyt2xxonq6w--
