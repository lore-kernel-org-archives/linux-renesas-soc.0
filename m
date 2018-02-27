Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:44048 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752090AbeB0JH7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 04:07:59 -0500
Date: Tue, 27 Feb 2018 10:07:57 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] mmc: renesas_sdhi: add eMMC HS400 mode support
Message-ID: <20180227090757.wvm6j4sy5nmeecf3@katana>
References: <20180213123358.13212-1-horms+renesas@verge.net.au>
 <CAPDyKFryhg=5G9G3ss3hFSAuri1-_y0uu7ZK=PNGJ0TF=-__DA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wme6awtlbcuivu2z"
Content-Disposition: inline
In-Reply-To: <CAPDyKFryhg=5G9G3ss3hFSAuri1-_y0uu7ZK=PNGJ0TF=-__DA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--wme6awtlbcuivu2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Is this ready to be queued up for next? It looks good to me.

Ulf, out of your head, do you have an idea why preparing HS400 during
set_ios works but populating host->ops->prepare_hs400_tuning() does not
(according to Simon's tests)?


--wme6awtlbcuivu2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqVH+0ACgkQFA3kzBSg
Kba8Aw//QyvU+mFCvMcFSsx+6gproHT52v7qjnFV6FjClDya8sufUDhWNexQseeH
Rfvth9H1plQN5wLjnQWZ91ZiFzw0JYPtlQ720yrSoFsNUd7vihZm+fHwJgjEE8gG
BIb1GlQ9FxSeWXjk+tTC1vVtQ9kAuNVa6HbYTen2RxJeX1cgqCBSPHdQO7+CLjC/
UVrN8N1gg6R8QOJjMHnAzRl+OTnSzT7+R5GKYko9bnz5ukvZjXEhCpSccjHxTg8s
Rus0q2XNUXu3EKuTUFAbW2a616skMfxiymYMlbK4ZOfiuNv38fFVTsUZK2a0qSso
Cxw7Xdk2YVNeX06dMdxnhYZ2zvKUgvZm1jMCMKT8bzh3WJi+z6oxHKTN4CfcBdak
ONbklj6f5S5XXV03+W/fPmErAd3TV+boBebBZ5pPgc58FslVO/Y7Q+kUkf86cdIH
PgNZ+xmsQWLYwjYVACnUsqpU0u2Cc/5v8u1zULRxoI3utjSgS7VGVBT8NYhy466a
Bi97aNjI2jWGhrZv0xGUKsW7FJARqMFboFBuyewqxKmETpIO2fJuTlLzBLs2snxl
nBE0byjdbkqI1yhneaMd7UD3ctLaRuZ8x8TLRzwo7DIY2uCYPWgG9wFi9v2z7AO2
CIf8sMAar9aLH1l247b208ORqwplCSNnxw2qfl6Hf8JTlpbS8m8=
=sneF
-----END PGP SIGNATURE-----

--wme6awtlbcuivu2z--
