Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:48506 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729021AbeKFR66 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 12:58:58 -0500
Date: Tue, 6 Nov 2018 09:34:50 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: r8a77990: ebisu: Enable SDHI interfaces
Message-ID: <20181106083450.GB1054@kunai>
References: <20181105214117.11734-1-marek.vasut+renesas@gmail.com>
 <20181105214117.11734-2-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline
In-Reply-To: <20181105214117.11734-2-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	sdhi3_pins: sd3 {
> +		groups = "sdhi3_data8", "sdhi3_ctrl";
> +		function = "sdhi3";
> +		power-source = <1800>;
> +	};
> +
> +	sdhi3_pins_uhs: sd3_uhs {
> +		groups = "sdhi3_data8", "sdhi3_ctrl";
> +		function = "sdhi3";
> +		power-source = <1800>;
> +	};

Shouldn't we have only one pinctrl config here, like you did recently
for the other Gen3 SoCs?


--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvhUiUACgkQFA3kzBSg
KbZd+g/9EOLzVUWAHVct5mpBvkpBeHY5MUG0Yx8AD3BqbAf1ANDQUgQc/3PnJT9n
PQrqmX+paUPJOQRLsXiuaDpXIRS9POrKCV13js7KuSAzOy1YP+ahQIVVPbOAtHo3
PwY5DeV5CIsdgq8aXV44JRqnDYAMi+/BS7vJG8/XhfYVNQCtDJ2EgkV89KJJCMEX
YE1sQzTZBURdRURPpAo4JawpkCAXKs3RXfdW3XCRdfrcABXJDz90k6hXulnryaOL
jf+Z5eKKWdfwnNE8FisfYNFOszTBlgo1eiB2A4JEWmtldczGADh7iBMXOKSQZyw+
iQA9EUeVKW1lltWQSwYRcZcPFPI3uT13gHCZLbXwj52v9aaL55g4os4ZBVWkTs+G
1XaIcD0Jl6ZvSj1sz04OZQNxfh2iddPpOY1NoS3vieRhkULX/1TyVJg/sVcFQtrD
Ek7mVRM9Alep6tFv4fjqraxXQpRxMWZJiFQXGR9iDIYYv7trfidUTW75B2rUA71A
6RmhXFO2IdFzfDq16jpuh13tEXpp839I+AQK7QPYylMg0E6e5dH7Hi0Mu0DYpeJs
0fX5dO82bP/dWk6aU5TkwS4Qdx1x53MwVhzJxVkBTBOHc0ELLBLUHfAP7Mwvn2YK
pLcUUeddS/tjpmPLFV0/TneEtWNID+GghLswHoVJ5dG4elcpbPo=
=zhfs
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
