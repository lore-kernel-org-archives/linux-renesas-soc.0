Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583F140B38D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 07:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751955; cv=none; b=LOECTzCE1DaKQmB2iHRW8Bd9QVEPJN1WnZCaaA+KHwagiPsn6VBoFGvogqt7w5cc/4o2iiHjq3uaPDbHT0x20iAW7lGZNTDey0De0ghblU3mloDtA2iuF3wrVe9/pUiHPVoI8lVfHqB5INGAKzAF9tAf+6z5kT7T5bepkoeP09Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751955; c=relaxed/simple;
	bh=6x6zUfX3HAgCXeFMP5IQJ8hlZ04cJus+Y81jg3rYM3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtR39LmNJaYmr2ks4aIUSb0gLevzkRu53/J7VoA67+nCQWebiGW6EZE0zogWeo7Lngd3ur+NVppsQdQyanKpqbZ3BGUAaeSKCU/WiutUgdOwtjB/a7Nin9blwfziY4RhNDvFN/4kB0sCZJ+/9EOLI/DcrMFoajO7wjw+J2Crc+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c985f055b9so1785719e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 00:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751948; x=1791356748;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KRLyqaFR+2tvKEVGCS6TXPlesufaQZLklH2Mpn/Gp60=;
        b=mqyYcYdtuuYjUKh/R3Pu3OqcC8qD0VThLZZhyQclOn4ap1Hyo4t9XNfedPp3TZU5UY
         yimPpbHTZVa3br4HBrs+p9ICcHxzL+IB6xzuJ/47xFMvgJXkvKp6+8mCmL47Ppq0JHw8
         RvN+jU/Q8OVg65MEMstq86cEZRcCCY/B+mjAYCSq360Di9+ik5u++2UHfROOQAWelrNu
         LF+8Y+wxlzAgB5RKhVvIfC+uetYAmbEPnd/KGcVimN91F7RprCHzFQN4C/LN0h407suO
         o1e9J92GrVkkD21k1r7G6otneJIIZGFs5scw2wEGaq3CFHhEPLXxSw6mn2q4wP6yTJ0R
         XWcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlvdC+q17VsuhZQDD+oec+7XfUaC2iBMqrBHtDM2F4SSzqYDoR1vydBKxIlov9WwwI6Br4RMOpQAFl863ypJf6XQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLM+zJRtq2zPTWOidR9D4/liMXc+yHQljV4PnS8QZIgH6yHbKJQ
	e7B7RYraMJeIfQGOAmcARX74ynPxbeAkLuoTG7Ddn3fwLZboQp7epgjiGtmYW/hQ
X-Gm-Gg: AYBFou09YuRK3JnpLThbWJiSDfiJj/rOb+9OqOLlOeOPErsVL5MeF16Ad+UvkN0Bg52
	FwM+oy5Btp1rLZv2tiw4huttpP+x5G4aXB1rR6kSwbvSjZyrmDV5h3lNXkoQXOZyguv5yBZOq5H
	AsGUMMqc9/NrNvmaXT6yy6w5ruSREc4xANfVUwein33HGl8Mz5HazoSidoWnBHcLzUv8BmXQzYQ
	rVeWFXW0ZZk9NgqM5I8uQYN6iAqbSnyuV9ejJOk8MMq+gH9OjOjKrfBZ9dCXUR0UdSCI9dzYvE4
	m9Mnw8aXI0LgN2Q7kR/Ry1AWxLIgTZjveoqOIGK6PTSyaATLwY3rM54bY1+gY3hV2zeeAHLIL5I
	feELoaiCnESQAOt6ZkLzoqZKGrSnexq4/z6yorFeI3ZWqEmI/zVDJJ3dKrbNCLpYUw3gsf2wk01
	4RiXxEUJwbk5Pv090+7+kzTQSyUEb7K1ioGvT0vycBQb/Vl3mjeawJEedWUJQcrPc9Yx9l7R8nd
	nSUv7ndBqN/i1VgDFIrTO3lRGeTaoocNqx3+5JS
X-Received: by 2002:a05:6122:3613:b0:5d4:3376:f42b with SMTP id 71dfb90a1353d-5d67916e250mr41981e0c.4.1790751948627;
        Wed, 30 Sep 2026 00:05:48 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d6140d98bbsm844132e0c.13.2026.09.30.00.05.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 00:05:48 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so1322294e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 00:05:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwMzLIvYEdXXrh3Zczk2vVhYUt8s1fkk9MW++HNDR3hVz7oGaj/4pvYaNV+DYxQpGoaLhwHG7JE8kHxqgNagzbH3Q==@vger.kernel.org
X-Received: by 2002:a05:6102:6112:10b0:7ab:9152:1c6e with SMTP id
 ada2fe7eead31-7be733a556emr39198137.27.1790751948220; Wed, 30 Sep 2026
 00:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com> <20260929-rsk7203-properties-v3-1-02f84aeb8e47@gmail.com>
In-Reply-To: <20260929-rsk7203-properties-v3-1-02f84aeb8e47@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Sep 2026 09:05:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpevoQLHepf06K1=YLRr+BUF9s3W_zaQkO24qiY2_DOg@mail.gmail.com>
X-Gm-Features: AclHuK9T_GF3rRYO4h8sYrJYvPsih0XtUnox4vMWY5UxSoWqqC_FxwtdTdbQ_M0
Message-ID: <CAMuHMdVpevoQLHepf06K1=YLRr+BUF9s3W_zaQkO24qiY2_DOg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] pinctrl: renesas: gpio: isolate function gpiochip
 from parent fwnode
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 06:58, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> The sh-pfc driver registers two separate gpiochip instances: one for
> real GPIOs and another for function GPIOs. Since both share the same
> parent platform device, gpiolib's fallback logic causes both chips to
> share the same firmware node (fwnode).
>
> This causes ambiguity when using software nodes to describe GPIOs, as
> gpiolib may apply hogs meant for one chip to the other if they share the
> same node.
>
> Explicitly set gc->fwnode to ERR_PTR(-ENODEV) for the function GPIO
> chip. This satisfies gpiolib's check for an existing fwnode and prevents
> it from falling back to the parent device's node, while ensuring that no
> actual properties or hogs are found on the function chip unless
> explicitly assigned later.
>
> Assisted-by: LLM
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> --- a/drivers/pinctrl/renesas/gpio.c
> +++ b/drivers/pinctrl/renesas/gpio.c
> @@ -278,6 +278,12 @@ static int gpio_function_setup(struct sh_pfc_chip *chip)

As this function is only used on SH:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
