Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788BA437114
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 11:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622165; cv=none; b=ktJgcCphYkAeXpJU3jop62dwhRfQE9jSR84gYEHjA4qZT5OAzS9vYjmpkM23NPnGfSWpnEErlNe15l6+qDbslN7QfZNNJv/Vseb1Dn3a+YM01pjZEmwRd4W3LAtGs2D8b2HVlZJPofVrSO4+xdA2KjhufDoG51H1XOCmYICh0ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622165; c=relaxed/simple;
	bh=Gh4FCROeFaZf1jW3QYsBpoEWmm3y7wrSPhPxJNI+fQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I92rJJTZYQxUnkOWO6lZM1V3CKX4OIKlo7TZo3IraeZDyBrh8aZNSPXV9RGgme64YVXH5aWyiv/BsTCIYLDrpRcEoTN6+YyN9ZHus7j9HC3doZ8Zy18vj8zwpa9Rx/CjcYWKVygnxpaWlAHMSeYltDDPEi3w7Zcm324Z38xFdVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-977fca41f52so960779241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 04:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786622162; x=1787226962;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CYB3iSUtjqKNSmgYUD8fg+WjonqllLzv5RJp+0OtOs8=;
        b=nACwXPvDFMFcbqs92JWGsJy/p8BT1GLf61YnS5tzkX/WRMZeXXiYpFNgLXU/YC3vCz
         PWYFVMwICtdOU3YOx//MtT9pTLxme7M8gZ8Z/Fhg5LnHGcYWB/NzvvKDFQxBE9LSnjTd
         VhZ+TMI2T3nRC6vCeYR0h4D7aCX2lf9gxpzQKBxXi0CNNEsukyw/uJf4JTP0E8hawwrh
         4R6UBvOrbl/CPfQTAOw7lUDdKqQ9oKIhB+xbrY4fg9CsXMC1w9cE0LCGAGeOnO5GeFkI
         LNeTQF8yLuNS5MGgvglmMx8V+4boQ8G4bjavoYmPxeoWSMdK2GCaGV+M5FsIt1N7UNQH
         5nwA==
X-Forwarded-Encrypted: i=1; AHgh+RpAE5HGIGqm+RHPJw9wi4+TRkHqQLxFhZ536JMRa2T60qTeHVMlDF+aJaplVMwI1FZqvwODuqmshykO2PzqwBqseg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQ6jVL2O5UBr4gz+5CBQVma/KaFO0kJAC9+tKGFnWsbhFJg4c
	wwaa6sygUJ9mdU3L3mAFcst6urI1iVnrSkTGs6mxFH/4ItqTjh1ACiatNW6XST+P
X-Gm-Gg: AR+sD10DFZt4hYrR0lZ744eGDQnSkxXw2tybYabMem4sY9cgV9HPngO6jg5q59yiXpm
	ePi/UTc8LiEgDlb9ONVdJn1a7wxfkGWn9/HLbMS27WFBOzTeYykLSvMCK3K54tnNNJmsr0FSc36
	BCsES+O1QlVkVPKLms9lcdS8afGx27ZH0CFZNLwpJtpylpUgBgN8nNEtELPPHhe07+HDmEft/UP
	NQsR4BN2j3Q1kJSFOGQBXMuo16A4MW6p/mZL3qvjImEMWNQ9nJ+GGUGcYmWWpqP9rQDhNJEWEiY
	YmrKA2nCNQesTSXTr7/lZFXgKEyw8HdEZu/CtEUg/DIXHX44mqkrcQYPfJJapOHQUL8ryTrZ896
	3fMRVI7hMpp0T4LueDcPPcsCFAnEGLvxPEty1dqQJzQvJb6AnsxmiLjec8K8EUI3pwdLIJCaFRS
	xZEC99G913HzXw2igF8skhwVuuDqWheqNqXBmtjfu8V0ycq5ajhu/gvWKT7bXuvpT4P2+Xj1Azj
	ts/AbI/A/RlT1tLkFvQhizBiw==
X-Received: by 2002:a05:6102:3f86:b0:745:6b08:c338 with SMTP id ada2fe7eead31-76db7a95d11mr1722303137.10.1786622162230;
        Thu, 13 Aug 2026 04:56:02 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97becc5ef5csm753112241.10.2026.08.13.04.56.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 04:56:02 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-969524c1a63so1349046241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 04:56:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpgFIhI/NeUVwo/mZPcLbGXzghqOQ9vQi6VNdLeJ4CHxg99RAtFpkaoFrhDpxD41R31U8qjr5dKPtai4mmSkaS3xg==@vger.kernel.org
X-Received: by 2002:a05:6102:1481:b0:650:94b2:b209 with SMTP id
 ada2fe7eead31-76db5784ab9mr1705726137.4.1786622161228; Thu, 13 Aug 2026
 04:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615115455.1412098-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615115455.1412098-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 13:55:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUrD22vs+HyuxSRfgrGqugoNp4wfvet-1tRo2qF_CsFzQ@mail.gmail.com>
X-Gm-Features: AUfX_myfnbm6UY7yoIkK-7C0m4oiXVacFM2N9TTPggfnS1Ryh7xr_S0ljIV4X3A
Message-ID: <CAMuHMdUrD22vs+HyuxSRfgrGqugoNp4wfvet-1tRo2qF_CsFzQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H
 and RZ/N2H EVKs with ADV7513
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 15 Jun 2026 at 13:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add DT overlay support enabling the DU/LCDC pipeline on the RZ/T2H
> (r9a09g077) and RZ/N2H (r9a09g087) evaluation kits when fitted with a
> CN15/CN20 ADV7513 HDMI transmitter.
>
> Move the LED8 and LED9 preprocessor conditionals inside the node
> definitions so that the nodes remain present in the base DTS. This
> allows the LCDC overlay to reference and disable them when their pins
> are reassigned to display functions.
>
> According to the hardware manual, the LCDC pins should use slew-rate
> setting 1 (fast). However, testing on the RZ/T2H and RZ/N2H EVKs with
> the ADV7513 HDMI transmitter showed unstable display output with visible
> screen flicker when configured for fast slew-rate operation. Configure
> the LCDC pins with slew-rate setting 0 (slow) instead, which provides
> stable display output on the evaluation platforms.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso

> +/*
> + * RZ/T2H LCDC configuration:
> + * ----------------------------------------------------------
> + * Function        Pin     SW Setting
> + * ----------------------------------------------------------
> + * LCDC_DATG0     P11_0, SW6[3]: OFF, SW6[4]: ON, SW6[5]: OFF
> + * LCDC_DATB1     P18_0, SW8[3]: OFF, SW8[4]: ON
> + * LCDC_DATB2     P18_1, SW8[1]: OFF, SW8[2]: ON
> + * HEADER_IRQ8    P22_6, SW2[1]: ON, SW2[2]: OFF

What is IRQ8 connected to on the display board?
It is not described in the .dts[io].

BTW, r9a09g077m44-rzt2h-evk.dts uses a mix of "SWx[y]" and "SWx-y" (and
tables), which makes it harder than needed to see which functionality
is affected by a given switch.

> + */
> +#include "rzt2h-n2h-evk-du-adv7513.dtsi"

In case of dynamic overlays, any conflicting pins must be disabled
first, so please move this #include to the end of this file.

> +
> +&{/leds/led-4} {
> +       /* P18_0 is used for DU function LCDC_DATB1. */
> +       status = "disabled";
> +};
> +
> +&{/leds/led-5} {
> +       /* P18_1 is used for DU function LCDC_DATB2. */
> +       status = "disabled";
> +};
> +
> +/*
> + * Disable SDHI0 as SW2 settings for eMMC/SD card conflict with DU pin
> + * settings.
> + */
> +&sdhi0 {
> +       status = "disabled";
> +};

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso

> +/*
> + * RZ/N2H LCDC configuration:
> + * ----------------------------------------------------------
> + * Function        Pin     SW Setting
> + * ----------------------------------------------------------
> + * LCDC_DATG0     P11_0, DSW12[3]: ON, DSW12[4]: OFF
> + * LCDC_DATG3     P14_3, DSW18[5]: OFF, DSW18[6]: ON

and DSW19[3]: OFF, DSW19[4]: ON?

> + * LCDC_DATG6     P14_6, DSW15[8]: ON, DSW15[9]: OFF, DSW15[10]: OFF
> + * LCDC_DATB2     P18_1, DSW18[9]: OFF, DSW18[10]: ON
> + * I2C_SDA1       P03_3, DSW7[1]: ON, DSW7[2]: OFF
> + * I2C_SCL1       P03_4, DSW7[3]: ON, DSW7[4]: OFF

I2C_SDA1 and I2C_SCL1 are exchanged?

BTW, r9a09g087m44-rzn2h-evk.dts uses a mix of "SWx[y]" and "SWx-y" (and
tables), which makes it harder than needed to see which functionality
is affected by a given switch.

> + * ------------------------------------------------
> + */
> +
> +#include "rzt2h-n2h-evk-du-adv7513.dtsi"

In case of dynamic overlays, any conflicting pins must be disabled
first, so please move this #include to the end of this file.

> +
> +&{/keys/key-1} {
> +       /* P18_2 is used for DU function LCDC_DATB3. */
> +       status = "disabled";
> +};
> +
> +&{/leds/led-4} {
> +       /* P18_1 is used for DU function LCDC_DATB2. */
> +       status = "disabled";
> +};
> +
> +&{/leds/led-7} {
> +       /* P14_3 is used for DU function LCDC_DATG3. */
> +       status = "disabled";
> +};
> +
> +&{/leds/led-8} {
> +       /* P14_6 is used for DU function LCDC_DATG6. */
> +       status = "disabled";
> +};
> +
> +&i2c0 {
> +       status = "disabled";

Needs the same comment as led-8 above?

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
