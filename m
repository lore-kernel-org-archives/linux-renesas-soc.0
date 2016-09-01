Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:47460 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750957AbcIAO1b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 10:27:31 -0400
Date: Thu, 1 Sep 2016 16:27:23 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>
Subject: Re: [PATCH] ARM: shmobile: fix regulator quirk for Gen2
Message-ID: <20160901142723.GB4824@katana>
References: <20160830145430.2182-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWdtVAY=4WiJWQfWtb5P71seANESm8tjLKpBboRwwJBMw@mail.gmail.com>
 <20160901142236.GG14300@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline
In-Reply-To: <20160901142236.GG14300@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2016 at 04:22:37PM +0200, Simon Horman wrote:
> On Tue, Aug 30, 2016 at 05:15:58PM +0200, Geert Uytterhoeven wrote:
> > Hi Wolfram,
> >=20
> > On Tue, Aug 30, 2016 at 4:54 PM, Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > The current implementation only works if the da9xxx devices are added
> > > before their drivers are registered. Only then it can apply the fixes=
 to
> > > both devices. Otherwise, the driver for the first device gets probed
> > > before the fix for the second device can be applied. This is what
> > > fails when using the IP core switcher or when having the i2c master
> > > driver as a module.
> >=20
> > Thanks a lot!
> > That could also happen when irqc is a victim of deferred probing.
> >=20
> > > So, we need to disable both da9xxx once we detected one of them. We n=
ow
> > > use i2c_transfer with hardcoded i2c_messages and device addresses, so=
 we
> > > don't need the da9xxx client devices to be instantiated. Because the
> > > fixup is used on specific boards only, the addresses are not going to
> > > change.
> > >
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >=20
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be> (r8a7791/koelsc=
h)
>=20
> Can I get a Fixes tag or some indication of if it should apply
> to v4.9 or as a fix for v4.8.

I'd say:

Fixes: 663fbb52159cca ("ARM: shmobile: R-Car Gen2: Add da9063/da9210 regula=
tor quirk")

and should go to 4.8. Geert?


--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXyDrLAAoJEBQN5MwUoCm2VwUP+wUrfO6bjRoab1qHiSKiO2sc
YHOpEpnP6uK99OIT0zaBbyvqKNL9WB5WAJnby6FszenO0zfF1wFPtCO8xybi1llu
zGXLAIda7DYSKvoE+tWxdCp0JUiFPV3OwpFCbH/7EB0BddZ26hU1rU0OyTQw5mk/
zGAIWz9cxAcfgY2DUE/TlwthBRYPM7y8ApHxT+90kNqN28AhjzjefuL6XGUe4MHy
36rOf1utJKr6jSDsIji6+6n08lxXqwV2dCew7nQy5OJ75F2Y0buFL21TSks9mIbw
ggZj+vT1jrYNnTrIMCBQ4afRWLYHYXu6bnsLkYZ8ZS+lKSBARPBGpYgA3H2TATcC
KH5tV19KcAQGKqQpVnGNrzLnTrOsagBPKu1lJ7Z+LgYwOkuxD/r/WMUpFv2+fhfJ
yAmPyepJf6bm7pUJ4WWtverCtzBxNZl9lgSPy4Zh97+kbSAV6CIokKcfGHvn534r
CUWvDQVrlxKwbwrctapB/dzip45w2FNiiUO4wcicXnj6wILrEECeLHSqLs2kjSNa
onRxDigziEgZ4UD0wKQlHhF/1dhWen9i05nKrRu8ko4pjba4hKXdh/t7TwXEEMlf
hhjAaJP9k9FPZu65zJWkC7pZCP5jDapZSsmwCJ3MR8p67zhCYuoLbNTsw3VNuo26
E/jmFEkP+1vwR4S3weQ4
=6O64
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
