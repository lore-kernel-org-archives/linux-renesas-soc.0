Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:32824 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751801AbeEVTN2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 15:13:28 -0400
Date: Tue, 22 May 2018 21:13:25 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: mux: demux-pinctrl: add symlinks to the
 demux device in sysfs
Message-ID: <20180522191325.luqgcfhxlzg3j4ho@ninjato>
References: <20180521072939.2836-1-wsa+renesas@sang-engineering.com>
 <20180521072939.2836-3-wsa+renesas@sang-engineering.com>
 <6641706f-fe9e-8d92-48c5-ebd4453c51c3@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="f56wdw72mhpphvxm"
Content-Disposition: inline
In-Reply-To: <6641706f-fe9e-8d92-48c5-ebd4453c51c3@axentia.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--f56wdw72mhpphvxm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

> Hmm, now that I have slept on it, I find this a bit odd. For muxes, all
> channels and the parent are always present. Here, that is not the case.
> And don't get me wrong, I see why that is the case, but that doesn't
> mean that I like it. It would be so much nicer and less disruptive if
> the client devices were not unbound and rebound (which I think they are,
> right?) on every master switch.

Yes, we rebind on every master switch. In the first iteration of this
driver, I tried the on-the-fly approach. It turned out to be very flaky
because it was stretching the driver model too much. There is no support
for multiple parents and no support for switching the parent at runtime.
When trying to do that, you find out that e.g. the whole relationship
tree needs to be rebuilt, say to keep PM hierarchy consistent. And even,
just for I2C, on-the-fly switching is not really supported. Some Renesas
R-Car SoCs have two different I2C IP cores which can be muxed to the
same pins. One has DMA, the other slave functionality. I don't see a way
to combine both into one "virtual" master. This is why I came to the
current approach. The use case that the customers decide on the feature
set they want to use after booting was said to be good enough.

> In some cases I think it might be possible to make the switch automatic
> and seamless, e.g. if there are two masters and one of them is faster
> but has some glitch(es), and the other is slower but complete (or at
> least complete enough).

That might work for some cases, yet I'd favor a generic solution.

> What do you think?

Given my above experiences, I'd just drop the channel symlink and keep
the driver as is :)

But thanks for thinking about it!

   Wolfram


--f56wdw72mhpphvxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsEa9EACgkQFA3kzBSg
KbZskg//Y57UxpiJHdkL5FgWKzCth+6Vd60TiuA36ioRS27gEquLp6zMOGEfHssn
GTGL2PNL8IAwMgMbNlx/rQl3ZuDMEIX8ysZtn0R//0Wu0cqXY0VyHvIfQRob53YI
SxP8MUU2ro8yyFGhcYXSE6br8DZfed66I6UgtxjuwzusNp51a8OWUvmo+npnoaSy
AZupEDo9RRukbaEmbznc/sVzeuzKF8alsM4gqsT0DYr6MsNM2cvOuVKHnB8I0/Sy
mYASjWJB7D8JmINQSCpQfVc/+N+0U8UtIoo6LC2bdAvGmBRg5PEPAqhoHIASczkr
xAcdaBBSmuhJqu2O5sKTTOkNl/5Z8yahSnFz2AGcbtGxHlUYfbMKYcvEOrntG3RN
P86CN6SQWDUfu/8gUm9DuGxasDW6iAYwUJX2tVH7lPjE4lzyrcB8Pjk+1/t/VkWe
aMegt2Bq2u8zwHn7hGXs2UGVAz9gNwStC4kD7okuNHyfsktfpjDq1lf+hgV6bNEv
xRIOkf+F1DYoQ/DJUs/qWn073gZIxG/EMFCx9kccxblnD6J/gBQBDMA34+Zr0IeF
i3cZYFRzdmG2uHPJQKIar7Y/wqGGQTw4whfhNxZI0Oua+weHxQsly8YLpyvEcWgC
a9RVZtW6sdNncPoTiphvqJSOzIXfm6gUXuXfvM9HGrR6UkwLN3I=
=Xm3Z
-----END PGP SIGNATURE-----

--f56wdw72mhpphvxm--
