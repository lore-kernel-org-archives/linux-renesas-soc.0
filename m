Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FDD1DB13A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563569; cv=none; b=u1nSelD+ZVF6N8wps9/BVfnZ1P0Yri0iZrxH0P4B5d2yH0/FdbYN4YUQ3rn4jwoaAKyOfkVloUIhxd2Si5FW5oJRQM8AlSv3f0CDQhGYMWouhpuk7fMJschKDXMt5IjJ568SguV+tDuzB+R5onvoh57Oaq11MatVIgK4SJkeYj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563569; c=relaxed/simple;
	bh=l7CFb4xOZbPuJELvvFP7tm4tI+VCynPG/D3gOjFxKwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dv1tBWifH0dI31WmtLlg9G7866iy+HNZP8rUtIUnQQeac5JfBZ2QRhmaB9oPLwCmlJ9ECPGtuWkx8Cemu6t76jaShJqcjNrFBPdgMuE3EMe/8F3BYjTyCAo08g3p71ifIUr9pHnYiv2z6SCCK6pA9z6vKI7hAJ5azQHzPzVQNKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LcOtntf6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LcOtntf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/5AK
	Q6l0IwUGFy/ybtUhcb9MAob6uwP4n5vGEAkErgo=; b=LcOtntf604vIbjG9u2wb
	wOFmgJfOKZNzHwe2UWzvyBpos3ahdQQTVB+QmYJUtX1AecbnpaaOZLw4zsGhD9TK
	R6QWSeS67G4HyHO/ZCykGn7Rg6Fa8fHLdmGhvT3RKmsrYJczSc9EpUIPbG4C/PfR
	T6oumTZbLiR+x9e6lFnu+J9hcp9KbDCR8lTaWqbLo4CKIyPSyJ06gGMn/l/E/daI
	bVhA4LtqsAgKvuuM9n69HYCNsAx7Z+AQMjjwqHjs9goKXP5izLM+5n1nnp6Uv0/8
	TxcifvAzKbo0JJtlGPpVDYuql6xgEMNXUhW/afp8K5R8ewQ1fokT7knoCkPboQu1
	hA==
Received: (qmail 1658484 invoked from network); 24 Aug 2026 11:26:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Aug 2026 11:26:01 +0200
X-UD-Smtp-Session: l3s3148p1@Rt0Vk8dZSusujnvL
Date: Mon, 24 Aug 2026 11:25:59 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC
 support
Message-ID: <aowOJx0TMIZMyFUa@ninjato>
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cf0Y3ECulnKKJpN4"
Content-Disposition: inline
In-Reply-To: <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com>


--cf0Y3ECulnKKJpN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		rtc0 = &rtc0;

Maybe 'rtc' instead of 'rtc0' throughout the patchset?

@Geert: do we have a rule for this? There is also only 'gic' instead of
'gic0'?


--cf0Y3ECulnKKJpN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmqMDiMACgkQFA3kzBSg
Kbb6EA//Ss3Uybzb3b7W7RDLKLeNDfF5h+GRyYd0Qs0OC1l2sIV5JTrKJgZE/fXz
0hDpnCHDBcb8PH506FFAZ50zJ/2NctMb04mVgGpGsZxtLmXlGkZp0LpzUAnV/NEk
b0aCKt7npgz++Hm1iWtWSclh1jJMgxgKZFIqp8lRd5JYoa74/AB3WlJWmejVtAgU
Wyr2a/bvJzf+GivJTaAKXUkgsuhNEJcYW7ieItNdGNlb2iLJ4Q5O4aXlHw1yk9eJ
W2BI8PoEpWDFP7lFt8iPNxzsJmU96BwwDWeuV1nDjRSjR/QUGU/+VCaG9hSGosJo
6jNp9WM1RlFt1Yx7BRTPjTm74fAZrccZPuiPeGN0RjmWFK9H8f5CNh1rc2WUtP1Y
BeVRKYrkQtNRJVSvFMLTzBsbnHtOGp86bna1Oz3OEdLUp6mTVzzMRYU0QcngziJu
iOgU/SUA2d4WSb7J3QgZ+xbRrBNCf0HP/9HdDBjuqe16GIWMsFhZ3amz7mfuVtme
9HRAq5Y8Z3kmpMgEZNKWBBZhzfC7vcUL2Ka67tQrth5liKtogHiNQYl5WZ5ASubE
QQS87uI4fN5P4FM1XRSkPmfykhX4pjRClxDFkkTAZGC73Vel6abqsRNdNDtLEL4c
CXiQNr+7RRE7doIOZmh5hLCBxsRBUm7+7hAK/EwXtgDPTy1lKxQ=
=aTBk
-----END PGP SIGNATURE-----

--cf0Y3ECulnKKJpN4--
