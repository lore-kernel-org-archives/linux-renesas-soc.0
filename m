Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186A7421F1F;
	Tue, 31 Mar 2026 16:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973760; cv=none; b=G7jy6O6nVh1Jq1dsfjoAq9BEi/hT2HGCIrcSfIIOPNtMUE2bniHBweKX37ekNf+isexKmDioU/fbkMivBoQplP0YOj6xIYVlKVj+8zcHCUSVP4Ixw5YhyehWakEBnJqUBf8lOEGIbgA/7wh2Y4dSoNpW8vaARaEsIHtXFpp6ztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973760; c=relaxed/simple;
	bh=VQJpEakpHyXz1AXwi3fnVUfQb7cG4Qft4cGZmSL0jCE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QeULyic/sWLGC2x1Vc9l4Um+rzEfgr8ii9wfsgbpKg0ICm3gLj3fQ40I9wZFaWCSjQ3Y98FJAKofshIhwabXYo2+i0YPqEvlciXjVUnaMx/GHuPYYLUcKXDFM5DAb5k1OQ9UEq1vYD4evBzpp8YFN7SetAfeg5l5MbZqfJLP75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRvrEw/g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRvrEw/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E791C19423;
	Tue, 31 Mar 2026 16:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774973759;
	bh=VQJpEakpHyXz1AXwi3fnVUfQb7cG4Qft4cGZmSL0jCE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sRvrEw/gFSD7kZfgpVlyx8XOsky0hGzXrKLVXcMhFbDyh2q4gLXpXOymHE7roF1Td
	 qT9jLoiCogBp1/zZwgtY4E8uYtoPks/qEbr/6ZF3PNkABlCQzHbLB895j2U23wTqZX
	 yMomq7ePF/fRHICQX5tAAJEd0v2xVqt9PTev3uN9J2GUwUvznRxuu5j6v1qDl9Zwtg
	 R2nvXL7KQ85tigZ0wNMsnhTZJK4rIiBfvCnS6n3PoyVMza+q3zcjX80qebmFZo6Vwt
	 3tqdwDxLopWTCHUeERoLwBl2zxCbov1GKEJkttEp370QxroMHnn0AjfL7w2g3kYVyX
	 y1TJMWUn5Owqg==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
In-Reply-To: <20260328103324.134131-4-biju.das.jz@bp.renesas.com>
References: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
 <20260328103324.134131-4-biju.das.jz@bp.renesas.com>
Date: Tue, 31 Mar 2026 18:15:56 +0200
Message-ID: <87qzp07z5v.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Mar 28 2026 at 10:33, Biju wrote:
> +static void rzg2l_irqc_nmi_eoi(struct irq_data *d)
> +{
> +	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> +	unsigned int hw_irq = irqd_to_hwirq(d);
> +
> +	scoped_guard(raw_spinlock, &priv->lock)
> +		rzg2l_clear_nmi_int(priv, hw_irq);

Is priv is shared between regular interrupts and the NMI?

If so, then you can't take the lock.

    // Some other context (task, interrupt)
    raw_spinlock(priv->lock);

--> NMI

        raw_spinlock(priv->lock);

--> Livelock.

Thanks,

        tglx
