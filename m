Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFD4C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 13:37:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2760F21773
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 13:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbfBSNhS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 08:37:18 -0500
Received: from sauhun.de ([88.99.104.3]:46180 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726221AbfBSNhS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 08:37:18 -0500
Received: from localhost (p54B338D8.dip0.t-ipconnect.de [84.179.56.216])
        by pokefinder.org (Postfix) with ESMTPSA id 697852CF689;
        Tue, 19 Feb 2019 14:37:16 +0100 (CET)
Date:   Tue, 19 Feb 2019 14:37:16 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Message-ID: <20190219133715.yvpitglk4smgqz4z@ninjato>
References: <20190217124126.7257-1-wsa+renesas@sang-engineering.com>
 <20190217124126.7257-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVLEeJ4i0rZKv8w2bAO5Q7StxqQWEEV611PPMGeE60JHA@mail.gmail.com>
 <20190218204122.j35itmqth3avo3a6@ninjato>
 <CAMuHMdUB--d6_tJ4oYnvSiXy0YNNoAtMqAyyGfK+qRuX4akhAA@mail.gmail.com>
 <20190219131852.c26hvxieficunmsj@ninjato>
 <CAMuHMdUmtVtyfRLgLo+=kMP_KOzPrzrwcHL6WaUd2tnzKnS0rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2wuurvef6q55wjhi"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUmtVtyfRLgLo+=kMP_KOzPrzrwcHL6WaUd2tnzKnS0rA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--2wuurvef6q55wjhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > > > > +       wait_for_completion_interruptible(&priv->scl_irq_comple=
tion);
> > > > >
> > > > > Error checking/propagation (-ERESTARTSYS)?
> > > >
> > > > Are you sure? ERESTARTSYS belongs to the "These should never be see=
n by
> > > > user programs." group.
> > >
> > > How else can you inform the user the operation has been interrupted?
> >
> > Definately not by using something which is marked "should never be seen
> > by user programs" :)
> >
> > In the worst case, I'll add:
> >         if (ret) ret =3D -EINTR;
> >
> > I tested the current code with CTRL+C, there we get EOWNERDEAD back to
> > userspace, even with my code not propagating anything. With sending
> > SIGKILL, I got 143 which is not defined. I want to double check the
> > latter first, might be my tests were flaky...
>=20
> Where's the kernel code that returns EOWNERDEAD?
> Must be hidden in a complex preprocessor macro, as git grep cannot find i=
t :-(

I rather think it is glibc returning it when it discovered that the
owner of a robust mutex was gone:

http://man7.org/linux/man-pages/man3/pthread_mutexattr_setrobust.3.html


--2wuurvef6q55wjhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxsBosACgkQFA3kzBSg
KbZwZBAAoaYEcSyZhMe7hnYrVdnYf1olDpx3ygZnQttIrcyIPSpORPOW22y9cwTr
191cOZ+kumnKH3UjrH2byuNdk5YBVO4pmjxn4MyJviKmCGlTaar35+JT4CqjCMn8
dSqJuvyV9oqit7mATOoM5sN6Jnz5Y4LiMPQQRucjAxUKbbd3pRLJ/qJ5CObcgIf8
NJVu7Qg5ohEy8eMUUNmicnvdwVnG78iLlahepM9hNJyqiGtfYr4dCG92EGhTO6m8
IDPzvjw5PtCB5PGt5X/E2+eYrjBykx9yM82SRrfqOUrYXskxINZIXrrT1HlbJknb
MRa5SMSnyVEuf+qZman3e8N8Jg1mPo/0/eAgIkj70ypy/+lJaDDtlZgI8izlzkIH
NFxd3gnfiZy529P6VTm7QDvwO4aT1qZln3oTRcdpBibOtuBWKtjMk7l9ZgwhKjUi
MweQYFhTXI95xdcjg4NSwHebQQP5w20BUOkNssC0thpCkHlHsJfvP9GbdCSDY3nk
1Zdm5h2uxO/LeIRuYxq1weUsIkcFjVd08wuN697mnTjQ820QsUio/rr/+jYKZ8/Z
nCvpRoQzt4Kzyxfir1lOXJVksdUE/fEIL8TTrrNQDKnfMeaZfVKQbC0GrqlfJEpE
IxrpKfR9t9F685Q/nobPIdDBv4NLKj9s+i88KPzUxGwIeJTJNqw=
=9OCY
-----END PGP SIGNATURE-----

--2wuurvef6q55wjhi--
