Return-Path: <SRS0=jiO1=QR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDCBC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 10 Feb 2019 17:49:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D482920874
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 10 Feb 2019 17:49:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbfBJRti (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 10 Feb 2019 12:49:38 -0500
Received: from sauhun.de ([88.99.104.3]:47166 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725971AbfBJRti (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Feb 2019 12:49:38 -0500
Received: from localhost (p54B33ABB.dip0.t-ipconnect.de [84.179.58.187])
        by pokefinder.org (Postfix) with ESMTPSA id 402F32C088A;
        Sun, 10 Feb 2019 18:49:36 +0100 (CET)
Date:   Sun, 10 Feb 2019 18:49:35 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] mmc: tmio_mmc_core: don't claim spurious interrupts
Message-ID: <20190210174935.i7x4ysn64meuuli7@ninjato>
References: <c737228e-fde2-33a0-2fdc-d88f0bfd2a9b@cogentembedded.com>
 <20190209214058.n6qdemed3bcjkefk@ninjato>
 <820789ff-a7ed-5b59-b661-2728cb8b8881@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jsmg7zhovpr7267f"
Content-Disposition: inline
In-Reply-To: <820789ff-a7ed-5b59-b661-2728cb8b8881@cogentembedded.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--jsmg7zhovpr7267f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >> +	return ireg ? true : false;
> >=20
> > 	return ireg;
> >=20
> > ?
>=20
>    How about !!ireg?

Better. Still, I wonder how this cast is gonna be different from the
cast being done because the return value is declared bool.


--jsmg7zhovpr7267f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxgZC4ACgkQFA3kzBSg
KbZ7uA//SIOEv9GU0rGPWb2svpgvz0Dn0/tgNvTdF3DGzQGa1h7GKXpXSm4azv2p
hiUVNu23To1q+k+9BpWwUFkOM8jye5953bcpu0ZsRNTMi/ga52JxCaj1O87Jyln1
UL9zhJlHw7/O3Tv7TiPRzDw7tXgz/LryhJUA0XD1GEtRT2U6rYEAPpf6NoJJjBSd
ajkOl4l8Tzw+S+ZnjZ5UdvmL/lYS+ayZRKddLzDR84P9T/hAFHWvKGbdEe7MLznG
TXn/7XoULe1SunArkWCcyPmzxqFasd+fpxJ3GEagBkqQDvL1TmtD/1T+9KyjnBgP
9EixfA1z6AgeD5PAWdGhQKbi92MSwfxOhpuDAhkb+B+36BUbc2kgLtiyfqs/KvqV
Aji2nOrXeIHp2TNWjMnXz4l+wmNk/fWzZ4x9VXH2lC484CaC5A8ujCQIbFgShdgU
x8hLCa8wggh7z1tvLNT4lM1zCdBDIyCb3cPFf9Vz+rNpkxs6n3ABH8dNWfDKsS2Q
doVOaU+6bCiKO0ANS7lPJjXj8osHYTlmi3EtsC5+/BzOlQvK/meLPeWaeeuWk836
9aPxhiMtYKxqqzqRBcjGsyXPKax8HhFu3ArsCMg1yqZSHvdK8sr5lxF6zYZA5bx+
JYcsbQXX0rhYQyEPbx9zUwI/fCVeBNBeUxi+hy8vzQR8XIkGZe8=
=QCrX
-----END PGP SIGNATURE-----

--jsmg7zhovpr7267f--
