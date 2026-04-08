Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFF436A004
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 15:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662389; cv=none; b=FQhomT8Q5LHs2RNNafU+S9PyQjs8cQJC+kNv7n29CFZvDqs0DHJ+Nl0n57RjVeDyWNTbEVFDF6rJAPyj8dzhbdcH7a9706FJPZD0op4QieYmv6kuQu5QrVoXuTYwLQZcFkXzmLWW4A2XfefOjy5WcwzBZIskJMm6YCVFJQ1cfNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662389; c=relaxed/simple;
	bh=19YtJl3+r+0NB03zqcq4gq5bU4z13xN/5YG2b/X+HoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DVJODrknroDZXbWJIsv30qh5w/ILvT6shelZPp46AQkggYtTKNgy6o5TYG33y7hnvRS+qKnFooIu04f2vtD/2xtm/q2839Kk26f1CVQvz1ZmoPgGCPnA4t/PA6FTnreQoHuCSGyuoFNXkG3tLlzlalRqUFVXBLiIWw/9HDxtafo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56db1b3626bso3119096e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775662386; x=1776267186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uj8oDxCrW5q3frhKxVEJb+udkuPEM5jfXig5YpZV3w4=;
        b=LX5S/B+jNHElFZEvnJEVMAEuRF1G3e23MttwMaXuFOHcZkdIsZlySk+pStq6WfaPfM
         4oeSMGQbdaaYyoGHQA2Ff9S/rMeXbi39sT8cL3yq08l9AFuSCjhW94WkZ5Bas17BZX65
         43RKEK1DKVQlYFZGwF+4nVBl1ZaVFfgE3N9mktlSvwWYhTPIi+vOOCytCPue5Uj6eLb5
         5qlPcd23q90uhH7BP4mn9VkJibqzvDvVTAO/SJYoLJFWvfjeiyooTgF8VWNUhzGoL5d6
         wkUhWaaosyKcM48ApQS+XtWa3zIwEbVyaHXITz2sfk15F4vdWR0ZurLuXKkOHhfebWvX
         yELA==
X-Forwarded-Encrypted: i=1; AJvYcCW3Q5380qdzje9olu3FwXpFdn5jdy0lMuvXAeH6CUYWWlv+uqTt6mrzGBnX0Sfrx4MnFxcecntGR8ih71c7LH3DoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi1ge/zH3wB/ngFYDMxTZczAGaVB7N7EYkQT+6Q1dkh+25HmGB
	WVKYyTdEvpDvWuh63gZHt2sNwui5AlbesbG4qjQz5cPhCejfAWEQ0RxYsfuow4HX
X-Gm-Gg: AeBDieukHyPWEFambR2/K3vS5T5zauYu5X52ANHSOmgu/qb3A+HfGLSc8NMbB4YcJ8z
	GrYT9vJUg4iHME5g17Kov8VymU/xyeLz2irflZGHr2FNUHb6X5TjKSkbQKHFU6JS+pcVVrFXAQv
	oNHqVv/u+MaCYygtt7PH/G/LaCHwuBjY0VFLEw0sL4hXxNu6HZ8PFVoNOEIWBGXLadMsdticf6s
	OVN8Rh+NK5Zfwk0UqjFc9oTFfSeDlShb72lGMbEpMoHtxtwrNZxmliaFxwzdId5sq7piyrXRF+6
	dj+sANLJDD5fW7pf50hIh2y9Ia6cSR6ysTifaByicKLPY5Z6QNkCcMUeahY7+pfDzRyBvNt9hNE
	2Idp0WUFkeb6zguX2IVGvnEIczTOEnxcl51EJgFgABUJLOglJtYw4INWWIaSGAawiZH8LhgLw6q
	rH2nuakFgAHfpCyryMoIaxTpfQpAvgJqxVmoP48vgfMYWXnw8q+U6T/k4/zvF5/QG/
X-Received: by 2002:a05:6122:2983:b0:56f:1bbb:83d6 with SMTP id 71dfb90a1353d-56f2755edf5mr239034e0c.10.1775662386336;
        Wed, 08 Apr 2026 08:33:06 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bae1117sm20386075e0c.7.2026.04.08.08.33.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 08:33:05 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56e91f17a99so3069504e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:33:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWN21XbqyySKVLGegMNFShGwyyXEfc4Ia4x/YxY1/I7ZwUsrGqqBLhkVJz42neuL7bLc9TBIoJXExDLKX32iuIhRg==@vger.kernel.org
X-Received: by 2002:a05:6123:67:b0:56d:31e1:2c9c with SMTP id
 71dfb90a1353d-56f272e7548mr263019e0c.3.1775662385062; Wed, 08 Apr 2026
 08:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403141341.2851926-1-claudiu.beznea.uj@bp.reneasas.com> <20260403141341.2851926-3-claudiu.beznea.uj@bp.reneasas.com>
In-Reply-To: <20260403141341.2851926-3-claudiu.beznea.uj@bp.reneasas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 17:32:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=06CG==zNbCQERSmyJWozQBA4kvS1Oofq4W3Vy5hpdQ@mail.gmail.com>
X-Gm-Features: AQROBzB56slYO0aAtvE-aBj1yn0s9lx5lHrW2N9ze8-wq2wHvY4t5VSxdea8ynQ
Message-ID: <CAMuHMdV=06CG==zNbCQERSmyJWozQBA4kvS1Oofq4W3Vy5hpdQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] soc: renesas: r9a08g046-sysc: Move common code to a helper
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Apr 2026 at 16:13, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Move common code from rzg3l_regmap_{readable,writeable}_reg() to a
> helper and use it to avoid code duplication.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
