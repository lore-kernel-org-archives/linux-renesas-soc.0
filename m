Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 18 Oct 2017 12:02:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC 4/5] regulator: bd9571mwv: Add support for backup mode
Message-ID: <20171018110238.hjv7huiievhr5obs@sirena.co.uk>
References: <1507649178-31473-1-git-send-email-geert+renesas@glider.be>
 <1507649178-31473-5-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zapjcrzcces6oi4c"
Content-Disposition: inline
In-Reply-To: <1507649178-31473-5-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--zapjcrzcces6oi4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 10, 2017 at 05:26:17PM +0200, Geert Uytterhoeven wrote:

> Backup mode is not enabled automatically, as e.g. on Renesas
> Salvator-X(S) boards enabling backup mode changes the role of the ACC
> switch from a power switch to a wake-up switch.  Hence enabling it
> prevents the board from being powered off using the ACC switch, which
> may confuse the user.

This sounds an awful lot like the standard power/wakeup, though the
power change is a bit unexpected there.  I'm also wondering if it makes
sense to just only enable the wakeup mode when suspending which
preserves the power off functionality while also keeping the wakeup
support.

--zapjcrzcces6oi4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnnNM0ACgkQJNaLcl1U
h9DF1gf/Y+ciNkMOKMiwWYRyVf3P/Uud6ZaqmTpZ9HSnGSxCClelttJ83ycD5apN
qKCt8WT9yn08Sko5sKLjVIWe9vRR/iRyKQQ4nl2XgEiNLdmIVJxVc2gH79BirhsT
nf23fFI9D9nLTroAjLDFH6FV9uZKHYqwQIWjQzrkmBF+OVXuDg/LnBPmLdyYNxcn
QKw9VFFcOLmiEBvyL6fV6HPaHDd9QK01fzcTWfqeT88dxJM5Xf6dHbfXgGe+QagP
u3lgtYW711xrIqMbLVsz5Fc7o1w1aiDa61u/+genCPGo9PJEk3LbQCNEhbUNNEnf
Hn9WeU6Hlg5609xD/TX9qXsEftTMlA==
=1+yz
-----END PGP SIGNATURE-----

--zapjcrzcces6oi4c--
