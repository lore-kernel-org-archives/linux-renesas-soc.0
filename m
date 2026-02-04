Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D541C31F;
	Wed,  4 Feb 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218524; cv=none; b=abx3rBq/qYiEA1/tLTJ8CbN1ltd1JQkwutUm7LNrlIRIDMTN5l+e9Ibj1Kz9jBls34teSzLMG69CBZMvMKqrkx/5EHEKm53RA5oN5EcKnkojy6uT6bRjCMFVoQbpRSuwRgNogtR9G9pDwnIO+tFsspDXmor7xeOuFlWPYWXUPF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218524; c=relaxed/simple;
	bh=iNUrX/5cETioElxv1qpC3ihSn00cWgUdnpDijcRIxHE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S0SX9j6H2gv95NXXR9GAQ31UUwxUR7x5AdTRbshUKI4AvHN7xuzAJMcVRczDpHuDcojWubF549QcqdDpGbgBoCcT+VlYWYVnIdeQOV6ut+ttG+hyMDzIqoeQRw0+uNDRZpB1LABjI8z0UgyV16LKNteeAoJfUDiglOrJd7P+YwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkJMH7Ix; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkJMH7Ix"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7BAC116C6;
	Wed,  4 Feb 2026 15:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770218524;
	bh=iNUrX/5cETioElxv1qpC3ihSn00cWgUdnpDijcRIxHE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YkJMH7IxhFwTxTodLPHc7+04viEQRet4tKBfel3a5QBsKn+2FUwlEMI0HHYPKjMjb
	 gbwsbmhY6qL0P83xInGyMNkPkt22aGkocmWKtKXR1sx9pRlOXnE4vSoUBLLcukUGBP
	 NwxVv0cjyhPm710cwZGbZZKByTm9wksmxz8Y+WTGLa46RWOXERUBFKn2+jZTEg1Fw6
	 rSDLOSqDDMOAGJMDvUpCMcwH2cH4G6MOFIZH2CgZBnNn2Ls52C/Ai45cOpBklbagKE
	 lJT7Tn5dz6dSLWOji0GavYZX2cRMFzm40bceIM0Gv/Kmd5HtoB6nzLrmXfu001bl/A
	 bn1Rlp8xs4fUg==
From: Thomas Gleixner <tglx@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 6/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and
 add SWPE trigger
In-Reply-To: <20260203231823.208661-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260203231823.208661-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Wed, 04 Feb 2026 16:22:00 +0100
Message-ID: <87pl6k1qlj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 03 2026 at 23:18, Prabhakar wrote:
> +	/* 1) Bus errors (BEISR0..3) */
> +	for (k = 0; k < ICU_NUM_BE; k++) {
> +		st = readl(base + ICU_BEISR(k));
> +		if (!st)
> +			continue;
> +
> +		writel_relaxed(st, base + ICU_BECLR(k));
> +		pr_debug("rzv2h-icu: BUS error k=%u status=0x%08x\n", k, st);

Why hiding this behind pr_debug()? That's all diagnostic information
which helps to monitor system health, no?

