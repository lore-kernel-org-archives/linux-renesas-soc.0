Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60626 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752650AbeFTFuv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 01:50:51 -0400
Date: Wed, 20 Jun 2018 14:50:44 +0900
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a77995: Add MSIOF device nodes
Message-ID: <20180620055042.6k5vxle4ltnzjby2@ninjato>
References: <1526475916-13705-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdWFZ2XL1E58-2_PdVWS3gHjw3AUB0JCCkaJUzLxWvwczA@mail.gmail.com>
 <20180517075232.yw3al4jfy2vk3zgw@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r3fhxslymyerqog2"
Content-Disposition: inline
In-Reply-To: <20180517075232.yw3al4jfy2vk3zgw@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--r3fhxslymyerqog2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2018 at 09:52:33AM +0200, Simon Horman wrote:
> On Wed, May 16, 2018 at 07:43:29PM +0200, Geert Uytterhoeven wrote:
> > Hi Uli,
> >=20
> > On Wed, May 16, 2018 at 3:05 PM, Ulrich Hecht
> > <ulrich.hecht+renesas@gmail.com> wrote:
> > > From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> > >
> > > This patch adds MSIOF device nodes for the R8A77995 SoC.
> > >
> > > Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > [uli: remove unimplemented ref clock]
> >=20
> > I think you should remove the clock-names properties, too.
> >=20
> > > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 66 +++++++++++++++++++++=
++++++++++
> > >  1 file changed, 66 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/b=
oot/dts/renesas/r8a77995.dtsi
> > > index 2506f46..2f712ac 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > > @@ -783,6 +783,72 @@
> > >                         compatible =3D "renesas,prr";
> > >                         reg =3D <0 0xfff00044 0 4>;
> > >                 };
> > > +
> > > +               msiof0: spi@e6e90000 {
> > > +                       compatible =3D "renesas,msiof-r8a77995",
> > > +                                    "renesas,rcar-gen3-msiof";
> > > +                       reg =3D <0 0xe6e90000 0 0x0064>;
>=20
> minor nit: s/0x0064/0x64/
>=20
> Ulrich, could you consider reposing with the feedback from Geert and the
> minor nit above addressed?

Ulrich, ping for this series.


--r3fhxslymyerqog2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsp6y0ACgkQFA3kzBSg
KbaKMw//YAKJKSkSruoQ8go/UVR52EpmMscBnCzn7gLArzNSGIp7qIT+hWjr9muQ
vFH2ArsFrL3kTMWdoaa91IxYW74vxtx/UfHF6G/ubtvc0DQe3nTjEwJV/vJ1gIBn
DPiOW1bwQAoXRUySfvvNQwEqiFhAhdpkrxFpcGLFxUu3+lrgyMhPvDHqWhnThGi6
CWf1PucoquH48OALYazcKUDwq+kRSFL47it+DQdQ5LWEx82Xg0h4LT7ynCymyAal
9NmeRDfPyT7L1DhRtgW/QhT4XDj0JcKR4T64R3/4g7CnTSybX1MCVXf2X8biT6Sn
8owEo+um6FzNTI2xyQ6215O3GgSv20UPE5iRlLVwSB6UhLIH8dDXGiWqX/jO5G3x
biuwtao6J6MrzktBknW5hM4/kCja7z0rMs7amV2jIUXJi3bVhNoi/sxN3xWdGraH
1BUEgjoNTL9QNWBeT7T1TcThdgpvDe0Ya5gKl8RwaDl32yxrrSBD2ij+tY7uuPdR
GTAO9mAXC9L0HomhYKjqYEbL2ZrdzCzLo7ppJfUGE9Q7IXD7jeXQrpx6swpPM+kd
KalcDzioxYyxMh3JOUYJawVC/huTSPIAGkqW+Dk/WYqVETJWmLuOeY9fS1/qnC60
sjT8ALSaPMBrrgC+v1kTOBtO25Bel9NrM9usdm1X0YTrwmaeWZc=
=PxOR
-----END PGP SIGNATURE-----

--r3fhxslymyerqog2--
