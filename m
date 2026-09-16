Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5074D4F7981
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565602; cv=none; b=MmVvpCPBsfNOhLf5tNDcInrJwLVD21KUB6407n1bRteeY4g5UO/bTeYR3Uv943xhUUPAeS9IhS//A8dnOwyMvnhYP/C3eBFXSwC8lz/vTcocv+JnlQVw8KMF6RyE8fLcmQ8m2lmBOvilGWnTMqgvUjDVK67NAculwIbdh7p0t7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565602; c=relaxed/simple;
	bh=mb2XQ1KGNSPMgyuxBLUyXCoX4VmOMT1Nq+RjhXhPzMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWVc0fvE8BLJBJO5m/hP4GWl/tG7yIftV7E05mvKknGaneWw1EVaoxcMD8inzb7lVsinrHRklkxjZo3BW388yQloGzYt7bxC+jLnzalrKwaWYQctK0hwKSyz8vzf8ptzQtak00W2kxsxU4T5FlV6exX/2TIMPurq6FP8xwjNBgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-7856441f7dcso346615137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 06:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565594; x=1790170394;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KZim0+JELLYTz16Ra4InawCH9gXGh4ZTsyUS8+i0IEA=;
        b=w9OnBqhv5q7c8GzZveolrszGYKAsqD8Er2PHMsrqSZxzhvjgcAXTBegSr0umPIr7rZ
         tjlSq2BWjlGW3d6niomZ1DYggsP4quzzT+DhjB1w2bocV38ogvMx4kQeFRf/xlaHXtN8
         s9kBV1noQk+5mSk/JPIkoRpsBuKhiaCdmKXdfZ/ZTKPq07FF+KOYkoN/WqytZl98bS8x
         SwqfMaz1d+pxOu3lDA7nQnkYUrOuTVN+VLNiE/PB5jQwYnElP5IaMTUO1BM3SZFAOfOe
         1IaQaFs71ytGr0XuVqAd5jf4gcEOQDwPu5i27NecvRf9eEt+2ZWuDX3Emmw8SDQ6BHjc
         ExCg==
X-Gm-Message-State: AFuF++ls3qL2cjjrjErTt58kOjxYOmC/pqxTe/Jhk+IxhJ6dkws+vt0Z
	188py9d/a3vLxmJHOqGPApZQlfLbiHbpQyLk6SUIqnIyuDNCmlslidsfXEFS4xz1VOI=
X-Gm-Gg: AYBFou2l+fbQ7dp9uERfYv9j9dJD8eDMxoWEAGOpOPMxowzu93u2aFWjgvEoKNZi4Sp
	YsEQ8nZVpGg5LhIgVeQz3r3xa/uok5WlcdjT9RYA05VaDjUVSvxPO03iPcGW7zuP6Ht6lIfO4ye
	r+ELb/mVDiy6u1eEdIeYPxNmWqgiUruTrEWoUwcbqgdfChcVx9IXmsd3a3o8Y4GQcajhlWK6eDg
	UkYM3JRH7umX+Ryl6OlFN+wrlfUDzVNNf9s/BXY/Tp8UcJPyAPCcsAs59pGdMPTnnSladteXl4G
	ya1d2vAezBJt8YIVTxr1rX2Pou1A3gX2sYSlhuZzXwRgR//32gyhbVotMv1Nveb9GGwZ1R2YPBU
	L0PQKpqbfHpb31kub74PfoBUVb/Q9FI7HulxainraMhSfJx1JWVpmhgKxguaxH6s6/wyvWtBTDV
	NE19fDs6k8RZqqPdiiHJ2qE6nTCFXKHtd2ny9XT0YxSQcNdXMy0mYuWa/qCYqHKkuxskkRG4Kug
	cWc/Ja4zWsmIrN/9xgcNRji317tYdGjs8sS
X-Received: by 2002:a05:6102:84da:10b0:7a0:eb10:79b5 with SMTP id ada2fe7eead31-7a0eb2f16c8mr1407639137.10.1789565593511;
        Wed, 16 Sep 2026 06:33:13 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb1148f57sm2892242137.4.2026.09.16.06.33.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:33:13 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c82bb05ddaso607896e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 06:33:13 -0700 (PDT)
X-Received: by 2002:a05:6122:1349:b0:5bf:8c77:e89a with SMTP id
 71dfb90a1353d-5c99ab375f3mr2670104e0c.2.1789565592896; Wed, 16 Sep 2026
 06:33:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916102520.24288-1-wsa+renesas@sang-engineering.com> <20260916102520.24288-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260916102520.24288-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 15:33:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzvSZUiS9JK2R7doct+NFEFmFy4sZNqerOwER-6wnJ4Q@mail.gmail.com>
X-Gm-Features: AcwNN1XvSPah2oUTqePVUlnZa47A7Wxsz425P1ob6Q-7r15waklaFxMMFfTjinM
Message-ID: <CAMuHMdUzvSZUiS9JK2R7doct+NFEFmFy4sZNqerOwER-6wnJ4Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] rtc: rzn1: add R-Car Gen5 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 16 Sept 2026 at 12:25, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> In general, the RTC on R-Car Gen5 is identical to RZ/T2H. X5H is an
> exception, though, because interrupts are not wired. X5H2 will have them
> wired again. So, skip alarm setup for the X5H case.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c

> @@ -503,25 +505,39 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
>
>         spin_lock_init(&rtc->ctl1_access_lock);
>
> -       ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "RTC alarm interrupt not available\n");
> -
> -       irq = platform_get_irq_byname_optional(pdev, "pps");
> -       if (irq == -EPROBE_DEFER)
> -               return irq;
> -       if (irq >= 0)
> -               ret = devm_request_irq(dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
> -
> -       if (irq < 0 || ret) {
> -               set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
> -               clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
> -               dev_warn(dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
> +       if (data->broken_irqs) {
> +               /* All known broken irqs are on SCMP only variants */
> +               rtc->rtcdev->ops = &rzn1_rtc_ops_scmp_no_alarm;
> +       } else {
> +               irq = platform_get_irq_byname(pdev, "alarm");
> +               if (irq < 0)
> +                       return irq;

As the DT bindings declare "renesas,r8a78000-rtc" to be compatible with
"renesas,rcar-gen5-rtc" (which does not set the broken_irqs flag),
a missing interrupt must not be fatal?

> +
> +               ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "RTC alarm interrupt not available\n");
> +
> +               irq = platform_get_irq_byname_optional(pdev, "pps");
> +               if (irq == -EPROBE_DEFER)
> +                       return irq;
> +               if (irq >= 0)
> +                       ret = devm_request_irq(dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RTC 1s", rtc);
> +
> +               if (irq < 0 || ret) {
> +                       set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtcdev->features);
> +                       clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->rtcdev->features);
> +                       dev_warn(dev, "RTC pps interrupt not available. Alarm has only minute accuracy\n");
> +               }
>         }
>
>         return devm_rtc_register_device(rtc->rtcdev);
>  }
>
> +static const struct rzn1_rtc_data rzn1_rtc_r8a78000_data = {
> +       .has_subu = false,
> +       .broken_irqs = true,
> +};
> +
>  static const struct rzn1_rtc_data rzn1_rtc_rzt2h_data = {
>         .has_subu = false,
>  };
> @@ -531,7 +547,9 @@ static const struct rzn1_rtc_data rzn1_rtc_rzn1_data = {
>  };
>
>  static const struct of_device_id rzn1_rtc_of_match[] = {
> +       { .compatible   = "renesas,r8a78000-rtc", .data = &rzn1_rtc_r8a78000_data },
>         { .compatible   = "renesas,r9a09g077-rtc", .data = &rzn1_rtc_rzt2h_data },
> +       { .compatible   = "renesas,rcar-gen5-rtc", .data = &rzn1_rtc_rzt2h_data },
>         { .compatible   = "renesas,rzn1-rtc", .data = &rzn1_rtc_rzn1_data },
>         { /* sentinel */ }
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
