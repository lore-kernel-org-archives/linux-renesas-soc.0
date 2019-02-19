Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5399AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 13:18:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DB0E2146E
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 13:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbfBSNSy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 08:18:54 -0500
Received: from sauhun.de ([88.99.104.3]:45974 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbfBSNSy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 08:18:54 -0500
Received: from localhost (p54B338D8.dip0.t-ipconnect.de [84.179.56.216])
        by pokefinder.org (Postfix) with ESMTPSA id A556C2CF689;
        Tue, 19 Feb 2019 14:18:52 +0100 (CET)
Date:   Tue, 19 Feb 2019 14:18:52 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Message-ID: <20190219131852.c26hvxieficunmsj@ninjato>
References: <20190217124126.7257-1-wsa+renesas@sang-engineering.com>
 <20190217124126.7257-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVLEeJ4i0rZKv8w2bAO5Q7StxqQWEEV611PPMGeE60JHA@mail.gmail.com>
 <20190218204122.j35itmqth3avo3a6@ninjato>
 <CAMuHMdUB--d6_tJ4oYnvSiXy0YNNoAtMqAyyGfK+qRuX4akhAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zgivt6hg3vdwagru"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUB--d6_tJ4oYnvSiXy0YNNoAtMqAyyGfK+qRuX4akhAA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--zgivt6hg3vdwagru
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > > +       wait_for_completion_interruptible(&priv->scl_irq_completion=
);
> > >
> > > Error checking/propagation (-ERESTARTSYS)?
> >
> > Are you sure? ERESTARTSYS belongs to the "These should never be seen by
> > user programs." group.
>=20
> How else can you inform the user the operation has been interrupted?

Definately not by using something which is marked "should never be seen
by user programs" :)

In the worst case, I'll add:
	if (ret) ret =3D -EINTR;

I tested the current code with CTRL+C, there we get EOWNERDEAD back to
userspace, even with my code not propagating anything. With sending
SIGKILL, I got 143 which is not defined. I want to double check the
latter first, might be my tests were flaky...


--zgivt6hg3vdwagru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxsAjwACgkQFA3kzBSg
KbZ0QBAAqSD6oM0kcm3g5pYix9nfQP/U+SHyJ8v+cALxa/knWNFOa9GKBbXk7e7V
Z5je/uOx5IM8Zne/QbfTiuatZhdl6ljcDmsZNWoUj6KHRGrzWGuuphbSwDgjvq+0
NwMu/kMzgKypsa5ak6U1ag+JOkPccaTGl+TFIYAjcirNAoQiHf8rSMP/jb5OLM1D
97polFquZytXe3TromIyGCvxL0til49yBhwjnY3ppdFcmjeW6YmMmAF15C9IMITs
voJpsmoXPFceVYdiozxS6t5iHZDCM5sVEqDAX3E5KCqJw1vpaqzXXEv5gH82NOHS
0IaWAmkbnxhylJMzh9a8BHUErvcskRGGa541IV+IzpzyLnvoSGIY2XOK7ExJ4xZP
V94sDKmDFVo9h3hIYU/eUuMn5T49F9sUbXWGXSPDLlOk1/5oXeoKVmIE9ZjZJibN
d4xAzl71nC0+2KqgdNbQaCPKH9P+RXV1ftiBfMJ1jp8yhltIQlJLSfWiCSD9CzY+
abYWYYu92AGbLbuxAWLgzc566dggCsSj6DYmoED7dnOo8BnUxKGZrdTH3sF8pPwk
y2KitCFmz2hL6nH1awlWpjunG4qjlRYgZiWI7HDy5uBoRNbfu300tG9/ZsVODGAi
VFIOdQsnwgRwun7TnDM7h8UTarmQ0TVNYXpoL60DdFM+D1jmL8Y=
=ErFL
-----END PGP SIGNATURE-----

--zgivt6hg3vdwagru--
