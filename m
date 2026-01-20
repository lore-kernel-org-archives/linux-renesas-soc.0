Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EDB39A7EA;
	Tue, 20 Jan 2026 19:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938658; cv=none; b=Ofz5iB1VWm+GSdo4u3QTgPlP5TLTZlHObt9HqpWRprUcYEJfw+Uzo8SUiXGlrufUEJMPji82V0VnwXSYhYd+F+N5SM6KduwzDGPKApQyCqBdlfjXVCbspe4dAWXBFCHpDa4qr0agSAz2KJhl/YkHZlBpiyxlDufy0YnWWEB8dls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938658; c=relaxed/simple;
	bh=rNm/BkKJ2SsiZEmOA6OjQ7wXIRmMYA9ar56PDVxN4+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZcN08eODpTuxzwHcjcVXSK8fFJfh0XGAW64BLG5OSlIKxSdobZY3zo6P83Fd53mERUsCFO2Uz7BBEolXekwi2rV3fRQn74Pq+PDmWH+JVtS6wdfZe3Sdugaa34q7ywsdLvLYdjU0xd34RUHUL/+JJo/vzHfY3C+pFboVeXJMgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZ6qGrHy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZ6qGrHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C426DC16AAE;
	Tue, 20 Jan 2026 19:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768938657;
	bh=rNm/BkKJ2SsiZEmOA6OjQ7wXIRmMYA9ar56PDVxN4+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZ6qGrHyuB96elpG2KxNCHyAp6Kodbkn6r+hDHyimuRLW/+UYbXKjNC9i1K3n3/Up
	 7YME1JkYRcvH/pAQkT1mvgryKQyxcSv2FLHPP3VB9zggrn+B6cRRfxzjTHnYGgFFQw
	 80VTeXr/ddjR87k8k1fFuxrIRkRf1xBTzv+GssbIA/KqmppgyVZYDCE+tuh/ZCb7UZ
	 kIcgYJiqi9hTQRgPXZ6eelpPTMb6cv5w8C3elYUiUYuyeAIxff0Y6MglbVnEPVt9Qc
	 3CiriA0xixEaN6hCjbHrXNxpq+ZSyUCCB6ZtXGAVWCUOzBjLBvzSGMB3QlLrtwqep8
	 E1nw6i+y/gWiw==
Date: Tue, 20 Jan 2026 19:50:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 05/12] dt-bindings: soc: renesas: renesas,rzg2l-sysc:
 Document RZ/G3L SoC
Message-ID: <20260120-payphone-aloft-eda520f321b8@spud>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-6-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3PWG9u3tglYC55KE"
Content-Disposition: inline
In-Reply-To: <20260120125232.349708-6-biju.das.jz@bp.renesas.com>


--3PWG9u3tglYC55KE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--3PWG9u3tglYC55KE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaW/cnQAKCRB4tDGHoIJi
0hBCAP49o8uP93CKKSVtfEoeB92gILJ5vr4IxKiN7AIbN4p6VgD/aFXv8y8h7dLo
pmPE8pZ3AWtsbU1mJqM5hDOTBJrDGwA=
=qhC4
-----END PGP SIGNATURE-----

--3PWG9u3tglYC55KE--
