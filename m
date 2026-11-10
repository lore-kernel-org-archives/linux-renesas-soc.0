Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295740;
	b=hfVNAkWr0EaD+A1GN923yKibrXqAut5P2QYSxUZhUFKJaW0dH2yc3unRmtUgRPKxsXLy
	 N5xa0NMxc5oWdHjLX8bvZoCucSmaQsAIe1lMnnx4WBNlDBLqaEMcZDtfedsEEbJ8NLu07
	 JKnj7kmHAUTzE4VGmn8eazwJ2xi/wvWzWCBqI3wxg4kJ9M9MEyk/o4toDQlndXN0oXV/n
	 FUPOM+pgATfS2CL+YmBzAcMV1SHHEKrJa+Rt2yZa4vaHEqDh7oV2nta14OJWj+58DohhA
	 w5iwGDofgMPDLlPx1we4GL3yG+CiZPYyDSLZE14D1SwiIrWki7/rfPflwQbvZ1nyzeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295740;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=8RnNLLjQCW+JKu0+I5thnZ6ztuxRrB8T3wli0bimjds=;
	b=y4R/3OEqWt9qoy6IEViKVx41hsd+4afUnonXkHE7IncPhTkRkcSDgcDsxznVt+1NU5B6
	 BN9jqrLVwr1gPEnzYCAHfJ1fnmid/PNy2PiBmAF4VkaO+fUnQItdrrytmVKD2BMPY/Bpd
	 woaUuv+6T1Z10fXR7Hn74/0cz5sHvEb2ISbB4oG7LksbMeQsjnWGnVnf8AbLj1mPZJZ2U
	 WZbo/L19jn/NxvilAG327V467b4XFG2RAkFCcckwumbW8Sb6WLGYySAErED+A5rBXfoOr
	 hDUCTjkCiHw6adfQAsU5fnveXbQ0hgyCmsi8MCq211G73pCqvhEyWQ5+wjjkESYeRhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=QoTp2rLu;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="SVAa/5OS";
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509E4606A326
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 07:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 509E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm2 header.b=QoTp2rLu;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SVAa/5OS
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 7D166EC062B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 02:28:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 10 Nov 2026 02:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794295738;
	 x=1794382138; bh=8RnNLLjQCW+JKu0+I5thnZ6ztuxRrB8T3wli0bimjds=; b=
	QoTp2rLut6yeSZc5qk/A7T3aYGJCYA9oOng+iAXcw8ERIpVuYHN9nRKPkji1bog4
	2xkHrRPfeR0S6IFlMp2nx2IcT+M/lKOrfyjRkNnuoJmHRIAhVDEg76dL9SxyrKpC
	dFa/bN7sXZyGyKQ+FZHPek5Sa7x9AZMm0WwaKt+KcFKCLfMzMIfImgaOsuI4bClT
	HbdW1bh6JKc6mD/+PwjEtLZVm+wYpkJHFyaJh1JP/tGAuaqC/TWk/5uuntZtg35+
	BeGZVv8YNvV0y3uIBXBS5MH57YLY8e6B5LXOGGnbGnVZ4/w/PmCDHFLwZsX7yUof
	l0lUVhxGNyDSHOdFZU1UzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794295738; x=
	1794382138; bh=8RnNLLjQCW+JKu0+I5thnZ6ztuxRrB8T3wli0bimjds=; b=S
	VAa/5OS3Cc0bn0YcAYZXFbEtup6gO7AFHPU43mEzkVCEAqhKlXJA8ymQfmDgnvkk
	P74TVOu71vjqH6Z6xmq26cwp6foeQdsfTCU18kLDGAAmlTUMGf0D0tHkg+Fde9ny
	D+7yJweWIr2ArFT3/oRi4SkdPfEA04xTr6JJW9+uZiaOckewbm+3HjG9vKNv/CC7
	K1kpTQWlZ9h1LNmZtaa2uXxOoKIFnTmkGH2dyHQi2zF3acVVCe8mi4/lunMyOTYz
	nupnUCoisy1MTeoqYtAzrkuet49CzziNE+vOI8NXAWBnrqBKv4q4dZ0paB/tnvmj
	4DStRcX9s9zZ+o+Gvu2xA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794295738; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:AuCMKReaRelx09MYzKtez37GpuNB68f6gXIkO7OVAOw8Vto
	x4MIGRt1pA3RgZDMXbLCpnc+dvRAruu9x9SZSTQE7pduY3PvitfV7LCbO1oJVwco
	tpe1mfvh6s2DyUoxHFSHAnyns6Nv4MpLONLQ2Hl5jS5So8OrE8HuDBVLgPVxwgBa
	sbYlLgiuC78OapeuRtLuKy3kdFk3kQDV0aqtTll1N8YgjRIHA38jbuOzVculEgpn
	9G213zQI01qqDxmJCpyZSPCMAmuAQ4HEdZuhCMxoYXMNUygVuBHFVv9SIpogzYrv
	nP5hU/+hmTsqiSu7LpY8HFBpjK/w9CK2t2VBQVA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Y/qURn+3Xhp0EY6Wi6RwWmgimgSYzv2XrF4NiMK0GpM=:MbQwsetfUTyCwpIH9soAPshu5Br3J13OJzhABFILRG4=;
X-ME-Sender: <xms:usfyatAC4rZKklLRN2dTDYLuJsZJHFm2G9Gcyfptbz6qbxgVBGB10g>
    <xme:usfyajsj9Kb7ezCDYsUJCRX5h9sZnq7xHmX6vo0ta6mzj1A32KMTdElylpoVvSl_z
    CvMsSkXutKTeng4TaOM5Fem5AvHbp7LZZG6jJPYz0oeoh7D1u2zy2Kx>
X-ME-Received: <xmr:usfyakLEeJv9Vudr9Aic_hISNk9jpBDzm1f0Lz8tXQ64KJKinRvNEk3ZsMg-03lOZSWEKtgf-JiUYil_XBD9SOv0hNiE1tw>
X-ME-Proxy-Cause: dmFkZTGXeCr4PfrP83D9ZIzOyE8NzEkO97NLDOd9CU+lzf8a76SW7PGMiiAuMIBbr5DI8p
    znCp4K4bxwnhWm32ly0Qb4FT/CguXiqV5oHr15eEuB7BNVkfjwhUAVyoS8jbImbxh7Su51
    eZbfED4N+9zG017j85guO90C9SKrlej1LE6mk5dGQazDLnHozBhXH1m9dPTZxT62Ayi7/x
    2/420V2oHPiKbfNC2gX6aM/uFAPNCRYfEUPXtj9a21rCIAR/dJrPrU9dfRDUrnuebr+FT8
    J4h2O6wI5i81JzOHjTS2P9AuSrca7gDokm63maKgAUelRsGttv6qFCK+qiRXd5lydHRvT0
    X/x378vB0i2Jh+vD4IIJEep7N7p3LPfGoZ6XIzQIKyHaYMcbPCXNusLBtXjqSmjPbsvoAP
    Zry50ZjjZEEb98kNm/pFSfC9whCF4JM4YTOLiqqL03eWsKaf5qejE5NTGu/SVQPh4ke6M4
    h5oT8Ss0sa7nSfOLMHt0H9u7jfJM1Rn262H9zIlDzG9uFixztlQjG48kY1hPvTKDJJvjo3
    XZwssFeeR1bjIYk9sZoyvsfC6IdnYwDke0bFQ5Hd59RhT7l8Wnmsk/FmHDYNijaBQSiYCx
    IAvo0NT2/zghH4j6SKMNGOxkxqrro7TArluHxg+TOzDh42eM8UtTOzftdNnA
X-ME-Proxy: <xmx:usfyaiZiDz6Cz6n__1XktSOTlb0qmQgMTgSQXuuRqsOc5e1XAtrYoA>
    <xmx:usfyauAxEaX8pzdEjAZRbyLTSpIRdF0UiFrjGAaCspdHdjlms87zBA>
    <xmx:usfyakZPhuzzjDi6Vv0vqsMGolIl-IDR7Sozr109LHRrGo12d1FWgg>
    <xmx:usfyaum_u_gr4QAmm1cK5A0og3b3ksvr8fZfTiIQp4kHOwJ42KVKSw>
    <xmx:usfyalorxdrTSCToXvlpdepml0Fipq0zTDg-uUQro6f7v0WMWKl2AbDC>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 02:28:57 -0500 (EST)
Date: Tue, 10 Nov 2026 08:28:54 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v5 1/2] media: rcar-isp: release the core IRQ before
 destroying RPPX1
Message-ID: <20261110072854.GA2870732@ragnatech.se>
References: <cover.1794278853.git.mhun512@gmail.com>
 <3b33e5cec5d3d046b67ab7ca31af0d63368da120.1794278853.git.mhun512@gmail.com>
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
In-Reply-To: <3b33e5cec5d3d046b67ab7ca31af0d63368da120.1794278853.git.mhun512@gmail.com>

Hi Myeonghun,

On 2026-11-09 21:59:04 -0500, Myeonghun Pak wrote:
> risp_core_irq() accesses the separately allocated RPPX1 object before
> taking core->lock. The managed IRQ can remain registered after probe
> failure or removal frees that object.
> 
> Request the IRQ after initializing RPPX1 and the handler's state.
> Free and synchronize it after draining I/O queues but before destroying
> RPPX1, keeping completion IRQs available during drain. Unwind the
> subdevice and mutex on IRQ failure, and convert -ENODEV to -ENXIO so
> the parent does not mistake the failure for an absent core.
> 
> Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Changes in v5:
> - Regenerate for git send-email; no code changes from v4.
> 
> No hardware runtime testing.
> 
>  .../media/platform/renesas/rcar-isp/core.c    | 27 ++++++++++++-------
>  .../platform/renesas/rcar-isp/risp-core.h     |  2 ++
>  2 files changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
> index 586a5adbedf..14f3c8f3505 100644
> --- a/drivers/media/platform/renesas/rcar-isp/core.c
> +++ b/drivers/media/platform/renesas/rcar-isp/core.c
> @@ -798,15 +798,6 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
>  	if (IS_ERR(core->base))
>  		return PTR_ERR(core->base);
>  
> -	ret = platform_get_irq_byname(pdev, "core");
> -	if (ret < 0)
> -		return -ENODEV;
> -
> -	ret = devm_request_irq(&pdev->dev, ret, risp_core_irq, IRQF_SHARED,
> -			       KBUILD_MODNAME, core);
> -	if (ret)
> -		return ret;
> -

I'm not convince this needs to be moved, but it might. But can't it be 
moved inside risp_core_probe_resources() to make things more clear?  
Worse case you need an error path that frees the interrupt.

>  	core->clk = devm_clk_get(&pdev->dev, "core");
>  	if (IS_ERR(core->clk))
>  		return -ENODEV;
> @@ -887,14 +878,27 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
>  	spin_lock_init(&core->lock);
>  	INIT_LIST_HEAD(&core->risp_jobs);
>  
> +	ret = platform_get_irq_byname(pdev, "core");
> +	if (ret < 0)
> +		goto err_cleanup_subdev;
> +	core->irq = ret;
> +
> +	ret = devm_request_irq(core->dev, core->irq, risp_core_irq, IRQF_SHARED,
> +			       KBUILD_MODNAME, core);
> +	if (ret)
> +		goto err_cleanup_subdev;
> +
>  	return 0;
>  
> +err_cleanup_subdev:
> +	mutex_destroy(&core->io_lock);
> +	media_entity_cleanup(&core->subdev.entity);
>  err_unregister_v4l2:
>  	v4l2_device_unregister(&core->v4l2_dev);
>  err_destroy_rpp:
>  	rppx1_destroy(core->rpp);
>  	put_device(core->vspx.dev);
> -	return ret;
> +	return ret == -ENODEV ? -ENXIO : ret;

I don't like this. It makes the code harder to read. Also looking at 2/2 
this is never checked and you have the same substitution done here before 
propagating the error further.

Nacked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

>  }
>  
>  void risp_core_remove(struct rcar_isp_core *core)
> @@ -905,9 +909,12 @@ void risp_core_remove(struct rcar_isp_core *core)
>  
>  	dev_info(core->dev, "Remove ISP Core\n");
>  
> +	/* Keep completion IRQs available while streaming queues are drained. */
>  	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
>  		risp_core_io_destroy(&core->io[i]);
>  
> +	devm_free_irq(core->dev, core->irq, core);
> +
>  	v4l2_device_unregister(&core->v4l2_dev);
>  
>  	mutex_destroy(&core->io_lock);
> diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h b/drivers/media/platform/renesas/rcar-isp/risp-core.h
> index 627a762d6b1..9e057bff4ee 100644
> --- a/drivers/media/platform/renesas/rcar-isp/risp-core.h
> +++ b/drivers/media/platform/renesas/rcar-isp/risp-core.h
> @@ -112,6 +112,7 @@ struct rcar_isp_vspx {
>   * @dev:	(OF) device
>   * @rppaddr:	Hardware address of the RPP ISP (from OF)
>   * @clk:	The clock for the ISP CORE
> + * @irq:	The interrupt for the ISP CORE
>   * @rstc:	The reset for the ISP Core
>   * @csrstc:	The reset for the ISP Channel Selector
>   *
> @@ -138,6 +139,7 @@ struct rcar_isp_core {
>  
>  	u32 rppaddr;
>  	struct clk *clk;
> +	int irq;
>  
>  	struct reset_control *rstc;
>  	struct reset_control *csrstc;

-- 
Kind Regards,
Niklas Söderlund
