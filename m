Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA4E470EB3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404832; cv=none; b=vAxYhk30bYDG11+m2v4us16HxKrE0+wUSkv72KPEYEAxdfjvPlmsxORKeE/iWY+j8sgtYdiRACCt/TXkH7l26EtMNkjmDdmJOQOJmZNBl8VP6LEIwDJFm+d8LrjuqZOvY1IB0brlqykIYPnAVZD4QyfnpBkfJrapyhRIFutKjkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404832; c=relaxed/simple;
	bh=Mh6gEpsA9iJQYd2BVSlqJWoSIMsA9HSAvPlTaQn8dqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNxfNCMI7ImxbnZ875Pbw67xj4x+BD3hHsTkKIBXKqQuU/Xvvc6ON/gPY4oc7Y7WtoPRXnD9ExhlFbIdKOqXc/qMiMCf0Lc3Q/Zv/G7cuhQffF9L9VG9KrjvFJ5lzoWNH/0yGS1wtDy701CZOAB/HSTBIJv3LCb0BlaALowg/w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a6c77d255so833762137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404829; x=1790009629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BQG/EJqnowJv9xXbgTYVxf8rMoXWD6yF3WQVjoo8UXA=;
        b=Cq/8xIO++Q40UeQDObJVsW/xUJp8AaIoxiQhzI3RbtGnRj9q12jbhB9FK8JPCq4eTE
         WTT1AFNTZvDYdhEe2CyJOym0mwkCOflXyL8ODirDqbowA8gZJ/K0ILEyId9lFg1pbbhP
         Vh92yAslX5QhMTmlWykJqT+oQB3NoEZ9bM4rkT/4UYjj+gw2E7OrwR6+q0ndCoJLf7nh
         +s50V0+0FQIxZvs+tUfIzGhcEoRTQYI7I/8BAUW8PZATyr124/Z40kPXITuuwOP4X4Tp
         fr7MQpMMIAFnXTbhznBu6Hc8HLm6DyyfgaJwxHWrg7kKIOGPGHSlwL5n/2lSnAGFH55B
         6vzQ==
X-Forwarded-Encrypted: i=1; AKwUvByBXwNsp+Xe1lcP5GWzUi2/yGAAX5PNuRHvuTLFCuIecj4F+M6e91Ofjz7dMbgDGW96uPZEAnwwoXbIv+xVFBCwfA==@vger.kernel.org
X-Gm-Message-State: AFuF++k7zUqFJk1jjM/EK75rHSj6LWv9o2N83/mfSBPXamshKeBA3Xhs
	DaLQtj/NdYg7N/8Y/ZPL5Lxkv0aP5gEQb9cYnXxRE5bkkU+9RSRHKwlRjizKxMNc
X-Gm-Gg: AYBFou0ZLj+Z2iTBZ+AhPWzF3Qb0NCWFrQuB3t2XALkvmO4TVfDlF+X4GYBZkaxDE34
	37Acr93/9mvUq6/9M0P+q+/g0DQ2nk86K1/dNzpwqtX7/UNyILaWFCQF9HNdCZZsBIv7Ew14D7R
	bFLV0zRHENKagp6QthXuRFO6UzM3N/4dnWoW8nkeEGEtjnox8Y/dou3F2O4yt4PsyFUxpu9WYKp
	FJIWmVEdQsx9GICLNjEkEnginNMkLGmZXqh3W7+RPah7TWbVGx4wvcAU5EkP2NB5/j+H1BnMX2x
	IKI9MmOTdTRJssTyqKtZDgd8LfV0+A+qn+WzhsPmLmlPcVqVJAFCY27UKwz5T+P+VryTouGPlwE
	L+lKoZgITPjKCK8C7kNYDGJqM8WCY6ag+f9Re4DbMDsQSBuF3Y4l8No/89kYGpoz7O5TWaXKVqd
	LU7ZO3AFp+8leWdj+nl/Abpqmu2tAdE4BchncGVqXGDLHgbgtgLzfadNheNvEQ17KuRaclvdYit
	6nLpOXoiP9A6Q23YP8HjDem0fxirrOl5WPH6Q==
X-Received: by 2002:a05:6102:50ab:b0:784:b6e7:cee0 with SMTP id ada2fe7eead31-79b56df0dfamr1435275137.3.1789404829405;
        Mon, 14 Sep 2026 09:53:49 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982df55422dsm5673649241.12.2026.09.14.09.53.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:53:49 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bc5bfso486510241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:53:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzssKqVu2QX6RJs+9ZKG+NUTPxKtLuU4uJ8Sh8AWYBQUeQW0+MjbmgmLBRth2FEj3AvTvWqQId2kIEU6AnW9qGHcw==@vger.kernel.org
X-Received: by 2002:a05:6102:160b:b0:799:e1cb:d690 with SMTP id
 ada2fe7eead31-79b56df9c48mr1219613137.1.1789404828557; Mon, 14 Sep 2026
 09:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:53:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8bsr7-nrQeNdrhT3Ohmbf+ODv-JOGEREMqRd378YYNw@mail.gmail.com>
X-Gm-Features: AcwNN1VcbIN-WIOpxXaGvhcx7QEKLAAdG5tqWb6e4fPVkeaziyHmblEewpvcoBk
Message-ID: <CAMuHMdW8bsr7-nrQeNdrhT3Ohmbf+ODv-JOGEREMqRd378YYNw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] pinctrl: renesas: rzt2h: add a helper for reading PFC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Introduce a rzt2h_pin_read_pfc() helper and replace the open-coded
> implementation inside rzt2h_gpio_get_direction() to simplify the code.
>
> While at it, use field_get() with PFC_PIN_MASK to avoid the manual shift
> and mask.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
