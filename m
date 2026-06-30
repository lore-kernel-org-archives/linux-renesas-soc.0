Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A3044CADF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 15:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834259; cv=none; b=ExQ2Zui2AumQpPkLOnbn0iAOvSYa69fOWz251Mk70xrvBBuydwLWAmTR4vTpo9pJbU1NBcgv4xXlqaFVjZ26jL+nW+nCOVVVCf6Q9SJGcngtJPoFMxj3pFyZCdYW1neMxZDEBCUO5hdLwAO/2gTuqDsG+4z8oL2CtUhXLz/kzS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834259; c=relaxed/simple;
	bh=CuTZcG0NTQSK1IiuWewtoKi7VjACdfVhijFD8N0XzcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7tHQ1l+YIyyooAeagS8IC5rMu7pIRYvMirwGEBi+r7UYpdQlNwniaxVX2yO3vIwTxc72mIra5ID9onl6JJUQ3wH6ayp2FhZsaPxG3CGZ8G7Pd5nXGAN5DtDdC+s5bGzDHtgsqxvog//sNdL0T5Qvh966u7wynAieNU4XdrnFXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-96387efc30aso2808746241.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 08:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834257; x=1783439057;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yXzNdN4BqbMf7eZ7YSG7ooOCqB2xenrTYSdSfGtHZp0=;
        b=rLpMx2A790dq41vYlH8vEW7Y4TYDSHk1nx2Gkf0nljiF/10pAZ/7eXVmUEW8tkaT4w
         12J2dGnU9i+MPU8WL7q5w5BMdUvNMtHJXSWIeZ7BMfqW/A1JF+3yDtnRARX2ohOM/f3v
         vhg1zmHw/Pe23hFstOccmvLJR2mUrZghxEKGcGZTqAAAAMvTe+jrCI73sviB4sU0U4ov
         bslurlOLtjmCH+0IO9QRWmvIfPB6mvMS2NbyWGKEBoExBjg+qROrrzVHI0JPUz9K0LHY
         a792apQgIxHkF+NU62gPdIGNpVBRSnAYuri7Mj52e2JFnUfqiEbHZN4U6oJztgwbcuV/
         0ibQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPeMYpr0eySxt/xptphDLzFV5hRveWj6JCN4ZAgzWPc5S/yRrVahlmhraeFkldAh+Cukni/9ILj+4FmXX81uDZMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKHqHzVMKyjdOu/o8kDDjB6IfA4anNTwd9AZ6sQOKGdys1/hHM
	yNHB3lfrppEPLNVDAusX2T/DyL4LGcQncqAWtlw6ETzfXQpO94kSgVo3ocq5sncJXgs=
X-Gm-Gg: AfdE7ckC0/01di8eWi/kSL7guWhzTIwsWqwl4oSxIGphPxsSD6ce2IsN0EhdwDbYCVb
	HZO+TLO6L28EoWUhfIPCKwG6/ESxHdEQibthdyrF8cIAFiIQ98AwY1UpFbD7EaJq9rh9g8Y29wk
	2X8GDWh3ey5njXw9y+p5T4drh8Vxf3Ejd1ALhdZjkjEo1X5fNnLAMGXHldD0X42x7XtVkBE/F5z
	ZcNNVRkRQ9nmj76jQDerr+tgXCMkYNQLlecr/GmukxjsDeMYOZLigZkWD2ui0jP8g/w5PoT276F
	vL89t0dCrDOmZuldRBn+8SNezADkm/ikGNTUNSjBYhbjwO9LOw1Zo6j8AVRf9Ane0CiDbXJpusc
	QN1WGEJqT4+tgwV+84GzP7sN7lZwHujmMz5kfGpnqSbocvR53PaYUYefofoovUb/7xu6hw9LPBF
	KByRzmcvK7SKwsTsY8dX3V7ymOJPM7034LCMrYLPdcIdAziUx8og==
X-Received: by 2002:a05:6102:1620:b0:631:37cb:1e64 with SMTP id ada2fe7eead31-73a35ff1b02mr2301826137.4.1782834257033;
        Tue, 30 Jun 2026 08:44:17 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73a83e27e6asm1350706137.8.2026.06.30.08.44.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:44:16 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9693bbb962eso1630467241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 08:44:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rov8cjk2bxSBOSDp5wxZSZ3r0pBZ7+MxodGHIB16SlaituW1tPMwWMvvz8VWjPmj+Mgpaq8qK/c7jaENfJBWmG/OA==@vger.kernel.org
X-Received: by 2002:a05:6102:3047:b0:631:ec2d:12bd with SMTP id
 ada2fe7eead31-73a35ff1e67mr2422168137.5.1782834256087; Tue, 30 Jun 2026
 08:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629095326.37302-1-ahmisaranrao@gmail.com>
In-Reply-To: <20260629095326.37302-1-ahmisaranrao@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 17:44:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURWZ-MFLNXVra-nwRi2m-fPnY0JUU=WFR7YOYBNi2w+A@mail.gmail.com>
X-Gm-Features: AVVi8Ce0nVeOsm0mLFiUh1ZnQx2aijL2YQYWOUlGz5qCeiV3-tLvcxG9byGNYKo
Message-ID: <CAMuHMdURWZ-MFLNXVra-nwRi2m-fPnY0JUU=WFR7YOYBNi2w+A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: renesas: fsi: Propagate platform_get_irq() errors
To: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Cc: kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Narasimharao,

On Mon, 29 Jun 2026 at 18:25, Narasimharao Vadlamudi
<ahmisaranrao@gmail.com> wrote:
> platform_get_irq() returns a negative error code on failure. The
> driver currently stores the return value in an unsigned int and returns
> -ENODEV for all failures, which loses useful errors such as
> -EPROBE_DEFER.
>
> Store the IRQ in an int and return the error from platform_get_irq()
> directly.
>
> Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>

Thanks for your patch!

> --- a/sound/soc/renesas/fsi.c
> +++ b/sound/soc/renesas/fsi.c
> @@ -1992,7 +1992,7 @@ static int fsi_probe(struct platform_device *pdev)
>         const struct fsi_core *core;
>         struct fsi_priv *fsi;
>         struct resource *res;
> -       unsigned int irq;
> +       int irq;
>         int ret;
>
>         memset(&info, 0, sizeof(info));
> @@ -2007,12 +2007,15 @@ static int fsi_probe(struct platform_device *pdev)
>         }
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       irq = platform_get_irq(pdev, 0);
> -       if (!res || (int)irq <= 0) {

This check also covered irq == 0, but that can indeed no longer happen.
Might be good to mention that in the commit message.

> +       if (!res) {
>                 dev_err(&pdev->dev, "Not enough FSI platform resources.\n");
>                 return -ENODEV;
>         }
>
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;
> +
>         master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
>         if (!master)
>                 return -ENOMEM;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
