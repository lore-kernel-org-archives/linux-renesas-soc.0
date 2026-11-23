Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439534;
	b=43IaNjNZh6NmqrSLYp3FBE82K5QE7HG80LktPguYNI+VqxMoLuAFlVyt213HGLP6Igak
	 cDjPOPppqC2Ao0dFqRdufUfFEjR7r5gNhSkyzZJRJfXGnakf33i9RhS1S1983mX/c8C56
	 ssk/cqa19s3SV1Ph/xw625gQ4r945r3tb6dFheFlAPq4IOu/fDxiLMkjAIkbSQ8XKoe0J
	 Y2Z0ANuiZQIf8S+mBV8c7LUl0EvZGJ7djtV1rKXRSb+ZFqfIEPwuaWfWP2MKDkOFnHNKz
	 f76slDrFNznYE2yeo+LdcmLY5p1fG+QEw6JSvXMRUYZUNdxw3sh1GdDRJccQK1j61UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439534;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=E7U8G6i0xepos/3PMIsIuLoAJuXWxBLJeRFOqwOSlKU=;
	b=LM0tRLNBKjbMd4UeILC2zWzk6qvFOXXYGxRINAdedjxO4Fhh+MuLX8+h1BGwkEVZgryC
	 /YPRQv2dI71RWT5cZorqNsWbPXBCMpVxzKDt0yoIiT7xzESy/X84owFyEXhYlMMf65qMV
	 F2anOTudrhI3/z9KWkLMf7Zy3IVusMtQoRMZ/Acxa2eTF5qiBbmHcDhPTFJ+SYYcI6G3H
	 p+dZ4M/9sO6qYBhFK+jVGpdMU0OAP1jPPSYrfv2od9UbDhFOkG5rjTXv8Af1Yc6AgtCci
	 yChewUw8I6qmkRjJK4j0S+VxLiy3KGdZUPRoEMElgk3LSro0X0L5X6JJuWybCwoC0Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CWYvHpqr;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D54A606A31F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 13:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D54A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CWYvHpqr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E7U8
	G6i0xepos/3PMIsIuLoAJuXWxBLJeRFOqwOSlKU=; b=CWYvHpqrl43SKEugm+dV
	aLXrR2GBZhEOAtLQrcw6GDEUIDrHYXIbpMIfIhc/pv5ovxu1bQRT4yLIsT3n9qa1
	iHbn/WVVOh8gcGeLn1xYqN32ibOL8Oir2MaospU6thdpawDqgAyqyibSctBADWNm
	idkuaavZcbtDnZpnOD5/48NIOPKAOvKM/kKNvSzjDEOIcltuY/nwmEjvw5T6ezM4
	fO4XaJK6AqnsD45S4+zjhAlKCb0s5dsF8YfqrTndEc/pW0JdFzUft9DMB/2MoZn1
	oEX0aoiTarZHo/5WxL/txHVjlbI7E6n/xcR30fzIttIn9Gt8Z7CjvGX6CffHIZic
	Aw==
Received: (qmail 2737992 invoked from network); 23 Nov 2026 14:12:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2026 14:12:10 +0100
X-UD-Smtp-Session: l3s3148p1@3kNmV/FgBoUujnsu
Date: Mon, 23 Nov 2026 14:12:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use devm_clk_get_enabled() in
 rzn1_pinctrl_probe()
Message-ID: <awQ7qa5FGG9RETtS@ninjato>
References: <e05bd9db-c855-4972-86bb-3b7346cdd278@web.de>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e05bd9db-c855-4972-86bb-3b7346cdd278@web.de>


> >  static void rzn1_pinctrl_remove(struct platform_device *pdev)
> >  {
> > -	struct rzn1_pinctrl *ipctl = platform_get_drvdata(pdev);
> > -
> > -	clk_disable_unprepare(ipctl->clk);
> >  }
> 
> [Severity: Low]
> Can rzn1_pinctrl_remove() and its .remove assignment in
> rzn1_pinctrl_driver be dropped now that the function is empty?
> 
> With rzn1_pinctrl_remove() gone, ipctl->clk is no longer read outside
> rzn1_pinctrl_probe() and platform_get_drvdata() has no remaining callers,
> so struct rzn1_pinctrl.clk and the platform_set_drvdata() call in
> rzn1_pinctrl_probe() can also be removed.

Ack. Please update.

