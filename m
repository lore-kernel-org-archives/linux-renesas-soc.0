Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA80113DDAE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769425589; cv=none; b=P/O3e662H7qW9rv1bFVB6yuXlrn2uk+Wh2fopFJjFdWFvni+QCXGoShXcbOFR9EciGzNYTN12cK+rg7HCCirZOsdcGm0Uzl2FWe5A09qVQtgLNfevlJqF+5a6dVK5OIlBa+ccTOIfKwl7P+PJ45H0o+vJNPSufBWcFiYQqkFahI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769425589; c=relaxed/simple;
	bh=2H0McNSW14YeB8QNJBi9kKZne48lu2V8yMUat775eL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3RPdo06FhxL6TSDHf5PBy6BlkLh0rpZ7SqS5RbkJBbOD03Vzac9guHMpokpSxNxavF/j/KWNBjnrjQDaOfyWCz622Vp2bpE5OkZUNmgOr+UVMkZXmbrhk3rUId0XSG8mo829N4sZxRYw9Dp09FTvLMVMwQ2Pcw1TZpiLsrHAJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-563610de035so4173554e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 03:06:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425587; x=1770030387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aS98Qbf9sAOaU61dqPi/K2l5V6UxS+EUsC0EMiIZcM=;
        b=KadeZe6klwEBFAiT4IfEn7bzLCuSbgkOOlPwdOJqmOa1IchCMYNw6rQgkVE0DmXBE6
         XgLTEUSzQvu5ATbVyaMD+Rp8RP+uDwaKQ7DcNiyqJtO4QlD9p9UibxC3o9XpAzNfleSV
         s1ikMp7OOxJf84b85SCPpXrXjfkP5VVjbLCVQOTDC/ot6zY5QczjS5M0/RXBArwbfxfr
         olj8PQjnPNltDqFyer3Yy9ofEeelPwIms1p+TC3qrjwI13pItts8vbsymExd3Tm6ejF3
         BqNyrbu6JKy4cU1fPSrFkkxG2GcDecF0uN2gQvErYDmvGO8aYA4NCYw+H2PZ+ehV0UYJ
         GSJg==
X-Forwarded-Encrypted: i=1; AJvYcCUBpV/H1pml994Pn8TwCheltRWrXQPmksVphMbDRAWz+9JT3o9171BOEkL9vUTSMxtSW55J6f9PTnUrDT4+YqRjdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kIgDfW5+X9gAmmpE7QHDBxRcIqIPa2ym6Y1yri0hPy2d7ZMN
	Mok9ionAxeTEMVt4SjnVyjPmDrMILzarw+PDi0vfQxewR1CCjIv/ljZBB9DefjlX
X-Gm-Gg: AZuq6aK9nhomvxJct5Kv+v41PwIX+qJJ68rf1eQXlTGfjfuCOnkgxZpimUP6pec394i
	Wz21LGpbZz0X8N6/fjesRLSf3Ez1PWlmPXX03s+yjTZAKD7iLuLrP5HDVOY7B74exP8TIh4rT+A
	oBGCF9xkzFH9IEqQhG+WVWfeyimj6+S8/F3caadpEfJaAHTJHUUDvk34OQEaolFsb2oThrOqXYZ
	Uu4hQvLjFp/68r+pkyD3e0RCwGSZHzitjfk4HaBiT8oV6NGhEbgmeQ2j/ftVa5dE1JGRAqiy+KT
	LmZzDQuKxMnDlKBcF7FXECigWGeRCND621k0shb6c7kMjTa11tnJqXy//aeTd5vYKUyyYwfWxth
	2CbjX/E55+VkAImVxygtoufrUtJrhK6rTuvCN29Ozr/SDk5hmK11HwhnDQK58zhYlq8uJPttKP0
	ZxDnQTyv4KfdMRWu6xkzLFCzGgNqGaHoZY8wF5u/xQezTho84W
X-Received: by 2002:a05:6122:29c9:b0:55f:c2cc:50ac with SMTP id 71dfb90a1353d-5665c9ee939mr872095e0c.14.1769425586764;
        Mon, 26 Jan 2026 03:06:26 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fa634cesm1589859e0c.3.2026.01.26.03.06.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 03:06:26 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9413e5ee53eso3180207241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 03:06:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbh7CHXbwBKLa5Kv+7BXD4uBD/fbyrDo2H3WZrKxJTDRsBy8mvBu0HE/s/e0CA7CbjUBEXrVfM8IjtSIz4HJCJNQ==@vger.kernel.org
X-Received: by 2002:a05:6102:953:b0:5ef:a8da:8b26 with SMTP id
 ada2fe7eead31-5f576492b87mr1267237137.27.1769425586050; Mon, 26 Jan 2026
 03:06:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121232657.155281-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260121232657.155281-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 12:06:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVa5_Ad9fssBqQkM2MYevwebowmNZbFJ64AXirn0KfrRA@mail.gmail.com>
X-Gm-Features: AZwV_Qj5vhAcK_cpdHEhBGKru4FfHXAD4S81A5Q270vbDRN7RD5_nDM_1mnBenA
Message-ID: <CAMuHMdVa5_Ad9fssBqQkM2MYevwebowmNZbFJ64AXirn0KfrRA@mail.gmail.com>
Subject: Re: [PATCH v3] clk: rs9: Reserve 8 struct clk_hw slots for for 9FGV0841
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, stable@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Jan 2026 at 00:27, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The 9FGV0841 has 8 outputs and registers 8 struct clk_hw, make sure
> there are 8 slots for those newly registered clk_hw pointers, else
> there is going to be out of bounds write when pointers 4..7 are set
> into struct rs9_driver_data .clk_dif[4..7] field.
>
> Since there are other structure members past this struct clk_hw
> pointer array, writing to .clk_dif[4..7] fields corrupts both
> the struct rs9_driver_data content and data around it, sometimes
> without crashing the kernel. However, the kernel does surely
> crash when the driver is unbound or during suspend.
>
> Fix this, increase the struct clk_hw pointer array size to the
> maximum output count of 9FGV0841, which is the biggest chip that
> is supported by this driver.
>
> Cc: stable@vger.kernel.org
> Fixes: f0e5e1800204 ("clk: rs9: Add support for 9FGV0841")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Closes: https://lore.kernel.org/CAMuHMdVyQpOBT+Ho+mXY07fndFN9bKJdaaWGn91WOFnnYErLyg@mail.gmail.com
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: - Update the commit message crash paragraph
>     - Add RB/TB from Geert
> V3: Add Closes:

It would be good if this would make v6.19 or v6.20-rc1, as it is a
hard dependency for adding 9FGV0841 device nodes to DT in v6.21.

Thank you!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
