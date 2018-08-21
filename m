Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41742 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726743AbeHURCE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 13:02:04 -0400
Date: Tue, 21 Aug 2018 15:41:47 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-xs: enable SATA
Message-ID: <20180821134147.sn4xzw4hn63r2cqm@ninjato>
References: <20180730073456.3687-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXLxhudW_s-FmtADt0a9-qd501s0Ckm=FTY97mxGH5GBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tg7r3damxywq27dz"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXLxhudW_s-FmtADt0a9-qd501s0Ckm=FTY97mxGH5GBw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--tg7r3damxywq27dz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +/* MD12 (SW12-7) must be set 'Off' which is not the default! */
>=20
> Upon reading this again, I think this comment is confusing: the 'Off' ref=
ers
> to the switch position, not to the MD12 logic value, while the parentheses
> suggest otherwise.
>=20
> What about the following?
>=20
>     SW12-7 must be set 'Off' (MD12 set to 1), which is not the default!

I'd leave the ',' away but otherwise:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Shall I send an incremental patch or do you want to do it?


--tg7r3damxywq27dz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt8FpcACgkQFA3kzBSg
Kbajig//XD1xAxpD6j/vZ6IEggATpLsubR+QNoblN46VJax5nm4WzvO/a/1abVk2
CQZ/mn8bgSk22vlt2NpmojpejXYx0sCCvJAkMx55rthwFztfQUo2tIgsUN50Mlrw
dN4jnY0DZOA+Xv032lWLSgydHyYlgaHH3g/BM5mAm8CrTKjcpUjOxH7Zz8ocvzMT
joStpRKxyUvAOef6FW+jTPdN5h1k1gvtAQtA0rLNLgetBxA7FgxQyU4b/gFtGLnh
fg8bsa9bmldTADXH9GyKuD+/8D8zwqEvepfCFlkAgmK+Sc9zww5pF/2Mgl0fuM00
ow/pGFzhjhcPiWfsXoVM/zpU1zJMzSc+PHHVA+1DygBAQeJLWlq4lavPFpthHuCu
RJH8b1JZFjWOrrNCQ+ACye3uOherBUn0b5IiZJQIcZbQcMr45mtPvpp9AsYMe1pb
NeEoz58EViPziOospo00dfAwSWwzQIBvj8HLqg2mxsHBQZmXda1ALTg7nNqxvmnN
VUptqdOH7a4nF55r8kG2wn+cNBV9S4vb7vJOSxt6alA13sx5D2DuI3W+dx/Qthm8
SSlK4YJVN5kRR+iZMWN/gC6bUQ4zJGqtivAUZRfIXc2dv23qInj+DCCyqUgrQ7Ea
se8nG18t+60jp09xCT11RyGf0xvIvWkH1RzzPUT5iD0VdXRnScM=
=PeFH
-----END PGP SIGNATURE-----

--tg7r3damxywq27dz--
