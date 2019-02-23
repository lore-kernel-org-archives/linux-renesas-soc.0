Return-Path: <SRS0=cYIn=Q6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341B1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 23 Feb 2019 09:37:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED6FE20684
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 23 Feb 2019 09:37:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbfBWJhE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 23 Feb 2019 04:37:04 -0500
Received: from sauhun.de ([88.99.104.3]:53636 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbfBWJhE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Feb 2019 04:37:04 -0500
Received: from localhost (p57BC9845.dip0.t-ipconnect.de [87.188.152.69])
        by pokefinder.org (Postfix) with ESMTPSA id D9BD62C3312;
        Sat, 23 Feb 2019 10:37:02 +0100 (CET)
Date:   Sat, 23 Feb 2019 10:37:02 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 2/2] i2c: gpio: fault-injector: add 'inject_panic'
 injector
Message-ID: <20190223093702.GE1018@kunai>
References: <20190219163946.13559-1-wsa+renesas@sang-engineering.com>
 <20190219163946.13559-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Content-Disposition: inline
In-Reply-To: <20190219163946.13559-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 19, 2019 at 05:39:46PM +0100, Wolfram Sang wrote:
> Add a fault injector simulating a Kernel panic happening after starting
> a transfer. Read the docs for its usage.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxxFD4ACgkQFA3kzBSg
KbaihA//YQovEwXIXPwDNuc9Xsr6sxbtxb9FWS0UVxtUgBJgTBTCudlXnQI5fDVV
L4r8MHxqQrwV5Y9h66y7Sqm5s8WGDvT3MD4wK/5iUCpCsHyPmzDuNKR5RPcVyP41
ppmFSVX27GirO0O+Ca0Z+b9O2AwMK0AIz4nhr4Jpg3UyC6OZXzCDvtEBuGbPxCSB
0toYMks4F3P786zdlD9xdehf8jrusC2UNPm5K/76LvnlAopsQn96jIMohSil/muL
D7PXIACJxku/6oZApfdhCmrqBEgT98tzIU+d1fv+Om/AWq77oKCdJZyvxULfo8sd
eqKeRqU4PU3df0qavVcIbNdvI/mxHS9pNIYkgZfSvT4noRnM1ss+Rts8c7jewfdM
JL19UtC/Xu20zvuxU6EYWcd4QQ1AkiH5/fmrxjZMbJexjGqlAAbErrs+PrxP+OY7
MGeZc0VuMirbpVDciS5ygrugMs0X15+x9BhRmD6I9e4MDIrNPpk/RdUshahtvOuZ
MJl1KgatLBih7zuQB98nvP45crH0ED8azmmxuUeIgan5y/LYm1NhPisoGQ9NuUEC
4JZ8kgbcpOZacPG6kFHeItoaLxgQG5C1E0iS5B8WyJqU4LXzMd9cM4pmyPwP5MWU
9i1bSx5pnRqsmqdQTVkAjBWECLZTrG6vRv0SyLmpltTEFfg7yXU=
=OvkM
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--
