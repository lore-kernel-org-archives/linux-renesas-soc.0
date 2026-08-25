Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8181D423EB0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 12:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660571; cv=none; b=erq3wcIpF7Mn4jzK64A/riq0dC+p7MWFHFMeJZuOImUEX/kCXSDU1NSb7MZi6ggFen1rt49n7Q65/zM+qCLVt5Ug9q2ltRqcGY0PjTXb1oZKiDYvngsuh8dh+3DX1sFJ5Ftfb9HCF1nGedZoj73WFA2MRQ+U87H9WMzCYFOyWqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660571; c=relaxed/simple;
	bh=OUYygWY7aQGmv+jfkKR1zFDlp2pOpiZEhWzRuVbqreA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WftYJDiM2MoxFXr40Te/qvJn1d5SHPXinjXup/t1578FyUyl10n6XbEGejdt8Ekw/gjN+SjQw0QO66UO5X8v5k9D+N1zx2KfXR5pFngFHNjelRAC3vWL+iMByC3HCJyBmaCubGs8x1qJ+FW/JV+3hzJBY4E+82J9uldnRTx15BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso3609788e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660567; x=1788265367;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CZpygpxN73GFJ3Yc0UcEb9bbZeeC/y4ziSdhkJEluzY=;
        b=bbZH2+TkXiobReYQYBHx8Ly7UkGsJK8vk6LywOWvNqwH43x9BNr3tXWzHjeo+3t043
         PmO0O1cB5VuSiGimMSD3ffxVMMVeXvgVPJMgKfR/9qSMYcGGApcNDfkPabNpqFwXLOo1
         9awGbB+TXD7LERRKqMXPAsDistxzSovSB88Vk59Xqv8tp0jLK7V9PjJWqPIXjbbTj6mV
         fjJ/8uHRO6icdUyjBfBdeUPYjBJ8xkIe+yAYWvUAOaAL1XE6DTBbvxPh+5c5T+1Rfi88
         p/OgfeQThu6Aa5ZNEnpLJZMmM+6xpatPXtGJKrp9a15tVvBqjORkLOIrSMAvyipVqy16
         Wb2g==
X-Forwarded-Encrypted: i=1; AHgh+RohYn67LyO0WXttqAk0ttE4FBe6M7cPGfdaVesHJlqjB3Hgb6fdKFGWhP3NY1tIRlFUcXLPxCra13eqiB0OYQbtJQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lQhkHef0beXTR7GDSdXufy8SV8wjV1lRyaC40VcnUa3ABJ/+tT
	TViCt7lMNIxFt85kM7n6RZWJOYrM4ee1Ddln44sg9pbjpYg0LgnVE2PBHvZIa1YINF8=
X-Gm-Gg: AR+sD12Rc4YretrOVi7y6+lQOhBOAeQp+UPJxCtUz6MXKctbF0c06cGbAav/zH1BE5g
	8KY3m3CXMGF6d0eoBZ5fXlICOEdykWZUS4XiP0ytxny0XRoY6pUpNtpDHVf3qfrXoIISfLV7J55
	ojbsYgsqm5hhlciSOa9cXYhVAbAIuXFqbdzqTbeVoezkGWfPm88qnjcCvY8tmi9wXmn2l4F3SjI
	20Ykn/KN40L5cacbySz8v2tgGy7B+vmmE+exRiIoCut0CqCqztuFnk6oEuDGS4l9RtFTgTn1Hwf
	WneLj9mG2SMgV/xFNf8a7GBTvPIiJdAuOt5bqFtj0S6cO7Q3cXdnVJkjiJ0WiamVA4QWM8Sp4Lq
	ov4gWeVx7MICzcdrByvUsjACti2oriNq7cl6C1P+6xRTLNbwaZQ4yMIssqegR9/bjAMFBU2qUnh
	C05YPSm7EIedo5+lalQzBucEiAOX6QLpB+ZloixupCgemJds0yyNBJuU1z5i+/NmlaVXrpD0iqP
	b+8tRQFWU7FWAjuFD7uC0AU9gDjcA==
X-Received: by 2002:a05:6122:3306:b0:5c2:acd2:5b44 with SMTP id 71dfb90a1353d-5c642ec21eemr3034356e0c.3.1787660567483;
        Tue, 25 Aug 2026 05:22:47 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c632e87d61sm4297101e0c.1.2026.08.25.05.22.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:22:46 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso3060485e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 05:22:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrjF6gi2pJE7UGFl54saOl564oEPvw26USjUMLxogujCjOCD69wegJFJA8BOIkY94ale5puVGBGe+Lvpf9s32YH+w==@vger.kernel.org
X-Received: by 2002:a05:6122:1354:b0:5c2:c0b2:9880 with SMTP id
 71dfb90a1353d-5c642bdb0eamr2454179e0c.1.1787660566483; Tue, 25 Aug 2026
 05:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260824075936.2904336-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260824075936.2904336-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:22:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWc5NXsNcc0AHQdpTFJUsNEpQ=aFrGAjAL1KSq6S2UCvQ@mail.gmail.com>
X-Gm-Features: AcwNN1VrcsnJDq8cs0fem2pESjSMtykAAddgNrgS-0md2cMIcsry0z-8mFdrvHE
Message-ID: <CAMuHMdWc5NXsNcc0AHQdpTFJUsNEpQ=aFrGAjAL1KSq6S2UCvQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g087: Add RTC node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 10:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add Real Time Clock (RTC) node to SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
