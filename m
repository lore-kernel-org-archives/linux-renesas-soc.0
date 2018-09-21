Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41136 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727392AbeIUVhM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 17:37:12 -0400
Date: Fri, 21 Sep 2018 17:47:42 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 4/5] pinctrl: sh-pfc: r8a77470: Add SDHI2 pin groups
Message-ID: <20180921154741.GB1124@kunai>
References: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537278478-1744-5-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVaU3f=Vi=VZYZPhUxoPkDo5oBjDZFnPjY1i-P9xPbEQA@mail.gmail.com>
 <TY1PR01MB1770EE6046C6FD96C17DB829C01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdW2XGA_jUCOqZ5x5m7Vx_r0NeKJW=_zunVSvXX9sApXEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y7xTucakfITjPcLV"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW2XGA_jUCOqZ5x5m7Vx_r0NeKJW=_zunVSvXX9sApXEQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--Y7xTucakfITjPcLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > 2) Specify SH_PFC_PIN_CFG_IO_VOLTAGE for every line that belongs to
> > the interface, keep the SD card pin groups as specified by this
> > patch, map all of the pins to the same bit in the POC register (as
> > per pin_to_pocctrl is concerned), and the board specific device tree
> > definitions would look like every other RZ/G1 or R-Car Gen2 boards
> > that support SDR* The only downside would be that the kernel would
> > read-modify-write the POC Control Register with the same value for
> > every line in the interface.

I don't think this multiple RMW is a problem.

> This looks the most sensible solution to me: just map in your
> .pin_to_pocctrl() method all pins of the interface to the single bit.

I didn't fully get if this one bit controls only the CLK wire or all the
relevant wires? I assume it is the latter one. For that, option 2) is
totally fine with me.


--Y7xTucakfITjPcLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlulEp0ACgkQFA3kzBSg
KbYQVhAAmcWNhRNkMnbkDzAUXPTyo6ssaDd+64eaPQ8smtkZ9Zf/iNlwoWJobvzv
obCrB+fi5SLgYR+S9RKJDI6I5HPwqrD6pwWtYBtI02reSLZwefp0Knuz8I4wwdYY
FxpdIvMzaZjlyLs/5rzyw2HmlEXnAKYQ4/P4UwiYvVWQXQJJwYbTC25TEU2BPWD7
aVvRTNlh84B5f73sxT2xJMm5XuyBY3523SBdlhp7VSOTgKSknozMJJ6Vq6zQeHLJ
toz5jq0xNs4/Khu1wYShXHSHo9auDRqI0IQDAtEqH+VV09FzQCPAgF2oDeLHgzVu
5VSZ6d8yfQJ2dCGjtGu+IJbNmw71ekALN+p+tVz07e6Xxsk2IX7I/DkPatvpXAfN
70UemB9N5WhcnszIaBfN/ympABfY6yKq3CMtX/21ryt4xWxsxHgzLCuzcZi+flsH
8EkYDv2pkNly+WxBhKmI73QxqAjdLkzMNaUMSgFV6DPijSN0wIUt8jLhbU0yxgyz
KrQiHiWWdPbl+TxPwJRWpQuItBHxEtG23khpRXRNnOkK2+8XczfYTSmZ/bIomMB/
mDX/OSm1w0JpTVAQ6/1UVMyYVAQAyjaSbQZpZLjlolN9H1TrDUedWIxrVrwRvvE1
cqiWRWVxyB0nFaZXmEH9ILnwYw6C1EzzmgHiUtPJzCKIANxwA7s=
=NmCi
-----END PGP SIGNATURE-----

--Y7xTucakfITjPcLV--
