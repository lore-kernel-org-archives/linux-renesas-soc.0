Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E2E3A48E6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782123424; cv=none; b=oRq8j5XagsJeGjAJ6E8P+ZXV3gqGU4qxeVR6nfwQ3DAQtZytoVgCG/du/GzX2oWp+kutc+8pqnzvGpTeNMakn8ie01ftqBtIwPic7IYLZ3ATdWitMn/81uoZzo2y+VjhdwyBF3mNjs7B43uc8xusNnHQfsAwnsTqxYKISOnHEAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782123424; c=relaxed/simple;
	bh=rF9MBMecl2KEOBvLP7nqkUZMnynYbMz7Qmy4vIKnXFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4LIMfdo1u6Pm7dwE73Z5EyHSvW4DuLq6R8RhJ1PWnYtTKoZfQ1sBjCYhYFcgKXCnU/KXMbkeGkxoMn+cWWmdimQaku4yiZA+KTer1kfg5VfP9G7zDRTVchf8GNSsfMCPv04ZiEQRrOPhAUM7fK7ncsjJ98l8XSvHCIQ62B3iO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-59d07df448bso3202760e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 03:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782123422; x=1782728222;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZE6Dqpb/1jL1qyrKK5dTrMmULFcUq6fRF5GQUlTLM54=;
        b=cJLV0HQW00aN9Zs0goQ8OS/+QQEpoAe4nLiNWWHnNb6He4OhwqSRljnKoWizIZe2sV
         T0fguIpaHjvW9CrRHR7BK/wAe7oCrhxQI3xuGMByfuNkizEOZi9xoNwVwwze8Hl2dle3
         E1vj36xqgFS5uCHS7uDKsALk5aHIHbsZ55L2fdPvCsZ4PyO2TuY4FKu2TSD44NQwfiHQ
         PZ/Dq/JEamlHgMv6SLY5dCj+mCNwxY41swpU8NAdMo87uCNexUlg6XcZ0YMQZ/H0q3QK
         2LB9vDAIoJL6LhTSUTQoIqUXvN70KzAop78/lFIfNiv2rg29y+/IBUd+gAPYQdaT1RH6
         iIlw==
X-Forwarded-Encrypted: i=1; AFNElJ+N3zDdDKggYbnz2wpniuZqAI8auvQZavlJq5R/6/n5rEdZMwqJ1wMPZ4oxK2hO73hgFPmuSBVLXHL5fKo+YpNKLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvWScia0C9Apu2dPuz56t/LWvh/ZPlXI5qSPUSOuRFfZE4R3rV
	RA3hpY6eLN26aTXsLJ6ShW9Xi9uMsy7NZHr08ViF6dMZuU+6p++8DTo1oKErZFbh
X-Gm-Gg: AfdE7ck1MeoeWIS7/AjBAOninx2F9DMaeKvZTJhEWzoOwH9mhFGF/j7E9OVIFU+FubN
	t+UiiL+QdBd5vZLOgmVMBn8kHpmVffKU2LQr1gDtpDMwLSrFSe7JrvYqXpEYsW94PInDivuVnDq
	9DbZeO76QAKFMn/NUn91fIsbTeR/Bs0qsFEELGltfu2roXruslMV1WebIhdwbiqC9/u0t60l+wh
	gyhQ5X498PDcpxDq+Km8+h8pI1gRmeKQVqEKxVCK3PLkFdd6YpOyNH/wUmRAxxlbH5uP6WP1R9O
	BRcQQQpEVeEjLfZJu4zUvYuK//184/jbPrDLyAFQ5ii7BSp1bGi+2SAt9JVBc4IuCuAwf/Pcgee
	8W7kcKkYz5+je4oMdYFBnjgwaZDa9glGylVZv8rKPxEtREXbFrpfv2xPbDkNFrTlYHYNfbjARV4
	wAPKxgQjR92qa6rmSajEtqPJ+HiH2kA1UQ4K9VcAH5pVoG0gMI7w==
X-Received: by 2002:a05:6122:1c03:b0:59e:f988:51e with SMTP id 71dfb90a1353d-5bbebaefec4mr6387805e0c.5.1782123422136;
        Mon, 22 Jun 2026 03:17:02 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb89a95dsm6806183e0c.8.2026.06.22.03.17.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:17:01 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9670c23ca7fso962699241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 03:17:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8nkzhgM/Rfqh7epd16ZKOFUPBvpPvtYg+uHzHw+zQFM6Izh/qTxaRhuwzbQ0+W1No7XhoYhfS1LeB6/xrTkKSTMg==@vger.kernel.org
X-Received: by 2002:a05:6102:fa0:b0:6f0:3c5b:ce7a with SMTP id
 ada2fe7eead31-72a03545558mr8210500137.17.1782123421256; Mon, 22 Jun 2026
 03:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com> <20260610074702.1743334-2-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260610074702.1743334-2-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 12:16:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXquncHh8wxEF4TxKhJNyVB3rCqcGLVtipVkC_H0M2TBQ@mail.gmail.com>
X-Gm-Features: AVVi8CeEHcvE3XW-KNNE60oqtPnFlFK01RuCAZUrkg9U-_-leTNgXIWxLpkdWeo
Message-ID: <CAMuHMdXquncHh8wxEF4TxKhJNyVB3rCqcGLVtipVkC_H0M2TBQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 10 Jun 2026 at 09:47, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
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
> Changes:
>
> v5:
>  - Use hexadecimal CPG module clock numbers, for easier matching with the
>    documentation.
>  - Use hexadecimal CPG module reset numbers.
>  - Lowercase the SSI reg size: 0x1F000 -> 0x1f000.
>  - Extend the SCU reg region from 0x10000 to 0x20000 to cover the SCU DMAC.
>  - Drop the per-line clock/reset comments now that the numbers are hex and
>    the names are self-documenting, and pack clocks/resets two entries per
>    line so each line lines up with its clock-names/reset-names counterpart.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -912,6 +912,468 @@ rsci9: serial@12803000 {
>                         status = "disabled";
>                 };
>
> +               snd_rzg3e: sound@13c00000 {
> +                       compatible = "renesas,r9a09g047-sound";
> +                       reg = <0 0x13c00000 0 0x10000>, /* SCU */
> +                             <0 0x13c20000 0 0x10000>, /* ADG */
> +                             <0 0x13c30000 0 0x1000>,  /* SSIU */
> +                             <0 0x13c31000 0 0x1f000>, /* SSI */
> +                             <0 0x13c50000 0 0x10000>; /* Audio DMAC peri peri */
> +                       reg-names = "scu", "adg", "ssiu", "ssi", "audmapp";
> +                       clocks = <&cpg CPG_MOD 0xf5>,
> +                               <&cpg CPG_MOD 0x181>, <&cpg CPG_MOD 0x182>,

Please align the opening braces with the previous line...

> +                               <&cpg CPG_MOD 0x183>, <&cpg CPG_MOD 0x184>,
> +                               <&cpg CPG_MOD 0x185>, <&cpg CPG_MOD 0x186>,
> +                               <&cpg CPG_MOD 0x187>, <&cpg CPG_MOD 0x188>,
> +                               <&cpg CPG_MOD 0x189>, <&cpg CPG_MOD 0x18a>,
> +                               <&cpg CPG_MOD 0x174>, <&cpg CPG_MOD 0x175>,
> +                               <&cpg CPG_MOD 0x176>, <&cpg CPG_MOD 0x177>,
> +                               <&cpg CPG_MOD 0x178>, <&cpg CPG_MOD 0x179>,
> +                               <&cpg CPG_MOD 0x17a>, <&cpg CPG_MOD 0x17b>,
> +                               <&cpg CPG_MOD 0x17c>, <&cpg CPG_MOD 0x17d>,
> +                               <&cpg CPG_MOD 0x172>, <&cpg CPG_MOD 0x173>,
> +                               <&cpg CPG_MOD 0x172>, <&cpg CPG_MOD 0x173>,
> +                               <&cpg CPG_MOD 0x170>, <&cpg CPG_MOD 0x171>,
> +                               <&cpg CPG_MOD 0xfb>, <&cpg CPG_MOD 0xfc>,
> +                               <&cpg CPG_MOD 0xfd>, <&cpg CPG_MOD 0xfa>,
> +                               <&cpg CPG_MOD 0x180>,
> +                               <&cpg CPG_MOD 0xf6>, <&cpg CPG_MOD 0xf7>,
> +                               <&cpg CPG_MOD 0x17e>,
> +                               <&cpg CPG_MOD 0x160>, <&cpg CPG_MOD 0x161>,
> +                               <&cpg CPG_MOD 0x162>, <&cpg CPG_MOD 0x163>,
> +                               <&cpg CPG_MOD 0x164>, <&cpg CPG_MOD 0x165>,
> +                               <&cpg CPG_MOD 0x166>, <&cpg CPG_MOD 0x167>,
> +                               <&cpg CPG_MOD 0x168>, <&cpg CPG_MOD 0x169>,
> +                               <&cpg CPG_MOD 0xf8>, <&cpg CPG_MOD 0xf9>;
> +                       clock-names = "ssi-all",
> +                                      "ssi-0", "ssi-1",

... and the double quotes...

> +                                      "ssi-2", "ssi-3",
> +                                      "ssi-4", "ssi-5",
> +                                      "ssi-6", "ssi-7",
> +                                      "ssi-8", "ssi-9",
> +                                      "src-0", "src-1",
> +                                      "src-2", "src-3",
> +                                      "src-4", "src-5",
> +                                      "src-6", "src-7",
> +                                      "src-8", "src-9",
> +                                      "mix-0", "mix-1",
> +                                      "ctu-0", "ctu-1",
> +                                      "dvc-0", "dvc-1",
> +                                      "audio-clka", "audio-clkb",
> +                                      "audio-clkc", "audio-clki",
> +                                      "ssif_supply",
> +                                      "scu", "scu_x2",
> +                                      "scu_supply",
> +                                      "adg-ssi-0", "adg-ssi-1",
> +                                      "adg-ssi-2", "adg-ssi-3",
> +                                      "adg-ssi-4", "adg-ssi-5",
> +                                      "adg-ssi-6", "adg-ssi-7",
> +                                      "adg-ssi-8", "adg-ssi-9",
> +                                      "audmapp", "adg";
> +                       power-domains = <&cpg>;
> +                       resets = <&cpg 0xe1>,
> +                                <&cpg 0xe2>, <&cpg 0xe3>,
> +                                <&cpg 0xe4>, <&cpg 0xe5>,
> +                                <&cpg 0xe6>, <&cpg 0xe7>,
> +                                <&cpg 0xe8>, <&cpg 0xe9>,
> +                                <&cpg 0xea>, <&cpg 0xeb>,
> +                                <&cpg 0xec>, <&cpg 0xee>,
> +                                <&cpg 0xed>;
> +                       reset-names = "ssi-all",
> +                                      "ssi-0", "ssi-1",

... here too.

> +                                      "ssi-2", "ssi-3",
> +                                      "ssi-4", "ssi-5",
> +                                      "ssi-6", "ssi-7",
> +                                      "ssi-8", "ssi-9",
> +                                      "scu", "adg",
> +                                      "audmapp";
> +                       status = "disabled";
> +
> +                       ctu {
> +                               ctu00: ctu-0 { };
> +                               ctu01: ctu-1 { };
> +                               ctu02: ctu-2 { };
> +                               ctu03: ctu-3 { };
> +                               ctu10: ctu-4 { };
> +                               ctu11: ctu-5 { };
> +                               ctu12: ctu-6 { };
> +                               ctu13: ctu-7 { };
> +                       };
> +
> +                       dvc {
> +                               dvc0: dvc-0 {
> +                                       dmas = <&dmac0 0x1db3>, <&dmac1 0x1db3>,
> +                                              <&dmac2 0x1db3>, <&dmac3 0x1db3>,
> +                                              <&dmac4 0x1db3>;
> +                                       dma-names = "tx", "tx", "tx", "tx", "tx";
> +                               };
> +                               dvc1: dvc-1 {
> +                                       dmas = <&dmac0 0x1db4>, <&dmac1 0x1db4>,
> +                                              <&dmac2 0x1db4>, <&dmac3 0x1db4>,
> +                                              <&dmac4 0x1db4>;
> +                                       dma-names = "tx", "tx", "tx", "tx", "tx";
> +                               };
> +                       };
> +
> +                       mix {
> +                               mix0: mix-0 { };
> +                               mix1: mix-1 { };
> +                       };
> +
> +                       src {
> +                               src0: src-0 {
> +                                       interrupts = <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>;
> +                                       dmas = <&dmac0 0x1d9f>, <&dmac0 0x1da9>,
> +                                              <&dmac1 0x1d9f>, <&dmac1 0x1da9>,
> +                                              <&dmac2 0x1d9f>, <&dmac2 0x1da9>,
> +                                              <&dmac3 0x1d9f>, <&dmac3 0x1da9>,
> +                                              <&dmac4 0x1d9f>, <&dmac4 0x1da9>;
> +                                       dma-names = "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx", "rx", "tx";

These lines are way too long (checkpatch?).

[...]

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
