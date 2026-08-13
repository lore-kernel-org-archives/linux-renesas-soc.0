Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8673B2D00;
	Thu, 13 Aug 2026 14:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786632800; cv=none; b=YQqLRHc6NbgyFma2ZSF38rjEU+ZqIiwlja38ds+ohyYfEgmnTtV8JN080/s/2mRcW8i9kDo6FISCz2ZgpTmnlGCQzsNmh2hnDWR7fgwhdJFtL1sP8XAFOsRqK+kQhoQ+ox02BWmlM40bbiWZZ7/NI4bPbA+UVOAEefQ88sa75pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786632800; c=relaxed/simple;
	bh=wUPWow6SvLCd2wY6W5QKxnTrkEVj/N3Gw29UDN2Oe8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUeEK4PIuOV59Xwde3+07m6f5j2le7ZBy8JcpuyctX+9WTb69gjt8v8QqRHOaWBHsLnPPAChORhAuztOWFdkACXzXdKem25DKHfe2JgS2tIM21z417wMhAk7BB9I9u1FQ/iFTkQDIO2jqOqmGbzA9/xgHDbFjw9w8PE+XjHVY7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkohY3Ea; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkohY3Ea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFD81F000E9;
	Thu, 13 Aug 2026 14:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786632798;
	bh=wUPWow6SvLCd2wY6W5QKxnTrkEVj/N3Gw29UDN2Oe8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JkohY3EabStjsfF0cwnIqhMRt9O4vWBHDFUbkhsb+Yizwi06dae13vLZgc8TbaH5X
	 fdkC8af05CRA4SDW4OqAgGdpw3GFrhIOhFpCHEQKviJin2VbuKqoPFv54mz8wo/eoR
	 +lGrmDWjGfmd/O3xAZjaif1aCGnqavCuHUeOeKduk+19BRYnRdWXCyMtGf4k419Vp2
	 PSpET9mPB0qRpMRkuWdHP5RNXODgz1yXUpBD8qIjmOvcvN3hSbwNagskZw37076L/j
	 XN4wOsbe9EXvjq7RhPOLWV3H218YVG+hQsB+Jjept9vJ8EZNYlpLf0+9V/x8aM9CCQ
	 AzGRWFqlhKslg==
Date: Thu, 13 Aug 2026 15:53:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 1/9] regulator: renesas-usb-vbus-regulator: Rename
 platform device to rzg2l-vbus-regulator
Message-ID: <f3edf85a-ae7b-45f3-b470-a0538aed3c2f@sirena.org.uk>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
 <20260812141940.246223-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zg1tO2X6FQS0oUvj"
Content-Disposition: inline
In-Reply-To: <20260812141940.246223-2-biju.das.jz@bp.renesas.com>
X-Cookie: Immanuel doesn't pun, he Kant.


--zg1tO2X6FQS0oUvj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 03:19:19PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Rename the platform device name from "rzg2l-usb-vbus-regulator" to
> "rzg2l-vbus-regulator" so that it fits within the platform device ID
> table's name size restriction, allowing the driver to be converted to
> use ID table based matching (struct platform_device_id) instead of
> matching purely on driver name string. Update both the driver name in
> the regulator driver and the matching platform_device_alloc() call in
> reset-rzg2l-usbphy-ctrl.c to keep the two in sync.

Acked-by: Mark Brown <broonie@kernel.org>

--zg1tO2X6FQS0oUvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp92lkACgkQJNaLcl1U
h9CqrQf+OuaiXK4WLAmc4QlO/4N+vF9B9n4VmnptlZ10NfKKLFBr6bj7jOROes2M
JJWZ4aiYbKNbN+drXz8gTeNXevzTRE2Qx+HRuxdd8+tPD242wgDqMHWomzQGOaF1
rTxpGugL6omZ1Fn8KlsGullYhUbstmylrEbCvGFQPfvf436D37H2hnFFkL7u6qpo
8FOz/7jA0wQhQ3dmrceXvSMggog+bd5pPoIBF3V/hP721pSVrFkr5oDMuguKmQpS
ow/Ji/BNME7be7foNOgrUVocZX4zuzKsZwPk/19TP3nHh5sZBzMckM5SNcXep/ae
sbJj21wr3NWEDPBF4bPGczBhlqlPFA==
=tjKY
-----END PGP SIGNATURE-----

--zg1tO2X6FQS0oUvj--
