Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DE53803F7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 08:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252505; cv=none; b=eMmlL4RCXLz5eHA+H34L2pCyXxGGwOWYBQrro+9gYaYIwOZg4JppsTQ+I5Q5MggOApjBgWXpjD5u+y+HEGqg7u7bW0IpFOFE23AHbM8GgsrA78T6ZXfaz9oe6CE44ssISVRBFXIVybHVT02BMiTfykEbex6WVtSd/EuRZrl/0bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252505; c=relaxed/simple;
	bh=G5HObu2Tihz2hc4tPre3bUJCkouseUTjJdA4SRq/f5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cn6XlZ62d36JRGb9jomI1n865w4byVHqBPGv4bGreQLr+/XWg+YokLUHpjw0wUNuZHmAhBONZoPFaTpP0Digg9LzzNtLIh/xtq4NmpWWNw7m0cfyg2zcFv3HIBDMOC3zAu4ALv5RqSu/66NApLjJKaKA6OnngIyG2rDxlYjG8zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gtR9L3SL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gtR9L3SL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=G5HO
	bu2Tihz2hc4tPre3bUJCkouseUTjJdA4SRq/f5o=; b=gtR9L3SLbLkH3GoQnwiI
	ktbCuh1lwC9ztTlsJjGMDVkiu+4ur37xGa7l8uWaXakW63pt+42prygLW6xpQoUf
	ImAzJEYxNvGbq7cBm1MG5eIEOsV/ZPBWjma8j05GgpwRnFI2/cClDA9UMkD7vnUe
	+/Y96q1D5a9VrVWws2i/0u+ijoEJ2DY5bOYi02MG51bzwbd0ZU9wOmE7BASIG5Fx
	YRTh5ZTPzFL1V7D9+PCyt7E5MSfC0kjG+pSaRKLnD5CrqPTxEE/1irlrQ59FhSCN
	w5c/lK++V3BtYmAZJhnUl9x/uw+Owz+LyCx3XjQyLtDP3TH/xb4ziKOUs2Keg728
	0Q==
Received: (qmail 2450355 invoked from network); 12 Jun 2026 10:21:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2026 10:21:40 +0200
X-UD-Smtp-Session: l3s3148p1@326GKgpUMpsujnsK
Date: Fri, 12 Jun 2026 10:21:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: sashiko-reviews@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: renesas: r9a06g032: Describe SPI
 controllers
Message-ID: <aivBk9sG1_XBj6cv@ninjato>
References: <20260612080354.57459-5-wsa+renesas@sang-engineering.com>
 <20260612081631.3AA171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sQvOxPUb5y9VI2SJ"
Content-Disposition: inline
In-Reply-To: <20260612081631.3AA171F000E9@smtp.kernel.org>


--sQvOxPUb5y9VI2SJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2026 at 08:16:30AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Target-only SPI controllers missing the `spi-slave` property and improperly configured as hosts.
> - [Low] The `spi-max-frequency` property is improperly placed on SPI controller nodes.

Sounds reasonable, will check!


--sQvOxPUb5y9VI2SJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmorwZAACgkQFA3kzBSg
KbbpIw/+Kyjbk4q9VBPms3WcWg9K9qKw6zfHpvAZOwLAuXqFWmTuQ7eJ1j/UiA8c
s0rHhrNPeEKjIm9PzTXmpaad6pnqjNFt+zMtwpSmxl4PiC/noKRITu4WCN4Sxsa3
KgJVi4g2E0zz5fW3pls5aFsttbbd3Sl01BjGkRrDF2Xvm6E5w1k9Y4mEVaf4xMn9
jEOicspnjDzVZeqWZcgmrUzWDH/cEMwmBizueKhyla0ZcRRMnjaOe+aQQxQ4BVDU
3yPret/3f+3tlD/gUvVnb1cncXQSni/mrAfvZG6UlYWb2MeExFxNDXNJn5JiOqMS
neNNzusERcTajo/JuzeSu3WrabdaPxB9Oc3wau4Vp2G4DqR52nAbn0oUiRe20vg+
jCnfz/Hpfnd8gxNR1CSI+1u/BtWScLwdPZ4NuV+oJf6rQ+vE6TyerFGCVFYI+bXR
SdrbsbEaXHUcKbMiAxPaLR+9Lw+Jevo4HYxKg5ySMboXPzx33Y4+Z2lvuLDiuGSH
LU7bQQoQLDXuUGBBhVsRn5PjTeQdBh7+3HGnYv3sAgzC3JyYMzSUFrJ3YO1jorjn
flbDyGDjPOXhVShwyulCMfAICCxADvxhlZqTIfx+TkQyzp10zUS9jNq5nd0HjgYN
NhNGuXpeL7YEh44xfZGkNOmZz0Z2YmboGVOvO1oWbMcynzDMabk=
=cCzb
-----END PGP SIGNATURE-----

--sQvOxPUb5y9VI2SJ--
