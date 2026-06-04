Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6AA37756F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566542; cv=none; b=l2GKFYtacHF3KAgRxW2y52Opb10k3n6epiWW+18/CgfpUFqsym4ODbZWf0/PnKTwhzQQ7F1TXXA/LzdhigE97na9E+gmlCumx+XDYi24xTfcIzm53Emb11g0dZ4lVuoYoSTeiHDlv0qG1KXYS4Wf1l1emvNTlEheHurLvfvT0ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566542; c=relaxed/simple;
	bh=9ccdKlMLp3ktq3NWcjK3eTgouh7Xi9aiQybPD3Ap1o8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QOKp8eg5RFqjxR8NQgFDxjXQ3tubVrv6ZpskO0HSUF3hGkoYok6AKjHZF8S1QqYreo0bkHHFT0XAkxYx7SpcANsv7cAWm1TpcR9HmumUxY/aHwHd3TGKZ58616RjMaM2QKa5aum4SyRtacAbEux6hdv9JzpEmyyG98x+3TAxvcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6c6f47198e3so364766137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780566539; x=1781171339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPyZKtpWg5qnni2e5fD9GWWB7qem8w+cCv5HCayF8qI=;
        b=fomITaOv8MQHSUrp8bXgNHfNcnGO2usdd+quCN7ZsQxmZ033zgDP4m7pGWqAl/HXA5
         KoQHf05BD2xU1Rzzw7UGiKbw/CHnf0rErwRtqONfpd3MrHqwmiPFw7pCTYbp23b4Dnjn
         yet8/gfrkFhmnhndIz8z0dCozvbQRXCC8KNK8yNYKj8XtKj2cwWBO3T4eK/KkVzbcBdS
         4sqkMHhcbbzJ4sGgkCHfx2rUa1n7K11JG03+Ip1grF5RVCSyGRK4uWbidWk5CRj7Etnd
         3Cl4XFh3EcyeHh5fSX3rz/55O0YNNCRAD33GfVd++sp70VPUpR6RQ3CcwZ3bWHHTusKb
         wMJw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZX3IKDCsofi/udG+q+Bd5ON4XogiEerCm4WQB4xvVvbuLC18sH+6rQ4V9XxjgaioDO4giPUGbEogQ1Azn0mBm9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUVWZgBfU50BEL5Acc3QXYryVPoPFyKyegNeMBm0ruTBSi++nI
	il8JemFUXT/ZvXB8Qn9G1k4RWGudb5Ns6NmtptugtbUsYLWuTGbJ/272m7lKJOEnZdE=
X-Gm-Gg: Acq92OHOi8k7gUVlUEn7GEcb5bSPvswemsAf+tSPtQZuIIw8V/NFtDf3nbA1ofsmXk8
	fWBJRmBFLSVcVo5kOcrGyK2udZLZ0Wp4iDWkgkh/pQqkMKgh1WQqERusXtU0wZmfT3vevwIhzYe
	jFmhvQFWGAzbs6fVihmbFglty4tOk7gVFCEBQm6PUZQ8PXgNZyn15ymDPygVqfQMk+iVlCEc647
	VIFmyifVSM8+ARDpq1rlBuTRE2DkDmqp/u2hXO/2RMZ8hUnE2KlQTqK7oXNuqo+b6utcF94zjPs
	KBsYjfrTvB6lP0xL99tYHdtJOkbDlA7lA3T/OSrt5Kz+C889FBOemSyNpfy1eBVqJz4onnB6lyn
	gBpe8T61mho+IRIrSEZU7Ox2mSPthAtyrXOKvpp/VCvLXN7dP72jjSAfq7hj6/BnfXu7dbrrG44
	SIiFDkGe1Aj4576oRP8M72vhtWloAH83sgJJKB1HW7C9ud1dbdQ39w5hOU8Spa3Rz+erSeubM=
X-Received: by 2002:a05:6102:7:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-6f5512f0f18mr1020657137.19.1780566539392;
        Thu, 04 Jun 2026 02:48:59 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96414156385sm4003362241.13.2026.06.04.02.48.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:48:58 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6c6f47198e3so364736137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:48:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/n2ftk0qzdFVtOgc7IRxbelfVK/whe6om5kF6MdRvpKj2lXCJqUUBV6n4PIpw7sXm/7rrHFJDKPs0SH85yua8Z8w==@vger.kernel.org
X-Received: by 2002:a67:f889:0:b0:6cb:b3db:c31c with SMTP id
 ada2fe7eead31-6f52c84f821mr959856137.0.1780566537239; Thu, 04 Jun 2026
 02:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603151642.4075678-1-claudiu.beznea@kernel.org> <20260603151642.4075678-2-claudiu.beznea@kernel.org>
In-Reply-To: <20260603151642.4075678-2-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 11:48:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
X-Gm-Features: AVVi8CdhQoz1FuQPTz5BSOMe5fOJfBS7YW1L8CNma8uYS8HEHOx4e8eahLsemts
Message-ID: <CAMuHMdU_T=G7os6KBG6xTnphnhQ9pQtd88BUkg61S7286bZmFw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] pinctrl: renesas: rzg2l: Use raw_spinlock_irqsave()
 on power source update
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 17:17, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The rest of the driver uses
> raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore() for locking. To
> avoid concurrency issues or deadlocks, use raw_spinlock_irqsave() via
> the scoped_guard() helper for power source updates as well.
>
> Fixes: bbe2277dedbe ("pinctrl: renesas: rzg2l: Add support for selecting power source for {WDT,AWO,ISO}")
> Cc: stable@vger.kernel.org

No need to CC stable, as the bad commit is not yet upstream.

> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
