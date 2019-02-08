Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6806AC169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 21:30:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 358E4218DA
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 21:30:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfBHVaE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 16:30:04 -0500
Received: from sauhun.de ([88.99.104.3]:59840 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726949AbfBHVaD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 16:30:03 -0500
Received: from localhost (p54B331AB.dip0.t-ipconnect.de [84.179.49.171])
        by pokefinder.org (Postfix) with ESMTPSA id 31B752C282F;
        Fri,  8 Feb 2019 22:30:02 +0100 (CET)
Date:   Fri, 8 Feb 2019 22:30:01 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] i2c: sh_mobile: use new clock calculation formulas for
 Gen2
Message-ID: <20190208213001.GE12451@kunai>
References: <20190205170046.5046-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N1GIdlSm9i+YlY4t"
Content-Disposition: inline
In-Reply-To: <20190205170046.5046-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--N1GIdlSm9i+YlY4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2019 at 06:00:46PM +0100, Wolfram Sang wrote:
> We measured the clock on a Lager and an Ebisu board. The new formula
> gives better results for both. So after Gen3, switch to this formula for
> all Gen2 SoCs.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--N1GIdlSm9i+YlY4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxd9NkACgkQFA3kzBSg
Kbb5nhAAkLCBYQF4TUu0Qz5bXkJnX7bh+N+mZUxDQx+aGtTNGfzxa/k4ualFvkli
DtcCJNmmYHtkBe0q0VnQl9QR3qBAbaHwgnVGECaq7dAsvdtjdGA3eyMdNdOe6EUv
GbCDB52KsMD/C8ytWgbmRRzFiy80QgmBEuL6uh29zVaFacS1rMs0pKOTR/THXlBz
E2N1pBA/8+3fcApO4dcDOnU1DLHAWgPwsTMpTnpJ9J0Uz+Rs4rFt8Fj4aWt8R/Tk
VmmCjhvMeqtAtPZ+k1arwNJQDRT0MK3qjzG9+NDOa/tdsmYbb5FqaW09OP9Ow9z8
SOUfXrdQjnslkGwGZc7YA6JO5bm7c6e78hDC2n/4/+1cTW6uLQm+NZhM4nqAJIb6
H66c+vrvPiGg3jZGoWZsk2Qf9383fwILlaVdaGYrJtHd4wNZ6MfZhLHb5hRDx7wv
exiCuj3ngVApYgMHygCOAO5OnFGy9lpzzLFkTR03qYu9E0y4poOJ/EQoDDkGemPd
/75Y3bON/B/LyMmkIHZXvJ44WS5Iis96hgSEadE9pePf7trHEjYMtLHa6/I4XU4J
TBkytx0WgRm7iBG7Ut8ik8gG40BVAQvZ/t9cyAa93+xQ486Rg3ZSB7256Knpy7ll
YTS+S8XhWsbmO08YwYR0IVL6sm5nkQaP4u/Ek8UyMYk1p1971p8=
=b6Wq
-----END PGP SIGNATURE-----

--N1GIdlSm9i+YlY4t--
