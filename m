Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16B14F30D7
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 15:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535422; cv=none; b=qk37uVkct6Bo0zTx6gt84FEEwaigbCuMuFVMbYP17MgBqY3hQRowZQCnqtTYqIZnob9WP7SHvXH0j5PgpxfLxTVKcYTmtO3XDdClZDTOoFBWk8E+1v87fANxtoPHcCyw6kJSgnyzCWpFRrxI/QC9tcZixGlLW5qIxfhp04I+RIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535422; c=relaxed/simple;
	bh=nCrntIDhyuwP8BQpdMv2tSN81fhquB9QOVe0SeizZYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lw4PKrOA3q3kLwPjk5YrCGAErpvL0kQxl8gVxOanDWY4o7qgMXwWPqfiYk8Yolf/vhh6vZ/xGLTeUk3k+Xfptg0Tt1iOmkNNo3x+RpEAnUZU6OdXi+MCjJr+vq9NdHp7P4coND400XjXEPAkRGmwFlB5IN3GyCgvqYRvuctqblY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97cad2f51edso366347241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535419; x=1789140219;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mr7nrVkZKYZ/vaRmGYmX7E824Q9vDG1RqRG5Sn6gSeM=;
        b=jnx9SVuzRaJDABrKChXuwITDxx+r4RCE7VvEc+5qAY0KC5h1Do/clrfFUka6QyfnCe
         qJxpbGt1BXLArYaCpiaMAbkTsCoVwdCZISCsJzIGMQ6lgF0mQ69v1gHP/Cla86hjTTgX
         BUoPHT9fHuD/k4U9/SzucOIZbqJjJMudl8fqZIFh5OPhiqvWV/MEHIj0WxFm7vijSZOq
         bu6594lYeKAOpD7E6WIk5yCDyFUHgeDrZUXvWgPQsyTtMik3lswn/YASC7zi5Ty6qDUY
         yCSIvBA9Nfg1ubxQyVXTkdOirGdphj6u5yFemxviSsOz5vIunkScdr/5lz1Pz6pMX2qH
         Q6Pg==
X-Forwarded-Encrypted: i=1; AKwUvByQ6mxQoIH8X5FqtiU5WLpC83M4sAxn+I+UondHQYlFsbidnZSw2+vTkCap/U9C6rOfwers8C5pUvZwKVPPlTvkEQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mOi0oDsf5532u2ghA2xBTuyNaYk2wYOdu18kEuSeM0uW8pKPBQ
	vBh4EnGHq6lijfrzxearbt6Yn/HpNCYMJMHetEDqhswlQq8Q2MZQmF7l2XGnqbjW
X-Gm-Gg: AYBFou00DVjbQ9kbcIbg2jxWos2hVSsyweheumm8bqRiwSSWgAB8IU08sfxeP3XA7/0
	LwEkd3eaWsvUeXJUcLUGDuSljHZaaOinQM62FFF5WvGWM6zORNn++YJxqEnCTKUIDpyqSGvr7hq
	Mzlu9v6J9Xcy1Ted4QocBlpZg2M6nHrtSaDgqqbXhohieI2/7PBUApQu1xf5nDvio/csp+DpEhC
	7n78EhGmz1vXZZyIdNY8CfAPmuTjOJcw19QxKhTBD1YZvNat2dwem1wOChQlzPhKXwBLYWGMn+z
	ukwsHJbllcLyjgfWZijYrvm5HePai8IVQU7WO3U74i6T/XriXQlaQxv2lWdno1vZntZjTlGETke
	XPJ3R1K1FTpd5XVDpmFvzHG2bEArcb6CR5R+ITzwrLlKSFQKPonujyFle3fijk4oz+e/j5lEf7Y
	Ff2xI+vt1QxmVDxDyTzqCGEGA8+DJe1YFK5ZpI0KH7qQ+KLWPTMAIqtTEH1y/Vh8uyeGXgb+K+/
	p4YQBf4ioMQQJp32NKe2gTPrApQIw==
X-Received: by 2002:a05:6102:1606:b0:778:9e3c:5760 with SMTP id ada2fe7eead31-78a4a9621d7mr1998765137.11.1788535419407;
        Fri, 04 Sep 2026 08:23:39 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee1c0cdsm1844277241.8.2026.09.04.08.23.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:23:36 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso512385e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:23:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwRDKhJ3rZlcvdyfSue1nwaeddS3OYvFFGgcTptOh5oC7HGfW/w/cyHBy4LW0Hhs35RL+qcdJiGUedCPWZ1H5emAA==@vger.kernel.org
X-Received: by 2002:a05:6122:32d6:b0:5c7:a3a3:a4bd with SMTP id
 71dfb90a1353d-5c7ed3a528fmr2695851e0c.4.1788535415032; Fri, 04 Sep 2026
 08:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:23:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyPbUEy1sPZWmosVtL9GQviEB+d8RW8Xus9wpxZREgRA@mail.gmail.com>
X-Gm-Features: AcwNN1VarzxavclKk9EMuPnWIySi6CxTEUYbBFaUC14MO-nuKk5tEQAZbU7dyfM
Message-ID: <CAMuHMdWyPbUEy1sPZWmosVtL9GQviEB+d8RW8Xus9wpxZREgRA@mail.gmail.com>
Subject: Re: [PATCH 08/10] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:06, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial Device Tree Source Include (DTSI) file for the Renesas
> RZ/G2M v3.0 (a.k.a. R8A774A3) SoC with basic support.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

With the cosmetics pointed out by Krzysztof fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
