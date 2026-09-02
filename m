Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B876D44A3EF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 12:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351186; cv=none; b=NxfcDJS52bKmeYbp01Q4VEMtzHqktQY94M+twSFNj1xsG1hTKQWlGAq41PPryXqjeCl1DS1zp1fwyR98FVUdkBXZfcQ7tpPNWIzsOBrQ4/HH/wZsnBuuPoNNGRkfatvmiQ3YLpsuNfHTU6VGOgw1atv8fZsingXydduVejibGJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351186; c=relaxed/simple;
	bh=biV/P6Lenk1gqyuDluawNcA5WadE9fBB25bM/uCBA9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrglxNAUg71KxvHG4Ik+MPilyJ2GHTTKTQ4laCR7nmjbwcR0y+uBCo08SCtEWiq6nJMq3BUC0JTdVnLG67ctrso2UguQ75X6IfgPoQStCM7M0aMVY68sZz3Kb3MXHEEDm2S43hVZfuAXbRVmNGFgo03nz81WCfmwd1CcZW7NSIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c65d654c23so386150e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 05:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351180; x=1788955980;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T41eIf+/AuTT/wyzLNOdOWtrZpKK7XdhLj5//SaN8yw=;
        b=F+Bjiae4aMangWOuWg5JrYxBxl/SMWmc7TazAoEXnjaNCptmK/wel+GweUQTuJVkBs
         JVkMH4ZOP9vz0NqAZZcj+onC/xEDU6SjzUjWYyFMSshVh9vC2Z2ImWXd+9bdFcUD08DY
         G9mKKm+GLOPEzXR4sRDdSt8fxI9aH7AGBeiQUqfmqPKs+BSZyUoTip1UAPBieSSMJgul
         YF1eIC4LA23f2VdN6n/d7GfDiLzYxKJEmvWp9HAvztnTRwuknfhiJCGRagC/gw9U5JOB
         s+T941PuZkS4nWkxbDZdafdHmnx2uy8KFkA6tdslg1A59PB340ruY/2rx9cDvcMBRW7C
         aAUA==
X-Gm-Message-State: AFuF++lTq3dBGRNqCkX/l8q+7gIHJx3P6K5abGGjslofH2Zx4fZmphrT
	/FUKPh3hq+S54xgtPCzPcDI+2OoKcmWSJy9e+ZlOq0D4dis5Wh6PBQdXqlDoIJn1
X-Gm-Gg: AYBFou04x/lCI6lBJxjCFVO3LN7UlORtt4rJU0giyV8NqpGnf87CBio0ZGe/mXNR5f+
	1L+fHytJZnwZHpKzSGyGMXcY1GweNTuFrkaGAoUCiLG8r4T3oJN8tkWHRQa7ric1SHoxPZlzSkc
	UdFZBsqLK5zJGJtDfogr+l9gj1iig6ok+HAvZhxQkVANUSeth/YuWmgZ6UHvtDeenF9lmZ5jwY4
	g8x5RnXpdWA4A6a/oljx4xjFEJjcPKeCUwNsdp0t3lToSvarrOc+sH9lDMQ47WWi3LSaNSQlvAB
	YGxtgfvCS0sp7DL1QMd2PgseByQRldAvs/SOB+HzxPZM0urHNJSDRypfgRU0nyjP/tzKl9rNOgT
	Q5G8PmwMoROtv0ybKpg6p2WgVD0j9nwqE0Q6WNYfzoG6qMit2hXZ6LmRfxybn1A35BX3+B8Wy6i
	5EnvjwYWBeGpkFlWks5qG8tRYhGkAx6IVo0yOcjxR8vb+s1uUV4bn+D+qN14rD9w7u/+tEG0QZH
	6XV42nnu35Etuhp93LnBj8Awh+4weXrZf90As1D
X-Received: by 2002:a05:6102:2d0a:b0:786:7a59:a313 with SMTP id ada2fe7eead31-78a1f3ca67bmr1035533137.13.1788351180369;
        Wed, 02 Sep 2026 05:13:00 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9806728262esm1980896241.3.2026.09.02.05.12.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:12:59 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso429173e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 05:12:59 -0700 (PDT)
X-Received: by 2002:a05:6102:50ac:b0:785:c643:a415 with SMTP id
 ada2fe7eead31-78a1f3c8040mr1328620137.12.1788351179542; Wed, 02 Sep 2026
 05:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817095447.34693-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260817095447.34693-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 14:12:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3OddS_FLezhLKL7Bfrw38PFAv+pNLvza5wt4bE5kP1w@mail.gmail.com>
X-Gm-Features: AcwNN1Xk803m9jEyq6713qOsrpmGtrbWsrTaCapprfgM3QHihPSKQL88K_Gs8LA
Message-ID: <CAMuHMdV3OddS_FLezhLKL7Bfrw38PFAv+pNLvza5wt4bE5kP1w@mail.gmail.com>
Subject: Re: [PATCH v3] soc: renesas: rcar-mfis: add hwspinlock support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 17 Aug 2026 at 11:55, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Every MFIS instance has a block of hardware spinlocks. Add support for
> them. Gen4 has only one instance, so the base_id is always 0. Gen5 has
> multiple instances, so the base_id has to be encoded in the info
> description. Also being a provider, a hwspinlock-private header needs
> to be included. Work to refactor the headers is on-going, but will need
> many preparational steps. Until then, we need to live with the special
> include.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v2:
> * dropped patch 1 because Geert already queued it
> * add comment that flex array must be last (Geert)
> * calc local_id in a less scary way (Geert)

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Any feedback from the hwspinlock people? Can I queue this in
renesas-devel?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
