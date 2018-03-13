Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:48468 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752397AbeCMUKE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 16:10:04 -0400
Date: Tue, 13 Mar 2018 21:10:02 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-devel@nongnu.org, linux-renesas-soc@vger.kernel.org,
        Michael Davidsaver <mdavidsaver@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 1/3] nvram: at24c: remove doubled prefix for
 ERR
Message-ID: <20180313201002.vz5m7tdobledpc7s@ninjato>
References: <20180312214230.17561-1-wsa+renesas@sang-engineering.com>
 <20180312214230.17561-2-wsa+renesas@sang-engineering.com>
 <1bf57371-c1f5-6d5f-716f-8fd00cb9675b@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mice73doeys44vts"
Content-Disposition: inline
In-Reply-To: <1bf57371-c1f5-6d5f-716f-8fd00cb9675b@amsat.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--mice73doeys44vts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -                ERR(TYPE_AT24C_EE
> > -                        " : failed to write backing file\n");
> > +                ERR("failed to write backing file\n");
>=20
> printf/fprintf are deprecated, since you are modifying this file can you
> use a newer API, "qemu/error-report.h" for example.

Sure, I'll have a look.

> >              }
> >              DPRINTK("Wrote to backing file\n");
>=20
> DPRINTK() can be converted to tracepoint.

I'd leave that for another incremental change.


--mice73doeys44vts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqoMBYACgkQFA3kzBSg
KbZuOQ/+LVUADUByIZO7fzSz8TSWbbcNwFZZAuUaWKMSS9WTuVh8Oede4SAWc6hH
sUXUUOYCApiZQZn88ycolMZIW9w3W+QGPmijLdsPxt+frZ9VJaYSVOr1w4oAVlND
/0P2YgQJM+UvRHA0XXS1yB+M86JfS+RVzqpp+8J7ttzrDLX1NRHXdhRCs9+rxQeV
nSALVJ+jbFNN9Defi2vHENkxzoory1vI1j943HW+gDi1iKh8J5MZbAERN6E+TnDI
r+OdVVAgJO1Lrk+ni+z/fqpjaiOF/EnSK/nHxGvWAdVUgfhC6NbNcq03zyKKOC8v
/ZjFhFOFUlgVg95t1CdaJLt9kac7g2SYgtDQBJPHmOnf2DHnbMez5Gd905TQK8j4
vpohZYLp3moxlOjK4ACIlz7gOSqs68iXaxvw3cuD45pqgCr8nc1ZZ26o4810ERP8
i0J6jLVoChdh9auoGbZpNyc7xturFqGgA4pMXSbX8mUA3JW02dBNwPQl/2cDezv7
va1suosmEoRXvlXEb+Tn3HOwER+3AsFje9+D0g8qG5LA94Fcsh8xihzrxdVJFuTf
QpybiMd7nuAIQ0+RZrvw09ku8ZgtHX/IeFGm4Wmn4Sc38KAJLBk8zcHHORvd43sy
dk4G+cS9Xph6tcXR5Ma/w0jImbsnOozu+q7S09QLBfa1O/Nskv4=
=/dSC
-----END PGP SIGNATURE-----

--mice73doeys44vts--
