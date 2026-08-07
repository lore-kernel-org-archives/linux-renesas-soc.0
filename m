Received: from mail.lysator.liu.se (mail.lysator.liu.se [130.236.254.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EE437E2E9;
	Fri,  7 Aug 2026 14:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.236.254.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114610; cv=none; b=ip54Dd5Hf96+9KIbkSH9n3y/1M5qVJrTvQ/UvwmNgHbeJ8Ii5cDEarIf8NI1nGQ2tGYgtf4PXmk6qQ5oMeXFoPkpWfLdUKLusRI0biK3EqDKRJsITcGYTecyAcViFHCFhQMGXkDlK14RMOdU+MPOEazeKg3vR/ArhCZSbdU3ric=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114610; c=relaxed/simple;
	bh=JOHHXnr/ardWvMNfEsdj3fjKlu1e5fcvn+9fYny2n+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbW+PFF5g4VwvfpVNd6wmnG5LdYhgf63mH77KkrcOW78/cXO4Q72M7YdlvnAX3pCyPnmK257RDxGyaUO6AXrcpV6lKfwc2iufVYppK7seLa8nybGY1hTwuw56+EzLxgKP31Tai/nNFPZ0jlRcgtSb4VNKcP4eUwkxe1yUwyWR1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se; spf=pass smtp.mailfrom=lysator.liu.se; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=GgYAKrag; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=GgYAKrag; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=eNjvOUd4; arc=none smtp.client-ip=130.236.254.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="GgYAKrag";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="GgYAKrag";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="eNjvOUd4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786114604;
	bh=JOHHXnr/ardWvMNfEsdj3fjKlu1e5fcvn+9fYny2n+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GgYAKragidw9TE6WmVDbJdWwlQap6p5iwmP1ImN7p6+SjswC06/ntI3EndXUbjFgh
	 tVuP+fNYeQkujluwAm5kMsxoyvjTIXfr7qqP29LKiSJtl4H+GTLc0CjC+0sOGc3S48
	 Ifz2J/lsFnBvV7uV7BKwkcn64FP1n//nBFEZe8WdOXuW4PV82zZBuqywYA2b2wbzYI
	 mrQcwFXgoCtNlEzLLWL1tH7AE3p39a24kRVkiLVWKGZNU8yAPcBED4cKzzSFs62zzN
	 fjJnxX0tbFSZLu+BtMOru/imlUFLYy1uNLQgBsHL83OCcYIJK623T+S2c4jeM/eNio
	 vPhJ6CesEr8/g==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 379E81C7F9;
	Fri,  7 Aug 2026 16:56:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786114604;
	bh=JOHHXnr/ardWvMNfEsdj3fjKlu1e5fcvn+9fYny2n+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GgYAKragidw9TE6WmVDbJdWwlQap6p5iwmP1ImN7p6+SjswC06/ntI3EndXUbjFgh
	 tVuP+fNYeQkujluwAm5kMsxoyvjTIXfr7qqP29LKiSJtl4H+GTLc0CjC+0sOGc3S48
	 Ifz2J/lsFnBvV7uV7BKwkcn64FP1n//nBFEZe8WdOXuW4PV82zZBuqywYA2b2wbzYI
	 mrQcwFXgoCtNlEzLLWL1tH7AE3p39a24kRVkiLVWKGZNU8yAPcBED4cKzzSFs62zzN
	 fjJnxX0tbFSZLu+BtMOru/imlUFLYy1uNLQgBsHL83OCcYIJK623T+S2c4jeM/eNio
	 vPhJ6CesEr8/g==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id 1D8A41C778; Fri,  7 Aug 2026 16:56:44 +0200 (CEST)
X-Spam-Level: 
X-Spam-Score: -1.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1786114599;
	bh=JOHHXnr/ardWvMNfEsdj3fjKlu1e5fcvn+9fYny2n+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eNjvOUd4RQl5WiPZ9RT/OeFejiIq3e5fwAdcdzohj4EvL27LVetLYtXSh++GAZAsX
	 b2dIQhGx+DxobMzi4QCApmXgvmR7nt1A0ElbooIewKCT5hqRMBTFTpmaMAO3DlE/0d
	 DiyY2UmOACKHRO6Kj6+LGWFwAGOFoalYApiJmGMQrcRdBp4yAyFMXazGmXw2X1Eyro
	 uqtwH32nfldYVMT2tv3qqNtzekRgyTfuZyNl1z2L5EwXw3hTsVeKLQ6O3Pz/KDfyuM
	 SBimZTkBcrHPwxwD0OS5sYCKTbbCMXjW/z4Zo528C7UDRD5XZE5gf8yPKMWdtLuCCk
	 jnckQ8jI3YC7Q==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id D6E2D1C7F6;
	Fri,  7 Aug 2026 16:56:38 +0200 (CEST)
Message-ID: <beb80565-717b-4187-bcfe-b1e089718f42@lysator.liu.se>
Date: Fri, 7 Aug 2026 16:56:38 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/1] mux: Add driver for Renesas RZ/V2H USB VBENCTL
 VBUS_SEL mux
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, Ulf Hansson <ulfh@kernel.org>,
 Josua Mayer <josua@solid-run.com>, linux-kernel@vger.kernel.org
References: <cover.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
 <fd55d955abff917123a33842076550dab931b548.1784109616.git.tommaso.merciai.xr@bp.renesas.com>
 <0ff405b3-31a2-4673-abb1-49293b137249@lysator.liu.se>
 <anWt48Y0yB_J_4Cv@tom-desktop>
Content-Language: en-US, sv-SE
From: Peter Rosin <peda@lysator.liu.se>
In-Reply-To: <anWt48Y0yB_J_4Cv@tom-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

On 2026-08-07 12:05, Tommaso Merciai wrote:
> On Fri, Aug 07, 2026 at 08:23:13AM +0200, Peter Rosin wrote:
>> I'm not previously familiar with the auxiliary bus. When I read about
>> it I find this:
>>
>> 	"A key requirement for utilizing the auxiliary bus is that
>> 	there is no dependency on a physical bus, device, register
>> 	accesses or regmap support."
>>
>> That seems to contradict this driver with its dependency on regmap,
>> thus violating the above key requirement?
> 
> I'm seeing a very close pattern in [1]. clk-imx8ulp-sim-lpav.c create a
> regmap for its auxiliary reset and mux driver. 
> 
> The parent driver is creating the axuiliary device in [2], this create
> "clk_imx8ulp_sim_lpav.reset".
> 
> Then later reset-imx8mp-audiomix.c into
> imx8mp_audiomix_reset_get_regmap() [3] take the rgmap from the parent.
> 
> Also reset-meson-aux.c [4] is aux device and is taking the regmap
> from the parent.
> 
> IMHO the doc paragraph share why such a device can't be a platform
> device or an MFD, matching on the auxiliary bus is a plain
> string compare, so no register access is involved in match or bind.
> 
> [1] https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/clk/imx/clk-imx8ulp-sim-lpav.c#L95
> [2] https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/clk/imx/clk-imx8ulp-sim-lpav.c#L123
> [3] https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/reset/reset-imx8mp-audiomix.c#L162
> [4] https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/reset/amlogic/reset-meson-aux.c#L65
Yes, agreed, regmap usage from the aux bus seem pretty widespread, and
not being allowed to touch regmap would be quite odd...

Looking forward to v13, thanks!

Cheers,
Peter

