Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039879;
	b=CyBFFqz/sfBHGuI8MUO29+m9VmHyBiH64qblf4OFok7ua2w0pLasKUbtgqNt8N/ulaGZ
	 ZrfkJnKlOLP0fLTbaZoKKr0NcBSsXTK9tdPnEgJtWKTiFQ/v06/knpLCvtiPQF9FSjmDU
	 dvUdlYPxH4WtjkbkRcMdMbLMWrJrYv7zcbp8mJU5VRXgIICfynip1s7GpAnbFXcDXRfw8
	 i0i4Q3OYtmt1lGi457hFWzcTUdx9SGEViomGZFHWIZiKrhx2LuSLmNNZ2ZF22Pwoi4kPW
	 G4ZCAEAWDiGvH5jS08gLRJAcc8WtVdRtSDcyAMcV1CS22wIFjDSVdqUwOywkQahUzkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039879;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=vXBeJvdU9KK6L1jYKoZZBXVpEjFUGaiQGPRX5ub+RWY=;
	b=doJy7EBCiDM6Pyx/5ei0myFf5fAP6WGYQRfrkbPvLRD6TP0RMrRLlpkpCc/I0d+AJlJ0
	 DPVCtvl2IOk/26G8vIHraOMXFm1C4hYoz5K+dqzEn2HZHb1VJ3YsyE1w+h0iiLrMzaIwj
	 ScYY61qthj7PD3NnpWlE1b9TDJrgb8eXTjMsFBoKOzUuHH3B/EgZ9XCM08Vey6oYtLj5c
	 ctpqCG0B/z4OuKx84cEsV6sY4FWsB6Fihf/Juuz+Hu0LOe6oCs//u+t2qvtUvYZGEBny5
	 0edRXm0dslwDdMxOjMLe82zkM813HIrBhDdKMD7IRx6S3Q2uAGuxgw4BDaHwnj1QTsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GvFhe4m1;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D12606A339
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2026 22:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D12606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=GvFhe4m1
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6AF8D0;
	Wed, 18 Nov 2026 23:08:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795039728;
	bh=mL134ZZgaKNlrGxhoD6JBl2EJLsu/XxLvDh2/+CCBk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GvFhe4m142rWoM1kDm8uUHvQi6QaZfJpsHRquNXkiSjomHWrinsrXNTSaZr6+G437
	 nck8bXwb2/CDjz9oDP/iDqrVdcdKTwvT7zVtN4IVbmsldVRHGu2n4bH/Oq9pLd9zHk
	 gn2D8X6Ti/DghDBGJpAXwxd52TSc6m6Voj7uD6BI=
Date: Thu, 19 Nov 2026 00:11:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 20/20] drm/rcar-du: Allow VSP and writeback build with
 COMPILE_TEST=y
Message-ID: <20261118221114.GI1923307@killaraus.ideasonboard.com>
References: <20261118214518.29317-1-ville.syrjala@linux.intel.com>
 <20261118214518.29317-21-ville.syrjala@linux.intel.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118214518.29317-21-ville.syrjala@linux.intel.com>

On Wed, Nov 18, 2026 at 11:45:17PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Make DRM_RCAR_VSP selectable with COMPILE_TEST=y, and enable the hidden
> DRM_RCAR_WRITEBACK option by default, so the VSP and writeback code gets
> built for greater coverage. Builds fine on x86, x86_64, arm and arm64 at
> least.

Let's see what build bots will report on more exotic architectures. I
may volunteer you to send a fix if I'm too busy when the builders start
yelling :-)

> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> index 80bd770ae0f6..5394f131c58f 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> @@ -76,7 +76,7 @@ config DRM_RCAR_MIPI_DSI
>  	select RESET_CONTROLLER
>  
>  config DRM_RCAR_VSP
> -	bool "R-Car DU VSP Compositor Support" if ARM
> +	bool "R-Car DU VSP Compositor Support" if ARM || COMPILE_TEST

This will make it possible to disable the option when ARM64 &&
COMPILE_TEST, which will break operation on Gen3 and up. It would be
best to avoid that.

>  	default y if ARM64
>  	depends on DRM_RCAR_DU
>  	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RCAR_DU=m)
> @@ -85,5 +85,5 @@ config DRM_RCAR_VSP
>  
>  config DRM_RCAR_WRITEBACK
>  	bool
> -	default y if ARM64
> +	default y if ARM64 || COMPILE_TEST
>  	depends on DRM_RCAR_DU

-- 
Regards,

Laurent Pinchart
