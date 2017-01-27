Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:59476 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754038AbdA0H2E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 02:28:04 -0500
Date: Fri, 27 Jan 2017 08:27:28 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170127072728.GA1473@katana>
References: <CAMuHMdVQVX9T7kxo-akbJQdcTwV2hA4188T57KBMGVdCFYw3jA@mail.gmail.com>
 <20170126135453.GB2718@katana>
 <20170126140643.GA11104@verge.net.au>
 <20170126141656.GD2718@katana>
 <20170126152413.GA12534@verge.net.au>
 <20170126201702.6kb62spuvx6jgll2@ninjato>
 <20170127063327.GA13565@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <20170127063327.GA13565@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Using renesas-next without mmc-next I see the problem above on the M3-W.
> Using renesas-next with mmc-next I do not see the problem above.
> Using v4.10-rc2 I also do not see the problem above.

OK. So there is no problem with the code, at least.

> So I believe we should delay the integration change, which is currently in
> renesas-next, until the driver change in mmc-next hits Linus's tree.

Whatever you do, H3 and M3-W should be treated equally IMO.


--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYivZgAAoJEBQN5MwUoCm24L8P/1u3bHsHrn+4f0Dl5YspHF3t
Y93/OOcDmb88AOTSQEmO6UkUKI8zKNgAjVhHic6oZ6iRPs6nkGoJrCycbNUPr0og
Q8EqzJvIVmJQiCP65Zm/mEcK/3e7gTvKZK9PQYIozOJ7fV2N9ysizSveNaP1GBTl
iQKQ3lk80hrcfhwR7AmNyRYpjw8/zAWfH7WYpbn1MYyJ7WJWJwdOCjZYKK82yf5i
hXz/69KPadebx2Iwjdt4iyC/TSkYgYPVGXqyWljF4pYs+uTp0eH0DutqEOUs7qWK
dH3LB0revvS43NSb3bCtWsguH0N/B7k7sfUkKoh6K0inqwNf/8PI+Au04aHK38sU
hwMMfesCgmZ2VownFw9OpuJRXeg8iOCyxTeFx8xvAeK2ADUKxHo4LQYFDZb+GqgG
ipmGpcRpQY9LW2oGQz8+LlPF8SoYB2h1youmJuRxy5Tf8EWs2QLLWJxcxkoEjhDp
Ub51MT/RWU8RZ8/O/LdNr8JZixtPzyXvFVdiebQJqlDj3MybrB1G8Mug/KoJc9NT
Mx2+Xh1pUiD8F9cpGwc9sb96OldGflSFQPjio9os8b5saEHqSDBRgC9QAI0mu4x3
wmalnUx3mVPNl5ivoJsT2tai6z3j5Ijy1ZtlC5Il84x1tyQVhOlq39rNI2G9JN2d
kXPIjuXokjl6fbGZTPnk
=0vV1
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
