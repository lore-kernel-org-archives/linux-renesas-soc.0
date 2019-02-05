Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFEAC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:04:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A97220844
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728818AbfBENE0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 08:04:26 -0500
Received: from sauhun.de ([88.99.104.3]:57404 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727635AbfBENE0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 08:04:26 -0500
Received: from localhost (unknown [46.183.103.8])
        by pokefinder.org (Postfix) with ESMTPSA id 5718C4A16DD;
        Tue,  5 Feb 2019 14:04:24 +0100 (CET)
Date:   Tue, 5 Feb 2019 14:04:23 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] i2c: gpio/algo-bit: clean up headers
Message-ID: <20190205130423.GB12401@kunai>
References: <20190119121655.5576-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <20190119121655.5576-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 19, 2019 at 01:16:52PM +0100, Wolfram Sang wrote:
> I wanted to sort headers in the i2c-gpio driver which produced a compile =
error.
> So, I had to fix i2c-algo-bit a little, too. Since there is a dependency
> between these patches, here is a small series.
>=20
> Wolfram Sang (3):
>   i2c: algo-bit: include main i2c header
>   i2c: algo-bit: convert to SPDX header
>   i2c: gpio: sort includes

Applied to for-next, thanks!


--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxZidcACgkQFA3kzBSg
KbbqEA/+IDV9EZpoICAkFTdTbKi/Qtt3K4yxDE7W9XKfMT7LESiR7g9ucLpdFox7
SZn+DRu9wPzb9NxVD4KehRBzOTIdhJ8Km9EJ7uIZX4vd+QVY3869wZ4WKJDlq9J4
bm8qZRa14/0KZgAeef+788/HR4wAjl6mWZOvEgeP5xgw6CezFpU31hZgj8aKv340
AcTBekOYkIh8RqBdJjOd4VHzMiT5W0jBYPc4TBmTVBM3vN6px8wwJrsBztbinU3T
MV6j/GZ7kVUdMBRBA37MthfIHOLaw/n8wuhX0G5vH5kX8M5GsPjfmFdMZR/A6MOm
YasGs0hBnCD6RSmBYrmuHpde9IsfW6ebG9S04fDJqxb6F+z54lk59a/BbxzLHeaX
BBaSXx+wKXXH0BjZRO8uDQopbjbXh2XkyGiidqER9Y7pl0Fe3oS49fh+WftJ1O65
bWilT3+XfpR/HvNVrg7rEQdDSUs3rQQhXJPoBWPt7ma6qyO66qs8VqzLdynH74Fl
lqbXSGlhk69uWdmh91qSAFCH8/2Lp8+u9mOEYKXpnqfPftzMkf30MT0D3MfsZCrJ
xUasrdGJTisT8wzatBw3VlO4m3OJiwdgGGpdFfYb6TE793I/1gjiXM8OjN+Sn7fq
fDyOJ/as8+w3HhzF72yBwx05K9gbdXeyShL4/IIUBI2n+xvrTkg=
=ZQrM
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
