Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:49764 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750989AbeBQITC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 17 Feb 2018 03:19:02 -0500
Date: Sat, 17 Feb 2018 09:18:57 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 1/2] ARM: shmobile: Factor out complex condition
Message-ID: <20180217081857.xowqahwnzob6titp@katana>
References: <20180217020642.21375-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="poc2wxmm6x7wjkta"
Content-Disposition: inline
In-Reply-To: <20180217020642.21375-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--poc2wxmm6x7wjkta
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> -	if ((client->addr == 0x58 && !strcmp(client->name, "da9063")) ||
> -	    (client->addr == 0x68 && !strcmp(client->name, "da9210")) ||
> -	    (client->addr == 0x70 && !strcmp(client->name, "da9210"))) {
> +	if (regulator_quirk_check(client, 0, "da9063") ||
> +	    regulator_quirk_check(client, 1, "da9210") ||
> +	    regulator_quirk_check(client, 2, "da9210")) {

I am afraid I don't think this makes the code better, just different.
The index is as magic as the client address IMO. I was not super happy
with the array size depending on the detected board from a previous
patch already. But given the next patch which modifies the msg array
depending on the board, I think we really need to switch to seperate
message arrays per board. Everything else is too error prone and
unnecessarily cumbersome to understand.

Other opinions?

Regards,

   Wolfram

--poc2wxmm6x7wjkta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqH5W0ACgkQFA3kzBSg
Kbb4FQ//butnJthB372wxPDCLyXIvbZo6F35plubTN87anEQu9Cpi1hgzpF8qGdR
QcVR0LdRF2Uiijh5g23UXYRARfpx8KN89sAd1tQtkQOSMdbnp3PQgBdyk3kjb2WE
MouABx3NfFT5a1K8FJphXkAvXICNKsCP91GnP9Xv/34dDXvA09NIZErZWcE1cLDg
JrXbi0Av9ipzy6vBhe0eL70A04x4iCuXLLryykfhUQUFBV7fikjmE+1TKzvDwnQm
MDGvEIbyUmsNW76OmuuiGg9OwTtTNaQMntjXS/Pkx9pn8Vy9J4eypFs2QZ1f0Myp
uniRvtIS6IMucJEwYk2QZKUeb0cY37/RcqOaLiPC0h/Lx1WdKZvQz8+URSqL/mXo
cQPi7lwR7iuSYJyjHh9u6b7m6tVcrwr/1ddFmK+bDRBMfbNpjsoxT78RNVKe338D
+rnSC4j6y7UjjxSGN/4C+V0WHFxonytS+X1s+47OmvgXQkp8g1qA1/GfGV6seViB
lLr0a9FYTGX8OkxJ837SVSa0nqDlxjm/FDBFrkTVfImVXzBaT+kCI6Zyu5JzVhCp
gRZnr/RSPlCLfhOjacHjkuENBXve1pl5figHatHT94LZYaan3P19hySB5sXkLjOr
q1yuHO8VNLSas++0ecKuhVJpljItR1cQ2l+qSPJtWGuaEyIlgh8=
=VsSb
-----END PGP SIGNATURE-----

--poc2wxmm6x7wjkta--
