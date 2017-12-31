Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:34311 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750724AbdLaKEd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Dec 2017 05:04:33 -0500
Date: Sun, 31 Dec 2017 11:04:31 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH 4/9] ARM: dts: koelsch: use demuxer for I2C4
Message-ID: <20171231100431.563efrm5pcd72rmw@ninjato>
References: <20171214223101.16450-1-wsa+renesas@sang-engineering.com>
 <20171214223101.16450-5-wsa+renesas@sang-engineering.com>
 <CAMuHMdXnY-zAc-=mBrrDy1XAxZcmvmsVA52D-EeZJT1Ff4Pdyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3sgnznfnmtatrl43"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXnY-zAc-=mBrrDy1XAxZcmvmsVA52D-EeZJT1Ff4Pdyw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--3sgnznfnmtatrl43
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I2C4 on Koelsch uses pins GP7_13/14 (group "i2c4_c"), not GP4_13/14
> (group "i2c4").

Confirmed and fixed, thanks Geert! I updated my error catching scripts
and will redo the other tests, too.

BTW, we also have this on Koelsch:

sh-pfc e6060000.pin-controller: pin GP_7_23 already requested by ee090000.pci; cannot claim for e6590000.usb

because pci0 and hsusb use the same pinctrl-0. Known issue?


--3sgnznfnmtatrl43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpIticACgkQFA3kzBSg
Kbbp0xAAtV+sym6lOVlbhcfCt7dl/cHTo+idhdlOsB75/U4dBh3IaI/Y2wUQD5Ps
SmnnmZKS6/Xf4XbgF1BH0l0cnWFH7+ue5EgW/2wI0FV9+77vx8T0ly3XGy95tLON
zzReeo7FK04Gs6Mf4RDw5aZBOyqUSnM7uDFIVCyqtbL7DipwTAevAWEVLzTyPRls
z4JfvnTnYbdvJLiDhs5emF9O+hmVTYh08uNg0dB5fFF5baUR7I6TNuCBgg2ihejX
YGEmTVwu5qVC37MJki+ETjoI0GFizHYxFUwuNCPr6wVMt0qEpvbRS74Q1P39pQfI
m0zI/PbRuTjKe0C3koVFjTEBtWfOzRcSJYIe2VIqXf30xex6v5No4iO5oCsCiOiX
TnWWqpwmPbUtIjh5zij8nginz9USpUp16NA60q3lIt9GNud04KWQJwUPdX6/yDtV
T+L8exOac1AGyfy2Ay+x6ExN7TKvsbee9DX2IcKhFCkvBRaVnweTLX5SbOLq+Yek
hjQKyH2pHzFIehGD5FDZWnlJ0IOg2ms3SOUFDNfQtefQJkSOIxzphuwBj5fM45Uw
SJEK8ZSWQo+lhjDMo1P3bgZ/w/1+4uK9BHpS7REFvPejQWwktXzyrDsqWCTsxr4F
Qc7iKA7q2/hPu4WmGRo3mrgCJcn96tXsd/xFh2pQECxX85CYitQ=
=ZwbV
-----END PGP SIGNATURE-----

--3sgnznfnmtatrl43--
