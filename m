Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305F74078F6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152991; cv=none; b=FzAnShs35LSlXrWwawuppTZE4G7uq2dPkhJLrXeX2DwCoTlE/aRXmfgrOS0NAxgJ0GKqyPCxVZNEkjd1i0Nsje6A+LNG+Rx05bNBMDztA/4DVmgWWFPQku5XUP4GpRtgKE5JYMP8O+Kvx7weZUoB0OIlXclgOW6WahMDkTR5fck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152991; c=relaxed/simple;
	bh=GH+G9KX9bwnt80PIq4IHwR7csOlpK4ojIMLf2aneyAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jMarei/bYOF1uq3yjshziOmh8zRbqyJPZYBW/F9ktFzv34BYpxWPquXhEPyFty8BpBMMGo4fjFBHQi4xmTtS+du+V+/gEzFhMbfBXhRr8eYNhdWSHDwDLUIzMsjmvpzSlV2KEwU6j679IQinQyVdknn9gEsc25K6kbszUwHom8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78564319a92so208802137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 01:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152984; x=1790757784;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=//oHg8gtYum1A3YUGYDpbh5UIJ1fkAr09bh3+8ifa0I=;
        b=AeEPVADw5tUd8pX7D+k/72KAA/MjkXrVSKPl86GyRkcygPs73Wm//0Qic0HVgDXwBG
         kn0Vq5Wa9hEhrPS+d9PH6d17AtBQ0AKPGT3thPSgBIxsdny6xp54zFqiSNTuwmLv+DNK
         nfbm7bEWvHn37OuYOLk1NURklyc9KUwlsZS2J+zqcCYoeJVgTI6y2piOJo0mfPfh53EH
         rOgOS1YzoIp6WNpJVr9CbBjlwgRc5ukFyJ3uPt8XgmwI4gREA6+XIXxZmyz416TbB/it
         cxg+JJEOYhgXHKuq8aVc9Uh0hnPonrQlc6ZIZL3e9lrNYb3QuhX71mkIwMLPJzPJm4IJ
         u+Yw==
X-Forwarded-Encrypted: i=1; AKwUvBxGq+EPKtCLbk1AQc6tVqTPNiYjgaV4Cgc0SxJNX9bp/V5nAvikpntq18O3TD2QbmUOKLXlOd0yZ0EMez/7uYNopQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nZy5Il5wXgbW2mDT6pHJ5l70SNcD6yf636qEhQtk7V2MaINfg4
	Y2vqJAD5NSNSxm3771XAC3yOGF25GnCuPh/6ostpGOO7N+vYUpLI6Hr6tY2NHPvVPIw=
X-Gm-Gg: AYBFou2k0py8nfcQR2CF6IlGZEo6tAVOf+fpdskEvO00PiflwW/HA0jR708C0qpPLWr
	bVAMo6q+yyYLOOzKpMIoRDnkhwPgLORbVNlBonBao9tTrJTQiMt0tS/I/e9DZQ2xicJjH5wsFnm
	fMz6ks/UynpfeqXtSgFRyHrk35K0UYusPMm9+ey0R4kehayuBQ0LcbYklrqIMWQuFZCv1Gvz/eG
	ZuV8xnE+TfhrXxFInFktgT+6QPnVLNZVP3VgIR/YB/Ww7wGZz9It0GZTHm6++kFbdqqcsacu+it
	MYkDnOn87nLtgGDs/a2AlFntHXgcjnRvm2eaKfSkFmfJ6tIPMw1zqNsPUU4MDvQMD0tFY1TjNG0
	07oG30B8lpEw97+mL1L/9OXWY1tE06UkZbR6RLlDZZPxaEh6B2aiF5xINAQDtpGI+ILMQz5d9LF
	LvB4witbBBswIQUYQFoQON3LzCWvJt/XtwohoeePT4kx2MLkavzEeeeCq+UZYuQEocmMMKSVT29
	xEeDTwE+g6GBOh+JBlRrI+rfwnpgUIpd2dp5g==
X-Received: by 2002:a05:6102:38ce:b0:7a1:f7d2:e84b with SMTP id ada2fe7eead31-7ac1da2dce8mr1660091137.27.1790152984077;
        Wed, 23 Sep 2026 01:43:04 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf35bcb07sm2838815137.2.2026.09.23.01.43.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:43:03 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a4fb331cc0so270235137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 01:43:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwbdRZN/x0FUvobfqBL1BezW8mXbK+bSLpftHqcz2lJ/C3j8fTtcQ70Sv/eZgShXoNHPJfGj997kRw0FATz5A4bKg==@vger.kernel.org
X-Received: by 2002:a05:6102:424d:b0:7a7:79c5:d465 with SMTP id
 ada2fe7eead31-7ac180f12bemr1838325137.0.1790152983610; Wed, 23 Sep 2026
 01:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914165026.184612-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260914165026.184612-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 10:42:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCeM3yEQjDX8xiUqCBHtzNQQGuOPHUx7-Ws+kHQDLAPg@mail.gmail.com>
X-Gm-Features: AclHuK848QBrvgpclPFCihicUGmIUafEaGDYy_N1SWQIWhJH-OczPXLCQn8Gw34
Message-ID: <CAMuHMdUCeM3yEQjDX8xiUqCBHtzNQQGuOPHUx7-Ws+kHQDLAPg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a08g046: Propagate clk rate for ETH TX
 mux clocks
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 18:51, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add CLK_SET_RATE_PARENT flag to the sel_eth0_tx and sel_eth1_tx mux
> clocks so that rate-setting requests on these clocks propagate up to
> their parent clocks. Without this flag, a clk_set_rate() call on the
> downstream GBETH clocks has no effect on the actual PLL/divider
> chain feeding the TX clock, leaving the requested rate unapplied.
>
> Fixes: d55a0dfec40b ("clk: renesas: r9a08g046: Add GBETH clocks and resets")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
