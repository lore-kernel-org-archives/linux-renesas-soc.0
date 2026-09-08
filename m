Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D48A4B0483
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858354; cv=none; b=T1q4YGaYF/ArCpFVDT7FLjjcfprmWAVuYKOHjY8I2aXiN7Y3IqR0o3x3bAqEk/rMEiRgS2nG2Z5YMyXFEc/ImwwJ9asfs6ec4ORNlSBeYJM6gdFAX2gJ7ei+TKBdj0SANTGer6tzQ37T/v8AEXiHxUJnAbA9hgM0oF+jFdsjGjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858354; c=relaxed/simple;
	bh=qENNEDqTfSxOEMOZqWtlSya5/dlWse6hSfPNt8qgY38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRiwixCi4/LyXOqAV7Oj9QbyQKsb43Hk6zDWJ7zQ2+cddNlD+CsPyNPYT1K8/TEquUiqAbXLEtRjNn0tni0t5zQAz0tl5xJGAC06lqa6SSfwswdq4M8VrOZN6T4XUDCa8NaU0xsb7U0jFDmsO93Vi2ktU4FDi3VYzD121SArDGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c7d1512dbfso3543334e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 02:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858352; x=1789463152;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A2RG0cKt2fiedWBmPN2R9LrrqHBfbGuuDFwRG5wsY+8=;
        b=Y/n+HGBaACSDJWfLJnQEzHuz325mewjNNDj+Xc36AIKgDGy1S4cpKz3YMIVQku8axw
         0cpMt9hCoLYO3DUlf+YkI9OEEmmafCEfJCJy6EYRcNItNDSEXI56LiH5CxuzNMmr2QbY
         pjOtHFutiluyvhLwkVzq6nS/ZVkXj2wfV3grX+FdNxFoBbqvXD+DlY/W5YA/fhAkykgw
         ycbZAsA4a3IWxPFvu93QzCREY6OWZMAa9T0DW6B8miQ0DQqBXb6F5aKyokeNt/Zi+XQT
         x84reS/CunyZ0x0k3H8VGUxnAInF7Tmqms3ig5hlfKb06ND+/Q6worr7VArZOuTGzlkp
         ATbg==
X-Forwarded-Encrypted: i=1; AKwUvBw4ac/5WCItX3wPSdMln48VWSPErA8ulYasreFR6hnkTJWb0A8vgLOUJUlqFV19UuY4BQGKEN2rGQ2mx7Cd+o061Q==@vger.kernel.org
X-Gm-Message-State: AFuF++ndgUT9T55kS8ezRwwPbbRah/3zGyIV2A859HBi6HECpNCqNISg
	z8Q5GC7Y3u6uXUgQOKBa7aui1nZj69o2dchqmAfzFNeD9kxXRssGMrKRFyD63FW7
X-Gm-Gg: AYBFou24BZORSqhVLDyioFzDFFtNlbjl5LHJ+G+6MD7+7VLpvMCVjELLme6Lr6VGXlS
	KQEEfkCnEJ8v1hhdpEA0dFOzLwLM1JtCqAon3X9wFzYxabXPTouaiWM50fQSLlBk0w4/bGpqBoq
	KnI00IpoKYBjXhnDDq8hTneUL+7k2Edq+5coqy7rwBGJT2RNULuKGFYjWLbCaJMDtzsNmKj2Kci
	MNG47vBVusDrhbT1t0w/3QX/ekMryN1p4Lhc4ysCDKv/+Q9+C0R92FP8GvrFqup1Mn8gYTJz++h
	LXmG3uYW5so4RzIJM64NYo6fBvYrLnwWX8hfLF1AwztqDTfmnjqyS1C10QOuS8cRt3Wt9s5kLpA
	tVGiTxQTz+ihw2QVZfpCJsLKS4CFZH5POdNRnMYRunnBZHsEvRSr/1AOuRqf9cxPyxTAaN8iJn4
	0EeR0euDsqq6QSooo/8gaYyWR0pqg7cIx3IwuK0jkOYDB3YWWWML2eLds6DzsPS3LRCu8VfHqW3
	/tdGHG1278WGKmaKRNv7IGUhw==
X-Received: by 2002:a05:6122:8b11:b0:5c7:a844:493 with SMTP id 71dfb90a1353d-5c7ed2f89e5mr16041169e0c.0.1788858351980;
        Tue, 08 Sep 2026 02:05:51 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c8221316d4sm562887e0c.1.2026.09.08.02.05.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:05:51 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-782df51b4c1so3242842137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 02:05:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx52FkKg/fttQrB/QFx/d4U1Wax0nCQq02g77RZrzsgWcy9CTtBj09+HNpA40S/IMT/QVAg+8wkAVx+sX4L/N2Dzw==@vger.kernel.org
X-Received: by 2002:a05:6102:54a8:b0:785:c960:ff85 with SMTP id
 ada2fe7eead31-78a4a8e5299mr11703243137.7.1788858350778; Tue, 08 Sep 2026
 02:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-2-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-2-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:05:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRtHVn_Xr8LgnUwYgQJ7nMYLPA0_psoe2Ovb6784YL5w@mail.gmail.com>
X-Gm-Features: AcwNN1VaOQFPsjNEjqZlOpJmCYxPCszYgVUjW-z18bFw1ijCstg7Yj1NvjUamz0
Message-ID: <CAMuHMdVRtHVn_Xr8LgnUwYgQJ7nMYLPA0_psoe2Ovb6784YL5w@mail.gmail.com>
Subject: Re: [PATCH 1/7] pinctrl: renesas: rzt2h: fix used_irqs indexing in
 clear path
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> struct rzt2h_pinctrl::used_irqs is supposed to be indexed based on the
> parent IRQ number. Do the translation using rzt2h_gpio_irq_map and
> clear it properly.
>
> Cc: stable@kernel.org
> Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
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
