Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 15 Dec 2016 17:46:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Fengguang Wu <fengguang.wu@intel.com>
Message-ID: <20161215174629.x7zzbgvjhe4q7cpt@sirena.org.uk>
References: <1473713446-30366-1-git-send-email-geert+renesas@glider.be>
 <1473713446-30366-4-git-send-email-geert+renesas@glider.be>
 <CAMuHMdWhuqSg+qUnDUqad-SBJOY5rOuRGuG7oUfTXiQA_rUtoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tevkpkhsj4t2dyso"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWhuqSg+qUnDUqad-SBJOY5rOuRGuG7oUfTXiQA_rUtoA@mail.gmail.com>
Subject: Re: [PATCH/RFC v2 3/7] spi: core: Add support for registering SPI
 slave controllers
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--tevkpkhsj4t2dyso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 18, 2016 at 11:04:18AM +0200, Geert Uytterhoeven wrote:

> This is caused by moving the setup of master->dev.class.
> To fix this, I can
>   1) Introduce a separate spi_alloc_slave() function, which sets up
>      spi_slave_class instead of spi_master class,

This seems more idiomatic.

--tevkpkhsj4t2dyso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhS1vQACgkQJNaLcl1U
h9BhrAf+J9/Y3iKtbQh+owYF7HlBgzBwUi6OgtYENNkhBl6Pi5XWkmlK3JhpyE7y
8IpbuFuKOBFOFKl0BWEsoKt2wm2KmWeqY08ydM97ffpl4MBJ+qDFjyjqutfOkMb2
0zhwcb2m1dq3svBzpiE/PVK9ORdfXkhbgSD/0wxbALpfH1bXPRSlG53VliZkhA1L
S6RYaMXhKP672FOYUJeG18YuHP3/LY/HQ9MqI17YKwF+m+XTQbymtBVIrkh0NKx6
19SBls44g9zFsZyYyruSMvCIdHx6sOiTZ4r/jpwdKXsw6dhHdY3eT+dIsEogwX7z
tsn9He/CyzvMw00CjDrRQ6I0kZBtMg==
=60zH
-----END PGP SIGNATURE-----

--tevkpkhsj4t2dyso--
