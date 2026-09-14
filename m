Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAE8490C02
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 16:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404736; cv=none; b=N1WaK6dKRdKBFhfH+lN3Qrq/FnNkB0LpzhWNxCavYTjl6VVzvFDSt2/iVXq6Cqvnb4wl7ZDsyxydQjj2fGMgUdolHrLV45oW4oMZb4ewblZ+fFLfZ72YJ5fC2NzJA1eenNFG0tn0cblePOrl8VqqfUr1Uvkimho2nfjHSTZhBfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404736; c=relaxed/simple;
	bh=UIWk/mFEONZjdGSVThQcGe22wgnytiwRHqb6WEyzl6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4m2RCFHMxebItpIl4slhLRYkV0z+1e93BES90dFaJ68MY7YFhPPr2lgCVqSOWx/mOnTjCcE2RmNXUpNaQGcmapk1tBTzI+k8DpNnvfo7DDykEk3BW7pwskGBwr+qjpxzCl3jNuJYrtiadiUlNxG2AMbSVqH6k+GHMN+KxAE21U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so907152e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404733; x=1790009533;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AvI/QWFHsgVdwtTPxxpgjV2LtpVQ5it1qz0zswhLJPI=;
        b=nntKklGr6NNpQaKo6jL+TldamukE+ESyL8Tb4jp3mRjfXg7bntv1r0pMVusKjLDgeq
         KwJgRpRlFn1ulocSFiu9BFM8CsR+SB4Cm2A8FkzQB4ol3ZQ/v9/CFJOAPTwqtw7rxJAP
         dyl6kWtHRw3MTcUgIxrodiyo0CWzIyIAgP+IIkzppwbJvqbejWmhgNpRZCBwsb62UjH6
         8tfe5DuZH3Ktef3+s17FmU8rFumz890DnGqw0rlgB+Bxt60l78wBFEjI7zZvPYxH7SBp
         eukEP6TzOuymDYUX3fBA85LYu7VKMDXdl539bQP6p1LgqDs/EpNXfw5IJn/YKUIuPpc+
         zMCw==
X-Forwarded-Encrypted: i=1; AKwUvBxOnkW6Tin2J9E48zl209a2mtzLuhZVU77suGxZJmldRf91gPZir7L7wQl5wzUJsjAiIaKLmzhP7zO5KlmX57x0MA==@vger.kernel.org
X-Gm-Message-State: AFuF++lDFIgaprwywXTu+HfZAYjCf93H7Zqr2gETbf3136GeJYDhGgTj
	51W08NHK0Iz9nWc5+tIpxV9jOsFig/r4z3TPeLRVaqGs3H5sua3/GUeykDzPVNTm
X-Gm-Gg: AYBFou04B62Cwsi+LSUxq1hhA10QbY7h0ovncQRIbRrtHuJEsB3OaYKLzZK8WweBKoU
	DTJECgFFnTvYpNw0S9DGYr+716XO2wa4XpXVcR+7k9WSW8eiD8llSzcfwFR12A21OJwWuMkVELa
	GLlfB92KVbdzyPBBHJ9WQlenteCJRSfT636/dTz+Sy1OLi9oeSGko+WlZCMdvfoqACWdykn9Bgq
	ZeOUoLtNuS8KQ6t1smRD4s5ZoJenpnz7PkGXdlz+T6q3z7yw0+YAwdXVN4DCcMUsH71e5ImcXUb
	VJKepkJM31iOemQAweDmrD+4cQyRnvk67e/IL1ifRkfyzjt7NEl7JAKkBfjjR6UdY6+0SROyKXT
	g0A47NAK8L+zA377hEBhNPx5s4hWFt6uqEXUvfje1jCiEKEzstJnr81jw2eiHO+nYMWkoJF7Rrl
	igovTwdO5pI0Z49+zHVSfkI2rAF9YC3aRt9gkhPhPAKbFR0AY5zGGeNy9MXLpRgfC0T81rpd+3+
	q3yUVApQ15oAWyNYISjaWWMZvFIDraR9cdU
X-Received: by 2002:a05:6122:4f91:b0:5c6:58df:5826 with SMTP id 71dfb90a1353d-5c981d5fca1mr4780617e0c.5.1789404732622;
        Mon, 14 Sep 2026 09:52:12 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470ae511sm12637672e0c.5.2026.09.14.09.52.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:52:12 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so907140e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:52:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjC78F8YcJC0LInl96sZ72njpkmH40mH4rrv8DhceApv8kbPBX5hELhUhUNapVEvJnJ5HzpfIqZDlRgjGMj1WamA==@vger.kernel.org
X-Received: by 2002:a05:6122:d86:b0:5c9:54c6:b4c6 with SMTP id
 71dfb90a1353d-5c981a92cbfmr4262605e0c.2.1789404731378; Mon, 14 Sep 2026
 09:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:51:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpTKXkJFFxgZ5W8Qdb=2YFwTNyjkxKqYFr_kLEsLDWcw@mail.gmail.com>
X-Gm-Features: AcwNN1XFaYKKRap8WdI0zgtlhQNDEsuoN6yL245cXUtWnEuRlQigs7Ay4Kwnzfc
Message-ID: <CAMuHMdUpTKXkJFFxgZ5W8Qdb=2YFwTNyjkxKqYFr_kLEsLDWcw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pinctrl: renesas: rzt2h: setup IRQ in .irq_{request,release}_resources()
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> When exporting a GPIO using the deprecated sysfs GPIO API,
> gpio_is_visible() calls gpiod_to_irq() to determine whether a GPIO is
> IRQ-capable, which ends up using
> struct gpio_irq_chip::child_to_parent_hwirq().
>
> When using the GPIO character device, it is possible to request a line
> and to dynamically switch between using it as an IRQ or as a GPIO, by
> updating the edge detector.
>
> The current struct gpio_irq_chip::child_to_parent_hwirq() implementation
> makes the assumption that it will only be called with the intention of
> setting up the IRQ permanently, and that it will only be released when
> the IRQ domain is freed.
>
> Since we now know that this is not the case, take the following steps in
> order to properly handle that case.
>
> Implement struct irq_chip::irq_{request,release}_resources() based on
> the default GPIOCHIP_IRQ_RESOURCE_HELPERS implementations.
>
> Move the IRQ setup and release logic inside them.
>
> Keep the mapping logic inside ::child_to_parent_hwirq() to be able to
> provide a proper HW IRQ number, but do not actually setup the IRQ.
>
> Remove rzt2h_gpio_irq_domain_free() as its only purpose was to free the
> acquired IRQs. irq_domain_free_irqs_common() will still be set up as
> struct gpio_irq_chip::child_irq_domain_ops::free by
> gpiochip_hierarchy_setup_domain_ops().
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * no changes
>
> V2:
>  * reuse irq_idx in rzt2h_gpio_irq_request_resources()
>  * mention that irq_domain_free_irqs_common() is still wired up

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
