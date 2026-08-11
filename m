Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51191442FD4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450187; cv=none; b=s6/FcmQhayM60Q+AIF/XXOa5hcJRdkrjcu9/g/R2N1RvSPnD4b32HtjJOY8ysweztA6k7cyekjIFFIOwr+o9DeKSkIxOpemaBYdzDlBYD//8Cn5szG9sHnjuEFekEJNbtzC5IMTLKzutRjta/UWXzxNjiH9o8FHYGNr+zWGFRNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450187; c=relaxed/simple;
	bh=jOz8/RKCdao82EWzssvpPQu6MldBuHaOzLydpj3dJ68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZomMg2o7OFfzj7eCIHyGLNHt9WraXvixtbOg5a2nyWQlFmubzFWZrZ4LDN/6/3QgjUGZE/F3J13/+Kuft2zB0zctWq05UJIB9hgJ9tL0ZKuNIwVLnlgaEkbgaDYYdw/0gMxdx30uM5g5m6Va71FSiNTPeSt2ohX2ojIwRUYMRJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-977cf5cae50so524554241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 05:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450181; x=1787054981;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uoVTJmbd8yKwYcWWlgS08ZgHIJGke3bvkQlHT1fmSY4=;
        b=XbjxWy/kMVa9nybCEYytMDzycelNieBuXQjeSa1gkQD2fPpeP7+ImXAUEKzYY+HM36
         P9ttVqbyYdCRRMZnGlOV0tZUYYTKZUClgDqhcZrssYg9nLUN1dM5YPpHO+neC4A41rYD
         IB4ijVBOVjchP5hdEEluM3CrGKmnOg/aQHql4EA2xx290sy7mBeJeaqblvHj5U0AUU7j
         Ac8EhrceAi8klAtT4otMosF2rUN1wQxsCzkGwZvxXWZivp5EdUZQJ9bEkCuErGhEFWhS
         Zc7bLfIxB1ySWxwOeOy0KUY+x2kjDz8dnX9FWm6k8QtWQQiAZ9Nfq3fPbjY3G5292gpF
         pKDg==
X-Forwarded-Encrypted: i=1; AHgh+RqSgOrwM+hDNmK3Es4Qa1jQ8MIb3U6qlEJd0oTQYEreQgn0ObQFz8+Xmxx5qtynilA6Zdb3O3KjWe31p5vipPvUmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXU0xhBwpsjSH2Q8kgCURfadeimpqjZ1RMIMVac1UbEQVXuMsM
	esKncSGAstcH2AxCTUoqDG1DeEhXiKrNSHClbAdpw8HFiTGJGcwxNIKUp/Mo/Mlu
X-Gm-Gg: AR+sD10sesuPGii8ZhxFd3T3aWBPb9rIijTe0fvw4wu36bhffsXf5QckEW0EK8Acxzj
	rJVu70z413ggpIPPEqA9A7GxP1wf/3p2BGGT2nuGmL5KZj4XQxxUp37C2VdSQoli4U1gyE3wXbQ
	VNMVO1k2BKMP2rgU9uuYNAFu5CJfLnPgfRPSLSVk75AKcbFuUM/hB6baHMAxtb+Anwu/lQInAx4
	Cl8sKpVvErbVfUOXyiqSdkW5r/kATaslvqmokXiUI0aD8/KeSsHpRwgtQeozmvcit/OdhSvJQ1q
	Tvz9C+RP6vQXGSrbO3FyHWD9xT2+eCqwi1wd8LLVXJB1yczlKWsYgLctYAB4dFR+Py0ztJDU5Ke
	L/lX40QFhdSawuHLQ3GFuoYquKpNrA+ZtcxnZBR2K5CEJzWSypEmYxwoDIREAMkhvgQXluNZvWP
	8pJOQo1yy6itx+3tdP7bWLYnTKnHvZ7bA8ys7p8yAyRUsBFN+yNzELrWGOapAjhOjw9pNuzqKUB
	0hewngtlsRUKyDxoCYQerjl/rO+sgfIQ4uCm+H0
X-Received: by 2002:a05:6102:5789:b0:74a:be82:73a6 with SMTP id ada2fe7eead31-76b560a071cmr576809137.8.1786450180795;
        Tue, 11 Aug 2026 05:09:40 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76b655b9ed6sm369891137.7.2026.08.11.05.09.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 05:09:36 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso1275547e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Aug 2026 05:09:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpTB92EC9uINNa4QcclhfrFCq6y1ack5RsiibUy2G6zIDkqDe4uzpBAsHx/3cj5noZ4DUBC2sXsBivPO4u5kOgung==@vger.kernel.org
X-Received: by 2002:a05:6102:15a3:b0:738:cdc6:f59a with SMTP id
 ada2fe7eead31-76b573b9e9amr650405137.9.1786450174738; Tue, 11 Aug 2026
 05:09:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-3-56f306156d25@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Aug 2026 14:09:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW15QrpUhbra1Jg1_8rQWf8CE5TQiE5SUAsqvz5YmEwpQ@mail.gmail.com>
X-Gm-Features: AUfX_mxAADqzKHeccKVpUAgUM-G2gOwUTpW15Dago95Bl-ey6AOZpFlGkzHgs7Y
Message-ID: <CAMuHMdW15QrpUhbra1Jg1_8rQWf8CE5TQiE5SUAsqvz5YmEwpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] clk: renesas: clean-up simple provider misuse of
 the consumer API
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jul 2026 at 11:04, Jerome Brunet <jbrunet@baylibre.com> wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
>
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
