Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:48519 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbeHXUEQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 16:04:16 -0400
Date: Fri, 24 Aug 2018 18:28:49 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] vin-tests: Add support for D3 Draak
Message-ID: <20180824162849.GI26480@w540>
References: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
 <1535106262-13004-2-git-send-email-jacopo@jmondi.org>
 <20180824161228.GD1493@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="dwWFXG4JqVa0wfCP"
Content-Disposition: inline
In-Reply-To: <20180824161228.GD1493@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--dwWFXG4JqVa0wfCP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, Aug 24, 2018 at 06:12:29PM +0200, Niklas S=C3=B6derlund wrote:
> Hi Jacopo,
>
> Thanks for your work.
>
> On 2018-08-24 12:24:19 +0200, Jacopo Mondi wrote:
> > Add support for D3 Draak board.
> >
> > Draak has its HDMI input connected to an ADV7612 which connects to VIN4
> > parallel data inputs.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  scripts/boards.sh | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/scripts/boards.sh b/scripts/boards.sh
> > index 26fdab9..7eb3a27 100644
> > --- a/scripts/boards.sh
> > +++ b/scripts/boards.sh
> > @@ -29,6 +29,13 @@ case $info in
> >          # for V3M, but results in an image.
> >          parallelformat=3D"YUYV8_1X16"
> >          ;;
> > +    "Renesas Draak board based on r8a77995")
> > +        gen=3D"gen3"
> > +        vins=3D"4"
> > +        parallelname=3D"adv7612 0-004c"
> > +        # FIXME: This is a hackfor D3, but results in an image.
> > +        parallelformat=3D"YUYV8_1X16"
> > +        ;;
> >      "Koelsch")
> >          gen=3D"gen2"
> >
> > @@ -70,6 +77,8 @@ if [[ "$gen" =3D=3D "gen3" ]]; then
> >
> >          txaname=3D"adv748x 0-0070 txa"
> >          txbname=3D"adv748x 0-0070 txb"
> > +    elif [[ "$info" =3D=3D "Renesas Draak board based on r8a77995" ]];=
 then
> > +        hdminame=3D"adv7612 0-004c"
>
> I don't have the D3 schematics at hand but this feels wrong. Why do you
> define the adv7612 as both a parallel and CSI-2 source? IIRC the D3 have
> no CSI-2 IP?
>

Why is "hdminame" variable the CSI-2 source? It might as well be the
VIN source, as for D3.

To me, and I have added it here because it is used in yavta-hdmi in
this way, is the HDMI input component.

Want to change the name?

> The reason this exists for V3M is that it has both parallel input in the
> form of a adv7612 and a CSI-2 input in the for of a adv7482 connected to
> the CSI40 IP.
>
> >      else
> >          cvbsname=3D"adv748x 4-0070 afe"
> >          hdminame=3D"adv748x 4-0070 hdmi"
> > --
> > 2.7.4
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund

--dwWFXG4JqVa0wfCP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbgDJBAAoJEHI0Bo8WoVY8GUIP/3q07T0Waaf0R/zEzN7Fiux7
FlQEWKxmns8p4p1t+Cs0VpS7ISOJ7avc/6ELd5Sxh3CCrp+s8kOvRl8bw2tefIpL
GAdCrcNZ0EXvkqSl7ALiUZjtNNfAdTXR6D0sUbzMM+eQRK2ixnKyvQf+Zu2GoRUN
YNkUZX2Y/Hzb64mhPob/qFd4Y5wtlmXEl4tis4NnpmetRX+42NNJPbm3zHDnDKT7
Y3F7EGhexH3i+S04OzK+pB0zC8/BkzSTPpvyPQx1kyeZR0anYaZo8PYMS62DOaDb
g157TR/fdMCdAmLXbatqxUv1j4KOMmilU5G70DsZAraAWQn0S08HdGs7oYH/oo9T
QHgZikA/iSkzXyhxkCI/i+no+/s2yqfDwgYvByC5DvR3ni2tlM5UZDLanM5drcoI
tnR3zOr98AHsjzzNt5IKD/Ldun7NjwnNMUoJTRDb7QRuSvK0s9C813pAaX31za7n
AhjYEwxxNDb4Iam6CFtyEvJT5yt5FGYmfU3F6tyGaaUCveWW2jOfW+3d9um9mcek
RPuojxMWNwHxExrOgEBcJzy6Y9rJ/jZLB8H+50qyiXQFaIXpGiWowTK7JJj1EMvg
eQavZYreObT9Fy+/b3YEUplFZH/UBaFiYA9pn5tlZ+fooXXpQ44erKqNjIrjQ0+R
4MjqpcT2yyfIXPiGDuXI
=Sa99
-----END PGP SIGNATURE-----

--dwWFXG4JqVa0wfCP--
