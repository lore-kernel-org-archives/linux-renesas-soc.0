Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:43518 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726618AbeINOGL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 10:06:11 -0400
Date: Fri, 14 Sep 2018 10:52:38 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] gpiolib: use better errno if get_direction is not
 available
Message-ID: <20180914085238.GA2683@kunai>
References: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
 <20180712155152.lbpsbd6b5ai73bd6@ninjato>
 <20180725202005.lflrjvz4aubqskq7@tetsubishi>
 <CACRpkdY2OyDqCOvwr_oPRdrh1VMnvD2e=eawyaKCNbQHfFAq4g@mail.gmail.com>
 <CAMuHMdWcKHYnyhinzsc-jkLBy+pEypD=Hz_XP0Fy4XyTYszpsA@mail.gmail.com>
 <CACRpkdb-dSaj=Jn5XsLu6YEDHur4gpGos0mfmYgqYVrZEvYLQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <CACRpkdb-dSaj=Jn5XsLu6YEDHur4gpGos0mfmYgqYVrZEvYLQA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Any plans to apply it? drivers/gpio/gpiolib.c is your territory, I beli=
eve ;-)
>=20
> Ooops sorry.
>=20
> Patch applied.

Thanks Geert & Linus!


--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlubdtIACgkQFA3kzBSg
Kbbiwg/9EMPh2853UoLGpwb+AF+t2bRAuXhNMcSFMN0QLVTY7brt7Z1ZskrSUl1K
EW/eP2RqS1AXqEzMMIuMrGEGA7Hm8xHAd4hubFz1JaY0BqWAjjMFYTcCTfvGWhGU
u2YyAIq2hJ0OfHwBjV9yvRC5sLHc3gYkZiH11ROXnBluNjhvF27y/yQAQE+A0uYB
JWN2R9h3kFnjQOwGL8LxbSTTnQuUYCNnn0xQzHfQ3dzOIKiJsM671hZGdHITJgap
oZyevDYwSCDAN+mbzjC64wPzpFmy4joQYz1XR6eh8ItDeQCmp5tbKh6uccNMnTEJ
6i/uHV8wWG2DlUnJsuhgesJpMYN7JwhqKOqPsIxJTES1Z4D6OXbx9nhP/VqjyW5m
2HP/K4EEVbZ1ocMBL1lBFhZyvSYm7MF73lxIbM/sNN1zxN6/OPW0qXwVTYYOJaBl
uD/YsXa4+51LS8DX09MMsv5ShfLubnlQQGQBlDfhmcTBuAQuqqaOD8IB5ws4JkEp
sU2KdxF0BGkmF7fBSsaMBitDcuqYGkFRtHjhlalQLhaXI1GNEMchAdP2eH6/uikB
OjfG9GNDY9huFmh2cq73ByDv3mhIspknhjEVlN9PZGD0oH9I3qjvN1cNXIqpf+4V
3a27PMHRGxAgiTCSgnKFAe1omhh2h7u2N3dtelZrD0CL3mq4cBE=
=GY5L
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
