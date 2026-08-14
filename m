Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1E240B0E0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786695103; cv=none; b=Th+W+D8xtxGZR35nb+ci+K4XK4PwsMnSrBj79IXd9QXl3dvvUuJQPC5RIuaL5PsVLtlWTOo4uiCqx2jzkuJaWVxymQoL4nrkyTDdsaSt/3Fs+Nn415u4R+pHsaL6Zi1BvrXGvQgRAtM8EtOGq+Ab7L5Pkn6st4MyqZf2pxKIt44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786695103; c=relaxed/simple;
	bh=v4T9gW2vRafpBzkxZdBtZpKsNvF0AsQmaXCfNQoj2eA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E+NXg+8gxFkSBYCcgjC+dCCoOexj23+foLHwjV9+bSBiLuemh3Cy3YNP7QWLynJZgHlm8VjOkeHBUjwQfC7ZKiZKFiIXfrBs3qV34oLvUOsF39q2C0at5ie8wUKRkbKq7U5jTe7UsO7fRfA7jLpszGY7R0SJwZoNceIf1ybE8UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-73b909fbb6bso388042137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 01:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786695101; x=1787299901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YieQAOiAXoJTqhAtI5XvMETug9uQQrcB1boOOSb1fXw=;
        b=A5EnTZYdpbjuYPiX6sUMzwL/beNCCMfgL0JFsf0ZGF1F7ignhMSCeK9rOguXq8uy49
         LvceFsJTcKnU6xVKb2QUJMIo/QfaSQ2bLXgqL7vMKg+A+MXwjiDGxwgxeQKIv20dpNoK
         TeZM1w6QJwgROxmf7/9pxEjrFFcnpP0gF6vKzXeciN7bQL/dIwq1K+5LdHXLGj8PtSJB
         qWlJuNudtzjkCcHW+KKUywCODnMSYCwH2rIdF9SFGqqrrQfcTo9Z2586KfCJYyqNgFVM
         29pIbB15eebMDDzB+iWFG4a01yE2yXeB4/DMOICxuaMaZ2PeVzaEejdsjzWOhgFNO9i9
         0wIg==
X-Forwarded-Encrypted: i=1; AHgh+RrOaMwF2Ps5x1QIN/3Uqq0CIjxOD5e7WBSaZyFIiG5n1x8lkT2ivVmDLFz11rvJTRDshXzg4N2cfB8SgI7zecdafg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxF22RTQ9iEB54s/LpjRV/MdIy5n2j2boffdq+dOrjXsjnCat9
	arV6udL0GaKC1XWuIaG6fa+ZSTTDlwZBSuizIFhDgUfE4Dnv7gqITORDBhujIvyOfbM=
X-Gm-Gg: AR+sD11WkuA/UEll/rGluvM+pEJhyAtP0ASG7tXqcgAuo73qT//SSf/074SM0YE3Pqa
	oIOVq2QdEeG4smaK+mgw9RCyaTgxDaulWp8mhVcOjDDI9/wGcTaf9W7+2I4RuKWU4z2yAP509ug
	0FAvVyt45sqMhlVN7Arg6zZ5I6eC5jXD71pw9kgzomSPC1SjEOUteQ3dyrJXr48woRqV9LOdCYy
	i5felAAFDC7Ph5jivVwczDKs4DG1pygjzzQy8cwI4m9RzpEPazkf3ftTLpJ3DK9q2rI0XBTkDNI
	KuAqOof0NChbPxJIU/PU80EsigrgjmyYkfR8Tu550s5hT9VJ0itp1dcphGRZ9houNktfdlbas2E
	G4QwY3MqMIQOaZv/sBjuefXVoX+SglVF24nyY52HTnkxCJmSvFQBAqnXt13YHvRIzYlvU01Kcz3
	UQR5+2P0cfA8QC2njvf9GI+gvHYhC3su+ogrm1cVhQ2NFFRMAVFRORJyMI5E/qfcPPT7kYCa9/o
	Qt7jhYmPeBAGgzFIe/OHbwXvoKTSQ==
X-Received: by 2002:a05:6102:4492:b0:74d:ce64:efa9 with SMTP id ada2fe7eead31-76f2d173541mr774618137.12.1786695101071;
        Fri, 14 Aug 2026 01:11:41 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76efab1d7fesm965787137.11.2026.08.14.01.11.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 01:11:39 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59cd803792aso552250e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 01:11:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqt+GpYtz6asX3eAwT/oU8ugCMOM2Dluo0bVyammDivc/DWARqN0yiVmm5x6sXv2KqcloNTA4uzd3C8ItxRD4WJ0w==@vger.kernel.org
X-Received: by 2002:a05:6122:e183:b0:5bf:ac34:ce26 with SMTP id
 71dfb90a1353d-5c591f2c240mr938238e0c.11.1786695099116; Fri, 14 Aug 2026
 01:11:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-rzn1-miic-fix-array-v1-1-b58cafcc917e@reliablecontrols.com>
In-Reply-To: <20260813-rzn1-miic-fix-array-v1-1-b58cafcc917e@reliablecontrols.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 10:11:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUrabJOWLAiSrSm=r7KbuZn4CrVZiswJsf96U3STaNTw@mail.gmail.com>
X-Gm-Features: AcwNN1VBy68t135CijNHMQtqI6g9Xvn6Re0OoflxL4rb6mgUvwNTcbJNfwwBIdI
Message-ID: <CAMuHMdWUrabJOWLAiSrSm=r7KbuZn4CrVZiswJsf96U3STaNTw@mail.gmail.com>
Subject: Re: [PATCH] net: pcs: rzn1-miic: Fix config array initialization
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

CC Prabhakar

On Thu, 13 Aug 2026 at 20:09, Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Fix memset parameters to initialize the entire DT value array
>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

Fixes: f39e968dc168a7bd ("net: pcs: rzn1-miic: Move configuration data
to SoC-specific struct")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -683,7 +683,7 @@ static int miic_parse_dt(struct miic *miic, u32 *mode_cfg)
>         if (!dt_val)
>                 return -ENOMEM;
>
> -       memset(dt_val, MIIC_MODCTRL_CONF_NONE, sizeof(*dt_val));
> +       memset(dt_val, MIIC_MODCTRL_CONF_NONE, miic->of_data->conf_conv_count);
>
>         if (of_property_read_u32(np, "renesas,miic-switch-portin", &conf) == 0)
>                 dt_val[0] = conf;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
