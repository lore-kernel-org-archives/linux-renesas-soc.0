Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:43150 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752600AbcHaIH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 04:07:28 -0400
Date: Wed, 31 Aug 2016 10:07:16 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: renesas-drivers-2016-08-23-v4.8-rc3
Message-ID: <20160831080716.GA1609@katana>
References: <1471959320-16947-1-git-send-email-geert+renesas@glider.be>
 <874m6buh17.wl%kuninori.morimoto.gx@renesas.com>
 <20160830112457.GB1638@katana>
 <87pooppivx.wl%kuninori.morimoto.gx@renesas.com>
 <CAMuHMdVqOobeJJQHARjP8=ujZmO+pgb+QfYBOT9Cqa5xagAYUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVqOobeJJQHARjP8=ujZmO+pgb+QfYBOT9Cqa5xagAYUA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The revision doesn't seem to be printed on the chip package, but it is
> identified by the da9063 driver (CONFIG_REGULATOR_DA9063=y).

Am I recalling correctly that noone of us has access to DA9063
documentation? Is this still true? Or do we know the differences of the
revisions?


--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXxpA0AAoJEBQN5MwUoCm2ziMQAKXWLSddJSeRoOXzmVSurQWx
qkdNBR4Ox7AXPuadBW54Stz4KIPZrWPmMFQhezYV5bSfjXNeXcltrq1b8MQ88+cJ
T8pg15ypVgTYGoZEVvUqhT/z2X2fV0+uxoGU/dpFR3mxH25xQOU/0ZozOXETUY8J
uiNifbOpfdPrZTRXR8xExgDdmRIsdWczns6cJYN5dXkbqGGKJ2T+GfsGTado0+9z
9UlY44ZG3Ot5QK56HZNY5qqla/s8P3FGxLVVFGSlkQLm9poXC+eoRUTEIJrzrigO
TG1Y2lgQVZLhyztfJJKPzVqL+Gdg7G1+5gESsje4hSolWd2ZgZvwBrSD8/ar+wd2
x3Cxb7486afr9rYc0+oevRnTrMycN3mn1bobf2KkZa1sN7Eb4RmLE+7kP0EQJnQI
Z6+jUaLSgGy1P6JegyOF5gCKPF9jscv+puQ1GyFpy1PKMPnJBVo9U0AYPOWiajtE
PjNr77f4cqRF8KPOQd74LW3k3Ffxb2t5yt4K7gieJ4WceG6ULXqnLxUoeny1AYAE
gLljMlQEVYULgX4NJ025+AnpvwxaSRU0Gaj6AM6Fw/kCCiXLqAsWlqhC8dhqSEKM
/r5HkHSAb5umNLZ2xvqMQ8TGV8cqg3Wnh/FeiM8pYiuegGDOZQ6GK/aqw80C5YPA
DwlnCfGTQOcLYdpKAbl0
=V+IC
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
