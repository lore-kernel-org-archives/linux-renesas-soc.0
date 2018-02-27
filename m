Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41663 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752056AbeB0NCY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 08:02:24 -0500
Date: Tue, 27 Feb 2018 14:02:23 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] mmc: renesas_sdhi: add eMMC HS400 mode support
Message-ID: <20180227130222.zsz73d3upi3s7vjv@ninjato>
References: <20180213123358.13212-1-horms+renesas@verge.net.au>
 <CAPDyKFryhg=5G9G3ss3hFSAuri1-_y0uu7ZK=PNGJ0TF=-__DA@mail.gmail.com>
 <20180227090757.wvm6j4sy5nmeecf3@katana>
 <CAPDyKFqMacY1THjO+cTb6Aws3mCnbLogui9T6PjiVcoR89FiLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="egbdmspa5t6ow45z"
Content-Disposition: inline
In-Reply-To: <CAPDyKFqMacY1THjO+cTb6Aws3mCnbLogui9T6PjiVcoR89FiLg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--egbdmspa5t6ow45z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Perhaps someone need to explain in more detail what the HW controller
> needs to manage tuning for HS400? I don't like that we may end up
> getting it magically to work, then it's we better understand the
> details and if the current sequence provided by the mmc core can't
> fulfill the need for this case, we may instead consider adding an
> additional pre/post host ops.

Thanks. Exactly this thinking prevented me from saying "It works, let's
ship it" ;)


--egbdmspa5t6ow45z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqVVt4ACgkQFA3kzBSg
Kbaz+w//R8ZxwuWO7FK1dlKgl8m3BMkWiY9GJ0z+SMlBuDS7XwXosRRUgvcf2taF
Pu17iCgLaMbLlQp/lWnpyPBJncjcg036FW+klc82Hbqwl7wU8RPHaHf4xP+QpIiS
FO/GwSshDkt4fKXoRv6rIneUl5VClKl/+zFbvBk0lQslnAfsyBluwwRuNPkYXJYR
cg89kJmeBOFsBkqVjeqBcPkYntg5TfUufW2tWrXvrb0LK44/waMG5N8dborW6V/u
aCUl1EHVWE33pPY6X1kUgEKcvMrX/q/TAj7gOrVaZV1dudV4TP4FcCpBWJKCnVUM
IXHke8pFmG+U5h4Na7jTrn1o8Jh6z+wEorp3xtjhLUfz0F+xC4Wk3nxHNx73aXfJ
v07vYiH2l+YLgBu0TG12C9LC03cp2XUnpPQDiCazb0oX+tLwQTIDwiW4JvxafrWJ
GazUodm0un0wDXjpJzVo+q0654d0Bvl507ODlx9L8MupeuUnXCvKZkVEhZoFqLlU
X3VEuW/Yv2AUUBUvwpCvkx9OKoT9LMEEU2PER05OyOWAYCwa7J6t3+WDTxVu1QNV
YDQ3T+SBc3+Z8/eO2kSLpxVmnCvAavAk3gtXUlEAK9znpkJYREDZECyK2eObiR1i
//o57272XCbm2ZZi3OvV7QMoNMuQKwVG7Jvi9AfX8SS7knNBay8=
=BsTl
-----END PGP SIGNATURE-----

--egbdmspa5t6ow45z--
