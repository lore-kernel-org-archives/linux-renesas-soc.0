Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 18 Jul 2016 13:14:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>,
	Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20160718121427.GS30372@sirena.org.uk>
References: <1466602929-4191-1-git-send-email-geert+renesas@glider.be>
 <1466602929-4191-5-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GFHULmA0mO3kKGOo"
Content-Disposition: inline
In-Reply-To: <1466602929-4191-5-git-send-email-geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 4/6] spi: slave: Add SPI slave handler reporting boot
 up time
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--GFHULmA0mO3kKGOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2016 at 03:42:07PM +0200, Geert Uytterhoeven wrote:
> Add an SPI slave handler responding with the time of reception of the
> last SPI message.
>=20
> This can be used by an external microcontroller as a dead man's switch.

The subject says boot up time, this says time of reception of the last
message.  Which is it?

> +static int spi_slave_time_send(struct spi_device *spi)
> +{
> +	__be32 msg[2];
> +	u32 rem_ns;
> +	u64 ts;
> +
> +	ts =3D local_clock();
> +	rem_ns =3D do_div(ts, 1000000000) / 1000;
> +
> +	msg[0] =3D cpu_to_be32(ts);
> +	msg[1] =3D cpu_to_be32(rem_ns);
> +
> +	return spi_write(spi, &msg, sizeof(msg));
> +}

Looks like uptime which is a third thing.

> +static int spi_slave_time_remove(struct spi_device *spi)
> +{
> +	struct spi_slave_time_priv *priv =3D spi_get_drvdata(spi);
> +
> +	/* FIXME Doesn't work, as spi_write() is blocked on a completion */
> +	kthread_stop(priv->thread);

spi_async()?  Still no cancellation on the actual operation but it
pushes it more inside the framework.

--GFHULmA0mO3kKGOo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXjMgiAAoJECTWi3JdVIfQxN8H/iTfhmcWrE0RQpPOF9FQ4WLA
45W5GkH13mncePGwfWt4pHlpWfCSRp6E0c2gYKJqd+QA7OZOBihaLJEpLY0Fc8pJ
5qv0bYjCIb8fQcqrmUYo4KkzkgchEqIZ+OlHmTAgWPyOiiDS/doGxPzgjQK3W8XO
EJijsscQXazBrgEjGlqpiJ6U/jRXi/qELJ8UUlfqYV7QdCHV2IUl2yaRghgOQNMf
3uQ59kL9E4tzWLZywxpwkL5HOHL16dAZRphxs//IYgWE/a6KHxKuN3e7kcuDGiwZ
KoTankimBu9HW4v7/8IGxwCg6RywDVRkl4seau7QwFTpyrlTeRwY75og0ixB+1I=
=tjIp
-----END PGP SIGNATURE-----

--GFHULmA0mO3kKGOo--
