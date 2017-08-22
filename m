Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:46520 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754574AbdHVG4r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 02:56:47 -0400
Date: Tue, 22 Aug 2017 08:56:44 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: Status of r8a7795 SDHI support?
Message-ID: <20170822065644.GA1451@katana>
References: <513dd4ea-7309-d2a3-7940-b14bc1836c31@de.bosch.com>
 <20170817072921.GB1423@katana>
 <fd4fb97d-9284-f2fa-5719-e28e6cc2fe20@de.bosch.com>
 <20170818090042.z3jx6rufxuc56m2t@ninjato>
 <32eb505f-b622-2562-e6d0-818c6bbab32a@de.bosch.com>
 <20170821081808.7teztwh4hbz25zjq@ninjato>
 <977e03d5-f59d-b41e-9135-fc6dfc19482d@de.bosch.com>
 <06bc290a-8173-3d41-ff1e-8c26b4d4c093@de.bosch.com>
 <20170821134722.GA5226@katana>
 <fc4e436e-9b6c-d39a-2061-aeaa1a249cc4@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <fc4e436e-9b6c-d39a-2061-aeaa1a249cc4@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I'm not an expert on this, does SDR104 need 1.8V?
>=20
> To my understanding, sd-uhs-sdr50 is the max speed for 3.3V?

Nope, everything with SDR* needs 1.8V. So, classic "highspeed" is the
maximum for your slot.

> I ask because on my custom board the hardware guys gave us 3.3V, only, for
> the SD slot :(

Pity, in deed.


--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmb1acACgkQFA3kzBSg
KbbzehAAkJdcraCYAWFJiRitvWSVENTj+BN1dmCR4HjpwwrNn3M6PXbOmyW7pTrG
vdqZuDr+uFH2AjbjA2nP0kyPtvTyS8UafpqjH3zxDCTccZAj0mww4iA9lIVnnJm7
jwICSTLLVKvNVPHVglvigfeRBlf1GeQWWW65zgX0bxxE/LM5iYFAh595u6DT+09O
MzBZZJj99jUnuIdJ6ThX3jeLi9CRl6iQvkuDtOCvVovxymET0+Ba+7Faa2lbist2
vxr6D26sU1H/cHXYNnaP1sVlqMkbOBsGxVuvKGp+JkrM0fBXqkg+l22pcfYQsGuK
EjxnRO/Tbj6LUzeEW6Ge/n6iwtyPEKDjl8NMU2iOk0EDUi+NcDFFmidct5kOY18E
VNes95TkVlg4qJIeMZVVrwHlkvalOtaRqXWjY9Nw8+B0weJScpuV3Pv/cSeHHKyx
A73RK9T/9XGJHgCTI4HxuXaE5NNlW7ISHKTxSLPNE5GCQ2GF6i+TPRWFbme5at+c
lmntUFDkSAMzGsbuU7JGysrHvnQOegklMhZuEmKA8w+yOvMbHPTyNo7az7kNt1we
chAfaffycMH7HRh6nHm/1Vt4Us+U1HBCOyXpdSUSVQCPkCk/0FSS1UfzjkfU0/rm
4tT4Ee+WZuotUI8Y9bhKLqKFtIRYzZe+3v4s0oEg1/9A3n6Pd38=
=YHUR
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
