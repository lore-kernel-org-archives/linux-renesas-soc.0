Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54300 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751816AbdLNLpt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 06:45:49 -0500
Date: Thu, 14 Dec 2017 11:45:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] spi: sh-msiof: Document hardware limitations related
 to chip selects
Message-ID: <20171214114544.GC9788@sirena.org.uk>
References: <1513191913-10612-1-git-send-email-geert+renesas@glider.be>
 <1513191913-10612-5-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline
In-Reply-To: <1513191913-10612-5-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 13, 2017 at 08:05:13PM +0100, Geert Uytterhoeven wrote:

> +			 Hardware limitations related to chip selects:
> +			   - Native chip selects are always deasserted in
> +			     between transfers that are part of the same
> +			     message.  Use cs-gpios to work around this.

Ideally the driver would be generating an error when it sees
multi-transfer messages.

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAloyZGcACgkQJNaLcl1U
h9AT7Af/TK1+7gMVOO2nLm4h2HMrGHPUHeUhJJgnR7vsZozlcCnsq0/bxn0NXB56
1PbwCYZvC2QrfsvHI7AvO+R/XnORlFzGgvHF3i95+S4zkP3Bwpg/11tsgKOHeRxK
E0csFyJZAD0+8gGnTGNRMaLLmudUSJxJ9wNWSw94fMMrzbdlXoC3rjlrczJ0snkk
MBawsXyfVDQb6rG1UvY3jCf6scZvhjF2D1rrmh9BnzB0A/prc6DoO5wdXrKBOxTb
G0Tb+BAuDDn2CmgoEqCfYLK6/rhU+E5MoknJuVFny3WXD5QXdAMiaB6U54l9CkYM
eppmnsSjtjRs/K32pH7q9r0Y1CcpIw==
=p2YY
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
