Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160683;
	b=fvnM8S0kAl7qme2iu5YeMdPp7lQYtyOu77FyWzsKnBk0tzaVat36dQrtoJdn4BZtvxHZ
	 2Ejlu1GmDvmsvQLoD3qL/sxtuEm3M/y4qESW22REjTjwiTI62aASKe923fQM0/YPW5cTS
	 T4jgBcoDPBTiTQtvn5HX7WsX62Aso5ZdpyOHS0wrEux0F12Bh3sxUAC4Q/CnfXcK24Cve
	 2KzcFn9JjWj6hthBfuT9vpnAv6x9bLpup7M/s0DjrjgXbp7KncnVvCK6L4XDSV47McO3E
	 bTVakUYLQmddZWGleN+IPzHO8YLyovfduR13pnbXNDFrUJMmZ9NB0hSKAbIyNqHs3bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160683;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Vu6IMQbhyMpXX+yWtY4enAtEpk8kj3N3fFV230nsSvs=;
	b=xgbFJHqxD5o0rYpD2bXGo27wV4cAHuU+mUOtyJJ2AGYVdZ2XIAO7xSJIphhqmq0GmguQ
	 /HzKPBKPdhNPuIwx55wpElsHNXDf+CllD0GbLiT4oADinS52EhxnXB5XCSC72ef/X+5vq
	 8Zm1KDMgnQyr7TKWYX0Hsa45bF/3xnpvMQPun1UcI/OwkBbi2wVrNjqtES+RHyOHAU54j
	 DQSE6vN1tSaSrNj2kHUk1HFcJpr4Al6CsSoxOaqdtAzwRrxAAlmTNG1i2ihkniGqD+TDx
	 BTOnrX4c/EhjlUr8jhSYAuFPN3cxKzLiul2BvGAQvw0qDl9vDeNwbP/ksBYWnbTtOdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3457D606A325
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 07:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3457D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-74ab99038afso397536137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 23:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160682; x=1795765482;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vu6IMQbhyMpXX+yWtY4enAtEpk8kj3N3fFV230nsSvs=;
        b=THcYzYEowwVB1LwI8KpEq/2IyiVD+DEb/JTaLbHN/VJ2Y8eVwlaf420+na4I/ktVIY
         0scblNV1nL5rBATc2XWjEoRxadHJFkFsTZnQB5ebxNI1Rd+DBT9vkq8tAsSu7SQ1mDX4
         MoPVeXU5PQUA6ryyUSYaRikGS7fcvIIcbdsTpzzp566DX2ZuEMJAQ62bErnT7qFeCWlV
         53Dqd/4ExaHpGH3kkHkLXOtwIN/JU16MsxuCspzcCn2D2bFi+TLMp4J5siYFhGL9ZAH9
         DFH22sIAP0EzDOXjvQTQXVwwnKjq3EAI7c6kJ13Kq15XU/aRCBBJr9wXhysY5h78O0EN
         IKbQ==
X-Forwarded-Encrypted: i=1; AL+hErEYvAh1HljBKGwiQ265eOUG4jmdaHEoRFb7YM001TCjJmj+xYp3MbmYe6B1mNbbKjXm1Ngd/6aM1qAkcnOxAW2rpQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9N31eHYNZAiPExQzp4s41lznQuxi/nHX2QH2o6NmLPYQVHLNPR
	FQ25MIxlB6cHB+AxfYfOSItqn6yOnEoij+DzmTuc9DZjV4h9q72masdsxqhrVy9f
X-Gm-Gg: AZFdTZfg5r660QKSbbv+ybqr6gHJtGdp+nndeekQY6uPedTfqOc6EgricYvvqD+O30d
	lNQizGC7Kmlpt2W5rwxW7BcjHd5VgmBCpCCXV/p6QMh21IwVjV7SXnAlEr5bjoWMa+NDhuKfPPg
	rnuTCeXFC8ugGGMpD4dnwpWiNkxkJo6p0g9s7YWkCKjp+guAP712topDmyOjh4uQLT2dHQ+qqpq
	nQP4QQ9QEQnPJLvwPXwspbtxrZfFCONL+BPLvE6HUuNhI2BYf/HaeFRCmT+yNH5dfLzbrYX65Wb
	xjWG4BmIVJPdgG2Nq3JZHo3tiwHIAUiyWKJtCmQTXqX1SKugHW4p67+Uft1PjIgyskJ3p9CmU0z
	NN9um5DHmLN3nZJmfX43Xi8LpMNwr7OoMj/RLflRPSeHHoKu5g86Zibeu8+Ih9iqCLy25eApjr4
	p0djprFO052Glw0qt031I2P2Xr54owkvipP3B3i/YDAXA62GgvwvwEtlMDQ7FJ7POFOtbeh8Vdw
	SbrYBmWh/YITaG4iqMuxnMS/Ah+w84h8EFxo8vMp/h6gqKX0uW0njbXgHFKjXx0QdGKNIzAwBgY
	DyixwvKlIoKRzBrtOk/iGslrcN7aDYZZKrR9OZJlQe3uG1K6g2R+Jsy4I5hY0g8+2R4=
X-Received: by 2002:a05:6102:3f94:b0:7cc:2674:b78c with SMTP id ada2fe7eead31-7d739391bf3mr836197137.7.1795160682082;
        Thu, 19 Nov 2026 23:44:42 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm2211178137.2.2026.11.19.23.44.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:44:41 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so380554241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 23:44:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFSwA6PyMXU60o3YnyF6LdXVxaVsdRAuARMlVxRfjjiHNjkLxL8cseoOQ/kQz8zkf17dWBfWsD69Yf6B02iX9rO9g==@vger.kernel.org
X-Received: by 2002:a05:6102:441e:b0:7cb:bda3:27ab with SMTP id
 ada2fe7eead31-7d7393925f5mr941037137.13.1795160681386; Thu, 19 Nov 2026
 23:44:41 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795094688.git.geert+renesas@glider.be> <a896e5bdb29c7c6de39df9b28b11d55614f2ec2d.1795094688.git.geert+renesas@glider.be>
 <179513882271.284394.17357508909448455391.b4-review@b4>
In-Reply-To: <179513882271.284394.17357508909448455391.b4-review@b4>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 08:44:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJ8zK+kzcznM7FJ3JCo1xWzjRZ5MQz9jhSUcYQfO5rBA@mail.gmail.com>
X-Gm-Features: Aa3M54p6yw1Lhc431P_jQfP5g0YMf_od8mct8UUR6SclOJC7dcSgYi-awR9w8qQ
Message-ID: <CAMuHMdWJ8zK+kzcznM7FJ3JCo1xWzjRZ5MQz9jhSUcYQfO5rBA@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: Remove unused clk.dev
To: Brian Masney <masneyb@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andyshrk@163.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Fri, 20 Nov 2026 at 02:40, Brian Masney <masneyb@kernel.org> wrote:
> > This basically reverts commit efa850487a6b6742 ("clk: Inform the core
> > about consumer devices").
> >
> > This commit added a struct device pointer member to struct clk and a
> > parameter to clk_hw_create_clk(), but the new member was never used
> > beyond setting.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/clk.h
> > +++ b/drivers/clk/clk.h
> > @@ -5,8 +5,6 @@
> >   */
> >
> >  struct clk_hw;
> > -struct device;
> > -struct of_phandle_args;
>
> Did you mean to remove of_phandle_args?

Yes, it was added by efa850487a6b6742, too (although it was
used in that header file before). Currently it's not used.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
