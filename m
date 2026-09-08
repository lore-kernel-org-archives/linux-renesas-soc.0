Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24094A5C4F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861555; cv=none; b=jJPlp+dRhF/dslekbJXUVThgYZzDBul/3SLiGBfWc3QL2NbZ9Yvv9WR9iecOnM3CV+Jf+bbeW1QI9mu2igvHNYI56npfRj0+xUsBOpFZGZtDABzu+DA2KYgRMstMIzBlQ4OLT0JqkZ28IdOL+B0BfANiJnu5wAzerniKxzRg58c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861555; c=relaxed/simple;
	bh=3MWgRPJt6D+zjmI3Wl8QcK/1SWMhE1qLRXA8MiA954Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfWP6MxhHfRZSO9WrR16sl1rdjmQ3BMa4iG1rzjueypZ+dy41rkm9+l50tUGqaJWwzkFlqCctSm6hEyLd3cXY8W4yJcP1vGrjkvdJxiimWgOGOFN+WMLnn2Z1AxDgAMPhxiID20VHlnz4kN+ga5lr8FKAe4SEDA4HBnK5HA1uSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97ea365dd5cso2734019241.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 02:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861553; x=1789466353;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NqiqRUClUQHn3RWD34Rj7ya4TrrYBw1oXhZrdghcnm0=;
        b=WKOw7rFjmOBezDk/En7GHIEHONauP+7zQlr/TLCy9Z8RdKwPm8DCFnsBfBFQp5zDgU
         Rk9uoIAv5z3Vz27f59Jrk0J9mGT2MYZR396TIqoV+xis9BD9+I5uiG91Sr+f7HBJG84E
         HmPPCRhiZzRtbXEYrJ57neAU5RzFGI/VJ4kGYikM6jPczVTCq/9Btxh7J/fZCgXsTmLh
         MDznSLmOM6OPW4XbOKTgs27gqzLHdkv58cuknwFYCctdpIpPYZnzvXaPjLdGqxg7P3p+
         RFRi4H7SuREl04uBm1XbzQq14xK1aPbYT7FbexCg+4y2qVeyL1fiG5RCdykL17PTC/B5
         YnWQ==
X-Forwarded-Encrypted: i=1; AKwUvBygPqwFo0/YcsGAA6f0HHgZAQPLE+GLwlkpZFLahhOIbyTvoiBLUslXoW5HHfvcace3S2KxpdndP/eWBJ/yZyu/Sg==@vger.kernel.org
X-Gm-Message-State: AFuF++mXzzzvS0n+UzeAt+hoTKzrZCDWOoRFzIggJb1hMwbnWdicPHqp
	pOX2XrXzyNpKebEHEHeE+FErNgFxRGCFP5J0d2ShRW606YQ6axuTPQNIjvLEw+tO
X-Gm-Gg: AYBFou37AENJe2X0FQtTIIE5vaD7zV0kYy4D17UpRHznPK9rhV2/IdCq1TtLeMt9bf1
	DH1SmkOZNP0JlqYvLswIvG9Y5FSrhtPj/9kZk7ReChnvBTl5UKV9HJReAX0NTCeUcer7iYXJ2W0
	6meaWfBq86SvNtjnEca5u5BeYjlfEGdwerugQdfc2HtdMM6GTPNpicfkGdbXoElgSQIZr/V4sXW
	jXhPNxzq+nQWz3sPtcQ20CAyAjIcskW25wdFlL+FQkHkaTspkmFFct1ip9zAgAUmeICBecd5evr
	Xjosi9C/wfvXIliwhF1tUSASjWb+3YwMs1LSRjJU+YL1IWVa0OCBWo0zW0wEUx9541yz62yw6MG
	Ea/A6lr64vQuCFtKqlBdBUDctzywn4nWIrulDlpX2OeyJ6TRWL6oOsptCwq/9G0OvG+hl+gt6yz
	6aWXIlCXbQyTal7GWBNoqLuO7kUEKDwE0JyYuXcLNgxGiZDi54vqQZqQnkIq0zt6Aw+Np0IZC74
	sky5Ph6hfud0++x29VjtqFVaA==
X-Received: by 2002:a05:6102:2b9c:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-78a4aa53ca4mr12964874137.12.1788861552728;
        Tue, 08 Sep 2026 02:59:12 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808e98a9b3sm9097246241.0.2026.09.08.02.59.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:59:12 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-779d18ef706so3125640137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 02:59:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx44k54GscT9XFRwbZ57mY/Fy7cLpiURbqR9MJM58V2w01ZDiglI9WCZirrdrBEMAlriBvO283OaCxYUmPgjYe3dg==@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:786:c86c:4f5e with SMTP id
 ada2fe7eead31-78a4a6e7023mr12785609137.3.1788861552199; Tue, 08 Sep 2026
 02:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:59:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ_4jBADsQLMCnhspGG8EWO0yUujFqh=31gpUoNydJhg@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2sYjbS3xvItm138PxHE5cGsknrhce5nrxreUz1pch3URAaKQ6yGSL50
Message-ID: <CAMuHMdWJ_4jBADsQLMCnhspGG8EWO0yUujFqh=31gpUoNydJhg@mail.gmail.com>
Subject: Re: [PATCH 5/7] pinctrl: renesas: rzt2h: wire up struct gpio_chip::set_config
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Wire up struct gpio_chip::set_config to allow GPIO settings via pinctrl.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -1192,6 +1192,7 @@ static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
>         chip->direction_output = rzt2h_gpio_direction_output;
>         chip->get = rzt2h_gpio_get;
>         chip->set = rzt2h_gpio_set;
> +       chip->set_config = gpiochip_generic_config;
>         chip->label = dev_name(dev);
>
>         if (of_property_present(np, "interrupt-controller")) {

I believe this does not depend on any of the previous patches in this
series, so I can just queue this in renesas-pinctrl for v7.4?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
