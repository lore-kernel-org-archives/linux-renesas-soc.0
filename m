Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E42C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 15:01:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80A2920851
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 15:01:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfAQPB2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 10:01:28 -0500
Received: from sauhun.de ([88.99.104.3]:40260 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727083AbfAQPB1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 10:01:27 -0500
Received: from localhost (p54B33243.dip0.t-ipconnect.de [84.179.50.67])
        by pokefinder.org (Postfix) with ESMTPSA id B1B2E2C3F83;
        Thu, 17 Jan 2019 16:01:26 +0100 (CET)
Date:   Thu, 17 Jan 2019 16:01:26 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH repost] arm64: dts: renesas: r8a77990: ebisu: Enable
 HS400 of SDHI3
Message-ID: <20190117150126.gku7sr3dcujfx2rq@ninjato>
References: <20190117143829.6ubwnj5cyh74mjq3@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="65nwrc44hpfugdxr"
Content-Disposition: inline
In-Reply-To: <20190117143829.6ubwnj5cyh74mjq3@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--65nwrc44hpfugdxr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2019 at 03:38:29PM +0100, Simon Horman wrote:
> Add SDHI3 UHS pin control and use it when enabling HS200 support
> for SDHI3.

HS400

> # dd if=3D/dev/mmcblk0 of=3D/dev/null bs=3D1M count=3D512 iflag=3Ddirect
> 512+0 records in
> 512+0 records out
> 536870912 bytes (537 MB) copied, 9.02486 s, 59.5 MB/s
> # dd if=3D/dev/mmcblk0 of=3D/dev/null bs=3D1M count=3D512 iflag=3Ddirect
> 512+0 records in
> 512+0 records out
> 536870912 bytes (537 MB) copied, 7.36003 s, 72.9 MB/s
> # dd if=3D/dev/mmcblk0 of=3D/dev/null bs=3D1M count=3D512 iflag=3Ddirect
> 512+0 records in
> 512+0 records out
> 536870912 bytes (537 MB) copied, 11.0156 s, 48.7 MB/s

Hmmmm, quite some fluctuation and far away from the performances of M3N.
Marek, do you have an idea why? Did you note any E3 differences when
coding support for U-Boot?

> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/=
boot/dts/renesas/r8a77990-ebisu.dts
> index 89383aa35d65..f2846c9eb83f 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -535,6 +535,12 @@
>  		power-source =3D <1800>;
>  	};
> =20
> +	sdhi3_pins_uhs: sd3_uhs {
> +		groups =3D "sdhi3_data8", "sdhi3_ctrl", "sdhi3_ds";
> +		function =3D "sdhi3";
> +		power-source =3D <1800>;
> +	};
> +

This is exactly the same as sdhi3_pins, so no need.


--65nwrc44hpfugdxr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxAmMIACgkQFA3kzBSg
KbY3xA/9ECx4ZBowhwEhkAx7HqMz6XqUHCVzfLNz7nVtHMLQ9FOnWmLYwPrR8Q28
l3j2yg7TxAf5SQ3oABlRrzEiwUnHzdHpM+gjA1vSdwy7lHSRO2gVtsLgrSpc4Yof
C0G86j6IdOWLsn4sU7vhgsS/mDcXY9Nbtcv+yGaZEgfwyk796pu9KpCSTicfLCDo
1mpRoOWTGNss0TDS38C9Bk2YX3St/gy1haElEAeTxhKruNhZ3aR2M9MDNJDDKZUB
+qoHF9dDmCjz9iHe7rZvP8IIMVE2fkeO242/L5QKkw42qtPVCBC5/glfWN0Mqf7n
jremIBkDgi6eV6fBFLVWF0xHOIBxJE899ecbBAW2/BERcyZi+BscIg9k8p0/HVoW
R4FjUL9hIhM7oHzNvntTjiHSyUc+YRza6Wc6GIod+W2SiBoCGG39P1ExLhu8qe0d
x/eZOIvUXIkjaz45COkrWpBMa76cxIJ9XmirD+nVSr3YUFr/zkqkItD7gp5BITY8
SLqAfldB8uW0J4rlSRsWmueJJt40AAMtuBMiNUAONfDpzoDG6ELWp8BFP88ex4qF
Pt1F6zlkI3X3bzDFGSJ/bgSBoyl3aUX69+eLY/J4wPommA88E4YoKhzU1TJHjcf3
Xx1yYJYB1q/MLzK5qSa/JQDmzDWOJArAbOV9+tAkx7RG8IzJryw=
=ErPV
-----END PGP SIGNATURE-----

--65nwrc44hpfugdxr--
