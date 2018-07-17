Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33704 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728624AbeGQJTi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 05:19:38 -0400
Date: Tue, 17 Jul 2018 10:48:05 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/2] i2c: recovery: add get_bus_free callback
Message-ID: <20180717084804.scksrehgyr4jq4u3@ninjato>
References: <20180710222423.7792-1-wsa+renesas@sang-engineering.com>
 <20180710222423.7792-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="c3swbs5zee4qbg5m"
Content-Disposition: inline
In-Reply-To: <20180710222423.7792-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--c3swbs5zee4qbg5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2018 at 12:24:22AM +0200, Wolfram Sang wrote:
> Some IP cores have an internal 'bus free' logic which may be more
> advanced than just checking if SDA is high. Add a separate callback to
> get this status. Filling it is optional.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--c3swbs5zee4qbg5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltNrUQACgkQFA3kzBSg
KbZrlQ//VdfWQYyJm726uLqe+O3jW9bjN+jm1rfaWN7r2A+j/eQYb30O2xac0qoM
ORyTWutv0pae6q2qdEBa94tkFYtMZMOAV3yxeD3kTceKI85Ofy51X81LV5dwOvTe
rO/X/5Y3TzA9OJJAi1KdybHmQo1Oo6IO+WQNEsp6o8Au9UZK1NnEhg4g99Lu14SP
nvx4ED4ezp5eKeLOizY3nN8BtCcMGMWeXzhidjyo8cF4UCPgvWq0wiDVntOHZ+b/
iSJUCuiyiAqiC1ZlVhhTZ84JICJfP5KVGEFQK8kYi7llUzpV0BCyGCcysZWZlq81
AJp7ZFOVQQXFH2GM5kLabsVJM+igVA7YUuWUSl0uVqpXlEY4kJrRPUn+8HNtbYHw
GMw5DCBNBDCbnFcyJQ9uX+u6mMk5KJrb9J980OMX4804OY3w7uHmoaMr5a2WZfPN
CzF4TPwn7wecWmzWvTTLxV9Kc1mwZAtBebTjYe3kT8JEW7SD7oGbzMZYD6UipD6p
6oZE9Ho60XcMS6QKgdqx8/Pc0TCGHY3lGPg9lxS+owrvio6l8rfQQ1ejDead8Lrq
kufJmK13Tm7c9trA4POcUeX28br8bVSwBBGIPg4FBTS7c8xr7zmqU88zqgsgBQez
GPWPoVAhFdAJKwI5nTrO7hchZox1tCVpteSHsuTA8Lq+3ZlGSbs=
=SFvK
-----END PGP SIGNATURE-----

--c3swbs5zee4qbg5m--
