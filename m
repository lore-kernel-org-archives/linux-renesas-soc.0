Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613585;
	b=dVU8kpXw0YFzNE620Vyua4NSXtIES5IvCGnvcP7P2IvDnYrRVb++mO7flG0SHrWPt3RE
	 eoShHu4qdsMjnz56CSSFochUp6A76Z/krrCTxUa5Rxn8XWY6CswdcGeHiHoNjUGFxN7QW
	 NwtbPB6GlYZ2nquDzHWZMytRM1ee/tE237L6u8/zu9RYmD/VIH+hv1PPWUQVwl5+mTM3Y
	 TJA5R8mzAOX6WbLrUHSboNvfikViem26gHnPuY1eXQKqePUqTM1T4o7A4pwZqSOBzW2qY
	 KqCKtPPd49bEYS6kOyWhQ5ZGFhI/AFx+oMi9Bu+XYULix4EG1vyaULrcpIHjnFhrwCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613585;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=lZ94QxStBmWvuh57ebyRfX4vKbEG8GHQMeQLMaRnd4s=;
	b=Fv7Dgf4DCSQpi4ggTIxyNl97+bw/hq9LLqIkJqvX2bLuTy8hLVExK9ShZDxoepg0QFmS
	 ZXwuVEc+n36DG13Lq2gZrpUqYbFJHm5UVZJEWwY78O9k6ux4Qp0QFoQ+Li7lcc3ra3R9e
	 xC3gARvOfwQRGi2dlKWEf1bQgxMfCSyiKakZTDjgqnIJ3a2a5ZYhxw4LG/y5E1K8EcRdg
	 NSI2hNUKqh0vQfTOQzRMLpxzLBJgBBftGGLvW8BjDYOezcwmHihPyJKcU4/G0wzxH83qO
	 ENKOKg+Q/SSc2eWOVGmcuysuxOjsA7TeavcwgMz5jXjS66Cq8ylYvxg54liH9Xt4Kgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=glider.be;
	spf=pass smtp.mailfrom=glider.be;
	dkim=pass header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=dl8MaM9T;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="Y64Z/QrA";
	arc=none smtp.remote-ip=103.168.172.142
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F64D606A32C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 13:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F64D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glider.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=glider.be header.i=@glider.be header.a=rsa-sha256 header.s=fm1 header.b=dl8MaM9T;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Y64Z/QrA
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.phl.internal (Postfix) with ESMTP id 4810B1380F95
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Nov 2026 08:33:03 -0500 (EST)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 08:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glider.be; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795613581;
	 x=1795617181; bh=lZ94QxStBmWvuh57ebyRfX4vKbEG8GHQMeQLMaRnd4s=; b=
	dl8MaM9Tqj6o5xay/RKtFaTthYBeCgyWC8R7WpBWMlK2lDg/f1EQyYG1m3Pe4Ywc
	lVABzr+yr4VgmBwTxd2XstrZuDBt2McO+j0wlN7LHHVaEejKOiCIH9zNrr55IaWr
	E7votpM5fvD2hjMykcWe6wmfjOdNUVcVxawNspjb/KhoY9ZGdixRR9p5szE8Kn89
	OW7fqtgkFzKb19STuuh9UB2eQAmy20WMLFJmKNlss1ZpFMBGz1DYb80srNnmM9s+
	KvDO2iHziz29cMJb4gQK8e9b4qGWL0+IVVj5KaZyWrYN8rvaZAxA78cmpzBvcmHZ
	YQoNvMceaH7Y5O9fYT2wNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795613581; x=
	1795617181; bh=lZ94QxStBmWvuh57ebyRfX4vKbEG8GHQMeQLMaRnd4s=; b=Y
	64Z/QrAWB6A+IiI2/DznKSzBxPW+XiV3bTqqVwQAs5Xzm0ub4l18ork6og9Q75y8
	OdmQGKvMC89fBUma+iobWNVuLAYiixIr0iWLMk5pzzv7xU6k1CqGoGKZS3M8FKK4
	yGglyN4DhbrdOcqgZsKseoQ/oUTXuBYt4e0mCCra1gFps+ItEU4CHh5DQhFWykQr
	CnLYjO/4n3i5h0VnujSKkDVJ6llnNoRaXnZOgmLN6XF66Bc5SloEourBelLEgjjM
	myi8No9HSLNidpusil41WJ/PZ5MJeRuoyV2NRQDqaBoBYCH5a23hz166a442+DP/
	5BajOLQprCbNQfq8OTVbQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=glider.be a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795613581; d=glider.be;
	mf=PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:WXdh2Wod8/gwpCdEfpB+u3NcEJfejwMBVaG6z4LkxIVTgnB
	t48WU7y0bD712YZM16B7HGLcu/rqEuFtMNemh3ihoQcrTFbZ8CP7tTKkKctnA5z+
	3IFr7VT5LzTx4l7i5/RaZ5p0zfu4kXHdepYKKc1tbLLQelEh4+lIfSFL4q+h5gf1
	bhR8r1agsqx/U+JDPP94lJSL+HWYSyD0LYa05QKhMXMdEir4RNFkHgy+3iCovwIp
	qWkU3s6WVUyONHtW7uaCqqGQWy+AaqW9s1/HR/wt/otgAA8Q3RNjxQ91M0gil808
	5lLbc7gw2YcX2SUthvHHAbyQZwkuLTsaydPmOEg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:7cJsvaS7lbTz3rYQkijHx7yvNh02Gk1vDAtk3psyh7o=:DzNKiDvlAZNc8HUburqEwkbhsJnO+ybBRiUiAfsMzOE=;
X-ME-Sender: <xms:i-MGa54SgRP4rw1l2oiv4VFtAgY4SmTrEsKv9HanUXS4UgCnC2fDhw>
    <xme:i-MGaxu15U17rg4_tfWReWjdHV9j_lpMZlvlDOaWlNKP-N9jDT3hfzcvfG9pJnbHf
    zNJBTFrXc22-WP7PWdueGmWgzTekGSHN903uRfnx-bLrY-DuPd5p1XR>
X-ME-Proxy-Cause: dmFkZTEtWldhjuZyL8Czrx/E8FdB+HkbihUYPqdHTjRnEXwb+U7l6JtT0E7RPxRKpKjcLL
    fOF71znzbok9VLWNqOiOgBMncvgqy9fEuIEAAQTICF+rXBdRLvieOhTHZ45HWPkN9oHVFv
    OmVkw6tGcMTnL+LligSMTuIiaj+5IwhPa02ubeyAWxB54e+ndohIoLmd1++Pm5zpdXa2so
    XM3GnrLy4v75wE6Tc/NgA/TtV1pf34f982V8OQ7TSpGtXY/deAoLOCSqVuKtmv63/zd1z/
    GO6lty0Pk7zwyDcCjIzLLDRs/ai1ycHythbma0FYguYGLajG5KIQC48uYyVyZI+SVYUzPh
    yTfZBTI4f5J/SNrbIGx2AedchsZAlaqpHn7Tko9/5e4bLsrqxanPSmRll9MbHAxsInMTFm
    V2Gn2O0plBTAEBTAkTiwF+j0Vv+EUxir//XJvZCSx9a1FPhvPPXs1Z80Rhaf3QVqec+Fnp
    QbOKmDiSQyURE9LFufD7S3m8V5yeUlSmhJVDef7ffHuQgvahR67JuUAxr7fvwPV4VKQyFk
    pNGStEUkYhm1Rt2nreZ1ED5hRKbBqyftZCS59ItXzMXv+5X3CbCulvguQ7I3xMsJfHZm/k
    r6ACIm+5F676wWP9A/lYbLKsky8o5K17Cikutoj8csHIEqYyc9EBPoUu3miA
X-ME-Proxy: <xmx:jOMGa_d6O-I6WxPyjtym5Ad9skMCmetxm7a2Vw8q3yexmqsbx01H6Q>
    <xmx:jOMGa1XGElyYDtw4POx8ndXggIoZf9WPbevt9G2r2jeWNuCevf5tPA>
    <xmx:jOMGawfaXQyxwDrlv4vF4ZmKWqlN09Ez4h5uX316yxuWMgfxlwIbKA>
    <xmx:jOMGa5PfegnZPwUB221nVOecywatX-TRuvR5sVPT3RakmcF0e23S0A>
    <xmx:jeMGa_cd2pvx_zZP7aEe30JWmYL_i_sigI1pOptvKYHAR4AKV-o3vFWC>
Feedback-ID: ia0f84a9e:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 04E34F8009E; Wed, 25 Nov 2026 08:32:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A-NbSchO8SUg
Date: Wed, 25 Nov 2026 14:32:38 +0100
From: "Geert Uytterhoeven" <geert+renesas@glider.be>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: linux-i3c@lists.infradead.org
Message-Id: <664681f3-2939-469c-8594-370bbcb84b5f@app.fastmail.com>
In-Reply-To: <20261125105037.29830-3-wsa+renesas@sang-engineering.com>
References: <20261125105037.29830-3-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] MAINTAINERS: add renesas-soc list for the Renesas I3C driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 25, 2026, at 11:49, Wolfram Sang wrote:
> To make them show up in our patchwork instance.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                                                Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                                            -- Linus Torvalds
