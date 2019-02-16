Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94D3C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 13:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C11F1222E6
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 13:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfBPNEw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 08:04:52 -0500
Received: from sauhun.de ([88.99.104.3]:42824 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbfBPNEv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 08:04:51 -0500
Received: from localhost (unknown [195.52.228.164])
        by pokefinder.org (Postfix) with ESMTPSA id 074232C0509;
        Sat, 16 Feb 2019 14:04:48 +0100 (CET)
Date:   Sat, 16 Feb 2019 14:04:48 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Message-ID: <20190216130447.7eiyjve3gusvyhfo@ninjato>
References: <20190121142839.19011-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdX=HVBYwRT8otZVs0WaOnjLLWrH8RQZyXCH8_Ro11Muaw@mail.gmail.com>
 <20190211205957.vtu57sslnc2pn6cd@ninjato>
 <CAMuHMdUFsMa4+FthqittPEG3u3DgZOphz+_CFqu6epSWJcJxSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="olpjbdarizq436yv"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUFsMa4+FthqittPEG3u3DgZOphz+_CFqu6epSWJcJxSQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--olpjbdarizq436yv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > Sure thing, this was a typical RFC marker :) It is now calculated based
> > on bit_data.udelay and has a comment.
>=20
> But that value bears no direct relation to the transfer speed as used by =
the
> master to interfere with, right?

Yeah, the assumption would have been that i2c-gpio is configured as the
same speed as the master under test. However, ...

> Still, you have to guess anyway.

=2E.. I changed the user API meanwhile. The value you write is the value
used for this delay. Because 'number of interfered arbitrations' is
vague anyhow. Because of latencies, interrupts sometimes trigger twice
per interference, so this number becomes meaningless.

> > Any pointer for that information? I seem to recall that the format
> > string is also used to parse the user string to the set function. I
> > sadly can't find that documented, but all the helper macros in
> > fs/debugfs/file.c have a format string, too, even if WO.
>=20
> fs/libfs.c:struct simple_attr {
>=20
>         const char *fmt;        /* format for read operation */
>=20
> It's being parsed using simple_strtoll(), so it takes whatever format is =
being
> passed by the writer.
>=20
> Perhaps you were confused by the term "read", which is from the point of
> view of userspace, not of the driver.

Because all other users (even WO) have that still set, I prefer
consistency here.

Will send out next version, including panic-fault-injector, hopefully
today.

Thanks,

   Wolfram

--olpjbdarizq436yv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxoCmsACgkQFA3kzBSg
KbY7gA/+NJAHVOGhyz26Ew39RDPovo4VhcPVq/2xN0FAIjxrOlvNZmB1I4XRchBw
bIKod2mlrem/Cb3RSkZaSPi09VcAKpPj+FUmEP+k4fqLAXOKQ5t8TZIZ6/z18gjo
voM4QfobPr5urTrcEe5mVPA5DGh54F7kosxnQixQGcu8Z+DobUZ5dUe/25jJaXEh
TDOKAmkBjpJ2rVU2D8XnAF6cOHkSL5A9aA9go0vKgeQY3ZCbYDRF2/SB4DwOZDE8
q8BvSnpRpJ9VcyRejgfM3AXVSi/byJAB4NnM1KYSz5Ynn8FB9D8//PPx7MXhqfIq
mwt6zoFhpiS5nTTYOJt/6T5RoKDhJs4X8ly2sYlJCyrY1U/azOXXJX8W486DsbB4
r7AYy7HOn3G8TzVxQ7rHM6zkI4a5X/ecn+wQlV61sFfCBRG0fYUA8BFfLdVOj6BM
lhm2+oHHASKtAcCr8gQ+ZDJlFrr63V+u/J8IWCZS1kPndOZiq5bxm/C/YXckLQM2
bdPpKDMZp1KlFtvx7u9dgW13+JtzevSL37ZYpfEnK5J2fjtDVCIRGjktY4QdpzZE
u/h30oJJ7RekrTsJ+rV+4y9acxAYaQy7NtYWZDcf4JMWPSOsf28qtXAFvHHQG8nJ
p9yrDeRe/kGT5N9HOilkhImpjucEyqf8eGf3SVAYPbvuxSHnpIk=
=tdJu
-----END PGP SIGNATURE-----

--olpjbdarizq436yv--
