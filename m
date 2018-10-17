Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:36718 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727061AbeJQULg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 16:11:36 -0400
Date: Wed, 17 Oct 2018 14:16:07 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Peter Rosin <peda@axentia.se>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: Delay between stop condition and start condition
Message-ID: <20181017121607.GB3813@kunai>
References: <TY1PR01MB1770A54E9823E9C6D0FC6986C0FD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20181017103208.GA1589@kunai>
 <8db1b1a0-6669-0d4e-7511-6fb44e309a4c@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
In-Reply-To: <8db1b1a0-6669-0d4e-7511-6fb44e309a4c@axentia.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Or, add an I2C gate driver (sort of like an I2C mux with only one child
> bus) in the HDMI transmitter driver and implement the delay there. Then
> move the monitor to this new gate/mux child bus.

That would actually be my preferred solution. Because it describes the
HW setup best. It is the passthrough creating the problem, so it should
be fixed in its driver. It probably could be a generic driver, or?


--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvHKAcACgkQFA3kzBSg
KbbXRxAArMKeR/cOpPc0sBJOOA8qDJdaV3a2KGMAGVFbMn+7rF08ihKTWjbxhA1s
SpYyZx31/vT3GfzrvEv16p7so/qz7OPgA8GJZJHO/QLpsri2/R1+A9DeNiuebWpl
8As/NBuqNFVDuy/WnTyH4dZnyhV2doBYnhY/IivBh4AVlJ4NH2iSvslLj8+2yY+v
RbDOxhEAF5M0Lm5z627YKqoLVU9zDHJsskhJ1nhukDL4fm36pxP+F32Jj3dnFawI
wK5vkyp6bk5KgZaIjW+0jhEZUgLrhMqN3bDwosmBKPyHnsZuJNdQndqqMCR7UCBi
k2kxLBmSg4u4m/zTjJdo2Vl0HGNyoyZRivCrEl6J0OCYvqLLFSO0G/n6j92HMATF
ptgk4DmaCmj+NbfHVIOBZjVXcfgv3l5V9GfHkIj0rclYYY9A5ts78lq0cc5RqDUB
UI/hDldMnPHTRAb5M2OWI/1D96dwdwGJL8pbkshzr28rkHbJDNMRsFNtGVp8D092
WVXTI0o0/bprj8Su4ulYsUUxDiH/GhFiv8UYp8+GfLOAJAveKlhsg5CpcypeNONp
4DQiOUP0vcDwbGeqwO2Om2bWz15N8l1Jn/UImL2u0hfRiFEzaDqFcGkP5j4PXuL3
uxWIVh2YMuNoA/181I31tWkxSsBDgPVhJLqTyJw49olWh4P6b9c=
=BCli
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
