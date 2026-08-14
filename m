Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DC5466B15
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 12:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710939; cv=none; b=c7nn8Ub4LqaZq+EodWCHHcA/JIRc1XVDW/1chgMi6v0ULYkNwKqJwWeF00NFxIk9MPDjk6pOU/jm4FsKPbxOS7Cx+LKL19hIZXnwyDlfGVeD5cazD0gpdDRrOHSR+dC62wb0v+BQUZp9X1cBzFnmW8dGOm7V/KHO/3XQJc7ZteM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710939; c=relaxed/simple;
	bh=mriR7x08gkRw7T+Z1DsGxxWSZ3VG/5RiGgPdQbqyaEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwSZM+E/WMA4n3NNN4+AFAPR5owPk5gLn9W31W1t7I7adFtYNXq+2pLpFvUb/pjkuegQMuTMJaVzvvahR4DRgzpMy3RPN4m/sk+fSOdB/3DDqZlky1X98NNqVferC5u6HHWYSSAnBZeuK+lZTi6wHxv/ebE4DWXVO7JrJ6LQPS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso1378993a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710936; x=1787315736;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xBz0qWkjPoeHXwmwUAFk9AMptjW62XkJH6HIJQAVVZc=;
        b=ipbzNkOrUyGIRgVfbkyvUeHwRevu0LfFn2D8M9dkaaW5mRj9JYamQwb/ng0j5E+PV9
         TWXYGn9pGti1S85Xa8Et90pSd+mtFISUf5l0BtqE7ZOI3ag/4hnqkNzyO41lIp5S9Osu
         1X3lCCFyqm0vqxG9gc+DW7GgbvYlqClu+5U3lXHvvu+WV+WGAhPJALnG0pggk6FuicJb
         4SpQpCA29/MVom3z/TdRWl+TVRwkLWHbLPIxyw24J1dL6gdcpUqLLz9x8LXYAgwQua+S
         CnqswxIngWgkI66fyYY+S3nnUW4TYDpaUofHkrh0XBhRfzO2sEOKwJXIk5lx46z9BuQb
         Z15A==
X-Forwarded-Encrypted: i=1; AHgh+Rr28ku/KA+9I6ScQgITJegzwHDvMX/+VTQSoXAxOQdsmCViWT6Xq6y4EKFozaaWWoRb+8RBnpLl3FBLMlrQTdYFog==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ/C63TzFBzMnil5vSD1QczRXO/zU7lKQCEYJbq7WvIaak9pLl
	36Lnuz6julFPC8Ujax2UZ+aEgTtHIiyXWvSnu3jejrLW0eA+Kj6yVyjt/0/2Y5OxdtI=
X-Gm-Gg: AR+sD10obZuGSlkcOtYwyD+K0honwbIqMVOALr/lOjL4ybiE19pAOIlP7SnTOk4ih0Z
	zqo3dlNIJxFTQEiWrw6MkASBqp2UBKtzQM2GS/C6NVlDezdb8TfVhn6s3Lhuiz3Ovy8tDEnbYad
	/f0UJuboqZ/lR1frJx/CEu2EKnsTemsmtFNuq4qLmXmUo+zwGtl2DitbwVcMU7DgP5USD5R7sz/
	dQvRelNNvQ/f7B2zKK6dVAA9BnjHl/UbMs7ZwpS28wfOIce8du/uNs6xZ3+qBJ+3cxPXWsnIu5z
	mAlKCQi9Wo/LIWrAxo53bCy66tzLSwk6lxOCAljKm459BwIsemm57D6oQTbUa6sGdOoK3efxld3
	ArpN98HNZNQSSa6I5dOpKTYxIiRUEl2MC2nsn0JI6wI8K4AIRPhOoEAKZrU2uY7hmjCjMa66+lW
	FKBiS9gk+SnjaBW19bcc5d1R9ozO30xpxmB3tSvWbBXm5NYe0P4tnxtgB567IWd3UaXglcR+bXZ
	JR4SyLlSQgTyuCCOJbASQfvbQ==
X-Received: by 2002:a17:906:99cb:b0:c15:dcc6:d06d with SMTP id a640c23a62f3a-c212993ef7emr244850866b.0.1786710935902;
        Fri, 14 Aug 2026 05:35:35 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c212378da49sm102239766b.32.2026.08.14.05.35.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:35:35 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so965242a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:35:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpQAYmXylX26kgOG7OniYs4k+/NDIiyuJmNIvL52vnWwpBTun4c1lXVN7pbtZ/gZ1xuCHg4CVxeC1AXT3tX0iTbeQ==@vger.kernel.org
X-Received: by 2002:a05:6402:2499:b0:6a0:9468:a025 with SMTP id
 4fb4d7f45d1cf-6a38a987f5emr2620460a12.15.1786710934803; Fri, 14 Aug 2026
 05:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:35:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWRNj1EyHmc4qMoLU=3698U6J9RaXe5KjjKbOZU6GXsvg@mail.gmail.com>
X-Gm-Features: AUfX_mzr39GriWtj-uBW2z5GWyYiRtWdDL-JXFwCBGDDES7ZpttXY5iLcyqCPI4
Message-ID: <CAMuHMdWRNj1EyHmc4qMoLU=3698U6J9RaXe5KjjKbOZU6GXsvg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
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
> Add support for RZ/G3L DSI mux that supports 2 duty cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped rzg3l_cpg_dsi_smux_get_duty_cycle().
>  * Updated Mux flags with CLK_DUTY_CYCLE_PARENT and
>    CLK_SET_RATE_NO_REPARENT
>  * Determine rate now forward to clk_mux_ops.determine_rate().
>  * Dropped the duty cycle macros.
>  * Dropped struct rzg3l_dsi_mux_clk and to_plldsi_clk_mux.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
