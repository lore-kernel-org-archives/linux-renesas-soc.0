Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58207 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbeHXUBC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 16:01:02 -0400
Date: Fri, 24 Aug 2018 18:25:36 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] vin-tests: Add capture format for parallel input
Message-ID: <20180824162536.GH26480@w540>
References: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
 <1535106262-13004-4-git-send-email-jacopo@jmondi.org>
 <20180824161812.GF1493@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="D6z0c4W1rkZNF4Vu"
Content-Disposition: inline
In-Reply-To: <20180824161812.GF1493@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--D6z0c4W1rkZNF4Vu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, Aug 24, 2018 at 06:18:13PM +0200, Niklas S=C3=B6derlund wrote:
> Hi Jacopo,
>
> Thanks for your work.
>
> On 2018-08-24 12:24:21 +0200, Jacopo Mondi wrote:
> > Add configurable capture format to propagate_parallel() function.
> > The capture format is the image format set on the VIN nodes.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  scripts/boards.sh    | 2 ++
> >  scripts/vin-tests.sh | 2 +-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/boards.sh b/scripts/boards.sh
> > index 7eb3a27..b379af6 100644
> > --- a/scripts/boards.sh
> > +++ b/scripts/boards.sh
> > @@ -28,6 +28,7 @@ case $info in
> >          # FIXME: This is a hack and not the correct mbus format
> >          # for V3M, but results in an image.
> >          parallelformat=3D"YUYV8_1X16"
> > +	parallel_captureformat=3D"RGB565"
>
> I'm sorry I don't see the value of this change, am I missing something?
> There is no functional change but I assume you use this for something
> but until I figure out what I will leave this change hanging.
> >          ;;
> >      "Renesas Draak board based on r8a77995")
> >          gen=3D"gen3"
> > @@ -35,6 +36,7 @@ case $info in
> >          parallelname=3D"adv7612 0-004c"
> >          # FIXME: This is a hackfor D3, but results in an image.
> >          parallelformat=3D"YUYV8_1X16"
> > +	parallel_captureformat=3D"RGB565"

Oops, this was supposed to be a different format, that's why I have
added this new variable.

I'll fix it in next iteration.

> >          ;;
> >      "Koelsch")
> >          gen=3D"gen2"
> > diff --git a/scripts/vin-tests.sh b/scripts/vin-tests.sh
> > index 0c5b29a..e7b7a48 100644
> > --- a/scripts/vin-tests.sh
> > +++ b/scripts/vin-tests.sh
> > @@ -111,5 +111,5 @@ mc_propagate_parallel() {
> >      echo "format: $format size: $size/$vinsize field: $field/$vinfield=
 vdev: $vdev"
> >
> >      $mediactl -d $mdev -V "$cam [fmt:$format/$size field:$field]"
> > -    yavta -f RGB565 -s $vinsize --field $vinfield $vdev
> > +    yavta -f $parallel_captureformat -s $vinsize --field $vinfield $vd=
ev


> >  }
> > --
> > 2.7.4
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund

--D6z0c4W1rkZNF4Vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbgDGAAAoJEHI0Bo8WoVY8WCYP/1hfxwWsMQg0d1LoakOQWAoh
56uMVNfjhRKYkYPDOHaUTqIPov+cwhViM2bZMH0MvQnTW2zD6TpXad+g9/pUhwEd
GaIBNaDxpGMt40pOAi89I+P+uu6+aNt9kE/ob9Fpo4DwUHUGdHXxCMhPW4pKsMXD
wRthyQG683kBdMxfi1YLGx00iY1MpWWRhTc0xtZEhmfzEoaoFmMEIitOUqbaodZr
v4ipxn6+yHh7zR09+iCFb4Gih0O8zz/oKyupPK2Y0MIGm5z8GiiI8EtH7L5y/LSV
o/VPPP+Til5cpzlLuLOwvRCQsfHT/tRvbcyx7b6d75InPVjtQjEyGtpNb03wjNOe
AvLqB24OmGLxVc3m2AqQA+N364zx6Bf7GKaGVuKtvdxFvYP5ng1xfIvI3/S7GdkU
UGYc02Y4+ZogbVeMDeBxUe/CD4Qql/h3OvgxiO38d3S7N1yohKDwSV/53m5+8F0w
kFZRLHZ9mIeZFzPygtgltNpJoshnK8qRAjBMf4wFd3tXHyB3CpYST8594pPT2xzY
fHLIDQdfwmf5zKtsXVLe/aenhS0BjENJFDFHEWQBdZUFjxhy09NuRFJDaJcoHp1O
q3+dofkXQMkBcN2sMiImR7Zohkt7o5SLurZwff+e4RBf4f+6mfIu1qMTBgUVfIX1
lDtR8eSIkU1bdPLO7DU2
=eqBa
-----END PGP SIGNATURE-----

--D6z0c4W1rkZNF4Vu--
