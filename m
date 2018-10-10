Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57576 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726206AbeJJTAv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Oct 2018 15:00:51 -0400
Date: Wed, 10 Oct 2018 13:39:01 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2] mmc: tmio: Add initial setting of interrupt mask
 register
Message-ID: <20181010113900.5wsj52nrhdwocfwn@katana>
References: <20180926150026.668-1-niklas.soderlund+renesas@ragnatech.se>
 <20181002225402.GA812@kunai>
 <20181005155056.GX24305@bigcity.dyn.berto.se>
 <20181009235357.5ilx45oh6eym6loe@katana>
 <20181010110833.GD24305@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="24kvdlz363j7yr2z"
Content-Disposition: inline
In-Reply-To: <20181010110833.GD24305@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--24kvdlz363j7yr2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I will move this patch back to the top of the reset series as it would=20
> IMHO create the least amount of code churn. Another option is to merge=20
> this version now and move it once the reset series is accepted.

Less code churn sounds good to me.

Thanks, Niklas!


--24kvdlz363j7yr2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlu95MwACgkQFA3kzBSg
KbZdBA//X9WrisSHj+O9npM8WsqQZ3SXzz4MEbs0JFDEoLyYCYl67UlVlpN/v8mo
U47bix4LqYqNqzIUX5l3zrrygoYr6ufqHG466MzH3l9D6ohiOwMPjVYJiaiFL7mw
kWayhMPSo7ZrMnGY3hyA/sgmdedVyHj1W2EVxWp3eTq19RqS7rHXwCmX9tMl73oF
DYGV1BGH5ihFxUNuZDOzEn2SMHLzZKDGKMDrFi/hILgmzJf+wUtx4fvQjXFRNh6u
FyEpt1rOSML52euJbp0q9NM/cK7jHQdubK6f1atPi6v5N2Ji16WgXEaNN0U1QfxB
Ry1AoW8LqlX3PWHPOqGvndGQidFVbpQx6dPNBbMBvlFojyh+oRWg6FptCfdk2qYt
z0khHzdjMzJJebtWFZ7CTOqoX/Z87cZb7rnmXZr7yTgmljOV7v9tQX4SWzMlsn7Q
VNzEAIVs4NjTqzHUxpprX+gtABFOoT7AV1tOLBCYbyLXb0ffI0kQzAxmpRI8pVdG
ox6vpCmlW6YcugbR/72Of6uFhS9YijcsYHryZVtT70DIEIaiXTkkDt08vAWxPl6U
cFafm6HxLbRfsyPjbunaMRNo84wbTyRe/R4ZrfAW6piFkQTOJj31/onegOhjZLNQ
BSZFBSO1A4BTBE1i5SR1Q14AkCPHt1Us4+4CObtxbGbumXkN+/Y=
=8UZQ
-----END PGP SIGNATURE-----

--24kvdlz363j7yr2z--
