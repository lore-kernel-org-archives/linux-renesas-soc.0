Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F0233F36B;
	Wed, 10 Jun 2026 14:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102033; cv=none; b=WluwUUCK4wzcQB1NSBFmjHtzNvqR3teVFgjjYKuoSInbuXWgKJ3k0fcmEUkRg2TvlINcG/ZpFuJFtvcZhtkdNQgPkQHOqsnyvFDFUj6v2USVedUkuUYPhYE1KoxhbtXvrzcCdGMNbS+cRjItLF6FmtOvs80gIB+1tajfo7W4uaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102033; c=relaxed/simple;
	bh=i7RQ4Gw4M6Wu82GkUyGskRHB6aI+zOw86mvfJkP5tWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGKQYE6TGlS52dx/2b4yQsD7d5NJtNu3JASbwjDKB2n3Ih0YKDE9zsY9G2RH3G22rPDVQ0dbwIz6zvmUq/K3k6I51croJy9Ywv1UlxADmFmRihh4JbIGCJFpHTb+cx9JSNc7tsSFtUieIMmI0FNnxYx3v3FZACf9PIqFl/pLR9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KlRY/4B+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KlRY/4B+"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 814619A0;
	Wed, 10 Jun 2026 16:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781101998;
	bh=i7RQ4Gw4M6Wu82GkUyGskRHB6aI+zOw86mvfJkP5tWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlRY/4B+3NDJ4asXb99Q1Ud+fRwK17IFnHqQmA0jexOuAeiGG4p4PTYB2NKgysO+5
	 mZzCri0SH+8nej6YuJb+NunyYI9WJ1PeVb1mc7xTELGrqV27NR6CZbg+I9UEGjXQua
	 2406mb7uDMeq/zOhnS76Fxs215a5VWVKrPcsjbuY=
Date: Wed, 10 Jun 2026 17:33:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: media: renesas,fcp: Document
 RZ/T2H and RZ/N2H SoCs
Message-ID: <20260610143346.GA1335994@killaraus.ideasonboard.com>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260430100929.1088281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430100929.1088281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Thu, Apr 30, 2026 at 11:09:27AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the FCPVD blocks present on the RZ/T2H and RZ/N2H SoCs.
> 
> The FCPVD implementation on these SoCs is identical to that found on the
> RZ/G2L family.
> 
> Update the schema to disallow the "resets" property for these SoCs,
> reflecting the absence of a reset control for the FCPVD instance.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/renesas,fcp.yaml | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> index 5e11ae0ee456..cbb16a7a5481 100644
> --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> @@ -34,6 +34,8 @@ properties:
>                - renesas,r9a09g047-fcpvd # RZ/G3E
>                - renesas,r9a09g056-fcpvd # RZ/V2N
>                - renesas,r9a09g057-fcpvd # RZ/V2H(P)
> +              - renesas,r9a09g077-fcpvd # RZ/T2H
> +              - renesas,r9a09g087-fcpvd # RZ/N2H
>            - const: renesas,fcpv         # Generic FCP for VSP fallback
>  
>    reg:
> @@ -66,7 +68,6 @@ required:
>    - reg
>    - clocks
>    - power-domains
> -  - resets
>  
>  additionalProperties: false
>  
> @@ -83,6 +84,8 @@ allOf:
>                - renesas,r9a09g047-fcpvd
>                - renesas,r9a09g056-fcpvd
>                - renesas,r9a09g057-fcpvd
> +              - renesas,r9a09g077-fcpvd
> +              - renesas,r9a09g087-fcpvd
>      then:
>        properties:
>          clocks:
> @@ -94,6 +97,19 @@ allOf:
>          clocks:
>            maxItems: 1
>          clock-names: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,r9a09g077-fcpvd
> +              - renesas,r9a09g087-fcpvd
> +    then:
> +      properties:
> +        resets: false
> +    else:
> +      required:
> +        - resets
>  
>  examples:
>    # R8A7795 (R-Car H3) FCP for VSP-D1

-- 
Regards,

Laurent Pinchart
