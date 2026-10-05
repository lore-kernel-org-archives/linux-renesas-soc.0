Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784D32FC893;
	Mon,  5 Oct 2026 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221968; cv=none; b=RJ7ZL9hwpFFPnEg9fLsAh9njNGulyEVDae1jbcEqRLPx4/EA0cFOxGgiboUCpoN1mWeppajY0IGA9E0u6zHfUaEIBdBJrNCwmEQaRIYiTUhyxcyO0LO2QWu2v0TQil8JLBgtkNApj3xCBB6ApGXDMOmVi7c3bkHIAgvpfHI4PAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221968; c=relaxed/simple;
	bh=vxhBAh0IeXj4iZWX6ujMHYAtXYu2EAQEVMDwCdfdRSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ho73daW7m4iksu/oNGcwy8Y3n+rboojEFqDebbVVVoPExSi9Um2qnRRLTiPlYiXpod4dea0PCNuEkPP2OASDuecSjioCxP/lldXP5BrileyeUec5BQAFOyYs3Z9XZnz/AzS/OclNJdMyQjxqRuWkTMmGZvOzGz+yJn2WRbef9/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuIaWHUE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuIaWHUE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6251F000FF;
	Mon,  5 Oct 2026 17:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791221967;
	bh=TsmxYqxnO2WeDg7wCu20ugj5Cb9eTylF/b6Hy0gfseo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CuIaWHUEI7pte7UZKTKwpO1hl2/iAfMacg+k1ej6wGc9LSh3sm2mD/eFXm30zu1Ne
	 dMmlKlMYPQMphBRkuDzHXnYFKrRLqX5f/CRnQZTwL4+hThzf7j1sQeis+W7G35ouKZ
	 6faCFQV/xL7pA6r5uLaAPRsbSNadW+1fSrOiPaXYJ+/uJ5vAZzuWQU+EmvWwRkwsc9
	 Uf14BTamwzOXlfrGC92G097i73PmAZN6Wus2AVoOqmjQGHxawNOu3B+Q7kyE/qNs5j
	 tAsAKPGiE/FSAd+1NFS66E5m754F1wVwru7jvFQW0wNRYDDKE0zhpq/4lUB0tbyh1u
	 Ie/LNrK3fqEGw==
Date: Mon, 5 Oct 2026 12:39:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: media: arm,mali-c55: Add power domain
Message-ID: <179122196593.1257096.7152760198243996928.robh@kernel.org>
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <20260928-mali-c55-renesas-dts-v3-3-2cf7eb746ebb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-3-2cf7eb746ebb@kernel.org>


On Mon, 28 Sep 2026 14:21:49 +0200, Linus Walleij wrote:
> Some Mali-C55 integrations place the ISP in a power domain. In
> particular, RZ/V2H uses the CPG domain to manage its module clocks
> through runtime PM.
> 
> Allow a single power domain and describe it in the example. Keep the
> property optional for integrations that do not expose a power domain.
> 
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

