Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:54774 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752461AbcHLRPs (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 12 Aug 2016 13:15:48 -0400
Date: Fri, 12 Aug 2016 19:15:44 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC] ARM: shmobile: allow non-SMP builds again
Message-ID: <20160812171543.GB1599@katana>
References: <1471020520-3077-1-git-send-email-wsa+renesas@sang-engineering.com>
 <CAMuHMdXcMCKSRore67fHL-a_MEWOokJ+d_VUqeW1W6gdkEi_0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXcMCKSRore67fHL-a_MEWOokJ+d_VUqeW1W6gdkEi_0Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Wasn't this fixed by
>=20
> Commit:     869ec056fa8450184423c8076e0a342db127795c

Ooops, yes. Sorry, overlooked this new 'if' after rebasing from rc1 to
rd/master :(


--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXrgQ/AAoJEBQN5MwUoCm29lsP/iAeOnMK8S1nHogDPnQ40aAU
ezM5BN3ncytW5YQW4F7CfYZaZLnH3dnY5Rrn9TnQDw0a7DD8Xtq4OZDP05YIlMpA
f/iw7oqBP+Oa4FDzVwtNW9CVk0CsNOROOqbH/LkHSdufMzPeH4i6Em2j/DbNOzaI
ZD6ExsqV9Rwmzaf8jzFhSca84hKQMOsWK3KAZGTqiZNz9OX7tH+jH7BfBr8zVZ27
fkNpvv+kTrGvcnDYU25a8JX5y9FVJ+2fVrLqZKRQd3JMAAZVVrVTFUPPhZmVxqgA
0GEwGxrDlUAB/1Jpq3TtB8cdVA3uTB7uAwhVIGhWwxkQzvdvF3cgYwsNfJRm3ktA
vUTTuJQjL1iyZUreNXPX3Et1lnLgFr8iXS0/hEPBam1TTKkPfb8u1pRc4okkyyTx
gyRhrdulSAcjYKLppjDABZqxmUJ5l3Kjb7eC0/DpKL7DSXd0+dOMudfMz95tK2Dz
wBYH04L9JCFbyc7xjRNmlnyw6JW74jmzJc96SWYNKMOmX4hyTBpRoBv0vS667kxW
r8ZtatbzxjeRmdj+aLdGogOJjuXUlX5j/HuXFrcqHLgP+jcu7eHmT3dCdghYbq6s
lcyhVbbW1A9HPYhQ9Ehv0huqSAPJAhOrjMMF0VPsUGgkXbhPg4RPdmj7z1wYUSnr
6M1A+WRW6vl5v2BrWZBf
=z1L4
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
