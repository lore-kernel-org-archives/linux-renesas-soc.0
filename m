Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A7AC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:21:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46863206DD
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbfBENVr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 08:21:47 -0500
Received: from sauhun.de ([88.99.104.3]:57556 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726276AbfBENVr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 08:21:47 -0500
Received: from localhost (unknown [46.183.103.8])
        by pokefinder.org (Postfix) with ESMTPSA id C0E422C0509;
        Tue,  5 Feb 2019 14:21:45 +0100 (CET)
Date:   Tue, 5 Feb 2019 14:21:33 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: gpio: fault-injector: minor updates
Message-ID: <20190205132130.GG12401@kunai>
References: <20190121141657.18924-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qoTlaiD+Y2fIM3Ll"
Content-Disposition: inline
In-Reply-To: <20190121141657.18924-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--qoTlaiD+Y2fIM3Ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 21, 2019 at 03:16:55PM +0100, Wolfram Sang wrote:
> While working on a new fault injector, I came up with these two small
> improvements. They hopefully make reading docs/source easier when we add =
more
> and more stuff.
>=20
> Wolfram Sang (2):
>   i2c: gpio: fault-injector: sort debugfs files alphabetically
>   i2c: gpio: fault-injector: better SPHINX style in docs

Applied to for-next, thanks!


--qoTlaiD+Y2fIM3Ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxZjdoACgkQFA3kzBSg
KbYbFg//WyvfBm8vrHMXUM/HprO6FzyZ7XUrAtd65OFMYh3Mj9L1yXMwQHUymPMR
9dJPa2kSvJ7V99Wfvx6Q7HKuXmAT6yZIEtw+OyrVCRphILtAjog4Be/BpOVryDpV
wS8NgnbT7jKO3wx2MHiQWwdD4bgQn7Gl2SciQ0jPwN1K+1umpbjkZMGbBxnnrr2R
XvGEt5pUpnu7A4z+VnMhgqoOOqIIgIOxlL0gY0i92MVSn4KUkLlEPwfW7GkaPlMN
qsH/kKzqrkYi2u7mhVbj4D5c9oB5zjm4VqZ0tp4eBFP3TWRLVKjPIYEOv4YnFnAQ
Po2xafx4sCzBQpXJ5ruIAoIhzbJOqOFsljLGxUB83XEXTeo+bC2KSTw4EaHIZ1qc
AUJTNKPqFby2oRBwtrnTIHGLr0pBoWO8+oj5rR2pMolzyAPqoJR9Dl0FSR2ixQUQ
MS+kZRJFDGB3IWGI1Yuz+LAgBG5K5T7U+isKuW7gbAfQM/PMJrNQzfYLH1NieZ/9
3j3oQZ9BUyv+p9I11BMtQliIRJmqOF05lZh222uEqL2NV+J4GBhG027gKYkv2isa
Oqop0GKI4DsbUlZTIfr79s6NqttkBEewkOBe71Zxcu0AwLPC6xpagjASfhdjezD7
n0Va16xYHSyCoZJb7XFpP7lQNPiPskqKwp44hTAAAxoGltpoBkY=
=JW4K
-----END PGP SIGNATURE-----

--qoTlaiD+Y2fIM3Ll--
