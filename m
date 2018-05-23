Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37404 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754395AbeEWJL4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 May 2018 05:11:56 -0400
Date: Wed, 23 May 2018 11:11:54 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-spi@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a77995: Add MSIOF device nodes
Message-ID: <20180523091154.qmegtkhtlyoyz7hi@ninjato>
References: <1526475916-13705-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20180517075650.gxmp5wrqcble5qua@ninjato>
 <CAO3366zkwoFAFjY++bsdhR7F86HnVxrBkspmb1VFPJokFvc94w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6nxmdedrw36dyri4"
Content-Disposition: inline
In-Reply-To: <CAO3366zkwoFAFjY++bsdhR7F86HnVxrBkspmb1VFPJokFvc94w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--6nxmdedrw36dyri4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > For the record: can you describe shortly which of these got tested with
> > what setup? I don't know the Draak, so I don't know what is exposed.
>=20
> MSIOF2 is conveniently hooked up to a 1x4 pin header (CN41), no
> weird-ass Samtec connectors required. My testing covered sending some
> data using spidev_test and watching the output on an oscilloscope
> attached to MSIOF2_TXD (pin 3). Looks plausible.

Perfect, thanks!


--6nxmdedrw36dyri4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsFMFoACgkQFA3kzBSg
KbbhdxAAgE2cmQ7RheBpYRSjRbhxOtrHWD7T+HqhODwmwP6zypcdjWFSXqA+o5Zv
UR98Qmd4Qq8oa6qNEh3+LPE8BE5i0rYMgrtctKsTppnI2uLRoBjtGEe65webtd5U
37YgnWv4aGXXuE9rEydrNG/HtRCvQrwipppBNPU411Zu4egAjO3gkDdVB6poXpxA
PfJaOlEIwwRVaEqahmghTCh3HIGyDtqqZVSBhjzC73vAJWGIKocS1Y1iuaaoKRt6
7CV8XIpUS+xYDnybTtahGXU7h6KzsU0flh0RBF7fh79xYlSjAC/A5anE+K8x5loY
wK/sZ8gcawcKIyDNXRLKNsfR4dokzlUwFyek5LJLBT3UUnvNGhjFA3AuTurl5nct
BUWpBsBFuPKKZkfxfQNHBizKoxc+yGv+blczYvYvVcg7REug5PFvlUUO7mSAWF+3
gmMZKdsKDtu1WDWUBLOcHXeV77XZV5rTCc+U0SWP4xwKEXev20xE1nLS4mT/yhfy
TN6ShLXcdyKhE8znj0UEDUAq+SpHyZGmyW1q2Rm5LVt4gFvj9AK2B7pM4sHWb1R9
6Et3NJnAgY0pPGgQZahAxDmv1K26pK1HIDArWfBnrRYbnxJGRqk/2Wz6JLHG4ddn
x26XZDpQUE5dm1HkGVYUfTekJQT5LRQKclk7nwDaSBcVtmVWhpg=
=rGcD
-----END PGP SIGNATURE-----

--6nxmdedrw36dyri4--
