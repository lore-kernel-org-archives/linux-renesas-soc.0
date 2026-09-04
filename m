Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B521EFF93
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527155; cv=none; b=OTcJxBop0jmvNCZxrqfQEO/mvq/IeJ4QrSy2EyaqFJ3+91wENC1w20lgSHa/m9vgd1U2ofpzMaXpZxnpiKnr5RsSpu7TjXuuix+NKvwHxTrMfVsSMLHiiP+KPP6ViJsoxyl7g/8yRuMpbXU1HpDtZ7h1QGo3k6zWwotitPHPQ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527155; c=relaxed/simple;
	bh=/ypz6zJjPNKfNpTn4drsgfOEfmGR4cl9pbI1Kxi8oLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XCd1IYXrfd8vg8dLQhGsVZQ5MHMDJBSdDYE2jSXATDRwprRCejlnbNgKWO7FouM1mcSt+gAyOFTM4YVG9PAfL293o9fzaBhMY50PWSSitL6/pPdo3W4dJ/OX53TXR3t7480HL+VSG6wKcPPQ25oMobeI6mCc5YLzjHdXKfDxsV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c7d4c663e9so805810e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527153; x=1789131953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8NOF30mvWowB029u1n+aELPP6OhCTftCoi3R2I9gbMk=;
        b=THwO17f7bkGufpMiKKiK1hHlCL4/yaeGsmHKPwA4fTyGFBe/Ggq9OgC1gPldIsenj3
         xyMqeVL8tyPC4hfNkn1hovS/9+o/Xj3raLIM7twdKIuAXbenxPo/ieTNOP+p/PKtbPDl
         4JSIrlYt4cIQIc57DuZ+7eXigzlcnM+c5GByqo9juKqy2pKtLXyirU4vVKsCkqKqKPyF
         RY/mJlmMJp5GQIYsHlw88pc6YvjoixczFb/bCVtp0mv7GFlfrzvB3oo0X1TYsMct/6Ht
         2fM+bFU1IOKErrulcnXbfv0neXKvuDOKNxlCvTe7lutEiOhO+RUSbZNxBtK4OsiYNk8C
         HBug==
X-Forwarded-Encrypted: i=1; AKwUvBwWL+++tBP4VEdhxbWG6PR0/yFW+taTnA3PfGYXVh2AnzKUWZAWCHYpjZgX22z0UoIbgfwTx1boF6XPL+9IWoxOZA==@vger.kernel.org
X-Gm-Message-State: AFuF++lVD363Bu8SDU97OlRX+cc1G0FIDjrZ64hvFkiEO57T/SkyGQac
	kInEi/BzJ+EqmL2cYpOZgvRqwa6QNlc5Kw13Ms/sp/x4V5vrk1qfTWIJHm1mecqfv8g=
X-Gm-Gg: AYBFou0gNfP/NHpDwA4v5sOAaZiybmPdW0z94Nc7/9bUrch3q1Jx3Q1kNiEbumFinf+
	y4WklY4NITvZufdPYFLyPFvycliohFpPqP0Rb7sfYRb3CFFvHQ13DPu2tcUJrn1VlZ+rS/pOhOd
	FrBkpbvaTFHkKB4KZ0+oeFhcAx212POQWKQB679ueabIPPl0K/iKJgebyL+CdSe7QNwzMH2Evyc
	JPqqvMqC702ytRNnmoTfsr/y3zbARdgWbwZ7YIonG0U4lCSngNhZPpcosLyrkmAgSV1eh1Noapq
	kOv5FsgQp3/ZMRFGgQrBrPAKLzMQ6r5ZuVQT9WxViHV6D7pKC/bXmRnIrvz+VrfJyQU7rSe1x2h
	R3KP9tpnBv6nCTFU61wB6oOnHA5vrdpLj3cyFxmxiRl0AaG9X+Sdnoa1YM9deumFTgJgaEsEFX/
	+F/K93HdJDcwmkk/jr+FjOxAX/GoceDkutFVREpPKQacr7QwMyj38GKOEqlV3gGFXB/G++gPjKe
	VeLsSNIrfxRKdmV6FE0HBKOfw==
X-Received: by 2002:a05:6122:c8f:b0:5c6:4bab:4cb2 with SMTP id 71dfb90a1353d-5c7ed80403dmr2545964e0c.6.1788527152707;
        Fri, 04 Sep 2026 06:05:52 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3874acsm1902455e0c.15.2026.09.04.06.05.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:05:52 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97bf90f4b41so590272241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:05:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz6W3ffW0C3gvs3Q8B/BV9Koqzv0go6wxc0nzdPXcjkMEXUBZhAIXiar3pqi/VMRnpFoenXQ+VGP+kb+dsCfx9WVA==@vger.kernel.org
X-Received: by 2002:a05:6102:290a:b0:785:f288:c23 with SMTP id
 ada2fe7eead31-78a4a918bdfmr1975845137.3.1788527151892; Fri, 04 Sep 2026
 06:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:05:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2NavSY5K3Em4jTKuiWCZCc+XOWW4nH4HHh76aoiuWEA@mail.gmail.com>
X-Gm-Features: AcwNN1VET22qEnErTI_Nd7aROS6yUTveXM7jVaLpauOVguTdNaHuyqM0FX-8ExU
Message-ID: <CAMuHMdV2NavSY5K3Em4jTKuiWCZCc+XOWW4nH4HHh76aoiuWEA@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
