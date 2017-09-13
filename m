Return-Path: <devicetree-owner@vger.kernel.org>
Date: Wed, 13 Sep 2017 22:53:33 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Haavard Skinnemoen <hskinnemoen@gmail.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 2/3] i2c: gpio: Add support for named gpios in DT
Message-ID: <20170913205333.wjtmg6727bcsxjrg@ninjato>
References: <1503566474-5335-1-git-send-email-geert+renesas@glider.be>
 <1503566474-5335-3-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="iq72dm2lyronaoe4"
Content-Disposition: inline
In-Reply-To: <1503566474-5335-3-git-send-email-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--iq72dm2lyronaoe4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	/* Try deprecated unnamed gpios */

I think adding "(deprecated use)" or sth would be good.


--iq72dm2lyronaoe4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlm5ms0ACgkQFA3kzBSg
KbZwrhAAgYNe2RokJnCaXTcx1ZNWk/rTPfSqn9U6XdtbcPqQKMt75Ce4yuCplKeF
+cB5jVq4mhKtRfrTjhr987c3JQ1i5E0f3BZlpYKah6dcwzYlM9vwktcVAFwMTmZi
70gWC9o6ULw1wwLkkrqk+/TAKuLJy9fiE7pbH1X41XAkBWCtJLbb3slkOGNbppPj
8SLz0vqPGvI/k3VXykjLjGKAh+VmuAENIXNyV3cClkQ7rjU6/o/AEEp/LafsQIco
3rs6al6vZv3lVYuEiZyUVVFuenPM39FstM8tNrD1k7pfaM2Q8Cx/QmLzi9YKnY78
oqeFeNFLh9hU9TLASFFj5QjB0zakQqoP9bfpbnwuMB90p/UuzHsCA6xqrkVDycTz
mYX9hsWhlgQl7iGOyEv9gLGocEMs1TddzV2iJGWmason9Y5z4w9o7tcbFslr4cbG
Sx9pcCvENExEohXlwDaSf93b3kaskU/R8E8pExs8p+FMqB2YsI//Go7DbOFarHvq
aBer4sd1UO3zcMAIwA1pe0yburVFnFR1wXTCSnVW5njOh4JdDIU3I1zJwY7qQh7C
Rc6agWZy8mqjgNo4r+dNb1zdXb4r2u3fOxDKY1Xlcg4xdCGueSIJe7G7//aaVbts
ejjxmC6EmnqtitFKWzlssup43Gm1TIc//rSGx7ufFmQhuAbJsoE=
=2Jaf
-----END PGP SIGNATURE-----

--iq72dm2lyronaoe4--
