Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB98284693;
	Fri, 20 Mar 2026 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996521; cv=none; b=iyXVG3E8ufJuZ5ptMuSBzoxrEfrcbImtWKf+I9jrnat6rheS8nM9Dh5i0uSyE1ZGvAW13eJB5A4awmpB+PIajMV06BmTSjYp9lPby6N+8TmQUSEsz/togTS46Mm+eTWr6u5jxV0FspWWvUoo961rkT8MIcHhhdQuIqwS20/T33M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996521; c=relaxed/simple;
	bh=/3SW80o8iSXUs17t16sqzadFC2FSXmFWxQpqy+g2zcI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HcNRtpSCh95xqcm7MXWNCGSSxVsWmVG+EKx9pQDG69dup/vJMBaUt4tny7DJA5rIOuT7bnK72ejkrSejdX+kkrX0HVgJgzOP7qHBUUfV+yjS+Y4XNFiiTicLVZR8uPfZk6xDCH9VwyVmT9Fl4HFNbpKPHZnaFt0sGLeyJ/e3BKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVnqLlze; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVnqLlze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9AFC4CEF7;
	Fri, 20 Mar 2026 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773996521;
	bh=/3SW80o8iSXUs17t16sqzadFC2FSXmFWxQpqy+g2zcI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LVnqLlzetGzwgBagkDmnLAYQKlR66NQtifTsQBxl9/I8rCQooNPt57mqezT3z1JVu
	 yRpH9qgp2eaTH+3sGBMlbalMzyF/kZb+lvgVx/KQrfS7saGKzs3BJLpH1Cuh+gF63Z
	 v92hKJbHb1reqriiqOxOJrT/9oomZ1sb+NuAgI9pRkL1Rt3V9kXOe5hDpL1RE+3H8Q
	 PJvzkoCRQXMyCNSF3smMHtbkxYcJly5P+sFWLwNFQ1UbQWr0CVoj+LyBKJLcFO+qM5
	 Lxw4Cyk+Vk6lXJvTcrZK5dk3x6f+e5EoL6F5m0GkYugU9mqTUZzZ/R8G3EawW0+wpC
	 fi+NihWyvk1lA==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 07/15] irqchip/renesas-rzg2l: Replace
 rzg2l_irqc_irq_{enable,disable} with TINT-specific handlers
In-Reply-To: <20260311192459.609064-8-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
 <20260311192459.609064-8-biju.das.jz@bp.renesas.com>
Date: Fri, 20 Mar 2026 09:48:38 +0100
Message-ID: <87o6kilwd5.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Mar 11 2026 at 19:24, Biju wrote:
>  static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
>  {
> +	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
>  	unsigned int hw_irq = irqd_to_hwirq(d);
> +	u32 offset = hw_irq - IRQC_TINT_START;
> +	u32 tssr_offset = TSSR_OFFSET(offset);
> +	u8 tssr_index = TSSR_INDEX(offset);

u32, u8? What's the point of those data types. We use uNN usually to
explicitely denote that this is hardware related. All three variables
are just for calculation and can simply use unsigned int, no?

> +	u32 reg;

This one makes sense.


> +	raw_spin_lock(&priv->lock);

This one can simply use

     guard(raw_spinlock)(&priv->lock);

> +	reg = readl_relaxed(priv->base + TSSR(tssr_index));
> +	if (enable)
> +		reg |= TIEN << TSSEL_SHIFT(tssr_offset);
> +	else
> +		reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
> +	writel_relaxed(reg, priv->base + TSSR(tssr_index));
> +	raw_spin_unlock(&priv->lock);
