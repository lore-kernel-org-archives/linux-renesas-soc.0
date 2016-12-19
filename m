Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 19 Dec 2016 13:28:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <20161219132842.h5ntmtqujdvfdjqt@sirena.org.uk>
References: <1473713446-30366-1-git-send-email-geert+renesas@glider.be>
 <1473713446-30366-4-git-send-email-geert+renesas@glider.be>
 <20161215175326.tbblqe7kto2qgxwz@sirena.org.uk>
 <CAMuHMdXJu0-iTFu3KMWXbbgidB63Mxy0oAWmTKKt0UUKuPbprA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="azqdxjhbxgra4ak6"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXJu0-iTFu3KMWXbbgidB63Mxy0oAWmTKKt0UUKuPbprA@mail.gmail.com>
Subject: Re: [PATCH/RFC v2 3/7] spi: core: Add support for registering SPI
 slave controllers
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--azqdxjhbxgra4ak6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 11:02:07AM +0100, Geert Uytterhoeven wrote:
> On Thu, Dec 15, 2016 at 6:53 PM, Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Sep 12, 2016 at 10:50:42PM +0200, Geert Uytterhoeven wrote:
> >> TBD:
> >>   - s/spi_master/spi_controller/ where appropriate,
> >>   - Provide wrappers (e.g. "#define spi_master spi_controller" until a=
ll
> >>     SPI drivers have been converted),
> >>   - Do we want a separate spi_register_slave() instead?

> > This basically looks fine to me - there's these TBDs so I might be
> > missing things and we probably need some GPIO chip select handling but

> Given the hard real-time requirements of SPI slave, supporting GPIO chip
> select may not be feasible.

It's not unknown for SPI devices to have some minimum time requirement
=66rom chip select to first clock so it's workable and probably something
people will want at some point.  It can always be done later though.

> As I managed to fix the issue with spi_slave_abort() on MSIOF, I think
> the remaining
> obstacle is the DT binding.  Do you have any feedback or other
> suggestions in that area?

> IMHO having the ability to bind to an SPI slave handler either from DT or
> by using the sysfs virtual file is useful to have.

I think it'd be useful to have DT support but really I think the DT
maintainers are going to have more opinions on this than me.

--azqdxjhbxgra4ak6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhX4IkACgkQJNaLcl1U
h9Akvwf+NBsS5T4h4HdkTOhpY9TEPyMCKaYEVs1TQa/ukf+31EpAsX82pyVYDgaQ
ajuXyjoBSZeyfLUql8RnUTUhScLQEb7LAOhPNPhmxj8Lw6yoqrcKZ4d4BNlRpEsZ
/kRI9Ww3IqaODc6r6DNHBBnjAB1y0d9wvUo/aqSrR6d20Aiv/vu3K3UVcFs/Y4y2
ZwtGstAVqMgtTt3hOEM8npyYLB4RyqaZ2dD7zWyonWoHsCPLzMICSpH9/g8ZyeA0
D4ePUepukzVrxfYVZKmu0aFzXOXfo80RYn/jWq4tQ0plFJxw+7YtCNUjmpk0UX3b
FFhlSc8I7zdfsr0g1h/0KcPfYBuTPg==
=IJBs
-----END PGP SIGNATURE-----

--azqdxjhbxgra4ak6--
