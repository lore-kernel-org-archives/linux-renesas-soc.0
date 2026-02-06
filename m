Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5D021A447;
	Fri,  6 Feb 2026 11:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770379114; cv=none; b=hCo0+2vSrsNckku4AmUPpPsj13DO3DcsbAZ3HWiYB5SIr+bdPY3WodnmOJa5dlAYty2Z6DmiLgGGnqh5hHWIlYdMv7/dp6peIpdYn3UudQBdNQ/mR2wG/qJz25ghtYL80vppPCV+hXQZuR5G+WHHt5STC8evrM12UlDNcnMauZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770379114; c=relaxed/simple;
	bh=eYTjUXr65pge3pSl4dp1wBDg1m2SjkHvIF/XJPWTftA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WCGBSom8qGT7b0fkvsqP5uYZRWPYAkB5hbWx9DSyLV0yFEqhRwvMh0HXRVwI+mwFLcNKKTzNotb2l7wT7nYrmR66BDppvGiT0KyW5fCQLtKJZPegAzv3MlMHSVfYNlUjZweazTTD5t3BuLk7HEofdeVmVUdioxW5HpkaOO7svag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKCEudLI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKCEudLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74EE4C116C6;
	Fri,  6 Feb 2026 11:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770379113;
	bh=eYTjUXr65pge3pSl4dp1wBDg1m2SjkHvIF/XJPWTftA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RKCEudLIByIbaCxi4dNo8gUwrQnr5YdjrSKCcIKICAS9EVJAG/0bdKaWmL8/ORfZJ
	 WFykl5AvL9Q1T4nSrJDaIVzJ4WDFcdRrXHk9YX5yuIrMGu+dsjk3C3wnnz1jO/qiAA
	 bqko67pKgU/zlOO3oxxNZA5JZmEoPcLFFPb9EsUGvxEzwyk6ahwrl2CGjtBJXCjT6Y
	 aHu03/4kXi0iOWs5BDlDo0cOgcN2Dw81d8ZtYhwuEEnfcSlgszmdiWCRmkRWzpLtPM
	 G01K/3H4EAeOuivD7aagWZLwWXcwkZNXQQ3hTqc5j2IxUZhjqgGkt+kZP4LITRy+IZ
	 bdmiMYW1oRHrQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 7/9] irqchip/renesas-rzg2l: Add RZ/G3L support
In-Reply-To: <20260206111658.231934-8-biju.das.jz@bp.renesas.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
 <20260206111658.231934-8-biju.das.jz@bp.renesas.com>
Date: Fri, 06 Feb 2026 12:58:30 +0100
Message-ID: <874inu13tl.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Feb 06 2026 at 11:16, Biju wrote:
>  /**
>   * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
> + * @tssel_lut:		TINT lookup table
>   * @irq_count:		Number of IRQC interrupts
>   * @tint_start:		Start of TINT interrupts
>   * @num_irq:		Total Number of interrupts
>   */
>  struct rzg2l_hw_info {
> -	u8	irq_count;
> -	u8	tint_start;
> -	u8	num_irq;
> +	const u8	*tssel_lut;

You can spare that churn by indenting this correctly from the beginning.

> +	u8		irq_count;
> +	u8		tint_start;
> +	u8		num_irq;
>  };

> @@ -343,6 +345,9 @@ static u32 rzg2l_disable_tint_and_set_tint_source(struct irq_data *d, struct rzg
>  	u32 tint = (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
>  	u32 tien = reg & (TIEN << TSSEL_SHIFT(tssr_offset));
>  
> +	if (priv->info->tssel_lut)
> +		tint = priv->info->tssel_lut[tint];

I'd rather make it very clear in the code:

	if (priv->info->tssel_lut)
		tint = priv->info->tssel_lut[tint];
        else
        	tint = (u32)(uintptr_t)irq_data_get_irq_chip_data(d);

rather than read first and overwrite somewhere else.
  
> +/* Mapping based on port index on Table 4.2-1 and GPIOINT on Table 4.6-7 */
> +static const u8 rzg3l_tssel_lut[] = {
> +	83, 84,					/* P20-P21 */
> +	7, 8, 9, 10, 11, 12, 13,		/* P30-P36 */
> +	85, 86, 87, 88, 89, 90, 91,		/* P50-P56 */
> +	92, 93, 94, 95, 96, 97, 98,		/* P60-P66 */
> +	99, 100, 101, 102, 103, 104, 105, 106,	/* P70-P77 */

Please format it so it looks like a table:

	 83,  84,				/* P20-P21 */
	  7,   8,   9,  10,  11,  12,  13,	/* P30-P36 */
	 85,  86,  87,  88,  89,  90,  91,	/* P50-P56 */
	 92,  93,  94,  95,  96,  97,  98,	/* P60-P66 */
	 99, 100, 101, 102, 103, 104, 105, 106,	/* P70-P77 */

That's makes it easy to read and to identify the number of entries for a
particular port. The condensed format does not. No?

Thanks,

        tglx
