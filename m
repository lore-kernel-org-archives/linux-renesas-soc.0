Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707936;
	b=3SWSYd6JwxliofFFZHnV2nY5MVvICGE0kQA5JHWBKRTBRvmPzpdzMxlm8GMtc22/OlKM
	 DBFRqwhJpfDmYKtklxH4Q5M5iKqWfcn3l2LE2254JkpdQ1HdNTmLm1UPDvMP9C2w1zz5c
	 lc3orFf5qVdJ3xbCpsCldm/5fnZuRk9sFOxpf1/F/FCqU+8jlu4nF/6dpAPZi44ewCG7q
	 heCglwqiUATlmCL33R6Lyz6q/ZzXBxwSqT0jpLUSkAIB4WzG/IpzrIpr90mLPA1HG1yX8
	 nPj5AODMeDpEms6vEoOkwUNhVb816Hm6NWGcDO1rPAkNkQNEDxn+RzleW5E+ZocyOSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707936;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=HYHQpE1qS5H14Gep8V33fXeQq629sOdOJ5tH0yp4xMg=;
	b=ptWxoeSF1FcGCxF/uxKna3d51ZKGXvQRGswK/XrznjkRo/NsWRWHrIR15XrWIDegN508
	 03PrNITaWJwRq9+INiMe54mPpkfuZOvoDoRx8zibxQNf2StsK1Odi/CfqQNF3kX5xYUHy
	 ryyftQfctlYbacRrGRN6tQ9jLbSCsLnuu0N9jtsQn44HnRCc9TVi2kDeBLpHvkSkUGyrx
	 sPtNDmjq+Z1Pif7nEJ4OAlR8A9rIV5OwbUAjMKrNWDzegvy/sjTj2VWBE0QLgXAinN7mn
	 loqq0qxyxXa7JSrQ1fBUj+Xr6q+BnBHb0tg8XeGZBWxmkY8q7kqhVMw/usV59Gjh1xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF458606A335
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 15:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF458606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f20b304c0so641435385a.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 07:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795707935; x=1796312735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HYHQpE1qS5H14Gep8V33fXeQq629sOdOJ5tH0yp4xMg=;
        b=RSnEJFGUpyiohs39LPeGh8VLZM9ekKhdS04Vu1Rrpfjx5+Nn4aAoSUprD6eN2wfkSF
         LyyJJvlkgVVrLq1Cjl8nDF4srYSVHXZJMpusR4nr41YxGGwnDHVSdncxhgwQZeHRisSy
         seRngwJ0RJoCopRFuml7BAkczIaW1ZI31HvaGmzSbKMG3GkncD61JlhsThZz6Ff3CD+R
         ZWw6uEgVjNGTaupJo6nyKISdFjjUoquATZjHjJzzKWriFFKpXBMwFnxKv0hdT1TCKYVX
         R5RXg87AIFugDD5Fhm68pr6xGNe63LPTNdFekeN+SMQUVncMKno+EUSgEwhZOxFrEviE
         pnJA==
X-Forwarded-Encrypted: i=1; AL+hErG3e/xXbCLNuKCem/ZpMYRq8s8cgLgFmBx6ix4Hnj9KsdOr8sJYxPi5dz9jTpHDzVIlYoa7vfmIoXp95nrr+SDNvw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+zcNgjU39we3gmhxRWzaSShjuce0PJqwAdtpCAKrVTXAfMT/k9
	xcYbQ9zOije12Zc4UhPkWaJ/gL0jRuTaVVSVDZP2S/KoEq3kUpzmGqoS0mCViE/r
X-Gm-Gg: AZFdTZdPLxC0V6JDgzETOqm8OjKCtXsmpZr3/SdbEgGn6Upgo9S37IXOcbK0h5HkN5K
	4iRQU6IixOSfexxI1p5Fnb2Pf2gx0HuOyNjHzhZ/A1oktHvwjOQuGxzHsaxu4sALfJm8KI3S6Ej
	oAklAeyqq+7WytaqB93c0mSGobJPJlj9vUujClUSW1d4v6AEsouBZyrT/bxvOvnwU8lu76Mabhn
	me7c+GKkSt0VGWWcKQ2ArcEIDW0fDwIckSZZerdUTEL6sPDRzV0iS0Bq+sgDAT/jj1JhRIzdVVJ
	ztrdy429+C6mDXQZs7Gxb8EhDrW11UqhYoTfoWlseYVDOMuXgZ/r0TfrYd4/UHPOhKUgJbJc+Sa
	+DVLbBc04FRD+SN3eVCQtMpnTHwWKWAIVz40rbCBb72xI8Q4UoXH9eFjKghVvDDP8fF7q8dXt6N
	n0CF5QXsU5fwd1I8k09cOITiMEZLA3tN5UjdSBW/bclcMN3ylE1U87tpl38sn7h5X2tVaVq74qv
	H45xbLxVaNHO+MFBfnKsX09jTYrEaZDj1oB7taeogEh68dTUa8BEcu6zBE09y3pxgiXbcH0bhoq
	p9ZwnXBWkRdf9fHoXbtveWP5fje5BOvIrHg0TKnSsw2E9QJjjpZRzE+YOgzr9FTUUlE=
X-Received: by 2002:a05:620a:8395:b0:947:ae4a:ba48 with SMTP id af79cd13be357-949baa0af75mr3651768585a.56.1795707934583;
        Thu, 26 Nov 2026 07:45:34 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a0189dbcesm552940385a.13.2026.11.26.07.45.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:45:34 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2eba2b74aso4041185137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2026 07:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEOxi2stTMK2OLTlTP0PUgYieQf+P051LaFuB2I+hB/x+JRsYu95ip//siNBnpBLUnsSl6SSupOiiTzTUFCweSjMw==@vger.kernel.org
X-Received: by 2002:a05:6102:3593:b0:7d2:cf82:1a5f with SMTP id
 ada2fe7eead31-7d7395d2150mr11590021137.24.1795707933875; Thu, 26 Nov 2026
 07:45:33 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-a5d2ff9b1367@renesas.com>
In-Reply-To: <20261029-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-a5d2ff9b1367@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 16:45:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJ3=ahkor7_5bTBJ6bDCW73KaBWqyCgR2S7YKvDmgLOg@mail.gmail.com>
X-Gm-Features: Aa3M54qSbWMSs1guGrg_PhByhryhHmWHwUWN36IXzOUxut6Ewo5mcuw0CYVtPGw
Message-ID: <CAMuHMdVJ3=ahkor7_5bTBJ6bDCW73KaBWqyCgR2S7YKvDmgLOg@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rz-sysc: Remove SYS_I3C_CFG register
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 18:52, Diogo Ivo <diogo.ivo.sx@renesas.com> wrote:
> As per the Renesas HW team this register was unintentionally left
> in the HW manual of both the RZ/G3S and RZ/G3L and should be removed
> from the code, so do it. No functional changes intended.
>
> Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
