Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53780 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725750AbeJJHNX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Oct 2018 03:13:23 -0400
Date: Wed, 10 Oct 2018 01:53:58 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2] mmc: tmio: Add initial setting of interrupt mask
 register
Message-ID: <20181009235357.5ilx45oh6eym6loe@katana>
References: <20180926150026.668-1-niklas.soderlund+renesas@ragnatech.se>
 <20181002225402.GA812@kunai>
 <20181005155056.GX24305@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ogvp2zacfeu6wz55"
Content-Disposition: inline
In-Reply-To: <20181005155056.GX24305@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ogvp2zacfeu6wz55
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

> There are already checks for TMIO_MMC_MIN_RCAR2 inside=20
> tmio_mmc_host_probe(), but I agree with you it would be good if instead=
=20
> of adding to that start to move Renesas specific code out.

Thanks!

> I did a quick test and it seems sane to move this to the end of=20
> renesas_sdhi_hw_reset(). Before I send a v3 of this what is your view?

It seems a good place to me if it also gets called when probing the
device. From a quick glimpse, I see that this function ends up in
mmc_ops->hw_reset, but I haven't verified that the MMC core calls it
during probe. But you said you tested it...


--ogvp2zacfeu6wz55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlu9P5UACgkQFA3kzBSg
KbZAmQ//fcJqomG2fiCE0xiE4qjmmF1UiNNKlvyQU8GKr7ecEdndLJi4sh27pzGD
3uwdVH51ZVRVqT/ewmvdrBwq64I/0ucOGI7x8Xd01jfAVpDDiOwcDVFzYtxa86Ae
tAbF3OxHUHzcFlhZ3NDz2CMZwBLyKfEJN1FNZio1LYrXuGeU7c+MkaTt5GfU5plF
sbw9tMUP/33kOYLkh7X6g4UO7CmIfCK5HSZ1G6rCEKqO7xVA32gKgcuiHhfH11rn
Dtm6t7BslaT9kVYOVCLXjZBh+Z2HecCRPkS43zS8Nx9mZFdPIRP5LvfAeUd3k3/f
rMWWtQl8W3FFztdVmIuFXxW7cdZrAYb6AefjhRUraiqMTvhRLbTTrnorMgWsYYuO
busAwp8QpbCHXUTuc+uobBWDUt8T3deoTCZj8bvP5kjviPHZkiLWk+SowNffhaWX
4FQ5jkAUndBoPz63clTxYr3PL4NUwJ0heMvwwwKC93eO7ittc33BFc2MHa/EgkPq
zJhFgPMpfNlVPYwVOslLpFnJlwClCRPhZlI5hu+hEMZgNpox71MdKuMnevD83xCe
DdyWyFVgpR7sN5lQf7zwrPfctdStJpjB7CY13acdQrOEPQvBzCim4vLgYCZA/F6k
ga7jfsLtaaec6oev+u4lAbqGGbkrQAb3xK7t4flWOF+a2Q8JbgA=
=qM3X
-----END PGP SIGNATURE-----

--ogvp2zacfeu6wz55--
