Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD73485CDE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787670186; cv=none; b=bXa/BQHqqR9EqV3iqhT2ZFFPJGCSJ91O88qIPewC2qmOZnmDonNJ8SbaM1sVJlZM2AzfuaCBfJiT85VOaccOGe6iCJoewoOdN5f35yKcZ+WyATc2cZHAXTL70KUQMOtu1IE+uj/ZG1PlSTOUkEYLlX1X0V5/Qq5XoDjd5fqWtH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787670186; c=relaxed/simple;
	bh=Loh7CxMJyj/c0rgZ7iXlS8miTtj/q5VnJdY302NtqGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uhpdzh5h3R/gjUSxvEpGppOa4NU8/4ysASH7zdSmctuhumk58lucXAhHoE3TZ9pt7tfshunxb0dHPCG8/EEdgQrzBDtBcBHmWWEqQG4xa9+3uFrSHGl70Eu2AcuwolXcVXbTVXOuWR+i4VueEVPoo2WH32B2i+MDLdrbpC86+L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso8490180a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670182; x=1788274982;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8UDG6348hQ5hCNqa39+P1Xgwy7V8Kyi97ymwy69cGkw=;
        b=NiFNX3sV8jQVUdOopM/kjH0I5VnhiFj5A853XRMYsCzJJeS0sqKIYVFb4p4KSgsJX9
         HJ6boGptP2mEOrH3n3Y2UII5wf6SNJpngtL6mvxPMGO9mlVAotyUKG1wuZt8Icx3KvfT
         cP1Fy3Jh1V2R/DrGWNvXTX8iFK1AcKea6z8Alrd0vsXF7S27CHGL5bP82YTpEL2CZJz6
         ImvXNhg74TYVmeZht+djNDdM1hWszpaI+WLiiC8F3eI1N2CF05Moqm263992c5VoUHk7
         s+CYCdWV0Tn6IBI3RsmXXWAYdHesvsvVgV5hGFx3d3tJTVHF7ZdpDkB4Hcbr6j2+qqgK
         JAoA==
X-Forwarded-Encrypted: i=1; AHgh+RpNH2DT34KzzMUFWQGd200QPrsXyPnUQ6ASeFWbRd69pMujsvaCESdfoefmOADCqnc7mrRDwJELndAx+LHCWo4Xng==@vger.kernel.org
X-Gm-Message-State: AFuF++n4bhpsr3XxyBDZcvV6wSuCrvH4H3It5Pz6uYmGe9Ghbzp8CS3x
	PM78aUl/bsfOirC3BEWWWBzcQ4eEzf2ITdx2Ke8KpBmjiuhK+ZtRYJegtnOinBwTM7o=
X-Gm-Gg: AR+sD13jgxSPMRXRl2Nm9obo0hNA77eADm12wHhGZ8sMN0dNtZxipZtDc1kKpCG03ro
	plMBAzb0lpwkIAOjrFIv6sCfHBU1lV64MCxYMhFzcRg7l0WL5IKm/NCSrDL6BaMscM7spi0KFYf
	pTeoxLlaXusJVMzqoDEDrQNicbGksCN83eNuCQafjCuec7OmHX42QzoVm6DiVnQCSTRwnCC/Rr1
	pAg/MEde/kS4hr69eeCDjQ4mv/b6jrI2aNuZmaI5rObFWm4jGqkGwlKQlG43cUYBEGGqbpdDpjO
	/NbiAGuVG3kniSCbIdmU90sxXEbzkLR5q7ytufWHFCDMUbaxRcCieIZXjanKMAzkR7XWliTJdry
	CZrKjhj2/xTIhINJmBVzR+3QnjhPhX8OFZ6S2UGY4D0kmiKkyTSPY1bXDxnspNWP0y64iWNnITV
	IsZ2mhAK63f9oBIrzyp/LyHt//A9pRTyk3APK8r4nZbrunB/MDq9tTakOvR0ybdjDFtnZuIdSgX
	mm96eFcavJXsCr2DEl76Pg2rw==
X-Received: by 2002:a05:6402:504b:b0:69f:b347:a681 with SMTP id 4fb4d7f45d1cf-6a5c40ee87fmr8352321a12.4.1787670182168;
        Tue, 25 Aug 2026 08:03:02 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83ba0sm81149a12.14.2026.08.25.08.03.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 08:03:02 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so5371667a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 08:03:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RobExmrHYRPOVpJalN4XnAhqmt3usgwxtK+CHavdaqLgqlHBXOMJ5v9nzIYefDkQqV7/stZ5nkDqI6YCr3/2jjeZQ==@vger.kernel.org
X-Received: by 2002:a05:6402:2490:b0:6a1:f93c:f0a6 with SMTP id
 4fb4d7f45d1cf-6a5c4157aa7mr9125375a12.12.1787670181340; Tue, 25 Aug 2026
 08:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-9-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-9-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 17:02:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYyGci_NNG8u+erL+vGeL+8vUXBsZ+1gcaBq-QYFWV2g@mail.gmail.com>
X-Gm-Features: AcwNN1XuzkfLnm_UPDcmDBLz-Zu37ChvVAcOyLsURutDp-p8VMVRi7QPa69l3QY
Message-ID: <CAMuHMdWYyGci_NNG8u+erL+vGeL+8vUXBsZ+1gcaBq-QYFWV2g@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:34, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The two CAN FD channels available on the Renesas RZ/G3S SoC are routed
> through the Renesas SMARC Carrier II board when used with the Renesas
> RZ/G3S SMARC Module.
>
> The CAN transceiver on the Carrier II board has its standby pins connected
> to GPIOs that are selected through the SW_GPIO_CAN_PMOD switches. By
> default, these switches route the GPIOs to the PMOD interfaces.
>
> Enable the CAN FD controller and its two available channels.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> @@ -68,6 +68,24 @@ codec_dai: simple-audio-card,codec {
>                 };
>         };
>
> +       can_transceiver0: can-phy0 {
> +               compatible = "ti,tcan1042";
> +               #phy-cells = <0>;
> +               max-bitrate = <8000000>;
> +#if SW_GPIO_CAN_PMOD1 == SW_OFF
> +               standby-gpios = <&pinctrl RZG2L_GPIO(13, 0) GPIO_ACTIVE_HIGH>;
> +#endif
> +       };
> +
> +       can_transceiver1: can-phy1 {
> +               compatible = "ti,tcan1042";
> +               #phy-cells = <0>;
> +               max-bitrate = <8000000>;
> +#if SW_GPIO_CAN_PMOD2 == SW_OFF
> +               standby-gpios = <&pinctrl RZG2L_GPIO(13, 1) GPIO_ACTIVE_HIGH>;
> +#endif
> +       };

Actually this is a single dual-channel TI TCAN1046V, which is modelled
here as two TCAN1042 instances.

Recently, we got real support for TCAN1046V, so this should probably be\
rewritten, cfr. "[PATCH/RFT] arm64: dts: renesas: r9a09g047e57-smarc:
Update CAN transceivers"[1] (which I wrote a while ago, but never
submitted before)

> +
>         vcc_sdhi1: regulator-vcc-sdhi1 {
>                 compatible = "regulator-fixed";
>                 regulator-name = "SDHI1 Vcc";

[1] https://lore.kernel.org/2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
