Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40420 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751525AbeDEQVh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Apr 2018 12:21:37 -0400
Date: Thu, 5 Apr 2018 18:21:35 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [RFC PATCH] mmc: renesas_sdhi_internal_dmac: fall back to PIO if
 scatterlist doesn't match
Message-ID: <20180405162135.cw3y7ycubzbfem24@ninjato>
References: <20180404170035.5507-1-wsa@the-dreams.de>
 <CAPDyKFoFehR8PD_tdFa4gubvbFXUgm-ig25Jn6nC4jz1ffqJTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="frqc4ouezyosng3r"
Content-Disposition: inline
In-Reply-To: <CAPDyKFoFehR8PD_tdFa4gubvbFXUgm-ig25Jn6nC4jz1ffqJTw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--frqc4ouezyosng3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -       /* This DMAC cannot handle if sg_len is not 1 */
> > -       WARN_ON(host->sg_len > 1);
> > -
> > -       /* This DMAC cannot handle if buffer is not 8-bytes alignment */
> > -       if (!IS_ALIGNED(sg->offset, 8))
> > +       if (WARN_ON(host->sg_len > 1) || !IS_ALIGNED(sg->offset, 8))
>=20
> The WARN_ON becomes a bit misleading being a part of the if statement,
> as it should never happen when the driver has set ->max_segs =3D 1.

Uh, yeah, right. So, we could simply drop the WARN_ON?


--frqc4ouezyosng3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrGTQ8ACgkQFA3kzBSg
KbYZDQ//UWffOetnDMiugez6bx3H2vcW2OWcpFA71WFYZMbnX6QvrqjRoYXgPRrs
IqNZak7f0fjK4PSvPo3dtkm3NF0pS1CIzhAaviHWEQxMDKA2gFp11GKE06tH3D74
YSR+6gZEqwbWqVgE5K4n+/H9+t7yFBPuB3x4FXs/yBWH9FcX9pTA9TSSzPUM0vf1
lfn2RNZ0F0BYqJ1TkbywBtBiwFBI6II0QG4+3sttwd2LrwKm0ZFYme7ZQSZfYvnm
ZnH8OrKv8AmOJiKctHcx68T1AnmZWlXS5FyjZx0sM2tP1u4LckO1dceWlkItaJI0
8OYdWjQIGb6wRDYysuhuwGJrFuqGzbw43Mc/rM66QRy+hxXxwDRh+efrg1z9cxDM
xDE4iy00w4z8cEZaO4/M+e6mTbXnbiL9L98EhbTbo9sfPMedKOjSlZwHIm+qKM3O
lBA8T7DlXSSEPvTm9ROAKlp1eesDrl0hupgtDvbk7pq2+Kh0JkvcR3af855c/D2s
QR6xM+xYs2X37ARZ5VTZTXNJ2q0yvakQYqmI+o2iEYefAF91hukzrjj6+3zOCYVx
xy3zoY/4PuX6FUFslxlBtphHghXpy/hc7J700Mtsi8Sq5Me6OEJJN2wBydi0/jMK
6fKAUu+LsJxWELM+sV31RPu7HjY3quUOxPfRpOKJrL/GS0ukfMI=
=QMNj
-----END PGP SIGNATURE-----

--frqc4ouezyosng3r--
