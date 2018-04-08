Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:40742 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751663AbeDHHrg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Apr 2018 03:47:36 -0400
Date: Sun, 8 Apr 2018 09:47:34 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: initialize earlier using subsys_initcall()
Message-ID: <20180408074734.7o4x4up5hnjrb5l4@katana>
References: <1521197932-2073-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <20180403155524.f7bjynyrr2uaxbvb@ninjato>
 <a3d7b5d2-3a1c-7bc6-dc5c-4dc4d658ba40@mentor.com>
 <20180403170829.iaieac5wk4hkleme@ninjato>
 <20180404212718.GB29865@vmlxhi-102.adit-jv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qiz72orkr4pkuieg"
Content-Disposition: inline
In-Reply-To: <20180404212718.GB29865@vmlxhi-102.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--qiz72orkr4pkuieg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Eugeniu,

> So, the idea is that the startup improvement of rcar_i2c_driver_init()
> comes at the cost of a slower cs2000_driver_init(). In the end,
> there is no benefit

Thank you for the measurements and heads up on this! Much appreciated.
The results match my expectations.

> If evidence in the form of measurements showing improved behavior
> is not enough for the patch to be accepted, then we have no choice but
> to keep the patch out-of-tree as a "workaround", hoping that we'll be able
> to come up with a better/cleaner solution in future.

I am all with you. It is not that I don't want faster boot times. Yet,
unless we know if this is a proper solution and not a workaround for
just some use cases, I am reluctant to apply it to the upstream kernel.

Thanks and kind regards,

   Wolfram


--qiz72orkr4pkuieg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrJyRYACgkQFA3kzBSg
Kbab5g//ULO61/9kctxHjfrQhzbnMFk0RNAJehQWc/otmzZOJgLWRS2WbT+Dl9az
ukB+oV0HoK+DnHvQBIkwWjC9Zww4VNXxZrDUxGidxLknrE7xfh8b1foqPR5yd5Ww
uO5uaWrn1i0WL4JwHAjNjt/RUs+iy5QK0g2Ze0u1RETOn6mnDnGV3zpRj/4EnC2y
k+TdDFBFMQxgOsHqGFm96w9fBGbCAY+u3QyR2T/S0/e3PIgYSMe3J004ruWypXuQ
QQp9u2y23IT5m7ciWPN7wLAw2a/5+yRIx66sU3BbVVLKNCtDQVNe7QnlOrMwzNoD
pY1KkVimfKSIGuw8Ng7hGNzFJCyN8MDX1B6ZgE6mld/raNRWf46Ch8aNR6viJx9x
rxbaX60vqq4RM/i1tR/zqiLAQRiTfK63PiFmQxyO47higB5MJcD4DJLjHN9NzzW4
trtggMwVYOwvLt/F57+SkRyYmrP4ehyUoFikUzadynwlijK2q8wAISw47iOfgy+B
XIS1sNeegE1dYHs2nTh6g3TJB0OpTympS9ODlf4UwhcscCgw6L+FffmFx7j2+IJm
PP1KGbEsgO7yHS6moDyBxRfRCWbCZkgtrOdsXO5djCAZ7doQjhFimLeTmPEH/M94
edygeDpuh5V02aLOjMGxy1RcS2ioeJRFmzEV2SqWKK7jpPLAqrE=
=oLDa
-----END PGP SIGNATURE-----

--qiz72orkr4pkuieg--
