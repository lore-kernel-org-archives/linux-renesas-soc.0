Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:55521 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1422860AbcFMObk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 10:31:40 -0400
Date: Mon, 13 Jun 2016 16:31:34 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 0/4] ARM: dts: r8a7790: lager: use demuxer for I2C
Message-ID: <20160613143134.GB1603@katana>
References: <1465370066-8450-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline
In-Reply-To: <1465370066-8450-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>    # ./exercise-i2c-demux.sh
>    I2C Demux: i2c-8
>      Master: 1:/i2c@e650800
>    [   97.694487] i2c-rcar e6508000.i2c: probed 0 (1)
>      Master: 0:/i2c@e650000
>    [  102.706365] i2c-demux-pinctrl i2c-8: failed to setup demux-adapter 0 (-19) 0 (0)

Confirmed :( Got today only this far that the ENODEV comes from the PFC
driver. CONFIG_DEBUG_PINCTRL is a good idea for further debugging
probably.

>    3.1 Unfortunately it fails for the I2C2 dmux if the GPIO fallback is
>        present.

Hopefully the same issue.

>    3.2 The test also fails for the I2C3 demux but that appears to be due
>        to a shortcoming in the voltage regulator code which does not
>        appear to like being reinitialised. The kernel complains as follows:

Yes, the demuxer trigger re-bind cycles which are not well considered
and/or tested. E.g. for soc-camera, this patch needed to go upstream:

https://patchwork.linuxtv.org/patch/32473/


--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXXsPGAAoJEBQN5MwUoCm2KtoP/0heQdHb0jsAvds4uJf8jPaw
zBl/ConWe8MYUZYhyaeXz71beQr1cgOS1Y7rRJduEo+Bb8dQeMvMjFLDZmSsq/v2
lZQMwq31ngyanVbI1mae8YHRIx5VFOFuzrxwKYUOuklmg1D651vFxnByc1cqJlq1
b14op+YSUCVWxRbiHDE3djQMn2RNotaAazJjsnHMSGQ1RwBPPa/e7EwZTFzCmV4V
gcEBD3hP3C4MXEZEJZlUkL4LsxT9r/95UuYjR9knlPcFCroATNXBUflyFj+VMh0O
bqUqdyfkilMrqS6BNmOaPHEEiRXUYyXuibdNJmywz1RDI5suFs2RxFNrZmONJ88F
ZouJUQR49HUR9WjSEwPzLXVeyidHWiGnJRrJyp70/hLEa3iVH6iluchJvEv0Mh8x
TiMH85vfug8CU4ojRHtIYWQknu0kdC2V0LoF+A+UvghSPp/WWShcFFj8hp5oET+m
6bepU5feVyF0GLXkudc9WHHSxvatJOKvUI+MB3AIRcGLb1784GVK7Dwvw8ASz24I
Z4k1Hid9SJ9Do2l0dTYtWUOkdp0zfXpEcsp1YCEILbZ/2JO3ABA4oz8qbogd4hNW
n4MmJUd3I181SrJ6gyAiaZAELpBHcZOZmp75EKvjX2p2NC/ZnuoC5b8cATxVJcVz
vM2ubgEGf6ZI9Mrb1nQK
=C9cy
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
