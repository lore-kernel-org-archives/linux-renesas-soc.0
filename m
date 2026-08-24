Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7214334C9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787582189; cv=none; b=T89N2z5sBZhiutS6f1IJCrUSSDVEon1eHo6Je3WVyUE9788ZelUk2hULl//jHeaeQNmshSsgxRjBSz8Pi1NYSNpDDxt3w+wX/yTa9FhLNIRpLwe/rUzZnZj/Fj0eetVhDMpd74YbWF25n39QBxBlgmN05wiwWjdTB2r7WXzQTHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787582189; c=relaxed/simple;
	bh=euyYYIX9hGqmevRqLicy+2VXXvcJDx0K8piK2mzEcog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyXDjXFZHVTPsWQZKyAyx4FvyWwhfRa+jryJq8gbQ1DDYeBhG9xN4UnMle6Z1F12kL4DXyItQCNAVlRTUazvSABTPpJKgIsnzjcNWd8XYqi/a2lzFbKWtKo4GVs5uwlWaFuyM7YVTmWqwud9gOt3IIlhceVkqd6bEfXC4C5QQTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so7055817a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 07:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787582186; x=1788186986;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cjvRvnamI0/i77BPfHjgSWNkTw1kt6AokX8isFSnrJk=;
        b=jkhvIU9W07Ngrxovq8oh89iKqolBrt1eiiCcyv3A2BqgYj5J9JPJuJLpnvJu7CGrCy
         o2VFk8DEzTe1/7agUGcqdV6SCKg8YbAYPjSheLI9OzJN//Vk9vycINLu0H0HgRKQTbmG
         DHSLBbKukzWZtLja8/FY0jyRjvYjcu5s7DykK/yIx9XO+aSLKLO0JA9sL8HdtVLjOl+U
         GTWXzbL5TwDSwnLiHvYfEPuVROvigrza6Qxj3yamakJPB424KYJvWeilwT2FxA8buuws
         29b0ejME2GjgRUympSQYOMNHSpDJSneDlE4qBwYDuHUfhCXyD3GqNOy+dR2dMQVCnEEz
         WHPA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+89KRHF1hJ0GICavLFYgdajtYUmH7TlkaJb3BStO17As6VtVY5wVEORqXlhaWjKoWPhyAlw6rbIGkRh5iekuQtg==@vger.kernel.org
X-Gm-Message-State: AFuF++lgI8JTaK+kUnJh6BnQ4ISktmvDCAGrXtR1viT7KcGWlubkfNt4
	H7yfoL+R/M+/5vJLqN2jfUleAPQfSmWi1uRO19djE1Avui6//HRXcMePZyTHMwP8dzA=
X-Gm-Gg: AR+sD12ZzPwNMuQLyNrZtVWBKXvq0hEdDkIGfg4itgXA7CswXDT5qJVBQcnacX7Ga+A
	PbHxp0b6qUbBkbTRzKPH3gcfBmN+HgjNWinTRawr0sGauuiZLj1z7pEvxPL+9EneIBK7iPMDRbm
	TnXLSEiMb9tSFyu2Pw399MTJ53DoyhXZSqkXKUNTPwKdoIEnqNus2eFdZRIbatN8blskTz69SLV
	IUjmTgZgSuBbc1KrazmlDsgQm21mu/vFIMN3GFAvFNeWnAmW6NcFE+bq4GX9FCGNU1s1v9OePKp
	p7lpnBmseDIIc+Nhuz5b/ar/cupncwyOWld9w9NZ1A0AJ46CYo9m3z6ZDq5v1MGJENWEifOcnkn
	Rpkx2qqAmM8cgW6GE+9UGCsEf3RiQhsggVoA9xa9XZJCTvVyJJK0COpzNyy2zhhMndfNpQMsFon
	n3U7K0VPn6lvzruAQwH8EAx6NP64k1Tce1Lwd+OSlW3CkQKv9DmohU4MPAa2xpPE5l9SqPbc2vs
	Dv9QOON4SYqsLrjc7dE083ndg==
X-Received: by 2002:a05:6402:2187:b0:6a3:95bd:143c with SMTP id 4fb4d7f45d1cf-6a42f154b80mr31215401a12.5.1787582186429;
        Mon, 24 Aug 2026 07:36:26 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5b93f3acdsm2592296a12.19.2026.08.24.07.36.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:36:25 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so7055772a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 07:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoImPBY2sgduDwpLLwgLtT13GsHsAbKXTmBGGPEblAwB71E83oG6NzMGx+Ir7GgQeX+TYRR4V6r6zDPOWUwfCMS/Q==@vger.kernel.org
X-Received: by 2002:a05:6402:4588:b0:699:fbe4:16d5 with SMTP id
 4fb4d7f45d1cf-6a42f13c47dmr33276754a12.1.1787582185390; Mon, 24 Aug 2026
 07:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787062965.git.tommaso.merciai.xr@bp.renesas.com> <aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 16:36:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUAcrUbYV+_CFp5sZ1gQtn5eHzswZPvfZs=-=FX44DVg@mail.gmail.com>
X-Gm-Features: AcwNN1WKLbQoBhWyxHFoBVgNL35FfLUMj0SA3RfCuChNtnL3NS63UMiAsSuuf_Y
Message-ID: <CAMuHMdUUAcrUbYV+_CFp5sZ1gQtn5eHzswZPvfZs=-=FX44DVg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add USB2.0
 placeholder nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Tue, 18 Aug 2026 at 16:29, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The USB2.0 wiring on the RZ SMARC Carrier-II board is the same for the
> RZ/G3E and RZ/G3L SoMs, so the nodes belong in the shared
> renesas-smarc2.dtsi. Enabling them there breaks the RZ/G3L SMARC EVK
> build, as the r9a08g046 (RZ/G3L) SoC DTSI describes neither the USB2.0
> host (OHCI/EHCI) nor function (HSUSB) instances:
>
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:94.1-7 Label or path ehci0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:99.1-7 Label or path ehci1 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:104.1-8 Label or path hsusb0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:114.1-7 Label or path ohci0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:119.1-7 Label or path ohci1 not found
>
> Add minimal placeholder nodes carrying only the reg property.
> The remaining properties will be filled in once USB2.0 support for
> RZ/G3L is complete.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 25 ++++++++++++++++++++++

FTR, this conflicts with Biju's "[PATCH v7 6/9] arm64: dts: renesas:
r9a08g046: Add USB2.0 host/phy device nodes". which does add the real
device nodes.

[1] https://lore.kernel.org/20260812141940.246223-7-biju.das.jz@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
