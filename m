Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A905466AE6
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Aug 2026 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105179; cv=none; b=HrF4zAkc8kDwGsS4mIJ8TjqKq+Ui7ATL5Gr2fn6yTYGSz6ogzwoH05j/mv/+juKcpgb5JeYJrHtka8SK5ZGvFhFq7XJ7AUshf/lgmMWutSX5dvCyUAersrrscgl+BTImjpxHukSSOnxOs0V68/R3+aJc6azAjokvVnZozFEZceQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105179; c=relaxed/simple;
	bh=5pGKnmoICNLpXe4M7LHt8EGcgiSmeRq0818OzQw8gG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qscD04j+JyMjxfSvQUWAjEk8BYr9NkPfzASEH9uhBdpSytrWm1Dzdw7d8szxDAMHebVTUDZHfk5evgJTLKYEbUeF8XI+A4yP0kf0BQKGfJvjPeY/7BUA+4s4C4HOOBQ72rsXSyZIhI/kQL8PbIRyWQEuki8Ag3iJGxhaDlNlin8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso1416053241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 05:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786105168; x=1786709968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DYxpa8lmyse0NqXbYFiTDGZv5gvprqKNCKipSvH+Cko=;
        b=SC7vI/JfFiFWfp7/85/qefPmL9wsUsx0O/VnbtXEfU7DVCd21/I2QWkXLaQMhqrw8P
         rAq8JuDoVGE0yOAoT2E/Sr5BaWLsUZdBXFeulgBpI7qmZMhD/S3+pPqz3+8CueRPuAP2
         ZOz5eK7Xi9jKm88cItX0oBQF9tbORLuAe3qypcORHaolQaKFFdv8x4/eNnlSAeDtUcwZ
         rKJpGv4QG0ojhlIaG1T0mEk3H0y4jIK683T1JX+kFRzOu7wz+HJLWa/AZnin2dJzpiMY
         pahSBgr85Hv8k4kkXcc9IIeQcQfFLqN6HBVI1zUo6YINu3P7s3/36i14EkXtrb1+JfLy
         qhrg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2LSD3j5IpiY1DpfaqSe2K1W8nT4mhAmvNkamb/6lvy2hr3CvxpkauIPyack34DuHIpuGRnkpgqvRr0q4pT28iag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy70ptr/1bIk0idBb+Df45TxDcGmJ2w5Ft5/pvxQlH4kkEzZx1J
	otsLvnZwHQ7fxrU6WMBm6ILr1Et/PbuivUHKeeHsxjX872ShnqzbQ1fiRwYaf90i
X-Gm-Gg: AR+sD12pGwRMQ7nGhY3IVsXSGWXm041cF9ovmZvUjWf5AuGbhaato05+YibaLTDJl64
	IGfTFAbWZxSJRDQwSGT2Tay4c97Zl2xZGWtjzxHRdJ/DJBgxeI9JKeWqEGm32atCc33Zprq91Nl
	pp9GV0PP77tmVHYf1SxjNSp11rZp7IihRb1NjZSzS4TNUzjPLJ/D0SHhw/koErbYrIIjdLTQqx1
	XUO1FCdILwHeHdAtXwxL9aDubNlnJsx17mMf2CVqgBSqevsY1JXZJtLjuD0KHlyMQ8evzF0xTtP
	Gd2PhUnTSTdiyq9ObUUQOS6eadf3AGfrJWP5GkDPbvlJJw4VIwokJKBDHc+s4dDxfS3RdKdeYbe
	gOgA2yscxTfc6UcNiG6yCSlmyBjmQg54N+YcaYCW5jSTzNASurr1Swo97Wi4zhdtWHT5K9KPMUB
	AJpaZrJ4UKV/+BXFBeDLzZvvN34hDMiu3UGQ2rD5lAN/dZqBDRnG8XfvyPPMIsf736C4CMWpU4O
	1ww1DJuw4hzMUGOnqg/xsa9L+s2NxgYCekz
X-Received: by 2002:a05:6102:3a08:b0:745:8031:8293 with SMTP id ada2fe7eead31-762ae3737cemr1620067137.1.1786105168611;
        Fri, 07 Aug 2026 05:19:28 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76400dfe036sm743736137.8.2026.08.07.05.19.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 05:19:27 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-74ae4c75b20so1211919137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2026 05:19:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqKQky7NT+XaDBixgN+6ZfbY1vEv+JoP9IsafQp5CV/kD2HCjFv4aG4Cqjd+LSnwFZQhyQ/6o8adWkFb5ViQFs9Ig==@vger.kernel.org
X-Received: by 2002:a05:6102:36c8:b0:744:e685:d7b0 with SMTP id
 ada2fe7eead31-7623c68ece0mr1223701137.8.1786105165460; Fri, 07 Aug 2026
 05:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807100320.121108-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260807100320.121108-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Aug 2026 14:19:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGfR58UodRRjr1=vzsxLBiNsNkiwu8A7FNi-dXVSMH+Q@mail.gmail.com>
X-Gm-Features: AUfX_mw1-JjmSggQSkFoEu3CKaZTE6znw8ZDrIHmcv8xsq03LStv5_YQM6l8QUg
Message-ID: <CAMuHMdVGfR58UodRRjr1=vzsxLBiNsNkiwu8A7FNi-dXVSMH+Q@mail.gmail.com>
Subject: Re: [PATCH] PM / devfreq: Convert to seq_buf
To: Biju <biju.das.au@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 7 Aug 2026 at 12:03, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The devfreq transition table sysfs attribute (trans_stat_show()) builds
> its output using manual sysfs_emit_at() calls with hand-rolled length
> tracking and PAGE_SIZE bounds checks scattered throughout the loops.
>
> On SoCs with large frequency tables, such as Renesas RZ/G3L, the
> resulting table can exceed PAGE_SIZE. In that case the function bails
> out entirely and returns -EFBIG, logging:
>
>   devfreq transition table exceeds PAGE_SIZE. Disabling
>
> which makes the attribute completely unusable on affected platforms.
>
> Convert trans_stat_show() to use struct seq_buf instead. seq_buf_printf()
> tracks the buffer position and handles overflow internally, removing the
> need for manual length checks before every write. If the table still
> overflows PAGE_SIZE, truncate the output to PAGE_SIZE - 1, NUL-terminate
> it, and log a rate-limited warning rather than failing the read outright,
> so the attribute still returns a usable (if truncated) table instead of
> nothing.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c

> @@ -1661,9 +1662,10 @@ static ssize_t trans_stat_show(struct device *dev,

> +       /*
> +        * If an overflow occurs, seq_buf_used() can return a value greater
> +        * than PAGE_SIZE. Clamp the return length to PAGE_SIZE - 1 and
> +        * ensure a null-terminator is written to prevent the sysfs
> +        * "bad count" or out-of-bounds warning.
> +        */
> +       if (seq_buf_has_overflowed(&s)) {
> +               pr_warn_ratelimited("devfreq transition table truncated due to PAGE_SIZE limit\n");
> +               len = PAGE_SIZE - 1;
> +               buf[len] = '\0';

So shouldn't you use seq_file instead of seq_buf, to lift this limitation?
devfreq_summary_show() already uses that.

>         }
>
>         return len;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
