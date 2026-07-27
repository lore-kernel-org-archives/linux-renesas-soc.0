Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244CB3AA187
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jul 2026 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167519; cv=none; b=dpdu4kaAXSxIh0vKVivfl1Is2gnMHB1mLVasbGYPZv7hJ29Vvbyj4x2cFtHcPSN2hSRRaoNH1Lm3OkpA296zCSx3T6I1ZldOG+dqgllkX+0KUxZtOC03c74hZf1lb3aiH0KyFCCwOJMzolUnENUuMM5XC5YIOTLXaEg4TSLCJQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167519; c=relaxed/simple;
	bh=4VRjDPXpUz5nr/ONs3h8eN0cltUxM/zj2dhOBv9VUvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUzVIyfuAhv+Q18kIwwOybm7Lc3iPSw6rwS4t68+gaZb51YrvxERswjH6hR8XnVMyjpQfz43peDMCNZK6/DS1RJzSMK5Oy9HhxvdQGmuseVhSSWeq2fvnxia4CvWd7ujnZOt81hI4arFzqIh62a+v0ExGR+udSBXh49Fa5T6j0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i5639RbD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i5639RbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=1y+3
	WjlCp0prLe2Yyy5mqGad4x2ebeed3gFXOHwXGXw=; b=i5639RbDF2Cm+vHhKkpe
	mXxKBGYZTFeLCE4CJIhyO4AOog5vBZHVawChK4s8y5eZeOLUkscW0icRRzYBN+He
	RwJ3gK48qqwzBeTiuRVsDoKwifZtT2hYDGN3clhbboUukacMsfWJqd/rXfGWT1yz
	wT7OZr66Q29HDHethMY/5goeWl69b+Q0erkmJIqYRUAXjRpH+UHN7g1VkDCrqt9P
	lA0LzhI4oDIcTI6sHmgvBrcIjUiRxSEVQ88LYW7Hf0shfuJGypB5QazC6/B2m6g/
	KfhrAIUDyXsq+b/TBv3yysA3vTuuuaZ53gu3jB4JdkR0M/ha9c1MlzPJH9hT1lHG
	fQ==
Received: (qmail 655990 invoked from network); 27 Jul 2026 17:51:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jul 2026 17:51:51 +0200
X-UD-Smtp-Session: l3s3148p1@UXxcs5lX3L4ujnuy
Date: Mon, 27 Jul 2026 17:51:50 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 0/6] memory: renesas-rpc-if: Optimize transfer
 overhead and implement runtime PM autosuspend
Message-ID: <amd-llbKq1t42NJY@ninjato>
References: <20260727103449.3188105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uDbJRkIltbee1v1K"
Content-Disposition: inline
In-Reply-To: <20260727103449.3188105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--uDbJRkIltbee1v1K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

> This patch series optimizes the Renesas RPC-IF driver by significantly
> reducing software overhead in both the direct memory-mapped (dirmap) and
> manual transfer paths, maximizing transaction throughput, and introducing
> runtime PM autosuspend to prevent aggressive power gating during
> consecutive flash operations.

Sounds great. I want to test it on R-Car V4H SparrowHawk.

> These changes were benchmarked using flash_speed on the RZ/T2H EVK with
> xSPI0/1 interfaces operating in 1S-1S-1S mode for write operations:

'flash_speed' from mtd-utils, I assume. Did you use other options than
'-d' for testing writes?

Thanks and happy hacking,

   Wolfram


--uDbJRkIltbee1v1K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpnfpIACgkQFA3kzBSg
KbbzCQ//X4/9osMEcycirXaHwkXJ3rlsCQ4d5hB8yW/SVU4W1ptYD2xzO4FPOxof
l+qjIWOEIyl2ykn/S6wUC6Wdazxe2RzOhS5RBk4om96IHyGZH/TJAPZogB9PMrRt
VisG3oUw8hCqKq+NywW0HzlCJagmPS7baSoqZrbztHg+3EKNwke/GpPMVf+Qn0kc
9SYrPLuB1gQsjRm/ZAURJ5w6omuubjcvNSawHFv4oJxfomPBmCC30vZ5c7s/wURs
sQRf4frGL6mXAu7f3dMw3mAYRbH4N3QZQSy7Ogie1L6Ix7NNb2Zm4U0inYFH+ag3
isW/pzS91C6/dEoifYURCcQNTLEazqAu6EMSAfK4fRpGIw9YMYq/10YrffN/5GmB
vgIrg61GtCb9WXfHGIOXrkBW4QhFxH3vVMdjZZUSTYVwLM7OnZv3jZymhcMHNgXD
KctFS+1h2zyCsMIJLkju7bSRbwsffiHFJC9B48aB1YnzebAaVmDmRYAQoqDRmqW2
MDXFYnJFdyj7Lh9CHNA+qu2rFFQf+ezrMU/GHugaIazb2vkeBoLNEjt9XYhzECV0
FHci3ghF5VxXkZsUu6HCphynZEQ+jM9mFzgq3WJy3VR3D6slJ40ZpLTj+xkNGTlP
EnnQnasjIogww6ONeqTNZsslLL8eL2iYgMqrBCPKdgMear0kR1c=
=1RD9
-----END PGP SIGNATURE-----

--uDbJRkIltbee1v1K--
