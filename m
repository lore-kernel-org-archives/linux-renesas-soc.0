Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDAB42CB06;
	Thu, 16 Jul 2026 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212103; cv=none; b=a3oUFEMfJ+iItIUhWbOPeQPzxn/zbFVp1KJMQQyidvSc24PVMwXvjYITQiOH/hFviPlZo5HLfoIAJW7gdQHWqdchTyteuUYVhnD/qPDnfNF7i8l1pAzTfNRK5cFX2d5chRfyEb0DkXqG13EeFKZf7G4ug30sxXP+XiSrkM15UHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212103; c=relaxed/simple;
	bh=8k3EmR+yLOJSC6yg//MDTd0myJ0q57zCiZLtOv4yHW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUcVJCg0ZcB4yQ+9vmO3F8PXkq2BBK1LN07UIyXwHV7PFmDx8rflUcjxXBUYLCD3jveogkvqt3GOZ0B/qyLBysH9gsSp8ryfidfrSMHkzbQQ8lBe0p3qdoT/0M1BHelSx5OFPDeVOL4agjFTuXtsBU5dLwscx+ZmiAfv7PFGT/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBoCZDUl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBoCZDUl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0CA1F00AC4;
	Thu, 16 Jul 2026 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784212100;
	bh=8k3EmR+yLOJSC6yg//MDTd0myJ0q57zCiZLtOv4yHW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VBoCZDUl74V9Zi1+YzAhTRxSNwmlb404HJNCu46kroZxu6gIl27d3qajocirYS1lm
	 1DmngZpPWp2c6A6lWlCqi4MebQhkK91HwY6bZE1+yCdAJybkEtbGuQpN4QFOhNjvGy
	 b952/0IVWtPFYRngTh41XZFmwduHO79hwz9qc6kg4c7GtOG2OfgBaz0sibkl+dS43E
	 PfyYTlYKlMEWOb3TWV/Vy3uP0/QWnPMRqOIUxpS0oAgSMfH4Fxms7sVrsHGr3KX7IA
	 DkMaPYjWgGCCCuO7wJ4cNggPShUwF/gfOLnatT5zvxdV4dYy8Vp1Mq64zQTN94HSVF
	 x5KLV9QakR70g==
Date: Thu, 16 Jul 2026 15:28:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-sound@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ASoC: generic: Card name parsing should be called after
 xxx_for_each_link()
Message-ID: <fc029f86-b274-4591-b424-8ce2cb005176@sirena.org.uk>
References: <87zezt0zlw.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdXfwYbMhzU4Q4L3Gz1vaatJs8gdgPytVGRUCzWAHTVK1w@mail.gmail.com>
 <87se5j4z80.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z9qVLZuUrKZvR/Fq"
Content-Disposition: inline
In-Reply-To: <87se5j4z80.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: The more the merrier.


--z9qVLZuUrKZvR/Fq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2026 at 11:20:15PM +0000, Kuninori Morimoto wrote:

> I noticed that I want to +1 update to this patch.
> Basically no functional change, but is for cosmetic fix.
> Will post v2 patch today.

Ah, I actually already applied it - it was finishing CI overnight.
Please send an incremental update for any extra code change that's
needed.

--z9qVLZuUrKZvR/Fq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpY6oAACgkQJNaLcl1U
h9B/RAf/ZEPGmncsoB0JvwAvZ9UzVqoWWcnygFd7nIVj2k1QEmv5B7Jou6VNd595
QowWu1muYHkHOZrMXsWqi5432r0z73M1xh8wc3gcOjmqUNG3ueBlUPSCs9YKCLir
fO44Siy1JSKPJ+YfG1E45YmwltiHeyASDsiFLt8Pz7NLjlG0WVRo1t1T2Wk/nWr2
kPVNcaRA0Tro16tO+/yophXoO1/LCjwMdy5LpQUH5S5HGYHbKexloJ2WrKyvoI17
dXRXziUyF/dCDuPk+wogNLNCTA5IcnNlmNAH/1o6IryOdZyEsjX8+NUlpY3M8/z2
LpFMTNGlhlTAXAYFQJkNNlnX/+0Qpg==
=HHX7
-----END PGP SIGNATURE-----

--z9qVLZuUrKZvR/Fq--
