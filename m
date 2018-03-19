Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47853 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934319AbeCSWHR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 18:07:17 -0400
Date: Mon, 19 Mar 2018 23:07:15 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Eric Blake <eblake@redhat.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-devel@nongnu.org, linux-renesas-soc@vger.kernel.org,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [Qemu-devel] [PATCH v2 3/3] nvram: at24c: use standard error
 reporting
Message-ID: <20180319220715.g2stcupst6ifsnrj@ninjato>
References: <20180319213101.6100-1-wsa+renesas@sang-engineering.com>
 <20180319213101.6100-4-wsa+renesas@sang-engineering.com>
 <2071e85f-72b9-9fa5-e5d7-7faa41fb9074@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dtcn2baqe4twlm7s"
Content-Disposition: inline
In-Reply-To: <2071e85f-72b9-9fa5-e5d7-7faa41fb9074@redhat.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--dtcn2baqe4twlm7s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -                ERR(TYPE_AT24C_EE
> > -                        " : failed to write backing file\n");
> > +                error_report("failed to write backing file\n");
>=20
> Drop the \n here and elsewhere in your patch; error_report() already does
> that for you.

Darn, I haven't installed my automatic-checkpatch-script for qemu yet :(
Sorry, will wait for more review comments and fix!


--dtcn2baqe4twlm7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqwNI8ACgkQFA3kzBSg
KbbfLA/+JuW2+64mmglCTSDvScUWt+IkemJLJcC6J0SowjZ5lHUdWVH57v/vnzGH
ihmoZWLPjbamcCjZLMbYKoKZigTbJoyHur6mcxUPMXdhI3qohvq+cAgB8jEKl+9J
xVrlUYH6hI6OYmqD0tNYkQlHe0bvQw6fwTHjjB01kTihy3W3t5hhUG0X9+w2G1bX
CTU7tpHZHXF+wM7VNwRmeCiZNhD44tHBBysK1dirjOQ24rGYdBIwJLylt5wqxjSb
wLJFUhDO0sOZd9rHxcP7hqicJ5KEd+mhj41d53qaIUMTc8Nu8i7VUoAUo9Xtz333
mzO7YAOVV16mBAunll70Auzx6UqCheuPSSF4At87g5l95OB6a0Qtfl2LNFge9Nro
6E2NE6cFXW7VTf+8ECzq0Kfx7/vY2d+nnRTl7yYlcfGUHXWkN9xL1dLUm0TWwea5
gQA5iqNd0ahvFTJ1qPuTTcdri5UsajCJKEEFiY2F8YUUucwNu6GYzFkuxeu5pTek
qOGKq8ZAS5NvP0L+ofBg7VrCSq/nAnO5eUW2eD9vWLb/1hYG1ySvroq0hEIJF6zf
A5YS4yziOsObEzhlsqhWYPLdSzMes+R1yKBGBYT4oIRm+s6goWfFyTqOKe63FKP/
k1nvRU44U5oa55QSb7/TYfVyHI1OyQ+2UA0RTbQqDBkQUplh/m0=
=IGpA
-----END PGP SIGNATURE-----

--dtcn2baqe4twlm7s--
