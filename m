Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8D93F1AC4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 07:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371500; cv=none; b=rGjWrV5YRRjwDIP2ZLfXueNTMLjaAmeoecQS+Rmn67UbMjQ5rVzA/wY6Sj9oX6TdyIOFjxicMBxMFydsA4tC+jfZtZx7Zz68RJBFJ+QMNmVvVNy8Q1NzTklRWi9kcU9c+oZzSAhk0if7iRORg7saiHD4U/9GNYYIRJaJk5xVceA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371500; c=relaxed/simple;
	bh=am3YRQdfDAT3nmaBqC7y5nue7c7B51qzUVM5Eheco6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFMnkssCP2ai+V1+rnM5Q6AX31VixtxiTD5Vn/eCygp9WqIYHwTY8APnnvIcuImictlbVc92N4cD/0/o9rev15NH3b4/8IO4/NDvDRwpCplDdMBlGTZ2zELzL6NGDwzKwkmH5l//xU7fvQZgMUrezYB507NmtWfQE6xT4MQFA8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso2510634e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 00:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371498; x=1789976298;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ig0KNWBSwSP4iz1PoFYIig3Kn8oJ6i+WfrIPn0M81M0=;
        b=a7D3KmyhNOpbe2qOdhHmVVU91tbFfpYkmBwHrXoVvZrL0pSkMPxVx5ebDI4rl5z0ce
         6LxC0wMcFRnetR00AP5uwMFT/7pxWpfLlF8trmywQrhZ2nwuyEHOpARCjdyANdy3nHuC
         WJlO/6moydir3CazaWBORM+bUe5N7l+IGN4+lqXmqnAHFeMQNMSm3J0HdlP8fnKYaN40
         JmfB0nA2ZyjUwLPvwL/5gpy0tXFyBgOHjnSV/muEh6xYtjHx1ZQ2lgaH8XNLhWsjUhS5
         +bZsW68sgHKPKSR97TeUzFtmt3si5AXU8hRhFCcwMLpLpc2RQfOSfpHIOYmz+lDR43gL
         OmLA==
X-Forwarded-Encrypted: i=1; AKwUvBxTOQIAAJ7G6iIp0dxNG7vBvQXo4XPus99iEAsmvPNgHaiTTIFAJVk1tz670v0BrpFPRZaQ0svsy2+fbpeg8vqnaQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nbyI9Meo4Fyqrj8prYRNgO6jjB23NzKXInlH7V0u7BvupTZEjx
	UvbHlg47ktAoEabt1baeBlcAhZkatT5kwvybq2U26KFfujilc6YR6nYsUJLVc4Fy
X-Gm-Gg: AYBFou2W+QVzx7vpw2LUVWDxbOJr/jXK/RlYSB7y61VchGjTYVZqJoRAcKsdF0E5WuA
	tV5KQdilkchXE4SH1YGyhJbjckZxEMjiCiCu7CupioFk6G5OqWJF0czKgx9OIfV4r05rQUWCAHF
	wlRj0pFzSVndxYV9Gff6daRQBpY9NFtaNhAOTveIVoDSBaPJHwx7SQbOWQNBqM7ajXce10ixaMA
	DWfE5aN1PYf4JDXyBWsW55YZXlJEpbD/8RShzMge2r7ueIvNfFz3VurOuWyjQiUI1YiJ3zj/cb7
	/lItVrR8YvjVLt0gg2LdkOAJjXjYRj2Y5wA0t27ZbtvlRXfIrb317pbJVycjPIZaXCpQUgtj+V7
	wtAW3pEJ5OgWQpMNod3qdPIttbBgC3vbKxSYq1fK5zK8AmfGKtu/Ae70OcvdiL2YaReYB09lqH0
	NDDKHbpKh3hY9fgw5G8et6kfrOOUXXOCehXFGxmY0mITPzNg80HPy7JtIBK9SXB5XKDNmABjPtq
	MSQwJ+rxBEeWiVDrGqFGwxd4SEJtsAqzO/a
X-Received: by 2002:a05:6122:21a9:b0:5c2:c0b2:9880 with SMTP id 71dfb90a1353d-5c981adc33fmr697188e0c.1.1789371497809;
        Mon, 14 Sep 2026 00:38:17 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8470f4e30sm10822333e0c.10.2026.09.14.00.38.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 00:38:17 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9828b5b20eeso1849574241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 00:38:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByqB9N3LgxMdEKRghj89RyqDXNg7Y0e1Ep1e0CFCtK5Y6DxgCtM6TN2c40XnJ5vWsyBCKnHJ1T2qF55HfSUcL6KrQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2b89:b0:785:e444:15de with SMTP id
 ada2fe7eead31-79b588868b0mr615690137.6.1789371496720; Mon, 14 Sep 2026
 00:38:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913173009.1164899-1-sashal@kernel.org>
In-Reply-To: <20260913173009.1164899-1-sashal@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 09:38:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXvDrscWWod8HAqpTRH-VZfyVC+pKJuQy9enD8tbyhsng@mail.gmail.com>
X-Gm-Features: AcwNN1X-8Qz82mGtefbPfDrQ5FfGVFMErWxdtZEnRaKLFMPVj7qmjR9TiGuLaw8
Message-ID: <CAMuHMdXvDrscWWod8HAqpTRH-VZfyVC+pKJuQy9enD8tbyhsng@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a09g077: Add missing slab.h and cleanup.h includes
To: Sasha Levin <sashal@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, kernel test robot <lkp@intel.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Sun, 13 Sept 2026 at 19:30, Sasha Levin <sashal@kernel.org> wrote:
> r9a09g077_post_init() uses kzalloc_obj() and __free(kfree), but the file
> includes neither <linux/slab.h> nor <linux/cleanup.h>. It only builds
> where those happen to be pulled in transitively; on arm allmodconfig
> they are not, and the build fails:
>
>   drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: use of undeclared
>   identifier '__free_kfree'; did you mean '__free_pages'?
>   drivers/clk/renesas/r9a09g077-cpg.c:966:35: error: 'cleanup' function
>   '__free_pages' must take 1 parameter
>   drivers/clk/renesas/r9a09g077-cpg.c:966:51: error: call to undeclared
>   function 'kzalloc_obj'; ISO C99 and later do not support implicit
>   function declarations [-Wimplicit-function-declaration]
>   drivers/clk/renesas/r9a09g077-cpg.c:966:24: error: incompatible integer
>   to pointer conversion initializing 'struct regmap_config *' with an
>   expression of type 'int' [-Wint-conversion]
>
> gcc reports the same thing as "cleanup argument not a function" plus an
> implicit declaration of kzalloc_obj().
>
> Include both headers explicitly rather than relying on an incidental
> include chain.
>
> Fixes: 810b8b6c4e02 ("clk: renesas: r9a09g077: Register SYSC regmap")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609101334.xgbNoC4e-lkp@intel.com/

See my reply to that message:
https://lore.kernel.org/oe-kbuild-all/CAMuHMdVBFCKA5gjQeXuTrOYbaY_sZg-Gnz-fgOCSKhF3cV8jhg@mail.gmail.com/

> Assisted-by: LLM

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
