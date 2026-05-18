Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA0026ED5D;
	Mon, 18 May 2026 16:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121690; cv=none; b=sCPZPJD3eZR1Bv4TbQ3s0w1iqIKiPpL0LEvnGI9YGu5A81oMduu0EzDar/MHFJOV/55qh+AjvzwSyIsg2s5SaHLg/FpLH6jIhaHbnBpdVw/74GcnkYTbzjZ6Yg9vzN9rNKl4uuHAGTBnm5TvjccepANbd+Y300QAerYwrcL9x0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121690; c=relaxed/simple;
	bh=3jGoaYLrIdfY8fxCt8RE2gFSjMDiP51+IVix3OYHhPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYtjoK+/9/EGP6Yhp0GDuqtD/YQOQL+omlMdLbfjKs08CGAw1KUSTQ6idmYDNjA77gvKgIlTKdq9hv7TWETk3EW+WAwbzdG8pnUrNMTORJaq7wGk4jKfd/4xwR89WZJvYJHRLq2psXqZeMBBWrlLExo+kMZY30DWblYPoenu/gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7ExYI8T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7ExYI8T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FF6C2BCB7;
	Mon, 18 May 2026 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779121690;
	bh=3jGoaYLrIdfY8fxCt8RE2gFSjMDiP51+IVix3OYHhPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7ExYI8TItuqZz95XMRoZ60wsT3UBHH2czPLr5/hOQB77QY5jQITBge2xlNIE8AU5
	 Cd0yMJccZO37BZlp4CSoOlnL6pKqrLS9AB00DVqJEdwEElj1djSAdXCcCbPfLBYDIc
	 y0wr49RKJ5QoWDhKZCXz9PsOGJtOkdPnpO67XXfslPcJrojB6I2crWCJuJVyshJ5mp
	 /JAVg1+isUTuinLFcZ2Ttug/pj3bhbuIL2qERaPCyvdFsE7ur2Ak8laaFj31/A6+Dq
	 wBfAvnmllN92N02lhiySqatuyuNrOXtfqogL0yUJKMjI1Ji+FdUhSa7OSp76aK+0fQ
	 XOLggQ0TPB4OQ==
Date: Mon, 18 May 2026 17:28:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Cheng <neilcheng0417@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add Meta Rainiera6 board
Message-ID: <20260518-contented-untimed-85b12903469f@spud>
References: <cover.1779088499.git.neilcheng0417@gmail.com>
 <4f7aee0a2dfc44770347ccc82e54820e7b35317c.1779088499.git.neilcheng0417@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D4Ni9Iy8zbLh/XVa"
Content-Disposition: inline
In-Reply-To: <4f7aee0a2dfc44770347ccc82e54820e7b35317c.1779088499.git.neilcheng0417@gmail.com>


--D4Ni9Iy8zbLh/XVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--D4Ni9Iy8zbLh/XVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCags+FQAKCRB4tDGHoIJi
0h/xAQD/GO09ESffxZeEWy0y0qDA2FYxyklacN0+YEI/W2UZ3wD9EAzOZtufjk4m
QRtp9ItGZJ9m+ezm/FyqrNQTH/CIlg4=
=dcZV
-----END PGP SIGNATURE-----

--D4Ni9Iy8zbLh/XVa--
