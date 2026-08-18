Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE363368A7;
	Tue, 18 Aug 2026 07:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037935; cv=none; b=MHYwvTYtSpgM5PMBLzoZHeOCx1a8pDOROSyaPCgM+S+wNsdaV3FjCQ1eWPTl5zQ2fyLt4lIHdIZ3dq7Pl8TGpWjpIiRFEhRDbo9DMoP7f5hDbWXsOeu+hJ+H87VVP8XAxcaXAhA6yzDDwTIVDGryjEVF1wyh6QkG0KV9quWUXEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037935; c=relaxed/simple;
	bh=G5fXO6UhdWB47PVefK3sRa+KaVSi7i7B4RGf+b8CIoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFASHQgTksL2fbT79ngpA10Z/Y4FuI1/MChIk2VwQ3d1EmAEBzwQk9/SrxylhBEaXWS+XIIK9p7DrpCsgFGV673ztgUnYvhC9lkkCmd4OATBWEnPoNlxf199XGoYpk4Qoh01RK2AfIJilUAyH1b0mso1thOlM8LLIWYlc769Vao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mi3iv7+l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mi3iv7+l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1001F000E9;
	Tue, 18 Aug 2026 07:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787037933;
	bh=sx7TnEaFDx+iHUmN9tF8zbgo4+wmdCMA2XY7O+hG+Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mi3iv7+lmjJtRI8gKaNc/5xKjqOs5uVfUa51Kd6gj5NwB4ehc6R2bLlLwPL2MNs7f
	 8f0m2mbwkuXoFC7QN+9q7KMpOTTjXhUJZj1IQelLHcP+OQCbN9309PpVSwM0G2+jO3
	 mCSLR24ekmNUJU//KowXGYqyivCkr5R80B2YOR5zOEH94TfC/UUaqLaWrcCyt4Rjl7
	 HiPiz/9NrIggXVvMdczJjLliXKJjAHa0tM9o7n2E/mD+FmL4BQC8xiPNYqRfV1LS1Z
	 QNzoBVvaLvMXfHorc9K3wZIuQUkKq3hcWMtzb68AFDGG9FZ5G9OJBoVSbwp4oQX7Go
	 UngtPWkwt4wTA==
Date: Tue, 18 Aug 2026 09:25:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v7 2/9] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Message-ID: <20260818-radical-stereotyped-guan-ce55ed@quoll>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
 <20260812141940.246223-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812141940.246223-3-biju.das.jz@bp.renesas.com>

On Wed, Aug 12, 2026 at 03:19:20PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Document Renesas RZ/G3L (r9a08g046) USB PHY controller bindings.
> The RZ/G3L USB PHY block is similar to RZ/G3S but differs in that each
> port has its own OTG controller, whereas RZ/G3S only has one on port 1.
> To reflect this, RZ/G3L uses a regulators sub-node with per-port vbus0
> and vbus1 entries instead of the single regulator-vbus property used
> by other compatible SoCs.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v6->v7:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

