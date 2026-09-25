Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D7847A86E;
	Fri, 25 Sep 2026 09:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328619; cv=none; b=k+DFnAe7QC/xYnfAGYMNhTOVRPmuYawh9E2sPa3JJPEGlj8AXP3jXogiRARVDq6rYtUpTY7monNcFFBBrTwSpKpFBPLTdfc/5fjN+5XpFCWYiyTHKU2qUwdLl1+lYgxWvJqamiqebyCBE66KM1vtIs6EWXsU6km01w04lK/wHPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328619; c=relaxed/simple;
	bh=nJ0/J95KwyInOWIEWMeBvCOCvt3BjxmuACXDJLcEw5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wu1hq2j5jw76yZ+bWUK0N74eHt8FHuWrl7m97UekRoBwV4+w3L4BVH9vioXTAY/BiYaw7fImkN8GO2LrWY1a1ELilttSiU3VwBjhqUAEUBR+q/pAL/zrIyvhWdWHfO6K8WXz0Muyi1I1GFCS8et9etNTdE9U8p6QGIjP5m7a/Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=luk3ajdZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="luk3ajdZ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78AF4C1;
	Fri, 25 Sep 2026 11:28:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790328504;
	bh=nJ0/J95KwyInOWIEWMeBvCOCvt3BjxmuACXDJLcEw5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=luk3ajdZNh4jrsQxH9iD6EKfviUNIh76eiSR0zLlBBarwNrHk26waD4shVQ1GdjTP
	 pH3hy8YERnil0rmBJqyMJLtKFnRdJpkgovKxU6BbNTCuVFj2oKQredB78LF6PP+uM/
	 6LVUyn6Sk5xGNh8j67z4FOO9foPQcPnbsXU+hYrM=
Date: Fri, 25 Sep 2026 12:30:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP
 and IVC nodes
Message-ID: <20260925093011.GA332413@killaraus.ideasonboard.com>
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
 <20260922-mali-c55-renesas-dts-v1-2-cd63cdb51033@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922-mali-c55-renesas-dts-v1-2-cd63cdb51033@kernel.org>

On Tue, Sep 22, 2026 at 03:34:01PM +0200, Linus Walleij wrote:
> From: Daniel Scally <dan.scally@ideasonboard.com>
> 
> Add nodes to devicetree enabling the ISP and IVC that are found on
> the RZ/V2H(P) SoC.
> 
> [Rebase onto v7.3-rc1 and sort the board overrides by label.
>  - Linus Walleij]

Geert commented on the commit message in the original series, that
comment seems to have been ignored.

> 
> Assisted-by: LLM

This gives the impression that Dan's original patch was LLM-assisted,
which wasn't the case.

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> index 637fc92dcc26..74b75be599ae 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -305,6 +305,14 @@ versa3: clock-generator@69 {
>  	};
>  };
>  
> +&isp {
> +	status = "okay";
> +};
> +
> +&ivc {
> +	status = "okay";
> +};
> +
>  &mdio0 {
>  	phy0: ethernet-phy@0 {
>  		compatible = "ethernet-phy-id0022.1640";

-- 
Regards,

Laurent Pinchart
