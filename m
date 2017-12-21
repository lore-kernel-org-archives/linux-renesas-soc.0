Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53997 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752556AbdLUMaT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 07:30:19 -0500
Date: Thu, 21 Dec 2017 13:30:17 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: add GPIO extender
Message-ID: <20171221123017.l43x7zka3qhqtfyn@ninjato>
References: <20171221115423.13591-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVau_wMd8aNVD9+fEsbMoozQxvOvjhoXKziMgh8Q3EcOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ufnltxzxhowmygpi"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVau_wMd8aNVD9+fEsbMoozQxvOvjhoXKziMgh8Q3EcOQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ufnltxzxhowmygpi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Missing gpio-controller, #gpio-cells,

I can fix that...

> and interrupts properties?

... but this is not tested!

> Seems like Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
> can use some updates...

Heh, I was relying on that. I can fix it, too.


--ufnltxzxhowmygpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlo7qVkACgkQFA3kzBSg
Kbb29w/+O0cdo7UDxN9sE6nDmQ8J2Vg62Rju3P2kBKLuZ9FPlWVKd4lwgJmd1tsa
ldalGbix2cpCXZxdNdIzqv7IlPAdy3Hrgwx0K72qFxpdaqb52f7EWuOLyjQyyTwk
7bYySfi051C9E92BqcfihWGx37e7OrxXYz00FgWW8mEOu5iwIv/SqJX0XS+iycGR
BwkzsicBjHQiFXK6bZYwUqrOqKrPYpdpz0sVEV+tA8fWaR6X6zi03oXPxtxXMVAn
XlkofPoev32LRbHJwzFw77k2i8cuLGIANVAUBPyOHubbZawqp4vvlwdMxM4X3a1a
GTrJ8KW/sPn7BGrdN/E5PVaduSk0TH0uVS6auAHFH5k6lJPfNxs9J41o4tKTKUVd
sbmWwgwqV3CLWBB9VJRmrvDo72baiyjMZo7XJeQNHOgktpB1gQsM653SxIXaMCHa
D7T3FWhJMz19147Jqzi4x3rbSXNEvHTmVo/xscTpcydDcjRuPeJNTtOg/Lis5wDE
blFJmwgXgJAtKgiXHKved8r5+wI3Wy3BpKVaxi/+iTQ254/STJrDxCiVJAVW/g4L
hxmGskMlcmS2XU/fN6//0/9PKdCygK4+8NyENLEBqn82euhhMTy5uzUPAtVsa2IZ
fo3KjsOIIeDGexx/sWeG/1N50QNhjy9m73EZaeGkeY5VzSLDHo8=
=X3tL
-----END PGP SIGNATURE-----

--ufnltxzxhowmygpi--
