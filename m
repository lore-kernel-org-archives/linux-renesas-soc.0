Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DCF239E80
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2026 13:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306785; cv=none; b=MygiCJW0etihukIff8yGmQ18pkhV7/SI9P0X34lNedLRPyX0r8crdR7ytXlGfvi/5Wv1UP+Hk1aB5677eOWGPmbMD+qTAD4fE5wIZOxjpj4FcV4n6Sm0dYg+0xjG1bGhFeHFTyPqsfRTN/ap0CG/mT/J63fqTS+FHQzgDQ+vCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306785; c=relaxed/simple;
	bh=vX50m4/9mpoS9OAgy/n0A8z7SSW5XduuDoWYLqcBObI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmBqsR/JniwmfkA3q9foE+M3kQEwAh/9ihmHXvf1DDXxOvu3tTC61V3lrUxfEuNWOqmaVNxdYhEkduVaEJ2EKttdVxw+7s8Z6lhCp8KYUQcQT3qEV9JFha6ErvCRD0acYARUGvTnPomWY4YqPqmxH7+Egz0p5XPIpYU/gb+EdU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59ccf81e6feso332771e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2026 06:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306783; x=1782911583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVDJhQYbmltFvjjEnnmNhAk+/lIL15u/vSuc+udanW0=;
        b=XBBPk9vQudhSb8EKY+f/H+uZ88ZzI5raDlPxBxnucXTlOwRGxc1vz/SU/6OqpGW0aD
         vkpe0oWuU5/YeDLp4XveNIDK7JdSvQlcPB1MigOg4EtUxPg5ymH2z0ysF1qsbK353VnT
         HuY0A7IWEhm7gzyPSiRcAjw9LrLEBnlKC79MfGuru9iKEL+AUHIKwYJnUFcYO/TCu/wa
         dylYFyUDPLzZ+6qZX+gCuzUEBKpCb+8pa5/0RchYbH47MXw/V5nx+vxIbz5LakiFn7Xj
         10rQBjNgUKoKdlk92nxgmoaQLQb6MhsFtDoxP1R3OjbpyW+uZ9fIBLniUpwPzJ1aBisP
         uiWg==
X-Forwarded-Encrypted: i=1; AHgh+RpnzpwU2x4hYAHGsSNDtNxKDO+wlsdWaXK7XyU5tvCe+h+4G5X9TjxeNPlMkGKNKgsZjQChGx5ze6s+I1e4ruO9Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+wIss5g3QnNbkkoXgAUr9O5VxiNwBdJGuoSruZWZvrJtfa69p
	wECxVdv6ZR4lj0V8n1p7smNBOEmsyvAZ7KKn5REHvS7MEBduPjnE1po08RJMFzcr
X-Gm-Gg: AfdE7cmLsrtyFPR2ZSNWahYgsl1y5vhhoOfLYxeSFOrWUm8VN1379LsRyYq3uVOL/ag
	mOYoWOQUHsFkeGgXvQR+W9UJGPRZPUrADrrDVMZw6lc48zuF7Jh4BrM7QpahMAKfSJggQlfmF4q
	DkPWzMXWKiRWIf9iyOREgbanbQ7c9Z/6lOR9zZZ7zdLFzF7+WycEf02bf6JMlTZt8xwnoq7xLFS
	18u79oPyHZ/7JbomsnXXMIQVKAq390dd+IalDzIjrSOQYJLq7JjCnKy1RlfGeeJ49TG5c/2O6FE
	zUqoZQj1L4SA81zPfy9JbrJZti7OI40gLZPLwxb4eiDAr+kdSbekNxVmF4XvjrKU0aIZbCYSt08
	nn/xWp7mH+3uGp2vwfKD5N6AIPGB7GfcV3sGOM5n914cqONpmII4alIMZP+MlKjEeUrRoH+Edfs
	1MBZk9zpfDX3mr2szkFZs3bKA/M7tOTnLkk2JFAnAK8iQL138Owg==
X-Received: by 2002:a05:6122:20aa:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5bbfbd538fbmr10293695e0c.7.1782306780781;
        Wed, 24 Jun 2026 06:13:00 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfba6e8f2sm11378853e0c.13.2026.06.24.06.12.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:12:58 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9669195bc9bso427872241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2026 06:12:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqKEJovpqyb5Rx+q0DB9GBlDF1qJSOJttmB4eWO/+J7DJcri6F0icMcXMbRpPXf/aJKCOU8LRyHlTuWPFWZFUKfjw==@vger.kernel.org
X-Received: by 2002:a05:6102:3309:b0:611:e0c2:1604 with SMTP id
 ada2fe7eead31-72b671e931cmr10142508137.19.1782306778248; Wed, 24 Jun 2026
 06:12:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ajvVfSusxZfjNxVN@stanley.mountain>
In-Reply-To: <ajvVfSusxZfjNxVN@stanley.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Jun 2026 15:12:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpnXGUHRNrT856RkBtsrO_So+0sxJ47cG0OihoChB+1A@mail.gmail.com>
X-Gm-Features: AVVi8Cf8LN4jqx6II-ppStxUS-9RUJFFL6cy6NRwMFT9fQRCj9ODD57bZVky9AQ
Message-ID: <CAMuHMdUpnXGUHRNrT856RkBtsrO_So+0sxJ47cG0OihoChB+1A@mail.gmail.com>
Subject: Re: [PATCH v2] thermal/drivers/rcar: fix error checking in probe()
To: Dan Carpenter <error27@gmail.com>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

On Wed, 24 Jun 2026 at 15:03, Dan Carpenter <error27@gmail.com> wrote:
> This code accidentally calls thermal_zone_device_enable() before checking
> whether thermal_zone_device_register_with_trips() failed.  Move the call
> until later to avoid an error pointer dereference of "priv->zone".
>
> The driver works differently depending on if we are using OF thermal or
> not.  We use thermal_add_hwmon_sysfs() if we are using OF thermal and
> call thermal_zone_device_enable() if not.
>
> Moving the thermal_zone_device_enable() call is a bit cleaner as well.
> The original code used a three step process to cleanup:
> 1. Call thermal_zone_device_unregister() to cleanup.
> 2. Set priv->zone to an error pointer to preserve the error code.
> 3. Set priv->zone to NULL to avoid a second call to
>    thermal_zone_device_unregister() in the rcar_thermal_remove()
>    function.
>
> Now we can just do a direct goto error_unregister and rcar_thermal_remove()
> handles the cleanup properly.
>
> Fixes: bbcf90c0646a ("thermal: Explicitly enable non-changing thermal zone devices")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> v2: Use the correct fixes tag and re-write the check in a cleaner way.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/thermal/renesas/rcar_thermal.c
> +++ b/drivers/thermal/renesas/rcar_thermal.c

> @@ -510,6 +504,10 @@ static int rcar_thermal_probe(struct platform_device *pdev)
>                         ret = thermal_add_hwmon_sysfs(priv->zone);
>                         if (ret)
>                                 goto error_unregister;
> +               } else {
> +                       ret = thermal_zone_device_enable(priv->zone);
> +                       if (ret)
> +                               goto error_unregister;

This error path is the same in the other branch, so it could be shared
after the if/else block.

>                 }
>
>                 rcar_thermal_irq_enable(priv);


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
