Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:52886 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753104AbeGCVKb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jul 2018 17:10:31 -0400
Date: Tue, 3 Jul 2018 23:10:29 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: gpio: fault-injector: add
 incomplete_write_byte
Message-ID: <20180703211029.czme4gzf6wlveu32@ninjato>
References: <20180629091247.32568-1-wsa+renesas@sang-engineering.com>
 <20180629091247.32568-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s6kbeduptdb3of6s"
Content-Disposition: inline
In-Reply-To: <20180629091247.32568-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--s6kbeduptdb3of6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2018 at 11:12:47AM +0200, Wolfram Sang wrote:
> Add another injector for an incomplete transfer. As mentioned in the
> docs, this one is important to check bus recovery algorithms with it.
> Otherwise random data may be sent to devices!
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--s6kbeduptdb3of6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAls75kUACgkQFA3kzBSg
KbZYlw/9F60WCILd0zbiSkkrhEQqoXw6WWwQil8Q0PqIBzRvN7QQTYFWyuZREI1f
fffMT/64bYOtNlO8Y177//Kv5BV/WULOFs8ywc4OoUB2YutXVCjsS2W1VVRSroKF
gqqubsx0wAx0aVuVy8+eLHQWOlD16PKI/e5aQ76O3X+70EzG2QEHyOxR5PuADWwT
4fNcfnxobqX66jUEMVnK12qvRgVV5T0e2WtgCtEvHJvxbeL8Rwnk9fLnfHzEV+P0
xdhDGNZyEh/LoGrP5yRlrsgIzmYJyhOxTrbZe/BdiNjSm8nYWFxex6AtWSajJYU/
j8A4l4naTQuDW1vJm8emn0TfH+Ug8MHdoaNAm+ETtDi7p8Xn88/mv8PNQe4xSb2+
ZhrhekfJrrFKeK0nzP39WF5YXqA0TZh7J2f8/DSc/ZKCIsy2019s2yf/xgWrJGvQ
UrYFuYZXuzqbgmPeLvjaIPSMYoMwZVKsBzRPrsAzd8dsE0lpGNT6nO3uz6wzty1Y
asqjWMjCE8bRkarLRXsTny0IOl/B3zc/4pUtun/x5PXALTWHsSvJ/KXHYBio8pve
z6ltqN0eAwj0wK48/jALTZR306wQl41PKGG4bC/HWj+RcJQU+U1Hu0hH9p+UyEJx
aWcHrKOXG9Cw8bf999yTy1H7i2xZX5SJO2uxXQzPgXC9FEfScEg=
=vnN7
-----END PGP SIGNATURE-----

--s6kbeduptdb3of6s--
