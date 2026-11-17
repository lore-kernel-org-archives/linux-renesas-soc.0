Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937085;
	b=v5re7Ql7DULU0dQrEsV3wR91Y0Ac9cRfvRhEgGg+E3mly0nMyynw0JnKF8SGmw91VeOG
	 36ERBTzTVJjt7m2Cn4LAAlJ6JBBpN172KEsixDnqNf7WdhfPBVAi+CCbkjpsUOKXvyBzk
	 SDC3bBrzKBIIiAMGaikiqlfYXxTPMhXNear1iO06gAyv3eylxVX4oflBDLPprop6uUzHk
	 DLC9e/+bFD6IVe8Ns3NHa+3PQvW7Mbz/eUvuMEwbNoV4QLLefQPF9Z7o21g9m5QtueR6e
	 g87MwKef2WJtHIeIF9/EfV8cSFR9CbZmBHTcrsGF8oTXUL2q2KkHYvaCjYdR1MoRUoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937085;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qId5oU6efIffOiA8tajVDPe+EXVi31e7RDD++IFkWI0=;
	b=zltuRlnrfDAX2pTkXNC5D+z1ZCV262V+rUG2aTF77FLXOLZTRErPtUor0aBEaan1aO5W
	 A4bznjg3gD+MXnko+uXD5T5WmoP9Jf4ESZ3jXHaz+kiPjVYzKFXEyEnh2Sfe7R9VjMUjd
	 LYU1TiCX6K7/Yvn685SEx+SZ0l+LYgWuBzc7Andg6Vazbq9ByDPzuJgFe3akyNTv9gtt+
	 FqNOUFRzOETUixnzx5p7XCbVevJG22saolh6FUIrMEKnfsJo+el8a3r6A57bzVlb/wEm/
	 foUX9mqzQKwQCSg1kN+cBN5w1YW3GIWcsLEb9/YoGvlkJjiUatKH2BXBHcuaDj1nPlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xd9eNF2S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5C2606A337;
	Tue, 17 Nov 2026 17:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xd9eNF2S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491531F000CC;
	Tue, 17 Nov 2026 17:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794937085;
	bh=qId5oU6efIffOiA8tajVDPe+EXVi31e7RDD++IFkWI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xd9eNF2S3oJf9M51r2Y/Hh74LuP3daNmTKtT+nlwtb2NzKaQdYQP9sBuAJSTxYHR9
	 ES3WC9v2/wT609F1swgrUu0z86ub3Tlr+YkhfGeWdvTjrbH80AcGWFjU4WxVlhM3//
	 7ZpTaNw0Ik6mai6S8PJNHdltg6Rd5aHhSAaUFAGMQIPByj0RP+i1tUNrkXvcPZO3rP
	 8cKv2CgK2FiUHVYd09Wkpm0I2yeUg+lnA7Q8pCXy4cOSQIQq60QkJjIGWSaKqlwXsF
	 3IFAAFuSN69OLyOVUp7bO3CtyPJVSnYYBZqtgOfPtcP9Y+9uCPo2m2NXQL/Bg4b0Dm
	 1i4VABcTU0BjA==
Date: Tue, 17 Nov 2026 17:37:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	randolph@andestech.com, cyyang772@andestech.com,
	tim609@andestech.com, az70021@gmail.com
Subject: Re: [PATCH v2 18/19] riscv: errata: andes: limit the IOCP workaround
 to RZ/Five
Message-ID: <20261117-grape-skeletal-89da442523ce@spud>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-19-minachou@andestech.com>
 <20261113-helping-elsewhere-cbcf0c8f67ce@spud>
 <avwdT/vGjfsUCkHv@atcsi01.andestech.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xX4oY8xNNpMcBrcO"
Content-Disposition: inline
In-Reply-To: <avwdT/vGjfsUCkHv@atcsi01.andestech.com>

--xX4oY8xNNpMcBrcO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 05:24:31PM +0800, Mina Chou wrote:
> On Fri, Nov 13, 2026 at 01:53:29PM +0000, Conor Dooley wrote:
> > > Move the match into soc_is_r9a07g043f() and make it also require
> > > ARCH_R9A07G043. Kernels without RZ/Five support then skip the SBI call
> > > and take the generic Andes cache errata path. No other upstream-
> > > supported SoC uses this AX45MP mimpid, so their behavior does not
> > > change.
> >=20
> > But a device using this soc that doesn't have a dts in mainline won't
> > function properly, so this is fragile. Why not just do it properly and
> > check for RZ/Five specifically?
> > Can check for of_machine_is_compatible() probably?
>=20
> I will check for RZ/Five with of_machine_is_compatible("renesas,r9a07g043=
"),
> which on RISC-V is only used by RZ/Five, and drop the marchid/mimpid matc=
h.

Looking at what is quoted, I wonder if my main point I forgot to
include. Checking for ARCH_R9... (or any other SoC in that manner) will
fall over on multiplatform kernels. Code needs to be written so that no
matter what Kconfig options are enabled it will work.
of_machine_is_compatible() solves that though.

--xX4oY8xNNpMcBrcO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavyQ9wAKCRB4tDGHoIJi
0qBvAP9+1RrfwGvdcMspPE/tS0MBvdZoS5zBpUQxasuB4VeMFQEAo9VQjBYpr8/L
QPB6RwjCOmhkEDqVr7MkDkNYTdGuZgs=
=h6tV
-----END PGP SIGNATURE-----

--xX4oY8xNNpMcBrcO--
