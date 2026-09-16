Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2143E9C17
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567298; cv=none; b=Yc6v4dOHy/Av39bl4wh5i4SmwTGeLgwKeNCHkrck60Ol3jIQqf1N7l8H20i2qR+j/aTum37XAfaK8RfFValTwKsyf7OBjZvHes3DCTcDlGsUr6KCDZw+DA2fZ83RYArBObphTT2ui8FLUDTIUDfp7JnvUKzL3fafuDLr0UNOeyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567298; c=relaxed/simple;
	bh=LOZA1HywhSNmDK1UoZyyxVq3wzA5V9QKlib/CveDAJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOYYhxe2Z6qcQCcx1LQSq4UqN5IGPMIyPsX+iweDl0lvQ+2NUkIFXWgiWqE/prVXgyNrinaW+v8gguJXSr/JILnOCTz4cK9abUxIespWKzV+Y9QpP3Tc5aWPRaJxW9n+W26ki4FfJdA3kRJ5RdThyCOFb1R/ctc9xdUl4TeRFfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c294ad260fdso316522566b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 07:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567295; x=1790172095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YB5wJdJp7iKTK9TemjyuyLSregIs6jY3r0wL3mFG0oc=;
        b=NyAvxKipXrBBFw5LlY0VzLm3PQtYYUtOf81uJkbliZ/aIa3M03ImwoAPG4x+c3BTvu
         IDFIK04xLixemnn/xring4J8DFQUtzqqdZPL4zFL8gO2I5M5assU4wNEtXAQU5RuTgYu
         KiJnuQ2bTcmGrg1czv2LzHVQ7diXZGkoLBpe4wrQKy3FRZeHI3puRy3oBhgEHkuD0x8c
         3+zCn7npLZJ4o9k5cMImN7iqWGvNEH06E/iMAWyzzYigdDL1aBJpUPJ37sWKOR51MX7R
         4WuWTT0IoGFLTQg3e5QLR5x6/MaKLMD+7p9cqhe0kIWTMN9aRpkDo8roDPxwa7grhB8c
         WxuQ==
X-Gm-Message-State: AFuF++l/xOD5Qs8hlc7caDnqOkveL/y/1JqYDr5dUHtMSH/VqyIanfBO
	jdmdEWIX58nljpGXi/+8IiOCJpwtGQ9FAsganQV1VRQkIBN5BnCHOHkK3lXbgagXGzs=
X-Gm-Gg: AYBFou0jQMQWF0FPxoMhm544S//dg1BckYJc/WxnWldkgqrogCzbAGX629PkPpNHNyY
	LFo7hLQRksPLA3udpicrlhguRaQA2nsOnXHoIcs0ZcHvirYTcEL6wjHGEGDzUQdUb3kI6BOULC3
	4YqPM38afMVOaIqTqkaRi778549bC6gish5QhsACBYoL8Od2kpGd5L4HbHxW4/3i7BQgh36hhWP
	aX81Z1pbNxOeuLK/Tbs/H4E3d6PnwaTV/1yHriNroy7cimtFWRS0JzL8FlCze/Ok+JqkQ6bxfH1
	m3D7fTXzBO8qHzvgQ//NlxCx5TnqETc+9N7/3VAWgSPf/s7iBJD3UmLm3XWnjK/PACuik+g4jz9
	KvI1N7zZ/TtJdwy5fbWtdOtmxY2Xlllsh/6W97MBqaCgiM46GZ2l6kpwxC7IwOZjMW8kzF/U3GR
	dFN8k+442NC3NuwVrQCKukYOPciLO2B/4wmO/GrGBnjc1EONwEUGmBL9zkEmGco68DQo/NzhTng
	ctnXvhHxzTzz7w5e2a1SAB8KhT9XUseHZ3E
X-Received: by 2002:a17:906:9c82:b0:c25:5a26:3787 with SMTP id a640c23a62f3a-c29c89688b5mr588452466b.8.1789567294021;
        Wed, 16 Sep 2026 07:01:34 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de453f04sm146183266b.15.2026.09.16.07.01.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:01:33 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so2447910a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 07:01:33 -0700 (PDT)
X-Received: by 2002:a17:907:9452:b0:c25:f7dc:2dc with SMTP id
 a640c23a62f3a-c29c8bf56d3mr614247266b.29.1789567293068; Wed, 16 Sep 2026
 07:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912191442.99453-1-wsa+renesas@sang-engineering.com> <20260912191442.99453-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260912191442.99453-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 16:01:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
X-Gm-Features: AcwNN1UfyJCOGSEjRjtYLZ4YGwDs-hH1sGh2EPXUqWFwEQpikBVlS7z89oufr3M
Message-ID: <CAMuHMdVbYaUXiW11j+LKSuSaLLF2PRR2kAFsaj-ZGsx7nNjK-w@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] hwspinlock: add list of locks to debugfs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Sat, 12 Sept 2026 at 21:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> To help debugging, offer a list of registered hwspinlocks in debugfs. It
> will also print the responsible hwspinlock_device and if the spinlock is
> currently used. It does not show if the lock is taken because of
> side-effects. Often, reading a lock means actually taking it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/hwspinlock/hwspinlock_core.c
> +++ b/drivers/hwspinlock/hwspinlock_core.c
> @@ -860,5 +862,70 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_hwspin_lock_request_specific);
>
> +#ifdef CONFIG_DEBUG_FS
> +static void *hwspin_lock_seq_start(struct seq_file *s, loff_t *ppos)
> +{
> +       unsigned long index = *ppos;
> +       struct hwspinlock *hwlock;
> +
> +       rcu_read_lock();
> +       hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
> +       *ppos = index;
> +
> +       return hwlock;
> +}
> +
> +static void *hwspin_lock_seq_next(struct seq_file *s, void *v, loff_t *ppos)
> +{
> +       /* Increase ppos here to avoid endless loops. Don't use xa_find_after() */

Do you mean xa_find_after() may loop forever?

> +       unsigned long index = *ppos + 1;
> +       struct hwspinlock *hwlock;
> +
> +       hwlock = xa_find(&hwspinlocks, &index, ULONG_MAX, XA_PRESENT);
> +       *ppos = index;
> +
> +       return hwlock;
> +}

> +static int hwspin_lock_seq_show(struct seq_file *s, void *v)
> +{
> +       struct hwspinlock *hwlock = v;
> +       bool unused = xa_get_mark(&hwspinlocks, s->index, HWSPINLOCK_UNUSED);
> +
> +       seq_printf(s, "%4llu:\t%s\t%s\n", s->index, unused ? "free" : "in use",

For easier parsing the output, you may want to use a string without
spaces, e.g. "busy", "active", ...

> +                  dev_name(hwlock->bank->dev));
> +       return 0;
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
