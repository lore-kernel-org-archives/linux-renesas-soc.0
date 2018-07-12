Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58822 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725967AbeGLRtg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jul 2018 13:49:36 -0400
Date: Thu, 12 Jul 2018 19:39:00 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/2] i2c: recovery: add get_bus_free callback
Message-ID: <20180712173859.2ltochywona6ffaz@ninjato>
References: <20180710222423.7792-1-wsa+renesas@sang-engineering.com>
 <20180710222423.7792-2-wsa+renesas@sang-engineering.com>
 <e87cb471-e26b-5f57-c1f7-4d403c476a9d@axentia.se>
 <20180711165216.hl5ajk5w2uxceiq6@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dlnrx5axysftziwz"
Content-Disposition: inline
In-Reply-To: <20180711165216.hl5ajk5w2uxceiq6@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--dlnrx5axysftziwz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > More importantly, isn't a ->get_bus_free implementation a sufficient re=
quirement
> > for recovery? I.e. even if both ->get_sda and ->set_sda are missing?
>=20
> In my case, it isn't. It needs set_sda (=3D=3D STOP) to achieve a useful
> result. Hmm, I think this needs better documentation...

On a second thought, it may be possible to simply merge get_sda and
get_bus_free in the future. For now, I'd like to keep them seperate
until we have implemented bus recovery for some more hardware.


--dlnrx5axysftziwz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltHki8ACgkQFA3kzBSg
KbZeUw/8D53EudeZKJzyQD0OL7V1SgFEjCyXPKdijpF6AH6PccXWA3Imqph8oRib
6JfbIzwhVBINVeBhd3LvUkgzpVypAIFmQJtN9W/xHYBtaXPWbQay85YEf7b5aLAE
1EM2vFBxHqqNEHCW24QoQrXJ84d2YSVH+hVgbkT4lToZqPrbmtVa9WAcrdFoFJ52
q34XHsnEisp49DxSkMRXOyrLjziFcMXSC/m6QY14Dwnn7y9yx5092g/kXcFJy583
F7q5MqIXEzpC+pO7nDeGjuXyjO+dNAohTPZPozlJAPFGfdvzzAkjn23ZwbvDWBMn
9Py2E0iFAojqP9BMxJGaRKTflryNTqc2WgHE41DkrDLzFjXrOn/+W+FCncVDo91u
NLlBs8M0bS4agLdGxqMysrd0uZgz4mDy90AcU2UQBagwrGkbdZeDTeNzSWFIa5+7
bhW6Pb9uDmbBXCgJILldqvePbkOR1tYgEgH9Ko/IE1aHx2aCyJzs7o3yEjukaps1
s0W2dxuKEH5ZuHteWcwOSMo+Y/mH3qc0pqvg7ysoP8oDeh89fEKhNbsWcqLNwcJ1
SWOis+AW6gL6pZSxne95vPx2AgpeiaYKQs05wdMk53hP8G0ET796NyAF9zKixhRC
BR2Sb96EoTJaOvt3bPtELmt0Ugd4d1DjzXh7Nzclq+SnOuzrDUI=
=KIdn
-----END PGP SIGNATURE-----

--dlnrx5axysftziwz--
