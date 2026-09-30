Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9284FD26B;
	Wed, 30 Sep 2026 14:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778945; cv=none; b=cqcmH69EnzD0caxWWdKKv/zJdhj3lEY9n9MUGKH017z84LmIADTEURccU+VbqJjLhD1646X3oZjSsHOyJV/v1jVTLfpvTlY4jOf/KPCOpaFn3lTcUHCX0Omxuwi+hfbqwT7fpFRPkdyYQyt4EejqAgpQe1eA1dCM1fZQ3ZIE01Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778945; c=relaxed/simple;
	bh=j55a1kw9VsmlPyzV7trMYtOllxMVAxv9ZYUFLIFgHGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3noFhd14V0/xS2hr7OFw2BtCTFs1ENdX4NSLfpfcAz1IOWqTj9S+lDc76IBP/ZtBbQKCY8gHwZeXqoyOE6p5eXEtB5HzCoM/Zg8gAalRwDbY5ACLZzpSFDhC9TTSSKd14jDsJ/Kgxgw8LC3pFAVZv6p1q0lj1PvHvOepoxucxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZoiJccVV; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZoiJccVV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DCB464E410D8;
	Wed, 30 Sep 2026 14:35:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ABB6960749;
	Wed, 30 Sep 2026 14:35:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B89710328C6D;
	Wed, 30 Sep 2026 16:35:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790778931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=tfmHOprbipc48o5g0n0twJsbfnYUZmE+VwMcW7xqk9g=;
	b=ZoiJccVVwgGhb7pvu+TN/0V5eHQoXkydKB6oLo7DRDwYMhc2qI7mJzOUHXf+FGSW0uWFiI
	2Yi+ImGd3Ygw9BdZzfUE0gkkVUpiwCmF4xLoACsvxzrqXONKUw5pg09GcDduR/eGBZr8qz
	KMIsuKjRTUDcPmFoOcgBn2aBXrC77rgEfFpp4ThpyZDITUVmFieXRPx9h4CTA+JwVSQd9H
	oP8tp4Ptii/ix4r4apIbZLYf4O732UQCJcEMRgRb5+y6zKcSxrAjSrbpa1+1IenEpsu+y/
	McytEnHuw7M69khZhteOnvtn4T8zNYMMQxR8nEzGUK5cx7cacYVd39j9qqt0oA==
Date: Wed, 30 Sep 2026 16:35:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Lad Prabhakar <prabhakar.csengg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-rtc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 0/4] rtc: rzn1: cleanups, R-Car X5H enablement
Message-ID: <179077891178.410237.381734440527302714.b4-ty@b4>
References: <20260917185903.61253-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917185903.61253-6-wsa+renesas@sang-engineering.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 17 Sep 2026 20:59:03 +0200, Wolfram Sang wrote:
> This series adds RTC support for the Renesas R-Car X5H SoC.
> 
> Changes since v3:
> * clear RTC_FEATURE_UPDATE_INTERRUPT when no irqs
> * added tags
> 
> Thanks for all the reviews of v3!
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: rtc: rzn1: drop unneeded 'start-year' from example
      https://git.kernel.org/abelloni/c/a867106d8a89
[2/4] dt-bindings: rtc: rzn1: add SoC names next to their IDs
      https://git.kernel.org/abelloni/c/73defdbfce62
[3/4] dt-bindings: rtc: rzn1: add R-Car X5H support
      https://git.kernel.org/abelloni/c/3b3fdc9fd40d
[4/4] rtc: rzn1: add R-Car X5H support
      https://git.kernel.org/abelloni/c/cba3b5f4cc00

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
