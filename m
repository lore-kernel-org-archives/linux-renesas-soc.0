Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230E73F12E0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660820; cv=none; b=TVpuT0F0yA/BWdmbb0pm8rTvbNrIZFkFakKZksTwpnfJ/p+Ht+iICLIex5Cnl1FsHU6AB2Nt8roYjnI40NS7Gbjrl6qW1TVedhW731FsfgSgQolRqbXgfnH/0oGGT5wgGWNGGfxzdFMs9yaXSfaWCtmnYpVkHgzh6NcW8Ssa4Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660820; c=relaxed/simple;
	bh=gxH8SjRD1UIdTzPbcf/H8o8DZ5xZ4KITTBXh+NTJ9ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLHwD7FJvqGp2u5QcVEYq+9P8mjMQL2sL+Hdsq1HVVS5qxtSrxf9z19Z3oADN/d4sYqTSyuku7XnpN247SrAmg248kU1UR1OXrTeaO0W15ZDlZ+6X6wRT6CX9DUWdcbBK/cnrcid2+3tJsZeiCunvMa2MBTbkUSC1HPDK1d3FEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so3734723e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660818; x=1788265618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3bNYZKHP963OmdqbLfjn2seFzOgtwyksbPN0UTH7ftQ=;
        b=OY8kqDvvdK2xtS0vHfdPxzKi+d15CC/Ibs+Dbie/UB8yZORcouNTiGVZrFqGjGl5sc
         cdiO4p86dPpBkWaUK63ielI3FBl7f1SKL41cqmdwYGwITjXShU2Al3FWJLD17l1F1vI6
         CnXhq4w7ljoAmETYXqpr+YS0wotSkNmy5CfstQu9Ppw9p3HN5KadjypXbsKZuBPZn1vU
         9/FaRLgPRraoHjkJZKQ6OPesRdMIwSzfA1gQjTU3eC4luvRHr/5tvaM1+ZZuvT4uMkRD
         5Wn3OJTw4MNmOCiBHaxbLJ00OE1f2at0qfav4rFAdDewynZb005XetcMaxigYJmjKhPo
         ACTw==
X-Forwarded-Encrypted: i=1; AHgh+RpkCIuE7p5v8n5P0oHdLp8PW+gMXKjtChqVKqJXFEeGQSiK/pTEcv158+GmKQMhhIPJtXGGg9yDW+WBWb2odKh/nQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kgLKFSmJ4exO+10y0XoZxmRGH3lsffjqeFPtZYM9vOph3l3wFu
	rRTjwCqQc87lgGpWEJDNkiyZJs0q+qyDMW6QmtH3kE7We4rim7VpXrzmC2kov5LB3uA=
X-Gm-Gg: AR+sD10TXLHy+sAPF1noqpYFoSNdjwHwwyPB4yx+IRWTXStlZgcynked/pUL+pxj+Yz
	zwGGnPpCvaxer5U8t6G04IK8uUVXyBeHZfOjcXVSYU0rnlIFue/e35ci/Oy/7IlZ+8Tr80rBGGD
	Mdlsn59jR65W4T8VtzDMBmDMYy6c+xoi6q3sSs4W+GvsNhRuB7VF9CPlGv5NpdZEZvF2HleAwr+
	6uLjECvzT9zu5T445JbtkPf9IFHAVsQZrLhvLrhsqQKyoPRKuUL9qrd/EM3XdUiL4usz+GEEfTb
	NJ1wwJN8VGNEZqdAFGSTPJRcYVubt6nIaONd9G3zAhqOJ3tlyYcAK0+sJ/7xpv438geXRHOC4vK
	0iNG0qv29PTPR0t41xP7xMAitbpfPgSTh0GeNjIGoZpfRJ+lkYFOzZ5hWXkHjskD8Lk5xp6mNOB
	nNCpTyOQHpdgRtR0BCV0p8ZMy51ZYkvR8jPPCJMAydsyPCjgvBAlxFGvbawIrYnxhQQ0O7ypAax
	GuYTtkTijt92fbe8NB2XtCbrg==
X-Received: by 2002:a05:6122:4688:b0:5bd:73b5:6d25 with SMTP id 71dfb90a1353d-5c642e2bee3mr2188586e0c.5.1787660818030;
        Tue, 25 Aug 2026 05:26:58 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623eb64b2sm5886609e0c.11.2026.08.25.05.26.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:26:57 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-73720e58dafso2527808137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:26:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqL/qppL7t8HR+yoE0zj0bl4a7J/xUCnnmZl2j1ySAB5VV2kW6g8LkbKX6Q2Iqt9oQjFuCJtZFSEPJfxHOREcTW5A==@vger.kernel.org
X-Received: by 2002:a05:6102:e14:b0:77d:a23d:ae70 with SMTP id
 ada2fe7eead31-77fe9814c27mr2237403137.14.1787660817048; Tue, 25 Aug 2026
 05:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:26:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtApMoHKg7v2CqNTQy4EF0sEzmSfQimGySgTcYjMwXEQ@mail.gmail.com>
X-Gm-Features: AcwNN1U4dCP-EqOtN5skyICgGBt3GttjfY4cB3WPPEIKKuOj9_pFM74mnwgkrag
Message-ID: <CAMuHMdUtApMoHKg7v2CqNTQy4EF0sEzmSfQimGySgTcYjMwXEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] clk: renesas: r9a09g077: Register SYSC regmap
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Register a syscon regmap for the System Controller (SYSC) integrated into
> the RZ/T2H and RZ/N2H CPG block.
>
> Unlike traditional Renesas CPG/MSSR implementations, the RZ/T2H and RZ/N2H
> CPG block also integrates the SYSC, which provides low-power management,
> clock monitoring, write protection and peripheral configuration registers
> shared by multiple drivers.
>
> Implement the RZ/T2H-specific .post_init() callback to create and register
> a syscon regmap covering the SYSC register space using the CPG device node.
> For backward compatibility, return without registering the regmap when the
> mapped resources correspond to older Device Trees that expose only the
> legacy 64 KiB CPG register window.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Dropped RZT2H_SYSC_BASE macro
> - Added array of base pointers to the r9a09g077_sysc_reg struct to
>   support multiple SYSC regions
> - Merged r9a09g077_writeable_readable_sysc0 and
>   r9a09g077_writeable_readable_sysc1 into a single function
>   that checks the SYSC block and offset to determine if the register is
>   readable/writable.
> - Added RZT2H_CPG_REG_SIZE macro
> - Updated r9a09g077_post_init() to call of_address_to_resource() to check
>   the size of the mapped CPG register regions
> - Dropped changes from cpg_mssr_common_init

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
