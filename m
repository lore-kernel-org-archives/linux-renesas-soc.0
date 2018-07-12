Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58488 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726744AbeGLQbi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jul 2018 12:31:38 -0400
Date: Thu, 12 Jul 2018 18:21:21 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: rcar: Implement .get_direction() callback
Message-ID: <20180712162121.z6xb4pv3beifpk6b@ninjato>
References: <20180712091501.22344-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jwlhf5nyxalvajbl"
Content-Disposition: inline
In-Reply-To: <20180712091501.22344-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--jwlhf5nyxalvajbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 12, 2018 at 11:15:01AM +0200, Geert Uytterhoeven wrote:
> Allow gpiolib to read back the current I/O direction configuration by
> implementing the .get_direction() callback.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

So, despite it didn't help solving my original case because of an
unrelated issue, I verified that this code works:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I'd still think it is better to have this code than to not have it.

Thanks Geert!

Regards,

   Wolfram


--jwlhf5nyxalvajbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltHgAEACgkQFA3kzBSg
KbYbOQ/7Bf+hKke9NkBXfCWiiMthwY5n059KsRxowyIe0FK002X+z+AOuGr94u/0
XTj934eLTFhvXibsKVWEJyuC/Ofs5ZxF88O2KrUhwRRNaJcycDYobjV679ZSGZ10
domm4PJSSJFEm9opZ50vL6Ng5zVPJogi57KXc91lJVq9lVYEZg0xJWi5bC/8jjyk
k6QTYvTEwuejUd7GCdyLsWy8xMWchUlR4HQNVLUX16B1sv6nWFv37r2yQWn6cqhq
UpA/pk2v1lm7el31myJvIXQOfnxKGq23GVmKAOpp4iG8110s0Rv2cmpGE0PqNPf/
ZkLaJ46YnXGQdpZXSO5dxOzzfT9UQsZf/Qb8qZuLvx3KG9Al0YZua5XZ1grt/mAU
WNd0g9JQmM5WsMQ4uPGB3WtXC0i6XvNYud39D9UFEsx4e/2SHELIE3XiqwDxat3i
aEtnytioOuY8szLQrNaztnwEvr6WJFiywIpC++pCNvxQ0CQxi2v9SH/S2jKLrtqG
kD52YuJxNAWlX292mlUl9ro6UmmRjgF5kSf6pZTOSsXjtl0eoaJPjyfTcCRXxP8i
NcYjDEjM3yby5NTNe9M4QskMKMda4dSxjnLNpagXdxPc+kLWgSIA3nyfJtreUg+R
Cr0fNsKpcEQK+443li/vFKjDo8Wi/fjVnR7ljIO0Vc36MHlDBQc=
=cNmz
-----END PGP SIGNATURE-----

--jwlhf5nyxalvajbl--
