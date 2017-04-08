Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53758 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752520AbdDHLGW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Apr 2017 07:06:22 -0400
Date: Sat, 8 Apr 2017 13:06:19 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170408110619.ctleghvryw6ju2td@ninjato>
References: <CAMuHMdVQVX9T7kxo-akbJQdcTwV2hA4188T57KBMGVdCFYw3jA@mail.gmail.com>
 <20170126135453.GB2718@katana>
 <20170126140643.GA11104@verge.net.au>
 <20170126141656.GD2718@katana>
 <20170126152413.GA12534@verge.net.au>
 <20170126201702.6kb62spuvx6jgll2@ninjato>
 <20170127063327.GA13565@verge.net.au>
 <20170127072728.GA1473@katana>
 <20170127081608.GG21195@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sojy6fkkqpgolhle"
Content-Disposition: inline
In-Reply-To: <20170127081608.GG21195@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--sojy6fkkqpgolhle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Jan 27, 2017 at 09:16:08AM +0100, Simon Horman wrote:
> On Fri, Jan 27, 2017 at 08:27:28AM +0100, Wolfram Sang wrote:
> >=20
> > > Using renesas-next without mmc-next I see the problem above on the M3=
-W.
> > > Using renesas-next with mmc-next I do not see the problem above.
> > > Using v4.10-rc2 I also do not see the problem above.
> >=20
> > OK. So there is no problem with the code, at least.
> >=20
> > > So I believe we should delay the integration change, which is current=
ly in
> > > renesas-next, until the driver change in mmc-next hits Linus's tree.
> >=20
> > Whatever you do, H3 and M3-W should be treated equally IMO.
>=20
> Sure, that is reasonable. This is what I plan to do:
>=20
> 1. Drop this series from v4.11
> 2. Re-queue them for v4.12 once the driver changes hit an rc release
>    - Please ping me one that happens

Ping :) Do I need to resend? If so, what branch should I base this on?

Have a nice weekend,

   Wolfram


--sojy6fkkqpgolhle
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAljoxCcACgkQFA3kzBSg
KbZbDQ/+OUT4dNHgGnLtacJqq0fkLBKVuwPXQm99tgSS9IDBWpdCoNqbKnQiIZo4
bDdBfzkkpIsqbcZpmme4DSbcGhio+Mh5kgyv0wzTEwR98hrfeRqruY6Z8721Z0A6
Bhx3/uu+vwy8RmwGZbrp9Yl1YT587scytEw9/7PLEKPRBkv55UumBOCPNYx0OezA
Sm15ldrj4nqxNBo7UoasKso9BRPhEpjiYpoH0657PZrGNjqUweEQ/WjYQ0obdxa5
J0cqjNygGo3P5g3xcjkM8/kBMLN+qGvEUfsfu8dApe/DN3yGurjx6goX1F+X8V16
yfht8/I8UvSclwYSLJ3hcTWAlHFOkiLaHPUeD6IwjCvOEZBY3IgW8gSkr92Xlpak
4TY9nRbX7xY6hUMirUcdZIKjDKsvIReaCQalnI3ygK+i5krDGmPYu1cQGY/ofrvP
hmvo07Q03xxRrNeOwDlLevPbmeKQvoC4eajyN7aMn8fAuqzHVZQXHptAqOi3H1uN
hBQlpAeLZ5zfK3VE+FnvYIY4X3VOvLwZYyZgd8S3E+F1raOfh3OA/q40E4IaSsZ9
JQIlAygKp5sKzUq2LsNlDBMt4frEH8SDingi5TBnLD8XGCnSi68OHHzK7ITDPifV
89QiPRxUo8U8FGIqyP059xdvIn0a1B/dl/Yn7Gvgh3Q/N4LydLw=
=Kc4r
-----END PGP SIGNATURE-----

--sojy6fkkqpgolhle--
