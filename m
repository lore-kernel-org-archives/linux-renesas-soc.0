Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C834521897
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069020; cv=none; b=ijhTfEUx9m1coWY1BRI4m1Gzdln42LtkCym1bmKYMoTpKB40n+a3NLqENFNHu1L9XIaRHgmYPhxcAROGkr43pjfMPzpqXAgfunH2wOoPSBPo6bcQJAqcoGpRwfIAHOgTg9599K111VsfBbvfdlH0rHGAdAGtdQFt6ZabeCLuUSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069020; c=relaxed/simple;
	bh=wPEZURz/x2+WcDS1J0Y5mVsZm2GwhUFVDnbKnwOL9Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMaG+053ZNySv7/KO0zTUqF+IA/d4Q/xj319V61KLWXSW8M160hod0afmOthsjUAvFafLr2OsteKJ804acunLFZsKP1bbjweAEd3Lc7KCrMFRjO4DCWh5YnpciM+XraUz/VfmCW9Ynzzo5s1P9UYVvuluHO1i/7xbw+JNFJJIkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ekO09FmV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=r7ZUYcuU; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ekO09FmV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="r7ZUYcuU"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D2FAC140012D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Oct 2026 08:56:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 15 Oct 2026 08:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792069015;
	 x=1792155415; bh=d4Y+UaRCOJkuo10OJNpvuYzS3Fllk0wMeQAn2UVR3P0=; b=
	ekO09FmVkGOVmeTA/byydZxaei6irAGCLVo/ANEJwnuW6+T+r8ti/pbeH8XtJ+Lz
	uWb8Cn+6/+H34lNRZ8lsoi78JV/5cZ4dhe+TOKFj6SwTfD18k+RCwIokdPssMdMZ
	SbYq0pAN2y5WGXkymHizcS6yyAH4vaZDYsE3pqdfIyiqVYaByAucKcAE3bvXrh/U
	WUeeR1m4Pv/Fr+WiRW/uJ4H3Qw/IpKMsFWfN1Hn5P2sbnWjRKEJgdf13kY4lhA5I
	efPgaV03x+l624cGCyjHMBPnNK0lVUlxnxQoV1YdiyCLI1HST1P0FQ7Di8CVKTLb
	CXfYBIGI3Zf/5m8ArXP75g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792069015; x=
	1792155415; bh=d4Y+UaRCOJkuo10OJNpvuYzS3Fllk0wMeQAn2UVR3P0=; b=r
	7ZUYcuUBmVh8/XPWUBxjZ4OMsvBMt0mFoc7IUSl6DUCy0/7UM1BeLS1GU71P/mz/
	AxFlSTDQ8ycJFg4mn0LdwTEagxStgxZLyqu3PQ+RIIpE4d4lW7vTZLWMaw7gObw2
	3yUsx7PbwcRW7gIXTnPKt2PpdoBvuP5Pks0cpO47h/umsjYifrR6dgZa7f8fLFQN
	HskZ4V8GdNzVJ/at/qCAqzIhh/UDT6zVQhzNe+ZDTuPBUVHEa5qTdaLTwzxm82bL
	+6QU303lQw2zZtk3UjErZYxpFyhILbU/CcIGlzPXEO0AET8gJQH15vshXd3x0fQJ
	w3ZZkEEnAyFyxcx2AEbAQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792069015; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:Bg6F57705RTA2DZTi1uS1h6m0bwqpHVQzjQvbKMn/x/pMc5
	0xuB0ngkfwumhHIkVPFP6mmm7q5bJfh57fAj7O21m2Xk4Nx3ZPjOc9B5BLCIUd/3
	vUU6uLLLuXV0gjhifLz4ywGdf5knyltpzW55CP/v0b0HT/yFh3Qbj29fU2td/PBb
	VEmnGG5HuvOMaaEgBsjIV/SVFXbSV2Mh86coG7lk0hDpvOXfDC6ugH2u7Cs82NWv
	1To6jEK0M7xQQxBXM9Wb1C8GR4WM0h0hdFRWa0S8+HuoLQ7hGK/7MKzkxALGM8i/
	pr0Oq1HsTf2qlqHIKO+JKLTi3VFF3cHvqpu8Tpg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:z3fr53DmWe7SCs30CXbfzp5DURC5bDRztcLg+OV5rnw=:wPEZURz/x2+WcDS1J0Y5mVsZm2GwhUFVDnbKnwOL9Wc=;
X-ME-Sender: <xms:l83Qauf76PAhMVDL5Es5JJXgRQUMdpPfASekruzkmKO58WF51rp3Cw>
    <xme:l83Qagbc6jKEwFrj-2VrqExuBtnVvfKKBU4BbK_g_XrAr9epkn5cYfVTqJ4onWvh4
    WutQdNCtOmkID_0Chaqic5647QxiMon16y4NiDs6oRq_W7lMZSK88U>
X-ME-Received: <xmr:l83QarHUr0KxatP-HPj87QI0_TvQwjLisx2gWR4rZYZh5mXRx30_i7Da8JPD-LJcCTxdPZ0RmMo-44CLjkMvzSo1mHvX_4c>
X-ME-Proxy-Cause: dmFkZTEQ56OHvq3vzGL+AyPauqCptT1uyaHJhWuULvfSVS/s5v7seR14SsJmK/ReuoCdC9
    SCI7kdZIK0LPjySsUdGYpBrC0b0Mgqm6jlCK+vE9rC/zihlJYnWLHgn8WJdHlv39fne2P8
    DDwQjoYfqsWaDPSTpW94qOuFbjzZIAjwSVt4LuMb/ZQ6aAmPLvveaC5RtZtZ11qpKV3/lY
    2h3FHf6TL8Lnamlx+oMSh7/Ks5Uuq0+ei3EnJTwQc/7genfnSxgvGTtWrAo7mHfv3UI6ty
    vFaaVy08u6Ii4iNtGpB5epuJ2OoiRX7KkPktYtHpa+Wv74KMTTiUVl9+IJkUiTpJQxJUhF
    ZNuoAvXYkavfeNrYIYngI7flY0cuaHtBJwDlcFZ2sAfpwrFw6X+2OgdYM5AACj/gdzFYyP
    vkqGLT8RHW4TiIS/KdyLXcWPIT1Wd1rtvM5F2BwlzndyzKaocdfy55k29e/z6J+j11ZX1Y
    zsXtaqDRAgypkmD8pQHUH5gJRFyOq+fPp3kWMMgDmYzCn0vFq3CG7lU/xkQmT/0GX9rVaD
    4q22Ryk1LKesqHpLVhFWBbsJySgvHM/z6bAbzJuzvHP/izAlLuhXRB7judebj95vToa6z/
    i0DhCWlxkd+7SERc64n5pOnc4w5aGg2lzzZ8fGFBfvpBeh4Ef7V8uNl48rkw
X-ME-Proxy: <xmx:l83QamkbmVFZ8DGHL3cuMhI4HHrLFv2nXadcfEEX27SI254mpqR31w>
    <xmx:l83QamdF65ZqyAIpvdUMhypBLoCMuW5CFXamrwp2DsBpqI0aUyCquw>
    <xmx:l83QasHpX-bIAqjDRMuG17YvtHQPEmx95bRBpM6xfUu5DPf-E0D8lg>
    <xmx:l83QakgIke7tMckHE6YBzvOy0_QFVMMSKK7as43bgVSEu-f3kZfOyw>
    <xmx:l83QaukG9lfI-0NIiKYWmiBhLPmStIxrL3iHo-2ydOpGC2Ij0vM9tZ76>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Oct 2026 08:56:54 -0400 (EDT)
Date: Thu, 15 Oct 2026 14:56:52 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: mchehab@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, ae878000@gmail.com,
	jacopo.mondi+renesas@ideasonboard.com, sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2 1/2] media: rcar-isp: distinguish absent cores from
 registration failures
Message-ID: <20261015125652.GA3577260@ragnatech.se>
References: <20261015004159.2202899-1-mhun512@gmail.com>
 <20261015004159.2202899-2-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015004159.2202899-2-mhun512@gmail.com>

Hi Myeonghun,

Thanks for your patch.

On 2026-10-14 20:41:58 -0400, Myeonghun Pak wrote:
> risp_core_probe() clears core->base when resource setup fails. Once
> resource setup has succeeded, it leaves core->base set while unwinding
> errors from the remaining registration steps, including destruction of
> core->rpp and release of the VSPX device reference.
> 
> risp_probe() treats every -ENODEV from risp_core_probe() as an absent
> optional core. If a later registration step returns that error, the
> parent probe can continue and subsequently call risp_core_remove() on
> resources that have already been released.
> 
> Only accept -ENODEV as an absent core when core->base is NULL. Otherwise,
> propagate the error through the parent probe's subdevice cleanup. This
> also keeps failures from the later IRQ request in the following patch
> from being mistaken for an absent core.

While it would indeed be nice to propagate the error I don't like this 
solution. It creates multiple places to check, first the return code of 
risp_core_probe() and then implicit variable contents ontop of that.

Would it not be nicer to add an additional return code to 
risp_core_probe()? If it returns 0 all good, if it returns -ENODEV the 
optional device was not described or a new code (maybe -ENXIO or -EIO ?) 
if the device is described but we fail to initialize it.

For this first check return code, then check some other variable 
solution,

Nacked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> 
> This issue was identified during our ongoing research while reviewing
> kernel code.
> 
> Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Changes in v2:
> - Split the -ENODEV handling out of the IRQ lifetime fix, as requested
>   by Niklas Soderlund.
> 
> v1: https://lore.kernel.org/r/20261011214448.2043581-1-mhun512@gmail.com
> 
> Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.
> 
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 2 ++
>  1 file changed, 2 insertions(+)
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 53ce47020d170454b3d208bce7f4d6aad76764d3..73bf7e42bad2ac1ec2493cd8ec81003cce05a3dd 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -563,6 +563,8 @@ static int risp_probe(struct platform_device *pdev)
>  		isp->subdev.internal_ops = &risp_cs_internal_ops;
>  		break;
>  	case -ENODEV:
> +		if (isp->core.base)
> +			goto error_subdev;
>  		/* The device don't have an ISP core, that is OK. */
>  		ret = 0;
>  		break;

-- 
Kind Regards,
Niklas Söderlund
