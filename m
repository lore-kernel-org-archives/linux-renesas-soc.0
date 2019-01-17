Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40934C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 17:05:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A97220652
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 17:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbfAQRFz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 12:05:55 -0500
Received: from sauhun.de ([88.99.104.3]:41156 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728885AbfAQRFz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 12:05:55 -0500
Received: from localhost (p54B33243.dip0.t-ipconnect.de [84.179.50.67])
        by pokefinder.org (Postfix) with ESMTPSA id 531B02C3F83;
        Thu, 17 Jan 2019 18:05:54 +0100 (CET)
Date:   Thu, 17 Jan 2019 18:05:53 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC/RFT 7/7] i2c: sh_mobile: update copyright and comments
Message-ID: <20190117170553.GA2516@kunai>
References: <20190116210555.12209-1-wsa+renesas@sang-engineering.com>
 <20190116210555.12209-8-wsa+renesas@sang-engineering.com>
 <CAMuHMdVj49y3b+WqyTfNV2sc0WTneFaO4zZSA6WfkZDrqgD=eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVj49y3b+WqyTfNV2sc0WTneFaO4zZSA6WfkZDrqgD=eA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > + * Copyright (C) 2014-19 Renesas Electronics Corporation
>=20
> Why this addition?

Because of the funding. Is it wrong?

> > +       /* switch from TX (address) to RX (data) adds two interrupts */
>=20
> Perhaps this change can be moved into patch 6/7?

Could be here or there IMO. Do you have a strong opinion about moving
it?

Thanks for the review!

   Wolfram

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxAte0ACgkQFA3kzBSg
KbYQJBAAgHA4fXR+R7VxanbN/lZpI2+JjRRlwGqA3tJ5z5cz2Ry8/YMMMjMEJsxt
46MZCzJtMf5iAJ0Jx0mDEYoq2/y5yqbsWSZQ8FmnAfiPDcYfueb7rzhLTnuZrvxw
CTzBO2AG9FPvHqeK0ZOrgqxWe0SGU5Hj/BcyjAbUnfvcoEYBBHezJ6ZIAUUPRLLc
ap3cMt4I4vUzSlgbO3VqMazenpmnNVttsmqnodKVCA+aEuJMSWmxNSx9mzIj9BmZ
zHdDft+urdj4MdcyEN/A/QlpNoIOOo5e7ayLcZLumtOa+XF54jnNwEcQzdBjzXgU
xkL504aKE3uEo2zMmiZBzb8Tbs3lANfohed2AePQK/zp33MRgCK7w16Nv3tNw/dY
UD1mbT4lwJCLXIxzEtZkAtHD7OmnXQxAdQCuClVMg/e/IR4FqbQ67j0DWxjlfC8L
Pae1fuZXTuqKTJX9esIxlLhGLmrI1xVbi1omopUcneI1T3pUEXBLPRnQpnm5ml0Z
9wtHL5dU1fh21fRkkwBKeURW1dZgxADhbSROXGv5kls+VwPd9FyeIvhZOigSt1tW
GpDSJQvvH/CDlkF8gaO2BSTEUZ0VV4dJM3vAhqemrYGSAQYVDlrlmHInxO0O0Nq5
4UFRDvNpi4FKc31ngMWUKMA5kg2KZlwuUjDn/Apa+tFU6r6ZiqQ=
=Ierp
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
