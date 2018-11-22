Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:45102 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728243AbeKWAoo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 19:44:44 -0500
Date: Thu, 22 Nov 2018 15:05:10 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Avri Altman <Avri.Altman@wdc.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH 1/3] mmc: core: validate user input for RPMB block
 count
Message-ID: <20181122140510.GA1070@kunai>
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
 <20181120230832.1840-2-wsa+renesas@sang-engineering.com>
 <SN6PR04MB49251A94A2BF6E60D12919E1FCDB0@SN6PR04MB4925.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <SN6PR04MB49251A94A2BF6E60D12919E1FCDB0@SN6PR04MB4925.namprd04.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avri,

thanks for your comments!

> > For RPMB, block count is a non-zero 16 bit wide number. Reject invalid
> Actually this is not what limits the number of rpmb frames to be read,
> As those are not indicated in the block_count field of the rpmb frame,
> But in CMD23.
> While it is true that by eMMCv52 RPMB_SIZE_MULT max value is 0x80,
> Which limits the RPMB are to 16M, or 65535 rpmb frames,
> I don't think that it is up to the host to validate the rpmb frame conten=
t -=20

I wanted to fix the following issue:

Currently, in to-be-removed mmc_set_blockcount() we have:

	cmd.arg =3D blockcount & 0x0000FFFF;

So, sending a IOCTL with a value of 65537 will silently(!) produce a
block count of 1. I didn't like this.

I don't have the eMMC specs on this computer but I recall it is defined
somewhere that there are 2 bytes reserved for it in the packet frame?

But yes, standards may be extended, so I am not opposed to fill in
bigger numbers than 16 bit and let the card handle the error.

So you suggest dropping this patch and keep the others, did I get this
right? Would be fine with me.

Regards,

   Wolfram


--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlv2t5IACgkQFA3kzBSg
KbZK+g//dufT/jq3iPqC/sb7dCIWfeWEPQe9+ELIY2q+c+m/EK3YyWuWI2ID0ZsU
fojrCzLgFznbBsDZwt+OH36v0uiPOBJEPmNBZTZ6DKKpWqbEyWoypgDd/2PUzROf
YUfOlHhRNW52aupu4zUpfZ3JpIXqhFtpQJhMsQn/X9kpkdiyB+010B/skqu26hV/
CWBKCwFaji9k1gpb8Fqt1oQb2Me3K+GoNLPMxC3OAz4Grd943dl02+Vs72lzVEQO
xx0phgRLAo1xNEMWxhneck6iDkc0Nb8bBv+2qxFMa4fUD/9cwhZDnieNhJ/RBvl9
Nyq/O2qeFpY6oVKMtSTtq8iqL39EbtoTmZZYfQ5Q8HXNcwJyICYVVABKQAscB/dq
olCOkV3fLLTJTahP1TYevbfz3/tCrMvs8zEa8hiE/S/UVreGsZjmngBLcSzze6Hp
f79zDfoW8bPs3+WucEdfOJohViHA5cI2vStfFi3ow0yt/yopv1YOXp89/veNRzj+
0USLEwrJh6iKJYvUIRm4y3Xo7coTaag5Ys9prc3KX3LqzimJluYS8D2FBApavc64
djEh/dgHFh3pk4rjKg5vX3upa5uWKcdP6BVdiV0usumpVVnAehYL9S8zsUO379to
lc4s7bgTh/5F7GNlfpr5Mf+nAEuOFb+E1YPvcNTFXkIz+Xr1kEM=
=FJOq
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
