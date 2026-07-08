Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74433DEAC3;
	Wed,  8 Jul 2026 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501373; cv=none; b=nmxb9LUOMePADsnm4AyIc1UbezhWHa33Yh5DKsYdQVJFfJvTkLHaJuGcuEt3/NGo4O3Kx9LIkXPar3VSxtSCyKC8Ax7Hu+1Cmpj3MoS/nZXIIth/hybuSWqusEb4MCGyOkyfMNcWsVKAqz5U/39UN7mYo2iJsHphX+oLYiLJuF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501373; c=relaxed/simple;
	bh=w/erZE7d/fLj3QO8NTiQ9zFxqvioKmFUMh7pNpP54yE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZpR+iv9RLq5eQTiykzGg60QEydYfkrl2KDKZ2nPVaXoD39IIqb/5rZhtlmur35Hj+YUOPXIKayWQBKNZb7won+p7Z8hTlG61Ms+fBgmnJiLSssrs7V4o3IM1a/ARw1sKrHEw3fa0BGCN4ZMx1KBhDcJdYt64CUw8Fbc679HpYGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WiCHAcj1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e5p1qMAn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WiCHAcj1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e5p1qMAn"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783501370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nqHoiBFUxv5l1GEcEYRQAZmbJr3r/2iN9lxXQAEVXxU=;
	b=WiCHAcj1tLT8ih7RMJkovvm/gbrYCUcqlnXv4XBnhm6b1QEbH1cygwq2RWVThT/tJuytEx
	G3SnNF5qYLVee1/R6CcBabD5F8YpyXJ9+MtgmKlpHjacy+3zwGUsf2A1nm9QYv6y2gM3aK
	1o51z6LQINRukXOBtX7nA41mDSwf2ya2hY6qXgawpXptDmz3Bt+uR6bGxTY5Uj27AvMANG
	5jo3l9qdi0x1ZrobmreyMSe847w5BI20IwcuLAqZdGMQ9r6U3S0PJJ2A5P6LnDf2GzHqM2
	fd9/djB5J1M2loewWOJ/02lcliUR81ExhDVTmXiGAHptA7oFG/rN6oO1UoYjFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783501370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nqHoiBFUxv5l1GEcEYRQAZmbJr3r/2iN9lxXQAEVXxU=;
	b=e5p1qMAnUmXLPSy1bvy4Gp7UNWwyLxmdjBALSZ88dbTRJ3Vb7KV9wQNkEeb0HCJSvpttb/
	5F6esJQt1XZ77EDg==
To: Qingshuang Fu <fffsqian@163.com>, Magnus Damm
 <damm+renesas@opensource.se>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-irqchip@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: Re: [PATCH v3 RESEND] irqchip/renesas-irqc: fix generic IRQ chip
 leak on remove
In-Reply-To: <20260708020902.429126-1-fffsqian@163.com>
References: <CAMuHMdVGM6YZ0xm2RzBRK+nf=G1-sB8DOjzLO7=OetZS_WcHXA@mail.gmail.com>
 <20260708020902.429126-1-fffsqian@163.com>
Date: Wed, 08 Jul 2026 11:02:49 +0200
Message-ID: <874ii9svk6.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jul 08 2026 at 10:09, Qingshuang Fu wrote:

Please use 'interrupts' and not 'IRQ'. This is prose text and not twitter.

> diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
> index a20a6471b0e4..a340d27dd8d7 100644
> --- a/drivers/irqchip/irq-renesas-irqc.c
> +++ b/drivers/irqchip/irq-renesas-irqc.c
> @@ -211,6 +211,7 @@ static int irqc_probe(struct platform_device *pdev)
>  	return 0;

>  err_remove_domain:
> +	irq_domain_remove_generic_chips(p->irq_domain);
>  	irq_domain_remove(p->irq_domain);
>  err_runtime_pm_disable:
>  	pm_runtime_put(dev);
> @@ -222,6 +223,7 @@ static void irqc_remove(struct platform_device *pdev)
>  {
>  	struct irqc_priv *p = platform_get_drvdata(pdev);
>  
> +	irq_domain_remove_generic_chips(p->irq_domain);
>  	irq_domain_remove(p->irq_domain);
>  	pm_runtime_put(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);

That can be simplified by doing:

     p->irq_domain->flags |= IRQ_DOMAIN_FLAG_DESTROY_GC

Thanks,

        tglx
