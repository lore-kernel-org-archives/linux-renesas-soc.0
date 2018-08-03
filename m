Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:32810 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730783AbeHCMn7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Aug 2018 08:43:59 -0400
Date: Fri, 3 Aug 2018 12:48:11 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: shmobile: silk: Add DA9063 PMIC node
Message-ID: <20180803104811.2kfa456t7ytcft6s@katana>
References: <20180730111817.5636-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdXib8fz3c41RX-70eA5w4ThM6e02ybmX=N=xXR6=F80KA@mail.gmail.com>
 <42d09bc8-a883-c3af-b0d6-0087b6e2558e@gmail.com>
 <CAMuHMdXSjLSsmU32tKo5tkS6+MipAXuVAUqkLYrXxmR07+eCEg@mail.gmail.com>
 <75d2797a-48db-4979-c059-d7359eb39cff@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jlv3olcjwhrp6jed"
Content-Disposition: inline
In-Reply-To: <75d2797a-48db-4979-c059-d7359eb39cff@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--jlv3olcjwhrp6jed
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > Wolfram: do you like i2c slaves connected to multiple buses?

'Like' would be an exaggeration, but if they are connected to multiple
busses, this might be a reason to describe that. People could then in
userspace bind/unbind to the bus they want? Not pretty, but there might
be reasons for that?


--jlv3olcjwhrp6jed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltkMucACgkQFA3kzBSg
KbaoChAAiF/fNtINQiWUupzushwGuM96oX07J2i60neq9CpCfdB8Qt+9KHPbbQh5
WbSBwseoDKKzd/Ck1RsFRp9mPQfvY+OiJnNjIkWRALgOBCEKL3OFsZahdBxi3bE8
hV2ABASbLHVFYwbe1Mcww6p/u4UrrgUYBACJTJkLr14kUq0BeY13S9LUE2jNMCfl
eJ8mmXSwqr0LzFF3WGfrEYAyDUyhUZ+tmblaVOsmX9lG7LE8ONEnSPLYi9FJcY/b
K2IHZCauzzYYePFerIk/4XhZem9W77MOcVa+bFhQV24ps67Vwkmlrj37bfLFoT0I
r6BagEBegfgeObLjyhoO/m1Giovk8GLhS2bpe3XUscXFoX+I5KOkHBrQHRCSozGK
P5OO+LySNqKiXCU3VhaXf4YUu0cz2MBC+V4ZYb826/srb+kHJtF73XZWJpKWDdVN
uMWQWBEE4mCyZy+PVso77hyr4Q+NHyfMQ/nObMUDR21hGktziigVvWWkagbL/rWF
Fmj0Tx93T/6NNtzkHN/BMFPiwPs8UbXsCE30YJ6TOxpQX8sNfghnO4RjGTWtRIEa
6dZD+FqHSOo+rUIrQGOK9+v3s2aykKI11HoBbPSp47wosKgyFmPwhTMikbUMAfMN
whRG1RMFHMf0YwTuWbWpjHPzr38QaB5EaXdZZ61JyZQQSg1FWbw=
=b4GE
-----END PGP SIGNATURE-----

--jlv3olcjwhrp6jed--
