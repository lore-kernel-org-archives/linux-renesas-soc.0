Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:34736 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbeIUEeI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 00:34:08 -0400
Date: Fri, 21 Sep 2018 00:48:18 +0200
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
Subject: Re: [RFC PATCH 3/4] i2c: core: use I2C locking behaviour also for
 SMBUS
Message-ID: <20180920224818.GB988@kunai>
References: <20180920161423.13990-1-wsa+renesas@sang-engineering.com>
 <20180920161423.13990-4-wsa+renesas@sang-engineering.com>
 <e31d69ed-d849-db98-00c2-27d489a2dac1@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kORqDWCi7qDJ0mEj"
Content-Disposition: inline
In-Reply-To: <e31d69ed-d849-db98-00c2-27d489a2dac1@axentia.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--kORqDWCi7qDJ0mEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 20, 2018 at 07:31:19PM +0200, Peter Rosin wrote:
> On 2018-09-20 18:14, Wolfram Sang wrote:
> > If I2C transfers are executed in atomic contexts, trylock is used
> > instead of lock. This behaviour was missing for SMBUS, although a lot of
> > transfers are of SMBUS type, either emulated or direct. So, factor out
> > the locking routine into a helper and use it for I2C and SMBUS.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Is it ok with static analyzers to "hide" the locking in helpers like
> this? Will it not be harder for them to "see" what's going on? But I
> don't think we have any annotations anyway, so...

Yes, you are right. Yet, I prefer this to open coding the same twice and
have the problem to keep them in sync.


--kORqDWCi7qDJ0mEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlukI7IACgkQFA3kzBSg
Kbb/Ag//XgEaIjZyl6nkcN3BGYf7TcCV+vOyqT7klXC3BgWyvAK9pagUEY6u6EBH
DyppLBhpqxmNwDnFejh9IQBGVXR9uZlxchT7PlOJ72G2ypajhYt5N3jNSOQFi1u7
AtBxQsUtFY5zagAC0lhlHE/FQCFCW+MOqiks5zB2g2HO49E1cIEcq2UPd86p2pt1
jwmZ9LPztcJTw3/a+P4psOvsDRDlk+9w9dVqvVFqu+obxs7rpflzm163C0WIVxcE
DxcHVOfVAe3Ia9Ui3T2cNsMcm2v5vZ/eYdMoZZ60hAg3Lrcr2HTTollQ60PHhPtQ
ABMIVcp8GJIkBpFwvMe8mcJZ7y1MeOP2JX7LIG14Q7O0woxjpT8rQZFAih7R84ay
ryeOnGvY8ft7jW4ulV14CifFl6GvKEu7mW3j2vQ5Lej7uHNnGlIaJDiBiFa+yIbg
llt4hgW8SRSrgaKbMOiXDRZ/ptyI4Fo35iuHDd3vtrhrh2lC75LobhNSAPLsLmfJ
lFPnEto8+JPip/bRsJBhyLXyGwDY3WE93CqF+mGZhmDX1NwqOmP0JFKLCFGVdNAk
vjDq+6AOwf9X1VRad6X3cfZclgPhsE6g1TkuFjGXlZle25GaNu5lD3CrlIWlQvwF
MeURdipZFTXsfZqRUqBZCDXsJ9C8AhSfZJMF19ysnkfx/TC8Uos=
=AfGD
-----END PGP SIGNATURE-----

--kORqDWCi7qDJ0mEj--
