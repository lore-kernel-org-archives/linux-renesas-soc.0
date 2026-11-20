Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795161323;
	b=mv0dLjnT7aIrJMt3dLmB+cik0CupiiCWnkuAKtMvE/IC3cVectDBxzT+ntfyQS8p8KRb
	 ZOyMf0QMeOFkFlIJW4jYX0NQrPtlbW8PYdijZJtdubds5CratT3758NABCD/dk961bkOr
	 4qYsnwzB4xZ6eWbg35F6rqBeRDZ0uepb6giB0oSNJXRBnRB7xsYDfrE5TfH6mTA3Eep6s
	 npNq5wKbk4qqCZOrSoNzPeENh9/Ftpj/4Q5zlj7YWHc6eK5zlcQk8bH5DiY0fSA9ZhGMp
	 Vr6DFRA5BDCWrTE+7jR76YEhB9MRybO+HGhFPSAkbSzzoyshTsG16xYnVvlKPAbov5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161323;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=xKnU/TldM314xEN7UqLDGvv/eDTZSOGz68aX0N6/qi4=;
	b=hA8Lak08Wp0gM2snKeBfEdeQHOsVH3ojTSQ759RlJq4qxPDmyFyPy99xWkjYwfNcJZY3
	 xo+qOOl+KBbb5LzDL4HSuBoms8u+iYEwcibFxmS5VWdRnfNiCnH+GpHOGCQLLcCcuciBL
	 8H9i0UKXjFz9fIFcCY+uF05uXhv+dFEfLwek3CJn/EWWX97dGHeyMCPUDpgbkh8dHHU6t
	 OSoMx2zLeYqzBtjafdVLcrYO5RHfJpzwbdZwriWNV0Gwfhy98ApcqyChs5+67owBKXEPY
	 A2VaoodWEDaU0FCZ/gUf2+t6H0Pa7E0fGngMA667JldprHf9nrn+aWJ5pgtdAhBhA+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98E0606A320
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 07:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A98E0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-70bf1671c21so384381eaf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 23:55:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161321; x=1795766121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKnU/TldM314xEN7UqLDGvv/eDTZSOGz68aX0N6/qi4=;
        b=VDR+6k6J1ENTnzI8jRG3f7QIOcwmVn7LU/5mbvnReDD7hryIvepNocShyXOPoL8LKu
         1F8Qgq+RYqnlmaauN5pNnMJRATgOXB1OgJ3iY0doqYOwlgO9y2KiXnB62L42Oy3M8AZO
         iXIb1WzYwy2pP7O7GDEW0smDO06PEuqTOASfMy2nkusD7e/jZuAj06uTxXxJ23iWQcOL
         JG2GQZTVr+01ddSe6JRupHwinut2hP6AK/fTBj4ybdlzZ8pFG4PyuzZ1uJNwLRWPQZEV
         2AEC4scK5cjXa5Cm4HRoJIvZXDmJ/hoSBPTQtV12mIaLwl6zJWZ++cr6dG3vyEn/3jDy
         xBWA==
X-Forwarded-Encrypted: i=1; AL+hErEBn8+AYgr5mi4mAjfgw4JB1gQuoo5C8woWGXOcOjLgcgGSyfk1+tOwAogH4oSoO3NMkD9rSAjuqJFoTPih79VRYA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ja51C57l0rvDgdu5wgz7TN7nJlVAC/ErqOsndx5fCBqjQXbjq
	h0p55Ps84mpL4ijO4MXvPmFGVb0oQ43tL/Mnx5DiOWNn2ccpuD6XhuS+lQcyOQEc
X-Gm-Gg: AYBFou1xuX1A8V5r3ZQCYTRT5yjTCTskGbIXcXVxDxyseizxvMjlhgdCRPS7H9rPTsE
	gWldY9nuIWYpnKh+46LkAV3vt1nvGhh6twrkaMX14R2DsGqOalM+ndLelWklhX6UwOg8UF0p3NX
	SIhxuRfP+U2uC3IPb7JIbVMaP0bHsl2fBKLK5aJaxXmQJnOYLK7d736kM2LfBXxFfuQ40YdEHU7
	0vYUIZtirtJiB0dfPm3oxt5VUW2QDPbfAdeR9fcGvnXQkjzi58XhxajFqF+mltas9t9pJXDaN3m
	yUihp9zJbQgbXFDrsQZ+rGlVtsVG1/w/I9t6Dn1TngJHeSwfx4MpFxz0Kcrc++h1M5lza6wIiJT
	oiBkhAARbMx6UA91tGn9LFrtLMDQ4FGg9+ItPSqtf6hy+ioaR3rqVkkDGQoAciXDMkXhoRu89n4
	NC4HmQ8ryYQUK7r3/7buv08wX6Q6ue2NNAn7ZVSJCovmCHqJm76M0GxICPIqD42EUSbimpQvqVJ
	aXfpGaJeMAVM2av7oIV0rObo8X+7xoJRWiyO1toV7m6JosJALRPL6oIn2AsgIRlt0aIaYvmMVWM
	h4dLO6ALsr3OENdYgG+o6kuXciYO3FeCHqoxqX0MjStwUoPxYcjZXIXa5Ee0CUp0fQ/xAlWB2dE
	iSK5k/dncMKHg
X-Received: by 2002:a05:6820:a746:10b0:6c9:80d8:a1ea with SMTP id 006d021491bc7-71b394eff7dmr1499035eaf.39.1795161321473;
        Thu, 19 Nov 2026 23:55:21 -0800 (PST)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e5472sm1622067eaf.14.2026.11.19.23.55.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 23:55:21 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-48ed0b68895so486029fac.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 23:55:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH93x6hdIsVATWvJi3hgow+9D9FSpoweYlViiv8KTsOibb7B1tfSHmfKqg7yRNy6823NOyxSIIkpdwSlAc69wjzDQ==@vger.kernel.org
X-Received: by 2002:a05:6102:6c4:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d7393caab1mr683612137.13.1795160956421; Thu, 19 Nov 2026
 23:49:16 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795094688.git.geert+renesas@glider.be> <683b5b189409e5ee04100044fb615b01cb877f3d.1795094688.git.geert+renesas@glider.be>
 <20261119225017.15a7b5cc@kemnade.info>
In-Reply-To: <20261119225017.15a7b5cc@kemnade.info>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 08:49:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVbgGV_6yjOip4xT3YhBgaOveHzSRbw9e_cHen9NRZqmw@mail.gmail.com>
X-Gm-Features: Aa3M54rfGlA3UrmhLbFF7B0m1MfxoFvw1pyboKcP24dUngkkG_fWLkpDdrOnbn8
Message-ID: <CAMuHMdVbgGV_6yjOip4xT3YhBgaOveHzSRbw9e_cHen9NRZqmw@mail.gmail.com>
Subject: Re: [PATCH 5/6] [RFT] ARM: OMAP2+: Convert to dev_clk_get_from_provider()
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andyshrk@163.com>, Ulf Hansson <ulfh@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andreas,

On Thu, 19 Nov 2026 at 22:50, Andreas Kemnade <andreas@kemnade.info> wrote:
> On Thu, 19 Nov 2026 14:40:38 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> > OMAP2+ clock handling uses of_clk_get_from_provider() to obtain clocks
> > used for power management, so the latter show up as "deviceless" in the
> > consumer column of the clk_summary file in debugfs.
> >
> > Fix this by using dev_clk_get_from_provider() instead, letting us pass
> > the consumer device, too.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Compile-tested only.
> >
> > The first change is probably OK.  The second change may fail if anything
> > in the oh->od->pdev->dev chain is not available yet at this point.
>
> Test on OMAP3:

Thanks for testing!

> --- clk-old     2026-11-19 22:44:59.810807920 +0100
> +++ clk-new     2026-11-19 22:26:52.862531880 +0100
> @@ -1,17 +1,17 @@
>                                   enable  prepare  protect                                duty  hardware                            connection
>     clock                          count    count    count        rate   accuracy phase  cycle    enable   consumer                         id
>  ---------------------------------------------------------------------------------------------------------------------------------------------
> - oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      of_clk_get_from_provider
> + oscillator                          0       0        0        26000000    0          0     50000      Y   deviceless                      dev_clk_get_from_provider
>                                                                                                             deviceless                      no_connection_id
> - secure_32k_fck                      0       1        0        32768       0          0     50000      Y   deviceless                      of_clk_get_from_provider
> + secure_32k_fck                      0       1        0        32768       0          0     50000      Y   deviceless                      dev_clk_get_from_provider
>                                                                                                             deviceless                      no_connection_id
> -    wdt1_fck                         0       0        0        32768       0          0     50000      Y      deviceless                      of_clk_get_from_provider
> +    wdt1_fck                         0       0        0        32768       0          0     50000      Y      deviceless                      dev_clk_get_from_provider
>                                                                                                                deviceless                      no_connection_id
>      gpt12_fck                        0       1        0        32768       0          0     50000      Y      48304000.timer                  fck
>                                                                                                                48304000.target-module          fck
> -                                                                                                              deviceless                      of_clk_get_from_provider
> +                                                                                                              deviceless                      dev_clk_get_from_provider
>                                                                                                                deviceless                      no_connection_id
> - dummy_ck                            0       0        0        0           0          0     50000      Y   deviceless                      of_clk_get_from_provider
> + dummy_ck                            0       0        0        0           0          0     50000      Y   deviceless                      dev_clk_get_from_provider
>                                                                                                             deviceless                      no_connection_id
>   mcbsp_clks                          0       5        0        0           0          0     50000      Y   deviceless                      mcbsp_clks
>                                                                                                             deviceless                      mcbsp_clks

Hmm, so the passed device is always NULL, and thus there is no point
in making the change.
Do you know if these come from the first or second change in my patch
(I guess the second)?

Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
