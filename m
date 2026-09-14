Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC493367283
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401685; cv=none; b=acEvaD32AyJ4RhlLEhudD8XhkPF9Va2VnNQG793bYLXESDgbivj692IdZzk6oK5s8Ihw3qG5lRKLtecgVZYO8ndN281hboQ08yMYnJRGICyk4Prqzqsd2qj29LS0NccRYoU8eemqVsmyc5yXvri6Vne2ZM/QDWZoWv1DhJS7+0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401685; c=relaxed/simple;
	bh=tidAyrhvNd18w/RMQ3ixTcc1CJXXLRgvNSZKkAY+9zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lcsm6WeH9ylYmj9Ui10RPMg1ry5+TsUun5VnXuevY1l8lEVcGA2JfQ6++Jl/PxNYBjbiDpYi8Gg/FJF1YI0jxGlEz3Yc1YAT/lvjWUzjMAvJD0cl05fJhLtdeFoIJsGYxEx4nWchb1nyoZ9tboQ1f7PFoeMfP6IzACuFqonYutk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c8319dd4a5so872502e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401683; x=1790006483;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qykkjFNFoMY5mcORIRq6zXUVDXiXOh0EpjPHb+vO+UU=;
        b=ZxtKfbRPpsTiHC/ODIiaKRuYEjwQ6jkZYQNnAgJvQfKTsYalQkM7Shp+Qlrfb4VNHv
         6m9/vV4ozwdF3OuXiVNSG6CPlCabiF8C2xpabXM5D1QcwINRuYQ2a2wQUIBxT43/v14s
         /YyuwhyHk6SqzpT152+QK2iziZdCyuKLZEjX0UTNSj4no2NYW/X3a/58F4JXKE0dCC2S
         oV0EooI27mi3qwTQM7/NcsEoYIxq7T4Eck7Yx2wucyhTo0UBEUPHqEAXdD1hLs6pZVfC
         iYO8ZRkxDMqHLRzmYjZC9+E8lKHKpZmnqltobwAR39/xEWMO8f51uwJo+mjCLBFlpCz8
         YeGw==
X-Forwarded-Encrypted: i=1; AKwUvBxlJzajLfj9r1jY+rzcbxfG9qR+fnLzdMeArPcX5LZtkT/ch07qTTlu902Y/cnXEq1TRdb93uIxBBs7uLJ3q4BVog==@vger.kernel.org
X-Gm-Message-State: AFuF++mocsm50NFcImkCX1z0obcxEzvW8Ailhu7/fRx5pshBmFqY8NIy
	zGN4JQ+IVYs4GTqnROekTwNKMOVEge8v4LtHaz/gHxh8ncKiuBUhSlFdHPkXtrjy
X-Gm-Gg: AYBFou259bYK3036nZSz6sXKnIYl/1VwvrVqQt6PWk7JU+JBKTMPGkTwaCC5zfmqI5S
	Aefzp/QGDm1LYyujFIwOD2J6gFSA0DM3HAE9MCxXYzA01NhjkhCB4PizkYKkqnhwHRlfU4IcqFl
	fyWoiaa7N+tGy0i9csWRGau8s13hZtM2wk2TqW5Xqt+NlTXnRVJGq23eUANxX5J17Hg6d/oMFKy
	e1uTx+40H2ZdkIcyusOtOjj57wC3WsWLFlSFWYsXzelX3rP/DZoJq/AJ9iyKY6tXkDkcf+g1nDJ
	/Ecy5obGbZu5tJK/6jGrTdOZpBtSHeCeV9If5ldKUSjKE0+FNwGsMjS79qxCTfFgiHMTshJR/8p
	JEz+E5955SFhB9Hhye7vrmpcJ5/3N/FxnAeTdHj80UzIJo/vAPDA0lcXW1M7kUXhR9BquyeQ7PX
	w8TeuxmqFWCOrqMP7dtuqYtzTcdyheCRb3hf+Aj+FADOsAH3+UCMEUi9am7xKjvzEX0YBR4Fh1u
	f2rRRbWNCNsVjtaX+5XSgCWCbwelamZ0vTdUy3jjpaTYamz
X-Received: by 2002:a05:6122:3a0b:b0:56f:6cc0:681e with SMTP id 71dfb90a1353d-5c981a92cb5mr3013318e0c.1.1789401666221;
        Mon, 14 Sep 2026 09:01:06 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9ed9257sm11403845241.5.2026.09.14.09.01.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:01:05 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b79so440145241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:01:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxQKhsXNM2IbVkRlAZSxLkYMKr4h9w9PctjnxEj7rY960UwUW0GNcmfmEuhyfTlJuUCSGyDeSn6jk3sfjb0rg2bQ==@vger.kernel.org
X-Received: by 2002:a05:6122:e266:b0:5c8:4409:602a with SMTP id
 71dfb90a1353d-5c981e978a6mr3949153e0c.8.1789401664780; Mon, 14 Sep 2026
 09:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:00:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUa+v+dU3rYbo94ncntsi_O5jxTYz+R05Tiw5ugvbgCDg@mail.gmail.com>
X-Gm-Features: AcwNN1UsCcmNqwTW55VDblIRDqEUqSmSDNxHTD-MZM3Vsk3F4Hbvpn5nqDQZKcw
Message-ID: <CAMuHMdUa+v+dU3rYbo94ncntsi_O5jxTYz+R05Tiw5ugvbgCDg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] pinctrl: renesas: rzt2h: restore correct pin mode
 on IRQ free
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> rzt2h_gpio_irq_domain_free() calls rzt2h_pinctrl_set_gpio_en() with
> false leaving the pin in interrupt function instead of returning it to
> GPIO mode.
>
> Pass true to rzt2h_pinctrl_set_gpio_en() to take the pin out of
> interrupt function after we're done using it as an IRQ.
>
> rzt2h_pinctrl_set_pfc_mode() switches the pin to Hi-Z, losing the
> previous PM value.
>
> Save the PM value before switching to Hi-Z, and restore it after the
> IRQ is freed.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V3:
>  * no changes
>
> V2:
>  * switch pm parameter in rzt2h_pin_write_pm() to unsigned int and
>    remove the u16 cast

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
