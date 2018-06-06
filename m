Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54650 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751991AbeFFOEA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 10:04:00 -0400
Date: Wed, 6 Jun 2018 16:03:56 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2] arm64: dts: salvator-x(s): Update I2C ch4 clock to
 400kHz
Message-ID: <20180606140355.ecxu3lgcytwfn42s@ninjato>
References: <20180528192947.2808-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVXrFvg9JqAp9C8pzcYZVMraeRUehgW5G0YszEjwoHb4Q@mail.gmail.com>
 <20180606134138.2b7x5odnc6iwrk3o@ninjato>
 <CAMuHMdXTs6sYjmKC3Wu1BgO7UuwxzMj-cp=LcjbxbywRR2zKow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dmjv3ymejfzr24aw"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXTs6sYjmKC3Wu1BgO7UuwxzMj-cp=LcjbxbywRR2zKow@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--dmjv3ymejfzr24aw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> All other (non-VC5/6) devices on i2c4 currently described in DT are
> described in salvator-common.dtsi.

Yes, exactly, non-VC5/6. Now imagine we need to reduce the freq because
of a HW bug in only one of them...

But all fine with me. You can send a fixup patch if you want and add my
ack.


--dmjv3ymejfzr24aw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsX6csACgkQFA3kzBSg
KbbS2hAAkm4hW61WOgYnR8PF2moghTIjVGbbWg1fJKQGvIyJaYkck7yic0fH9zzo
e7Py+63rljjxIranJG21O+HjIYsOGC7dEHws/FWP0sOAxBmyDppJqtdP8dqGpt+n
VMdJFxdjLf/TbzAoCRVj7ZNJuHHdPotOxpjYZqMs5UIWFd5m4YgBIUzMDY/bASg8
aWDQeWEfK0ACvZgCQz5nqCf00kUVlEvE+uf8/tWhIPrc2G7QkVA6tp6JkTa+bkpe
kZScAlM2pNgsOmVXKEIi52e2MRwCevc5pomW5yIybRxYu/3K+BFhpMASvX3nY6mQ
35IvWqz2zMZsRDJlZF56QACNpiT3G80NYDEFznV4NYTKZe7lxZg0F8kLkJcRd35u
coF2BDj0YY8vOcuL/Nm3B6vZ5UuzcTC2ru5ieujx34d+MnD9XezlBcvvjnp5DwC5
dy40kNEIHIOMKWnNjNXopP3ChXoLyiaVzq2/ukta7a4I6O7HIgLlblI+F2lh64N9
Xfxs7P6kw/l44IWmiR7GdIS9TrSH6qq0bnXcJ7p5dU2+GOPzK8omn9cDyi4l3tdU
5n717H+VRgos5jxyX3tih4qu9iShHs13pZVWwgFKd8/xzJDI0fBh5sdHkmmuHOG2
Ali5fTBysW+d7Ry8+PqpdqZeTSuQZNglFWQQ8szAnC2TQ1wRSg8=
=dVVT
-----END PGP SIGNATURE-----

--dmjv3ymejfzr24aw--
