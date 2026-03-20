Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8FD361DB9;
	Fri, 20 Mar 2026 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996637; cv=none; b=aca4xiDAbMYC/4Og7A/qOWAjVpyxcotdazqULkEFnk0yxbcAvdxCzG8X+7DzVBZ+ru4csugqSv2Y/0cmVblYPB0CQBuMzIvrn51LWhmS/1EdEGwRMX3SErMfpddhWapB+yN1efzkwnofN3uLZc9gztK8MroiZNEWrqDGXsmWk3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996637; c=relaxed/simple;
	bh=qn+VF/RnXfcuUW6vF3jfCd/mXPb/2kQIDgKojghCpC8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KDWCjT2W7XkNg9JnU8OMMsULiyyqiOoVo1OTTbXVFroUtyGTGcdKvUmztST8SjA1LWi6au6t6TyMSeSHtPhoHkhIOKASgAzuimbecn9W8Py5yKB7ceTdA+chNBt8aC1fOn6EvGDmlYAaZai/Kh9IavUGj7iM0mL4PDqgINh3uLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ykdb5U3/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ykdb5U3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3CBC4CEF7;
	Fri, 20 Mar 2026 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773996637;
	bh=qn+VF/RnXfcuUW6vF3jfCd/mXPb/2kQIDgKojghCpC8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ykdb5U3/59nBn2EGB5y84zihnS74/YTk5W9/Q/yX7cB+UtXGzj89RtwvL+88jP8ec
	 mau14vqDQoc2uiaxgxmUfj9eayDjPCZO2YrAcWbpk1ZeXq2kFUTd7Pl7uHlF4lX/X2
	 Bth4jK1EckJ6cLkx6x94Y4wesoSfBJ8YBLfkyE8ivYou+kiWPcn936fAw7zLnyqv3o
	 pwwHzOvht4Z7DSlgi6pkAHKG6/W6HAj9W8uXtWmvUBqEUYaym8HQ85pireujAnzKsE
	 nSjJuBLfTriNRNTj8JX12wK+FoxIDW03fxOm/7gGaI0TIZrn59kiqZjLVCWjd5VPuF
	 Bu3gIHMkGUUPA==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 08/15] irqchip/renesas-rzg2l: Split
 rzfive_tint_irq_endisable() into separate IRQ and TINT helpers
In-Reply-To: <20260311192459.609064-9-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
 <20260311192459.609064-9-biju.das.jz@bp.renesas.com>
Date: Fri, 20 Mar 2026 09:50:33 +0100
Message-ID: <87ldfmlw9y.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Mar 11 2026 at 19:24, Biju wrote:
> +static void rzfive_tint_endisable(struct irq_data *d, bool enable)
> +{
> +	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> +	unsigned int hwirq = irqd_to_hwirq(d);
> +

stray newline/ The previous comment about data types applies here too.

> +	u32 offset = hwirq - IRQC_TINT_START;
> +	u32 tssr_offset = TSSR_OFFSET(offset);
> +	u8 tssr_index = TSSR_INDEX(offset);
> +	u32 reg;
> +
> +	raw_spin_lock(&priv->lock);

  guard()

Thanks,

        tglx
