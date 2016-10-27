Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 27 Oct 2016 11:15:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: mattw@codeaurora.org, mitchelh@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        chris.paterson2@renesas.com
Message-ID: <20161027101545.GH25322@sirena.org.uk>
References: <1477560799-58896-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <1477560799-58896-3-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Bg2esWel0ueIH/G/"
Content-Disposition: inline
In-Reply-To: <1477560799-58896-3-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Subject: Re: [PATCH 2/2] regmap: Avoid namespace collision within macro
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--Bg2esWel0ueIH/G/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 27, 2016 at 10:33:19AM +0100, Ramesh Shanmugasundaram wrote:

>  #define regmap_read_poll_timeout(map, addr, val, cond, sleep_us, timeout_us) \
>  ({ \
> -	ktime_t timeout = ktime_add_us(ktime_get(), timeout_us); \
> +	ktime_t __timeout = ktime_add_us(ktime_get(), timeout_us); \
>  	int ret; \

Why is timeout an issue and not ret?

--Bg2esWel0ueIH/G/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYEdPQAAoJECTWi3JdVIfQVGcH/RtQkatljVUgodujGLYSc1Pj
RVGj5gfBpGes1MqstFXN2yn9/Q5L5Wjs7kSjmQNvIdlJJ+TcPlyk9267g6fWU9aB
2afg1dU1DR9lSH2ESikxL/I4JGYAd07EC0I3RgwZX2paUVb0sA4n4GmatAY613Ez
sFYc4xGEpYttYD5Z5IuqIh0w5jjzPRBjBnEsjm28M0HZAvMwt/d8XRc2SmJoM0lB
w4AUDkGLqcT/Camt93z+OVEF81ZxfWm6bB+Apeju1NcLErS6hOGs0ZYOhSUfbfLV
ojDgvSkAC61TZOnnAixmE6RJjzXoLLBS9PClegQZ+6u8nZamYuBizJLFmaU83J0=
=ScXk
-----END PGP SIGNATURE-----

--Bg2esWel0ueIH/G/--
