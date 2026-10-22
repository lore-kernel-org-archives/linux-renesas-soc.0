Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661032;
	b=NwSic6e0haBblsG6BqY4ar7p/Rt6P0MttAbDVc5IhiHVTqcAmIE1NCzMqFpLirJnQ8v8
	 G8lxnLp7xF5oRmBkDD6CYq1cOdTLUG+B1eJkjAx4pWmw0Ll4nFkFOfik5lGuM70DaYyb/
	 pQA6CQZOT7ml3I45h/wWFyfT9VkgUnfGSPUWuYBreILOnD5EGUQ8pWI6h9IYPpxefHaPQ
	 PW9TuCMmAqbiwt0aWWDofdOwXg14ADjxXc6T/3uRFB8Hk7Z7J2OaZJ0cR9rR17snBpEyx
	 mD1EGQxaVE7NNKdT+Twb7AckTXWPkIJTaZ84u6a6PAd3jCbDJhy98gG94yvwgv6BiEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661032;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=gkhBBRoKjdMjfG0Ulhfds5pPtjNKOakoMGJLQPu1F7U=;
	b=5C9MISVmVLKW096eAVG2liAsNAEIpTvzlcg5pdD3EjRgrSUxxTy8kxGfWunghKsbt00W
	 wCh4S5y2ehAaxEx952OpXqI/6zimq/yZHP4PS7P4I6XMGaqlOH3TTuIhak1NEBb4plISu
	 WMLNl4YpzRHw2C2flc/+kvOwbu8UluZp//2z/lfXDrIO8jLS+vIOsEnZPZmRDdv6S56YH
	 u7Ena+dUzj+t8wrKQvzz2tOiQIPGK9TmAF0Vyz2nGiKS7/ilFwDJhf94xBtQmgCBLhCpc
	 uXWQMc43LidZYlwqzx+7eapWtX+vT6VgIXf2DFfwZkL2/uR3iW2vGyBSdLjyZJXvVSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2CC606A31A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 09:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2CC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7c4818e4165so712833137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 02:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661031; x=1793265831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gkhBBRoKjdMjfG0Ulhfds5pPtjNKOakoMGJLQPu1F7U=;
        b=uZe6qgpvLDgI/bxvUn9MMh8DnUD+YOKR8LQnH+9wGBm/UQGuH1E6Dkdy650qkkStLH
         vPppBLHBR4SqI/RYSwgDQXWVwHTat0CntOuFrxDnuUlNUTk0pM3seaPUBmvFiRFutGer
         bY5W4zKggR8KU3U1FPmJmHbuAiJ7t+HXSq7pAIaoSrtYvc06efdUV36eBDoDxGGAWZL6
         LvaUO1gv0OzsAJbzrc9f3GShLN4iUsY5oygptcL4wQeCPNvtiDX6cTfu3hVY14gOBCD4
         ubFBm0pKJqTSP8+QvJWejSyKp0GDrkZifOsJmppABjBkjs2xIb/omZFK2IrYXGSLmKS8
         Dkpw==
X-Forwarded-Encrypted: i=1; AKwUvBz3hxg1X0ak0FuB5rKoy9Pe9v+pR1Q4pm2T8ak4fdAbBeWTor1Q4l3moEaq65ydw3a0k8ctFZF2+XqbcAHVApy8WQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIX66P7h2dHEDddvwrEKCF90XvAyRrKYzxfv0bpkNx+3G5ncqyu
	PdVv/ajSJQKQP/h8hBXArvSmlATquFb4JHuWbnYm+5Z5rCkTbMSJnrxFI8UKeujF
X-Gm-Gg: AYBFou2j3gt5WyU19Npr9C+Frs9vm5ZZUBa+XyUbBzpUmfS8eFtei2Jsuhk84Tf/34S
	qQZZg1qP+JhFmjQDPc0Netmlrh1eXjGUUDOzck9aOPJmsFV5BEDvvhSBvQ54OSLelkrk5rPKulS
	U23U6b8+zO+8KLCQDlZdcIKWWxUMFWbpeA8qWd8BPBel7bb7nVYmTncCoZoxCVkBY91VXxKs4Z2
	+i2sCbm2uJrXzbZSmiw8pokkEUdFVtc93Y8xa0CsdlP6MCKLgShsvtq711SD/NLy9x1W0dKM9PV
	zsgvXH//Yle0NgQs1bIn0rvnY4HpfjKlVVpmC4tKorvzV16Npcp748uYVS/RMFj44AmdNW8lQ0C
	+mRcu+YDSaMhtMoj/FmVxuX46cRScmxPPGeyIO7jjzSgLl5mopgYaHCd6iZ6JG/NvzmQ/A3n7VC
	O8IYvGapk2cY5Ebt+l4zqx+DqdXZauZLSuVDa26na6D0v3IaVlwo6Lg7Z52Iqwt9b7Ek8sKA5uW
	1sHscxTrqWb3Z+inCjRxQcYVmWonN6pLjfGQuFDz3KWLT6MktQtPcsuPx5rpnidsZyRPzbYQYnQ
	zzp0XN+p+hETSeBZag==
X-Received: by 2002:a05:6102:c4c:b0:7c0:115c:14ca with SMTP id ada2fe7eead31-7cca9735c6fmr549526137.5.1792661031224;
        Thu, 22 Oct 2026 02:23:51 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d12049e1sm5829725241.12.2026.10.22.02.23.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:23:50 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-78fb1fb9508so566198137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 02:23:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzdyVYEeyfB0RGEnCfa3HRXiw91bQ2yzWPdfPjOXdo03bGnl0QxuoK7v4YAEFfPv6zQ0HPIEYEmBg3gay69lFhIMw==@vger.kernel.org
X-Received: by 2002:a05:6102:5093:b0:7b1:3ecd:3d8d with SMTP id
 ada2fe7eead31-7cca9a1a007mr483763137.7.1792661030261; Thu, 22 Oct 2026
 02:23:50 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021235818.3059519-1-briannorris@chromium.org> <20261021165858.v2.6.Ia4649c7263a5733426a8778ac4b2dc459f3ffef6@changeid>
In-Reply-To: <20261021165858.v2.6.Ia4649c7263a5733426a8778ac4b2dc459f3ffef6@changeid>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Oct 2026 11:23:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNuVOnn9KwYuRm5TYsMEf362V_4fSwQGp3fOfR_i7jkg@mail.gmail.com>
X-Gm-Features: AclHuK9DeixcMDu5pJYEJIO6mwWZklXvy1cHSqlxPpUgEBM8a99XYlxTEG_tKGQ
Message-ID: <CAMuHMdWNuVOnn9KwYuRm5TYsMEf362V_4fSwQGp3fOfR_i7jkg@mail.gmail.com>
Subject: Re: [PATCH v2 06/17] iio: adc: rcar-gyroadc: Discard
 pm_runtime_put_autosuspend() return values
To: Brian Norris <briannorris@chromium.org>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 02:01, Brian Norris <briannorris@chromium.org> wrote:
> This driver propagates the return value of pm_runtime_put_autosuspend(),
> which is not particularly useful.
>
> Returning an error code from pm_runtime_put_autosuspend() merely means
> that it has not queued up a timer or work item to check whether or not
> the device can be suspended and there are many perfectly valid
> situations in which that can happen, like after writing "on" to the
> device's runtime PM "control" attribute in sysfs for one example.
>
> For this reason, modify this driver to simply discard the
> pm_runtime_put_autosuspend() return value.
>
> This will facilitate a planned change of the
> pm_runtime_put_autosuspend() return type to void in the future, similar
> to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
> type to void").
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
