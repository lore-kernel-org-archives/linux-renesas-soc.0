Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4839C342CA9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 23:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776466805; cv=none; b=XiifDE0YDXdZCxfKquBdYIiUUW0amFmiIpfRfM93ssnJ9FOwcp9+4QbW0fEclcmVrXwlvFqc4bC5+C3anRtZJl6mIwq3VzmK7YsnxX+BvMiZ+Wdb3KfzdxWEdJ2vCPF/ILH81y0a57d0EWiKk2zfprgB74YdVIVTvDFkUNkrW0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776466805; c=relaxed/simple;
	bh=Fm07s0LJEPJFPXZOrReLReFYBTP8YoXXyqIbew7XXdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjyw/YtChiA4uSeoIKGZyiAYpTHemJ9DZwFRqLdqhyPsv10Dzfpl3F3mrP5Zn8/VppjhNHIeEgeMLtfY7RGYcjWNYX3Dfw80ykjKTtEOvXoS/LLU0i957Q4G0v7WhtQtJBaFuZJPdxTO0Oen5BdjRwGS8QI3fpmLpCfQlclySao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZFxdk5E; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZFxdk5E"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso12304265e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 16:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776466802; x=1777071602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkdExcpqmT1SthGu9bjHhEKkx2pAcbaljkvmf0PwBS0=;
        b=JZFxdk5EWDgr43hKTEWEcgj92us8026yOO0VrnCRLaEy/PS93PJspHf8P5g3LVyWVY
         QUmrNVJMX3GeJyeTDTTGgTQBwU2X85Dip4YN5TzgJp1pGQHkZoig6t+sOEYM2VMHj/+E
         JOLOB4BBUqgGLnqJ8C0Lr+DdVCVW6TMtc9Zp4huQyDnKdEsEWrwoY3vnvf8lgwSmd5JU
         ARxAcCQjEFcKWwzkb0mgxvRiKuNEITu9u3k+3zo2GFzSsdqL5CjpkajhVuXNRoIqIVas
         UyDYQNCHSqxrZAsl3ZR33TbVc5cd9cdl/R3MOLVeKgK4Lc638vLWejIcxFo4E5eSoLnX
         GDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776466802; x=1777071602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkdExcpqmT1SthGu9bjHhEKkx2pAcbaljkvmf0PwBS0=;
        b=hGnk6chAAoz+1K8h5nrMpIwfgtXBsWXUjj6fyWrONK6sR5+lGvQImuDN2E2xaCtPuS
         NuWpLPelt0RQcs243adIXAZEQiFFdHWISBownwx+iPuvvAGKE9Ja97rZWIQmxcOf2z+K
         VUnQ2tdoSmI+gVknvkEupuDINABu3TPQXjJ8x8LeiM1o8EzA6kzo14c8b64gVv8MSbF6
         iIaA+In0STvrQtOa/3MJ0Yb4kkvKLCL8DmnJei1yrVoSdHsFdOuI8iQpXPIaeKU5qV2Q
         608g4r/XCWs2sloBuAmWWIK7D+8JaKNv6LYwNvv13ilTWyt5FVizafEbux6RvKlKiAGf
         3AlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/iDq8Z5SEHyslZ696119rI292lIZHhoWYHmOJT2dxCZtjamx7NGERn/TAevj9XA9CxqzvWhQzUa/tRd+rsFNUfcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfo9s9y8HU61g2f0+o2Cu/ffdnjlDc6GpmNNSxYlB1+pBC/sNy
	qnkWCX9Ot7gLdyQ36dHGGroMYZSU72FTLuTOXtv0ovuEd3wbWXn+gHhn
X-Gm-Gg: AeBDietp9qkfgkLizZRRHjeXZKUeqRMky1xpkEJwut4zlEB23Su8CpGnvxtFYb48g+2
	DrsYbwxCDlCA3PL/vvpcW4mWSZ2fqe2XExmLYAXcxXy/wJTAYnZ/RcUBa1eh7CUafXLYn/o8aCw
	S1WJwu1fMRXPNie1+vrkY6zlkpsIM2wUpK01GpfA7MiUEQWvHP2ksekXeiY/RB1jVCqn56K41Y8
	VMMHsCzvl/09IK+BOPg2eVxGM0C8alD4ypjFXc+liwKwcVoeK7cJ+ssltNzqvC5COY14AgBg+xC
	Q1fnj0m8+m3Z7t8bX0i2PpH1b9w3BPHZ/ZN/fJLHhPlsUaoHPoGjjXLw+Sk1rFpgFh6sjjD4Jf5
	GP2c0hVJkOhx63YtK0h19P37DjJhMjWwlZAXAeHvXDKhY03v5mrDxUQ1ZynDwvjPSQk6m9TpQ3X
	PMAaP62qadQJfDHSUhk8ndTW86don6+XSMRRVRxvJhQ9LmBF+rvMZLMhIu
X-Received: by 2002:a05:600c:a318:b0:486:fdca:ea8d with SMTP id 5b1f17b1804b1-488fb784662mr52675915e9.25.1776466802424;
        Fri, 17 Apr 2026 16:00:02 -0700 (PDT)
Received: from localhost (16.237.129.77.rev.sfr.net. [77.129.237.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1393f5sm71813135e9.9.2026.04.17.16.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:00:01 -0700 (PDT)
Date: Sat, 18 Apr 2026 01:00:01 +0200
From: John Madieu <john.madieu@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH v5 05/14] ASoC: rsnd: Add audmacpp clock and reset
 support for RZ/G3E
Message-ID: <20260417230001.vzbeym2ik4wytdfc@labcsmart-sqy>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-6-john.madieu.xa@bp.renesas.com>
 <17da3459-9205-4853-af08-5b2863403a9a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17da3459-9205-4853-af08-5b2863403a9a@sirena.org.uk>

On Thu, Apr 16, 2026 at 07:57:34PM +0100, Mark Brown wrote:
> On Wed, Apr 15, 2026 at 12:47:22PM +0000, John Madieu wrote:
>

Hi Mark,

Thank you for the review.
 
> > +	/*
> > +	 * Audio DMAC peri-peri clock and reset for RZ/G3E.
> > +	 * These use optional APIs, so they gracefully return NULL
> > +	 * (no error) on platforms whose DT does not provide them.
> > +	 */
> > +	dmac->audmapp_rstc =
> > +		devm_reset_control_get_optional_exclusive_deasserted(dev, "audmapp");
> > +	if (IS_ERR(dmac->audmapp_rstc)) {
> > +		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_rstc),
> > +				     "failed to get audmapp reset\n");
> > +	}
> > +
> > +	dmac->audmapp_clk = devm_clk_get_optional_enabled(dev, "audmapp");
> > +	if (IS_ERR(dmac->audmapp_clk)) {
> > +		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_clk),
> > +				     "failed to get audmapp clock\n");
> > +	}
> 
> Do we need the clock running before deasserting reset?  Usually the flow
> is to get the resources the hardware requires stable before we release,
> that helps everything start up cleanly.

You're right. The clock should be enabled before the reset is deasserted
so the block sees a stable clock on the way out of reset. I'll swap the
order in v6.

Regards,

--
John Madieu
