Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270364B0E28;
	Fri, 25 Sep 2026 16:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354718; cv=none; b=NHp0lqD2lKVgIowG/MWTj0bJaHxvIn2PGYyMyUCY0/idYQURoETZEwdE2KQtLzIDonLodhy3HvusZABm7tyNNT7WFI6lXhNz2Q/ZnctCfVs86QqVpumrMZHosJcNHRvRyNpcbYpXSIEIXtDLyDxEYJTJmzUMq+pJRB2khzixrOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354718; c=relaxed/simple;
	bh=UfTqMoZaKl1g2H1qPqJgwV+BIhhP3ccyhCE+fxx6oqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQoaXCCbN+hqJ/uysm4v78p5Km70+iD3StM9OrIcejIyXFIffekzh/VMV/59A/EKBfyFx1Ft0a39JQciRnzYVhEfqUfp2onndj26Oiqw59uCVdQbywQi9tOp+kSdEu1APzTvge15UeFZB+9z8133808/LSvK0lF7a9UrcHDc05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+AzGy/3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+AzGy/3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6971F000FF;
	Fri, 25 Sep 2026 16:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354701;
	bh=UfTqMoZaKl1g2H1qPqJgwV+BIhhP3ccyhCE+fxx6oqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G+AzGy/35yWcB/yRSQPg6CKCHS8fQQsVhDau7eZLgAam//ohXhp06x4Atq4uxdUWF
	 9FhACAsB8aMRJnr4xWYyh9lY3ogjiz7fj9afyW5V14FIUtV9BUiZjtAx2c8KFqS/3Y
	 9Gva8wwtjf5bcXoLBYUcxBuDbsNgP/5XRwdvXs3EIHzZsSAlEJsZQPfTrL/XdSxrIp
	 sSj92Eoi3owe4+B42Lc+P57WtPZuykz4nFB1byhJDK1LFiJ0NuwWehCs4jhKxsijd+
	 i1fi1OymdEt1qewzd3r/3onpCuHnRD3SFlHZZtxnajgcPxEd9SIHJBlcpvsDa1FdFa
	 P7roDOrae40tQ==
Date: Fri, 25 Sep 2026 17:44:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: renesas,r9a09g057-ivc:
 Describe additional interrupts
Message-ID: <20260925-asparagus-overlap-380bada986b4@spud>
References: <20260925-mali-c55-renesas-dts-v2-0-69f728a474a2@kernel.org>
 <20260925-mali-c55-renesas-dts-v2-1-69f728a474a2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Epds5nlVIYwBx0ec"
Content-Disposition: inline
In-Reply-To: <20260925-mali-c55-renesas-dts-v2-1-69f728a474a2@kernel.org>

--Epds5nlVIYwBx0ec
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Epds5nlVIYwBx0ec
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaralCAAKCRB4tDGHoIJi
0kmhAP9UtzLGipSknLNtJhdWdswGoctUdt+/1MEwu6KRq+oEogD/YbIeNPRWWTVP
OegXHGc5oWJI1TgfTudw6K+NH45n6g8=
=3vm+
-----END PGP SIGNATURE-----

--Epds5nlVIYwBx0ec--
