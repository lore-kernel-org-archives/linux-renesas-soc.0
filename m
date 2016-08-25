Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:46401 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750715AbcHYRjI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2016 13:39:08 -0400
Date: Thu, 25 Aug 2016 18:46:23 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: renesas-drivers-2016-08-23-v4.8-rc3
Message-ID: <20160825164623.GI2856@katana>
References: <1471959320-16947-1-git-send-email-geert+renesas@glider.be>
 <874m6buh17.wl%kuninori.morimoto.gx@renesas.com>
 <CANqRtoRCoe6-f3ekkvvTsX5co5kj8ZTzUpgfXL8LAHqp6c7=og@mail.gmail.com>
 <CAMuHMdUneaDwC2yMOkcfNQy2f47dTdOoxr=YyZX6VPmZW0kBQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="e5GLnnZ8mDMEwH4V"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUneaDwC2yMOkcfNQy2f47dTdOoxr=YyZX6VPmZW0kBQg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--e5GLnnZ8mDMEwH4V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > How can we check which ES version we are running? I recall seeing some
> > patch from Geert that printed out useful information during boot, any
> > chance that could make it upstream (if it is not already)?
>=20
> It's part of my topic/renesas-debug branch. Just merge that into latest
> renesas-drivers and see...

I second Magnus in wanting this upstream. The FIXMEs are about the
cache. Maybe submit an initial version without cache report first? Or
are there other issues? It would be really helpful to have this in the
bootlogs by default, I'd say.

Thanks,

   Wolfram


--e5GLnnZ8mDMEwH4V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvyDeAAoJEBQN5MwUoCm2vToQAKSLZ0s6gtYaS//ty+WeXj9Y
UBXRzlHDjia3EjJUsqFB5mnFi7P4b3fzxLaks33NrVs7Cyt7CdsZ2DnPmUbkV8MR
EPRsfZkc7oZBNX+Z3CSu2beGdKyA+mQ0vuY6TQrEAjL/YKmUE2cP2X7Yta2mfAzX
Wq/oeXy0x3g6lO3ssytVD1uRvV/X3gClG3GvNGQqp8jMf5VG4/1/IFktoSdmrNv1
77ggd+zfoUqCMiEOUJIJ550plUU1oopHVF5Zpnpl6jvAoe2JTrajNQR5LzQKk9nk
6hb0ozBG4ansnbFCxVywkvNc2mic5HRDl5dUagyroQ9/Wku+9uG1/7eGT1m4CEbi
CeZm3IVeIozZy4U+4lHvYmsqKudQF9Hv8154GkcwHP9VOJRnfmc0PYAnmrLsGwgJ
Wn9gGjD5bcXNR/FVhaBMxnMBFUZ6lJTJgKhjybG+ESYlp15DkaLXUJzHwr3C5hfd
YloZyXbfWb7qaizyrgYG8mafSvbvSVjw4BJtzzl897Ac5jzbhkga4ORTWY2QBkB6
Q4o6wsURXP/fgNpFoad7VB3QB+CJuaUefXU1s6WqSnNpJmrYnrAmVINMbMVamTIU
qzhGGuvWhh/H8jRE3tOljWWdY6GQfjDyFdX7dW9PCWar6mt6CLquECCv/MAgIEik
Lw0CdAvT8Fs1v7XQ/7Lf
=BibG
-----END PGP SIGNATURE-----

--e5GLnnZ8mDMEwH4V--
