Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:34702 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbeIUEcd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 00:32:33 -0400
Date: Fri, 21 Sep 2018 00:46:44 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        preid@electromag.com.au, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC PATCH 2/4] i2c: core: remove level of indentation in
 i2c_transfer
Message-ID: <20180920224644.GA988@kunai>
References: <20180920161423.13990-1-wsa+renesas@sang-engineering.com>
 <20180920161423.13990-3-wsa+renesas@sang-engineering.com>
 <c7ee2547-1b3b-3e43-e933-234516031770@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <c7ee2547-1b3b-3e43-e933-234516031770@axentia.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 20, 2018 at 07:26:21PM +0200, Peter Rosin wrote:
> On 2018-09-20 18:14, Wolfram Sang wrote:
> > Using the common kernel pattern to bail out at the beginning if some
> > conditions are not met, we can save a level of indentation. No
> > functional change.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Yes please!

:)


--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlukI1AACgkQFA3kzBSg
KbZQtA/9EZ/aRI1W3Hz9M9y2zvwWMQm1oRZL35cMMMo1plixhlnExxinI5cvgy9l
+aIgdaug5uVq53Qc/gfkrB22GlQHxdyiZ9WOjBHWt4OgIBMxb6cf3NeaLRi4XG6X
DlkHWwKaz6J7UiRzyQuk3qgWlcgnMeNW93FxQmkoWKTxdvq6JyoF7/l0QcNBQby0
FqbZzptmX22Rjxr9acRE88GsmEQv726URKy3XBQLKuv02x1Wk4RCKwxtrcUELhcD
X1MQHqI/05x8JGKHE+BjtFGpQyeg5Myw16lmSK7eKvNyjKQT42HLnBTiayNYkbSY
gtWCb39gzhrrfb7MAT/Bl9TKg/ZmvyXJKdqTMnLBiX+Tqo/ZKRhDgBNUKsW+gQUW
jMyJicsPGHmQsMi+NZQgF4fpvEyE/VT2WFD3r58UIT+3ApwRIoGAnQJzOwjN+KtC
IKf3ezsVeTyTj4vizMaGIKVW9CTbeGpVTmIULabOo1+LXsxDruGPJjlUFuZz7Fdz
mvfYtO0w2iYfQHnPTcX+h8JW2KwVoAdLkVAvF1LekFfYxBwO0AF70wt3xbyBwHZ5
f0EngLB43KvNFxT831JyMfy+oQ8Vzxpanhr6mZHqMHAhW5/NY5a8MI002gvMGgJT
oHmaMgApIdW3lccaJLdsJKGsrhw7IclYRUXDU2ihrUNo7YnWS6E=
=7k+X
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
