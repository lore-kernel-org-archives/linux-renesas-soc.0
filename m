Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:50042 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728172AbeGQIBg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 04:01:36 -0400
Date: Tue, 17 Jul 2018 09:30:21 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] i2c: recovery: make pin init look like STOP
Message-ID: <20180717073021.djzs2smgowlmynez@katana>
References: <20180712174919.14447-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXKk=ON9kabroLUAexCJ2xRQEOCtty+sTP1vsqiusQBEg@mail.gmail.com>
 <6101f50f-0bf5-b660-0cec-af089eddcb1a@axentia.se>
 <CAMuHMdU8CGB6tzG3QaoVJBwrB00PwWEKTa_YW2myErepwAXzKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xifpg5jhdm3anc3u"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU8CGB6tzG3QaoVJBwrB00PwWEKTa_YW2myErepwAXzKg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--xifpg5jhdm3anc3u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Any change someone changes RECOVERY_NDELAY to 1, leading to a
> > > zero delay here? Is that an issue?
> >
> > No!
> >
> > Above this, there is this line:
> >
> > #define RECOVERY_NDELAY         5000
>=20
> I did say "change".... (and the first once should have been "chance" ;-)

Still no ;) The pulses would be so small that devices won't recognize
them. 1 or 0 as a delay won't make a difference then.


--xifpg5jhdm3anc3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltNmwkACgkQFA3kzBSg
KbZIhxAAi+GJ8UfXOguPSj4mkkTkdmC6e20YKIngDloHDlbzhXQ5DEF3RGHQwQqe
Am1NHTUr2zPcHDJHn17EbEl8E+Wej9v2+bov+hlHH8QlPbRQUlXqPs5t6RrCtyiw
1mkmuinqHoV9ZnR7VRVwIeyt/7lUm2COfhOYecK9NhQPXFUnWTSOvg1JR549/68/
LLOqlIds84jz6h9QStrZ6xuVScZcmYKnqL1SJSqXR/MdH0VF4n1KTtcDYbkOa16h
pXuhjbFAqFHYR7SoE2a2nrA0ydgIxq2IJrSv3ScQKbXpp3BnvjL3p02ReVhwPcj2
wz1SpVe5fkmeR4G0xM9Wt6CScYV2bM4DYJTKComIfAkdPdopGk/kKthvEkMWw7fk
T5VVe0YHYx7DPs5jPxmPxrHoETcsTrH7zlq342Wmbz67EaZ9u/rNFYNo+HOX8tjd
2wtenYTiSmoh4/yNAWoqQohZ+1rQHV7Z/mmgpjvne54JdH9/Vi9hiPU83OYDivBE
p12SjFfQOIGftxOE8uegUqVUJKt5Zh21NEXa6KRdxD7gKTooGPhtiEBQeSFiKETQ
++onZjHHAh0PYtD4ujdPUo8rJXvQxpn5pto/K/xXyY4LvuywoV+PjzxMS6B1a4Cx
VIGoTybUSIi1VmP+h3VtDKO7iopfpupVbqXGISYHx7g4sfa2k4E=
=zHF7
-----END PGP SIGNATURE-----

--xifpg5jhdm3anc3u--
