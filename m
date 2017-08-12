Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:43377 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750864AbdHLOq7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Aug 2017 10:46:59 -0400
Date: Sat, 12 Aug 2017 16:46:58 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: sh_mobile: Document r8a7743/5
 support
Message-ID: <20170812144658.6agnj7jmy6hshhc2@ninjato>
References: <1502196349-29245-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3pzgxkuao2rikslm"
Content-Disposition: inline
In-Reply-To: <1502196349-29245-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--3pzgxkuao2rikslm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2017 at 01:45:49PM +0100, Biju Das wrote:
> Document i2c Device Tree support for RZ/G1[ME]
> (also known as r8a774[35]) SoCs. They are compatible with
> R-Car Gen2 SoC family. No driver change is required as the
> initialisation sequence is currently the same as for the
> R-Car Gen2 fallback binding.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Applied to for-next, thanks!


--3pzgxkuao2rikslm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmPFOEACgkQFA3kzBSg
KbYojg//R6/Xh6kX5zmu8zj9htAGFtptClS4C2HBTKnMOj+FqdG2s9EWx97KBCY6
+cv+jG95h5IvExB15ejZZYJIe1DXflTNzk7VzlFFXH1XdNBBXqk13lO+wXWvdDw8
puPnW2gjKdVFmM+W7j6bDNS/FO2HskaS7xEgxmDIV0V6t4+uC1Jo9AvbIKKNS0HF
rVHz582XB959KfssP4UO2/5yP965rRKszzSE4RghKIB4QCjJFl7a2KWKVXtzEHKz
ER3T5pyp/wqfHp2uX+8GKz4fbGdHLyDOyhC5KJ8+ZKtHKCCZkpCX/sDf8wJoxxod
eaB12gB4zvlxxYSdke6FjB3kI0ItDCme4ThZXPT1NAn4muD94G+l2wcbtrqN8fFM
S+DRzy+ahxymY64+CDvIOTsCmZrJIvXokMhI/KspGymAoV6ql/lOvSEOoBpivnc8
1fSTPMJyJ0BR/QxjQhZ4aLPNC19Weh1+U0tgGJVLvHIinPi7cibixW9Pssg6VASP
eFEyGo86vH9KnQh+OUsJnW0N9XYiyZo95p+fLyUB53nmvh+t7TXd7zqDVZjveV90
wN/rP/OZPPl2cnRbQV/pZK9qgojzKHInQ9SXesVHf/gDtEvGEG3+6J4tOV5OoLEK
ziICO9Qse3vySpZl5joT1PrFZr4tBXl/zh+/Io1u5KgBNlp7qb4=
=5Nn5
-----END PGP SIGNATURE-----

--3pzgxkuao2rikslm--
