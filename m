Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793702774;
	b=gEJv+FJk/fj4wk2MUqorJwxluxwMjm6kIXzsz1ed4BfKOXnL/kBP1UCKVAHuKGSR7wxb
	 ES9eZUZZxmM0vWKAVIM1e/6UzStxrFRpof/w2zN7FW8JSvm21AoSMpNowlIV21a4KwHD8
	 gIw/h7T1P4mlWOg3kPwZFlpEl6Jjcc5gpdhdCKdF6lNfH9CqgdIe+lUJuBQ0X3SwPtS5W
	 hStfPcszC4A5TJ8GqRlP0RmqRU0x840BzHmEHZU6ck7hkohE2MuwtMsMQbgoYlVGGCM9n
	 DJuH/krAJLMAJWRzFU4TC5LTBY9k8OzVKk8/WkIzU90R7j2K6kBmDWc9KpHV2JA3XvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702774;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=ykled9t1sZ0NwtTu6/W1cNPOEmvsHqczW4xKi3H3sB4=;
	b=B1u/Uqr3v2RJn+pOSJ0xNeKZZxRMVHpmiS7HhhW08JzINFYUpRBysYR7RflkGtMk+7aX
	 fhVdjNuvEKs8qoLfp9z6VGsqoPujTlI9kmK3Jq9um8igbo/BwEthzbT/K7VZUqRtnZh/9
	 Nasj6P6IlZHmUY/uWHMJAbXcic3MTD+TLdmOvfJ/EXUubkC5HE+tyPJ/kRg1rG8RpoHZH
	 4wGf+GgFxsyS3sU2SFEbaz+3bRXeO2Z7YgJuItJU1lQ8DPQgPgoCN2pWxLhzJyqhr4Rh4
	 kqCXHmWIF8yRr7JMWOEXzn3G1g04vZifzK4729pTkOmrs/c3jwHTKf5CO0BIFQCV6ZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=QLjSk9PX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79E6606C5AE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 10:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79E6606C5AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=QLjSk9PX
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1B683202831;
	Tue, 03 Nov 2026 11:46:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793702771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykled9t1sZ0NwtTu6/W1cNPOEmvsHqczW4xKi3H3sB4=;
	b=QLjSk9PXgO+HD5XAi7nX7TZU47VKw+vElBZ4QmZ+zFAClz68WwQ2K1LQHvDSs5qqALNopI
	MRzgIQk7XoJR1RTpHisMa61uIoww7TMqGeJC2BMKy0WzwSm+P9mD8NjZgrpV7xr3fUmUFX
	x67LmBd3d79kOUmLYYretrkNEU5hdzxjnPHsL7Lrt4UjvHmOCkqs0h9mZ6I89I4rcXBnnj
	uiScAB2DNfXbPZosZMJOYNcZI3sYdD5TdqODGUIZH5T1Q1bndk+N8xsWJaTb5G8v8CSmCy
	j1tH1NYh7ELVYmr88ZIfnfWWtvzedlbUWR+G4QI6YT0KdTUEuEpQ8z9VNId5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793702771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykled9t1sZ0NwtTu6/W1cNPOEmvsHqczW4xKi3H3sB4=;
	b=axIP1Du7XCtXgp+GO5jzVLDaeIJSQAoI6uWXZre7tLlQPWR7DL2ucIhTUMAkpnLWUTiLhP
	8ahFH+ATd8SjakyASqRVzIxZkszZZZjIRkHyrXnXsdmaCFIPaMkr3/pvPKF1LQrfi+X3DN
	DphDP5uP49XwGb/8LEE16ORayzMDPv9dhtKuztqImPesNQJkQK9u1ctovry+tM3o1Q7Luo
	rtzz9djZDXdxe+MOiXDjcgU6MJaVtm0Sx0LBIjaeneDjkPrQ+RFlhlJEpuoHwd+d7BJxZw
	P4Wma6t2wqaGyG03Jt+h0CGSTN/CrXRFnKrLuqoJ87i7G2BbxRPYHs7TnXaF5Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793702771; a=rsa-sha256;
	cv=none;
	b=WmVjCDT5cizc8r7YCRXzfU3IKMAlNzpLsgF5Y6LEpw6IL2WRfXQ/VbUMlcC41tHesjwz1X
	rrJJmkRzuzUtd714jn6ygxHjkWo4oDXrQQlEb7hlECLTo8R+nq27CxnQhKSWzYpbgGpBJF
	wGbPB392/QOpPjEh2IP23aVLsYE2oYLk/Jw6jo7d3a6Q+SSscE+Cby20MjDJIU0wkOre5H
	lh+1nL/33cgf9AFAnyAjc3ugeD2Hp9miUfYWgViPWlCvJC32HmuKlZIXNSVSxWNLlxS3ng
	H+T+VG73NyMZsHep9H5hv15OO2b8wrdNQhseIiVWW7/rE4+HCR6GqZLIJ1Rogg==
Message-ID: <c18ae12b6b7e849a9a91f5ba1f6a53675a5f3041.camel@pengutronix.de>
Subject: Re: [PATCH v11 0/5] Add RZ/G3L USB2.0 Phy reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju <biju.das.au@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven	
 <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, 
 Biju Das <biju.das@bp.renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org
Date: Tue, 03 Nov 2026 11:46:11 +0100
In-Reply-To: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
References: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mo, 2026-10-05 at 12:18 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Hi All,
>=20
> This patch series aims to add USB2.0 phy reset support for the RZ/G3L
> SMARC EVK. The RZ/G3L USB PHY block is similar to RZ/G3S, but each port
> has an OTG controller, unlike RZ/G3S, which has an OTG controller only on
> port 1. This series migrates regulator driver to use id-table so there
> is hard dependency between reset driver and regulator driver.
>=20
[...]

Applied to reset/next, thanks!

[1/5] regulator: renesas-usb-vbus-regulator: Rename platform device to rzg2=
l-vbus-regulator
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D26599cbf46fb
[2/5] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3L suppor=
t
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D5457783a7432
[3/5] reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3Da0a06fd270e8
[4/5] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D5ca65d048910
[5/5] regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator supp=
ort
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3De0d3ff3fe71b2

regards
Philipp
