Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF54254EEAA
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 13:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872697; cv=none; b=QlS9TsOoQt/6DeK03XtO26Gk25DuD0kH8T/vUeih0rHSY+rZdl15r1tHej9g/UZ7AXnNuv4VtAiQqBYqJ9ynpBVwdPccZvSMKSvzBH54KrjVpOKSiv8pFvFRaGtJR3zWrgaIF6FkRuVjtFQWtXuxEbPV/0/w915bpzE6XBYtEeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872697; c=relaxed/simple;
	bh=MqL/Xkqtt9tuAW8ouTIoqFaGI5c67z7vZomae3ZWfzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2i4fbv8dwJWOoHNEdEBTn3q+fdWBjtKOB3PWnrU/gV83O12YfVnISZANvme/94LQHgjwYEvWIRykRa5jCM9sU4vXjShpVw9Dw2ERn7sC/KnhhWgIUpgZfVSAZcZGhqAqEGt5EgW8g+oloPRhXGoB8aMLu0SRLdYLVJGqItySg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c7afda4515so2650842e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 06:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872695; x=1789477495;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6D5/u0iibTcmvkK52s1OWfcUGM+MqNy3igZLyyuUE+Y=;
        b=huRZBozizE+gvNA6CnmOTViXfDLuQuuLULRXVw3aHKRVu+ldQd6KC7vu5pAW3E+PGG
         MFZoc6cv0SXGNuug0ZyYIfRCvGWUegZ8K7nZOzt1rl661jnrbI58bNwe8etlgj2aXAkb
         qGl3Ok2FawGQBg+5L52P+XJUOsLbKN0HMd/U5fWAfHClOuSVBI2LKKj8TV4uFhwIjwX1
         5KKzfR4M73zTzC3AbcE/Lb9eZZYCJEU+GoF6/6+tZi4Hl1gy3a9rDOu2CVYPsjI3dljF
         L27EtG3sB+DmpS6Uv26ZzmTgtejywqd2c5ISUOmSnInCct1swChgiF7vYTLw+fTlxOiT
         N0LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqDg6X3l9FIFGH5QUziyrXjOz66D9Uxw3B/rdS+Q92CVrLJFTEe/EkeCCOb/EgU9HtSMGvleK/TtE4Ah0oLAw1aQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mjf2FAN5xwHFLEPw2lN3lHolDxgbsuOu5x2rDdUqJmGKbq0bTU
	hv3OZW5lQ5rnHoY7a+ofvNlOkZLZIsD/zuNrf8tNA8HmIdZZbqH0yh8+RompQReA
X-Gm-Gg: AYBFou1YcxjzJnXdovSzDnF+eRtDBdLE4kH7QAzI4DiBb/6IpxeuXCDD2U/Q7J4N39F
	u2CMKMS63FDXudlAE5TJO+xdJSRMnReJKwIopwrbKjFwFHLBkjpjAKByOGsaxCUIpVXyTFb6Ydh
	hLePScWrw+edVLUZXRL8NjG2hv24mK8mbB1yt43BwfirQ6EWtYUOuXSTXdygtSLT6DNbDYtYFtY
	lP6olY6Bic68wPC84t4aWbzqsh3KtkAb/c9dytRAqOHBfYaDl5Vqgm1ZzM9jWqjO68PBSBZaDHv
	099EEr6q+WCC9KlH+R+q6xzNM4TxW0RJXjBX/WIetIMcxLzdLdfbddQdYGTGKpe6re/uTRyWI+R
	483JmPuTvucrKIOV+AWwkUwYb33TPRJ+d2gGSn3OeZ4Ud1ht2PuiYhH5X0NgW1xorEY7/0Cd/Ty
	ZgBEcEuSsA8KC/xSnycZjv6Ip4rU9OrQDtKH3Ik2cShcimhydc9cDJGRa4gPFyrfiDTJ2amDjzd
	hGRcTAs0650RtPIRWgZIM6MtQiJxg==
X-Received: by 2002:a05:6122:32d6:b0:5c7:a3a3:a4bd with SMTP id 71dfb90a1353d-5c7ed3a528fmr12874842e0c.4.1788872694545;
        Tue, 08 Sep 2026 06:04:54 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98280a3aeb3sm1339265241.12.2026.09.08.06.04.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:04:53 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c67175d176so2060478e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 06:04:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzJ34ATOhXkxaQVkTUNnGOr46fCDrca3WffDIS+2CkqhgptUWAYAo8DqsX9ZYLneNexHHFQyQR2m/rqKow4Yx8HGA==@vger.kernel.org
X-Received: by 2002:a05:6123:2c8:b0:5bf:b3a0:388c with SMTP id
 71dfb90a1353d-5c7ed3e2247mr13571554e0c.6.1788872692103; Tue, 08 Sep 2026
 06:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-10-biju.das.jz@bp.renesas.com> <apAT6qiBpkum_SLc@tom-desktop>
In-Reply-To: <apAT6qiBpkum_SLc@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:04:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOhvYhWzq5_ifi-bmRmtm5X59CnztVqqpJJ3yiu2G-OQ@mail.gmail.com>
X-Gm-Features: AcwNN1X9WPT8W9e8Zwg8bWnxXuvgHZ6-hB9cMhTXuxpji9ryx29w07MWZ9A5668
Message-ID: <CAMuHMdVOhvYhWzq5_ifi-bmRmtm5X59CnztVqqpJJ3yiu2G-OQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] arm64: dts: renesas: r9a08g046: Add vspd node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 12:39, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Aug 26, 2026 at 06:48:43PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add vspd node to RZ/G3L SoC DTSI.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > @@ -696,6 +696,20 @@ ssi3: ssi@100e4c00 {
> >                       status = "disabled";
> >               };
> >
> > +             vspd: vsp@10870000 {
> > +                     compatible = "renesas,r9a08g046-vsp2",
> > +                                  "renesas,r9a07g044-vsp2";
> > +                     reg = <0 0x10870000 0 0x10000>;
> > +                     interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
> > +                              <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
> > +                              <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
> > +                     clock-names = "aclk", "pclk", "vclk";
> > +                     resets = <&cpg R9A08G046_LCDC_RESET_N>;
> > +                     power-domains = <&cpg>;
>
> Same here IMHO we can switch resets with power-domains position.
> Apart from that LGTM.
>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with reset moved.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
