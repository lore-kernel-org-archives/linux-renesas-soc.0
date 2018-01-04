Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36892 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752835AbeADMAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jan 2018 07:00:37 -0500
Date: Thu, 4 Jan 2018 12:00:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: Applied "spi: sh-msiof: Fix timeout failures for TX-only DMA
 transfers" to the spi tree
Message-ID: <20180104120035.GC10774@sirena.org.uk>
References: <E1eWn56-0005rw-N5@debutante>
 <ff4bca03-24aa-e77b-23ad-63ea01b98a2b@de.bosch.com>
 <CAMuHMdVnYeQhdnJvaXWzjeH4LF_RJ_VdXMuJCjRqcPFABtveuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVnYeQhdnJvaXWzjeH4LF_RJ_VdXMuJCjRqcPFABtveuw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 04, 2018 at 09:26:31AM +0100, Geert Uytterhoeven wrote:
> On Thu, Jan 4, 2018 at 8:05 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> > On 03.01.2018 18:44, Mark Brown wrote:

> > Would it make sense to forward this to -stable, too?

> Yes, _after_ it has landed in Linus' tree.
> I didn't add a Fixes tag, as the fix needs changes to apply to any pre-4.13
> kernel.

> Most probably it will be picked up by stable automatically, as it has the
> magic word "Fix" in the one-line summary.

I'm also always a bit worried about just sending things on when nobody's
been complaining about problems without lots of testing.

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlpOF2IACgkQJNaLcl1U
h9CPIAf6A/8VfI3a+ChcCzIxAegKBse/AhU+c4nFAqYNNKQBAVMOEgnw/0GIMIQD
1BQS7ja/Tn9xDSnJHn3kfuzeBFyeyrape6A+C6yKDpEyK40pI9xKQ3JQVQPpfoMR
UjspRqkz7ievfrdG4vM2DITToHMFV4zW8f87x5gPrGRYSEhDBE1O8eD2Mw9d+q70
OhC6aKZl5Q4FL41x3mlJhk8RMFcf7lRRitvvi07FUnsR0h1INIUjSOHvdjYkdYD8
CZAIAQiSi1UyO/46essQmaNGkRMrn6rUMX/KR4NJA7Xjx2kj7jIlud3VyN4K0Cgd
uTf7zDY8PqNrZ2mE9EOFfK1e9/8bbg==
=Ic9u
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--
