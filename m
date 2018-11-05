Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44050 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387640AbeKFD3X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 22:29:23 -0500
Date: Mon, 5 Nov 2018 19:08:29 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 0/2] renesas: rcar-gen3: add HS400 quirk for SD clock
Message-ID: <20181105180829.GA966@kunai>
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
 <CAMuHMdU9KewOQLaNrrWxd3YfLJs+uwto9=fSwo9r6QQCYMy2gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU9KewOQLaNrrWxd3YfLJs+uwto9=fSwo9r6QQCYMy2gA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> Is there any chance this can start to bite us in the future?

Well, there is always a chance but to the best of our current knowledge,
we can't see it for Gen3. And even then, we can still fix it.

I was entering SDHI hackfest with the attitude of representing the
hardware which means exposing SDHn. Yet, I got convinced that getting
and keeping highspeed modes stable means turning a lot of knobs
currently. This is not only true for HS400, but also HS200 and SDR50 and
SDR104.

This simple approach here allows us to have a stable base on which we
can evaluate the other BSP patches on top. Especially those which modify
the tuning procedure.

So, because this change does not prevent SDHn exposure in the future, I
suggest to go this way for now, so we can spend our (limited) manpower
on evaluating the tuning next.

Kind regards,

   Wolfram


--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvghxkACgkQFA3kzBSg
Kbaoow/+O4kV+tztNg2lYqqCX27MsFyQROsliVN5//qIz3pwEoggwp2jhiwvZBRc
sVPD/JoyXrBa46b0Q8rhR76NlgigtyNOcCsFm6sVAI4E3ntG7ArxDroRrPJ07FRP
SGszUD8F6vsSsS5Lmyka8TGMjHCRYHtyCwDkwIL9w55WhIDuA7SKDt13zcXyAitr
Hc/L3prv5sKPrPnJNKlgf2fS4JChYQVRX1p1SewkEfOTgnArn93sZE498HQQ3KPI
QVVLEIx9j//Dbk2BB7qvz+V0NB7lp95j5JZjDBeQeVe9AU0HJm92qHr4gt8NC9p5
Q0CsVeUuaMWgKYwZ7mVB1evfdLA4QOv+oZbeyWh820O3udPestdSH4D5kxfkkFeF
yGDOiF8qr9L+OKAZCkjOQ839tgGwrBB7miPKv2wvDsJg7VPbg4MXMx65S6JgKOix
Qi6lZCUIXA57TXpYDkgVrCXxZjGb8e1df1DB/XHZlf6pfwyt91pLd+YdMFq9PTJP
KFO/jTbIsv4cclqiblrIy/FFvXY07dG1PGq22RpKBpCa72F1DPD0lmYap9wI7TKC
lMLBwf9EMNOen9LUX/U22x+2rC4tCx3VGXpffTWFhFdJSaqVdJO9uzeKJ/6XB/uf
/PfJP8e5JdSM7S7vjPhXB8AxW/bIOHcx4fpEDSM4wIT3zR+/4rU=
=/QUy
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
