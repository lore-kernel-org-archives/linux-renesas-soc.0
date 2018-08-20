Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33570 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbeHTWYQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 18:24:16 -0400
Date: Mon, 20 Aug 2018 21:07:26 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mmc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/7] mmc: tmio: replace tmio_mmc_clk_stop() calls with
 tmio_mmc_set_clock()
Message-ID: <20180820190725.77kn5j4urkwa55kp@ninjato>
References: <1534403799-10594-1-git-send-email-yamada.masahiro@socionext.com>
 <1534403799-10594-2-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d43a37bvm6nxnnv6"
Content-Disposition: inline
In-Reply-To: <1534403799-10594-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--d43a37bvm6nxnnv6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2018 at 04:16:33PM +0900, Masahiro Yamada wrote:
> tmio_mmc_clk_stop(host) is equivalent to tmio_mmc_set_clock(host, 0).
> This replacement is needed for the next commit.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--d43a37bvm6nxnnv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt7EW0ACgkQFA3kzBSg
KbYU9RAAj6K+KIslWWDX0nM/d/V74J+v+cQWaXDONqZsegona8jLholQ6MBSEgFF
jCvkKpJVK7Lt5TGPPJ8h1l5orvGmBGh0GuUCZpRUply26NXG0D460TdUad0wKBLO
myzPS0aRHc8i/ANiqj+5oCBLDPrzKPUJ67NAGw1giHam8vxgcEf3KwNkfkvAZi1o
fGosUJB8ys5NDctM7rW7CJavvoZBGOjuWvohslu/5VacdJllwfpLokSL0NhpF+vu
sgHCmBziwEQN9PwtP3vNrnlnh0t6WAEm3zALq+i9aH0lV8E5u7KiQg0+sKW9Gva+
nS+qr1/8Tn4lj9UmqtXoWElAZJhASnHOwae9qZNgN4v7HUeVX3PI2dwAsZNPNjBc
XbcWh8BJ+pnGurTRywVcztesnjmK5uu4rsFljrfIFTeqGYTseKJH+PPrj4yAXeE1
y/zq1SFHMtr88yIw5dT9uBb1QNbACd54Is7Ck+3gXDwqE96+smE/oXyNV21ZJXVF
8agINiBUUM6DkYGyafA4yG2HUv98Vli4MXYe/Fkota5NsRNvGop1uI/BxXXV9HF6
1edYIiyguZPunrDk3a54wMCSnuZa7BgRDl/PIqwGPx5fztBKKzm3mbdWR+R42LWJ
AOjbo3YH/lxZyKUHYSJSNn1RhVdOBVKEv7pkOt+nkXJHWny9FoE=
=8k0o
-----END PGP SIGNATURE-----

--d43a37bvm6nxnnv6--
