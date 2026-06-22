Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2917A3A4F47
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123599; cv=none; b=fG28GNmLntrliN9Up0hnqndG56J9gvyeKSbQyQHF/xH/N/FV50bsMKDSEn+U8A9ufM7cs7gYxl8lsTtCc1q8l8WBWH+EEwtDnulTozd+D3zhYo1WcCH/ffcjEokJntvMejATONT3N6aNBVeurdtbg1fDEH10Ocx2zQOEXi+6iYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123599; c=relaxed/simple;
	bh=6ud969rmgTywtWI+bBtRObW/ffl4TQi6E7dIGUBQTJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zv/V/qMAh9sW/Xq0160ijsLSMeGoWgqBtgRYbFtDH1nV9SufFPPpHRqbSUBd2L5juPJJ8O/8m9dy1wKfRtWhWU6aFFUjIejuNmx/HEpCDnUaAcZxItOWzNRejcaVVEYXLwsf6BDi5el2Es4joLGndr2lhb7NeYF3kZvqtucMPyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59e2b96e3d3so3375283e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 03:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782123597; x=1782728397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7C/nv0Z5Z7qVZqg+9ueiOKyHAs5rlrI+CCJKFNeXypQ=;
        b=YT3ptsaMZSd9ix/MLQX35U87MTmVnb3+gAoU6ZcKWbivvM+ERdzXtC9ONzq0i4y1sh
         eyQCeahmXs3RD93A5nf4JeA3vgJBzUhu1/3JESaEba5/TeHMKCx5B5Taa2hqzvW75m4c
         EM3oY5hL7T67lREL8+QUazdUqomvaa7TVkFvwc8zGzuCl2yg+WCv8WDRmSIQZKnkrmDm
         E6GZIAjW7wkmp7IgqZf6lYHxlB/1BT61af437kIpe6EkML2b+dtb+BYizylEM+U5K/fe
         5NUj5+oyAnJ2rV1w0RVeTfdvHsTY8SgMCb0+oO/XSY/J038G9wXgOdKXKtabPhoNvFEs
         Ytuw==
X-Forwarded-Encrypted: i=1; AFNElJ8vrocmmIYn3TXkwdAnDPFlpia+EoH1aDnatg7iy80BZM0LevkW9ZKfK4PdEzVsVFKsGFT7t03N0oEvrBTA+Um0xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKnnqWH7zfzlZ9+0kILRJ2BEIQ5SVu0r0wNHcT2ocCy7BdnAYn
	9oge+BHyCqS5COie6pmU4BU4qequGlrIAMyMLjjTwTL/PdC6gR1Buht3BxxqeReo
X-Gm-Gg: AfdE7cnR6+Arje4SjXRVXYW2WMvJSUinSTMruK1qpzVQ6bWrKpYP/7uwfzis1zLq2cY
	vjjzQqohjs2DOGodtchkznpHyXt/qt3rVP3VEDHGaaGRh4SdGtzB3wUSUJPInGGAmmANx2Z3hhb
	LIxEFwGT+yuCuWeMRWBX1kT1YrfRO1ifYmpeqBhzTFvx+/cRJlEiji+ocD0ggwztnemlo3GQnQc
	lSULenv9MgXL8Ti3Zk4+fvIcl6hxnrJND8vrsuiUgEGcRkwUrwmeHVebZEF3qDVoXn39tAZXUwW
	UuGdXUBHga+VO2s35Dhg7WtZK/4j5W8Vl8Mx02V1I/ZBsK2t4L8fn8z2WofoWmRaUIY325IK93L
	GmRjsTjXkRr3Y5WLjiq61dTzHmJvbq2d0ROjJgjlXXsZ1L7dxPPa3MbLPUEmPKPzmw4LpYPQ5yH
	mZjObp1FKdS6jnfHOOkuVzcXH5qF1ZP0MjufT31RGBBYuam+TtTK28Q4/49wIy
X-Received: by 2002:a05:6122:458b:b0:5a5:4166:67c5 with SMTP id 71dfb90a1353d-5bbeb9d208fmr5964896e0c.3.1782123597122;
        Mon, 22 Jun 2026 03:19:57 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfba73cfdsm6423466e0c.14.2026.06.22.03.19.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:19:56 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-96392241154so3209260241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 03:19:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+h9qMAm08+JtvXv0dJwh9mLXvXzOyLebyViJEEITJ7xuFTgIGyk15bSmIeOIMtedhvl8MOJ7SVcSbsRkl3e8ZrxA==@vger.kernel.org
X-Received: by 2002:a05:6102:508b:b0:728:89af:8edf with SMTP id
 ada2fe7eead31-72a1dc35643mr7908394137.11.1782123596658; Mon, 22 Jun 2026
 03:19:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619083951.3777556-1-john.madieu.xa@bp.renesas.com> <20260619083951.3777556-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260619083951.3777556-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 12:19:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVm8CjeBthANW7BCJ2+4jByCfVamwe-NGPb1YzZQy_bg@mail.gmail.com>
X-Gm-Features: AVVi8Cc4BYgeZ4BSzBgW-PDiqmIMegzDfp5P72yPB69qZu1to0ntxn4UKgrveb4
Message-ID: <CAMuHMdVVm8CjeBthANW7BCJ2+4jByCfVamwe-NGPb1YzZQy_bg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.madieu@gmail.com, biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 10:40, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add the snd_rzg3e node for the RZ/G3E SoC with all sub-components:
>
> - SSI (Serial Sound Interface) units 0-9
> - SSIU (Serial Sound Interface Unit) units 0-27
> - SRC (Sample Rate Converter) units 0-9
> - CTU (Channel Transfer Unit) units 0-7
> - DVC (Digital Volume Control) units 0-1
> - MIX (Mixer) units 0-1
>
> Sub-node names follow the new RZ/G3E sound binding: unprefixed
> 'ssi', 'ssiu', 'src', 'dvc', 'mix', 'ctu' wrapper nodes instead of
> the legacy 'rcar_sound,xxx' R-Car prefix.
>
> Wire up all 5 DMA controllers (dmac0-dmac4) for each audio sub-node
> with repeated channel names, so that the DMA core can pick the first
> available controller.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>
> Chqnges:
>
> v6: No changes.

So same stylistic issues as v5.
No need to resend just for this (every resend consumes review time on
my side), I may fix it while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
