Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13EB279DC3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373088; cv=none; b=FyKqn5g6jOYOkOYCDCAOQo7cyZxJCHV2Tzb4i/JTOCDI2GMfcDV8Z9hrjL8PXirIzXhAgtmbbL1oznx9QCsjCIu7g4gyUNP29+l4Ka5Oe2HeE0eTEyq4FhKKiBrsfjJfKyndOtckEPQIBe8zAIlD0LrDTChZm7eR+XPU+qBcSn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373088; c=relaxed/simple;
	bh=qOxCYMeZioIGCmh0MxrsIyGPyaOCPaAbU6O6uizTRQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RrlA8SNHQPdQButvwPFY+nCUZOzJvb7R5za6S48lWjI5/W11BxKHyXIo3VgnI7AOGRGX8spbQmp6pyf43WCMH/epJu20V1IiQdLNUcD4JgooQBm5y6SoELTY9cvzn5VlzAlu1vqO93nL4X1NecW0KuVDOuZLvAH3BlO+FPnv6fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c84060045aso1284127e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 01:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373086; x=1789977886;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G2JcK4+UnTdYFj4YxjDgOg657J6kp6BHITWmwnB32W8=;
        b=P3T8NTVb3t3/cPh4nnd6lqd1tjEROLALRDwxVZv83oC8b7YzsQzuuhIO++YomFj1aU
         P2l/nukKArJQrK9Z3CQuwHPulijT8onScHdDU0h0G994Pu22saGXLnrj5EmGVGB32wDE
         7yeKFtyO/NYuA/NvNEe+VdZiDJH1SE5GNRzagLnj9iOHTCg8jERVsBZ1HsJjVwgZ+mLx
         vz8Mlxb+fx7BfOv39A7xnNTMpnimcBcPJKqK/hx9wqOaIOkSetdKjHvpx+Wxx9xFvVyw
         vo1JxbL+jxUF1JxvnfAznUQDT1YSLatS0M1LqfR42L3+lvaWZIaY8J6e8IXlh1E0Vyj/
         dDRA==
X-Forwarded-Encrypted: i=1; AKwUvBz7aHEgirD/Pds02U1YmEBUwirMjrB6uX3NLzdpSkYPaf7bNnkK612uvnBnxXhrGpKh+BEWblRKeDKmmrZUoEoCLg==@vger.kernel.org
X-Gm-Message-State: AFuF++nXtj7Ile4ZIWpVVW89m3DUyXwjqL73PHM7bdV9RfbOtLFuRVGR
	wzNTD5KzGDjXNCn8t4Ziiy8zjwa+Gs2f8WPNUvPc9CE7dkXXSUM+R82mz1Os2G0h
X-Gm-Gg: AYBFou2HTIrWk/mAYfLl1xjXahWN3fNbvq+CZGRddNBf5DO1ckSyBqsuYVTlLp14QUH
	gd3dhwq5XzMviQdXdIkv3256gqWOoiMijzDDFmLt0PTxUJtDyK+pOGSIvN/XNOXukaPnhD6MS1B
	pggmhnffeSNHok79OlQStExGwI3EvLHWMMR9GZp2nVTWXAS+1UHqRtIurhBH6tbSw+Hm+fIur/3
	5nUhFpgrNQ5GzhUMQrPA6r3OdL2ehbepQXGUi6mvJ7xplbI6nma3LN/Zfij1LrvpXYcF4J2Z2UT
	JzOdncAslUqcFE98l8m7kdTOd4he0FZW9HSk67rD1+IS3smYAyKN9p7Jo9JQHi6YeXhWxYagw7J
	yAiZViHOcd2urfFY72M0dNIUfe7vhRFqz2XuBca3rXlIgSO7fo/w5lEXLTmhn2OzT/txllfiQ55
	NtD1+Ylp3DumQxzjvun7pJ/ZLV5D2L1rui04CrEgyhOzSvIasBvIs8ZTn23+r28z45S1YiJSO5w
	R42BuEL6jbAyQpE/zc+J7bKo2W2FYIHKCN5veqZ
X-Received: by 2002:a05:6122:4d86:b0:5c9:66f7:2f23 with SMTP id 71dfb90a1353d-5c981a7de56mr665980e0c.2.1789373085701;
        Mon, 14 Sep 2026 01:04:45 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c84711aee4sm11438821e0c.13.2026.09.14.01.04.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:04:45 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c9851764a8so43095e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 01:04:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgSFoEKfjabnVpl991UnFOVo3l0OyqwJQvN31REKRD+nz7Q7Q5xckt4OgxBFlOPzaxbzy9CfPBhxbEilHLGOP4Ig==@vger.kernel.org
X-Received: by 2002:a05:6122:4905:b0:5bd:cb34:1b70 with SMTP id
 71dfb90a1353d-5c981a7ddc0mr603320e0c.1.1789373084860; Mon, 14 Sep 2026
 01:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com> <2489cf57-65f1-4502-86ae-1e3673899b87@ideasonboard.com>
In-Reply-To: <2489cf57-65f1-4502-86ae-1e3673899b87@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 10:04:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfmVHsJBtnn0sB1f6YwnVpQOY5coP0pu6qOsknc-XfaA@mail.gmail.com>
X-Gm-Features: AcwNN1UjvEXLwhrFNF_ZKWONSXtVIhmEHRxBRtfYrWrrOz2Bml4dSuA03jjsOBQ
Message-ID: <CAMuHMdWfmVHsJBtnn0sB1f6YwnVpQOY5coP0pu6qOsknc-XfaA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] drm/rcar-du: Add support for DSI pipelines with DSC
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

On Fri, 11 Sept 2026 at 09:07, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 07/09/2026 12:29, Tomi Valkeinen wrote:
> > Some DSI pipelines have DSC (Display Stream Compression) IP block
> > between the DU and the DSI. Even if DSC is not needed, the IP must be
> > enabled for the DSI output to work.
> >
> > This series adds a basic DSC driver, so that the DSC IP gets enabled in
> > bypass mode. This enables DisplayPort output on Sparrow Hawk board, as
> > the DP output comes from DSI and sn65dsi86 bridge, and also White Hawk
> > board's second mini-DP output.
> >
> > Original series from Marek.
> >
> > Note: I see that not every run of kms++'s kmstest gives me a picture on
> > my monitor. Sometimes the monitor seems to be trying to repeatedly sync,
> > but fails, and the screen stays black. However, I see this same issue on
> > WhiteHawk, which uses DSI0 pipeline, without DSC, so I think that is a
> > separate issue.
>
> Pushed the first three patches to drm-misc-next. I'll leave the dts ones
> to Geert.

Thanks, will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
