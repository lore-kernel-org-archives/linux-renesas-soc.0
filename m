Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 25 Apr 2017 23:31:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, lee.jones@linaro.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <20170425223106.zriauibqrboxaj4b@sirena.org.uk>
References: <20170425183210.30594-1-marek.vasut+renesas@gmail.com>
 <20170425183210.30594-4-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3wogcb527lmq3tma"
Content-Disposition: inline
In-Reply-To: <20170425183210.30594-4-marek.vasut+renesas@gmail.com>
Subject: Re: [RESEND][PATCH V2 4/4] regulator: Add ROHM BD9571MWV-M PMIC
 regulator driver
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--3wogcb527lmq3tma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 25, 2017 at 08:32:10PM +0200, Marek Vasut wrote:
> Add driver for the regulator block in the ROHM BD9571MWV-W MFD PMIC.
> This block supports three voltage monitors, VD18, VD25, VD33 for the
> 1V8, 2V5, 3V3 voltage rails and a single voltage regulator for the
> DVFS rail.

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--3wogcb527lmq3tma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlj/zikACgkQJNaLcl1U
h9CPhQf+LbOa1Gh7X96VTi5KfGSnenT3ZQ1D94kKCXpabqLoEQaGwBo7K0blKvIw
jx0ljDEjJcnrXm0RRBK65jEVPbONwHyxr9H3GQl/Or3/ngDnNv99YicvmqKtTGdY
e9i6xd0XrcB6Cr7gIQN6MHLI3RiPWuBCe/pzzZ2SDA73oIFke0ZkAVR99Ryt5B+D
7rYTXD5IHXX1DipzYw9I4eoeYT9TERX+IUUyfJAKLSYUjep4p/HuoTZjSK7HhnxP
nuCBkaXdHTEjj7G28HD9xbHEh9VCtYR8yzjWvPkJGtOnKj6jK4grfAd5PMX22uVM
T1MyeLgslQMsdmBa8L+1IZ8PgyGwuQ==
=rLDB
-----END PGP SIGNATURE-----

--3wogcb527lmq3tma--
