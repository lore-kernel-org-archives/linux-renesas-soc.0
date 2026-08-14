Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D746D573
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 12:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710983; cv=none; b=lMjo6o/Xrc2T9/vbYB9e8o//azn/U+F9RsI8FTYxcsBvFYVeIYd95JpHZXrjqAL9b7+HEK8JNpIULhhMqbqqM6LhEHUVBZlsQFs8ZcLw3meV0sM0KWrN0cmBfvrj40UWgOteqvLRQmHeNa+Am7REtCelm6NyxpD5nKuPkRTKDK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710983; c=relaxed/simple;
	bh=8efzPxRZ2l68YRalZ78BD8G3POr3O2MQSnQiXgJ1Q+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fr0YvOgFIhkvJkgQRslasAH3CxuAWVNzGS1/By1XXSrGQfIuJFJG5YaIQq2OUAyy4yvhMFD10b+CEVF/HQFcZEcKPZDJGuzfpL4wwJWdmYkF90HA/HnHDqPkjwj6eHDBQr3D1+UEVD82y00WuIhnrBPj20CPR5bME7k8mMN4rcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a17cb94b26so1560392a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710978; x=1787315778;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ugCyvrIP+Wubz4GxUtXuzhWfYKwKhvwY8k21XzI9sZw=;
        b=oHnvReh237YxqFKAM725QJ2ENweKZCL2zxh3l1TS7UEvGfeam18DsOiWLkdOFk/IC2
         RND6VOLO0igByixaT+C6b1jZj0iCBCe6DQg3W1xVXXvS7GRvfckVZcbsye+2dyQ9uNrD
         WXtJQPnVCkqbHLwZuzmHb0WYMSaFaIOZIu12use0zTWPlID+37Zx+5wh2GKQghejTns+
         3vnvkPUTvaSKSzyXqBKkjhDsmphN643I7GtCcH/SCwIVQs+G2JbqSZXgK5UEB5Ft7xrd
         OWcLAgN2nD6VFZizgSHKMEOngLOX4XfYrfM6zDGHuFEmCHq1DanVmBUm0pRad0czGowZ
         v3IA==
X-Forwarded-Encrypted: i=1; AHgh+RohmZvZghzCE71F7wNNEyvoPHuOlXV9dlaS7aB3TfbmiDTeWIM3OcINSwIKE7kkAwovJ48N64KJNvjKaIJKq+0pHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn2h1p6fphnWmIvX1rtuZV8P8VcZ7qksMk6r4PRKQGjz6fWNOG
	Cb5kgKpyiq+2TyIHmAKzAlf/5zWtOUzhFd4d+6qIP0vlA178GM4u1nvmVGRPdVzZxL8=
X-Gm-Gg: AR+sD10/+QBwRzf7k8PCHWKrF5IfbeO0Q8xsKlMbTMGRYPVEwqN6p+AlDmMIZIEHESo
	q4KU0B13nlqvpAnY1uIYoqyQ0Iiy9hw6z4vQqos611kIgBOkNGBiYzhmOhuOOr3U6bTM+fEyU2p
	WfNAbR5MaEhMGXtGcl4+j7YLrNoV7XC34XWXeJWmA6h11eFmy0bDJc+IDRDM8KraXIR5E5usazC
	+TQwKbmVZRO+GPdqteLScp2G26FH8ATswxCu/NIU55x/dQnreHKsL8iXOOueU58teVtXmPFtQTN
	OzHWRnkuNsF/hfB4+0PaCfMQ5QJfk12xzgCVv/An61iQ8D35pjeM5s3ZVKyFsb/HDmvG9108RvX
	ZVnR3APSzva7LdH/4zIy1utNOF9vL+8R+LlInmJBdrlMmdAPuxmJ9eXQ6lgSJTexMwqtUkuOGx1
	DOUkzTf3a4joPusbG/cRbLRTjD2qQxCIJ3tD43X+JOyhoY3/AoNTB5UuOYccQqRt2hu1a3ivX5a
	LBq6JwBGYPtnv5k3aoPQAhfhQ==
X-Received: by 2002:a05:6402:11d4:b0:6a3:8446:c55d with SMTP id 4fb4d7f45d1cf-6a38a8d63e7mr2660531a12.3.1786710978242;
        Fri, 14 Aug 2026 05:36:18 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38d79e42csm643605a12.30.2026.08.14.05.36.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:36:15 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c197eaaab00so186461066b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:36:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr9e7BurNKGjCJJyGCmMH5KB5l7NXzNKyfxcJtOVJFxiN2bK3ngmZL5UrLDq0OYmVPHGrfVWxuFjRtR409M6pv69w==@vger.kernel.org
X-Received: by 2002:a17:907:5cd:b0:c16:6608:bff7 with SMTP id
 a640c23a62f3a-c212a27f6e3mr253512166b.30.1786710974960; Fri, 14 Aug 2026
 05:36:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:36:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbg3cT4onaxj8Bz+MZyW+WBHG-q6FU7hSKQga2yXDi5g@mail.gmail.com>
X-Gm-Features: AUfX_mzfh77Nzt9tjGmsNggfjKDPmcxXAlMDwoDfWGxpefmrlPGM4_p3ooVNFck
Message-ID: <CAMuHMdWbg3cT4onaxj8Bz+MZyW+WBHG-q6FU7hSKQga2yXDi5g@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] clk: renesas: r9a08g046: Add MIPI DSI and LCDC
 clock/reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for the MIPI DSI and LCDC peripherals on the
> RZ/G3L (R9A08G046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Replaced M2_DIV7->.m2_div7 as it is internal clock
>  * Added DEF_G3L_LVDS_DIV for fixed factor clock with 4:7 duty cycle.
>  * Prefix mipi_ added for all DSI clks.
>  * Fixed commit header /r9a08g046-cpg/r9a08g046/
>  * Sorted DSI entries.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
