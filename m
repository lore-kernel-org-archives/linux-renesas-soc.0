Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805A44DE72D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 12:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648569; cv=none; b=XIOoTTEh8YtmGbdPJ2zW+DPB+LZwTVvGawyJiHxUs4sjbPHChjB8M19zvtXWSscqsUeSidF1QiRQPBQGMZ7GEhJtHISAMcUH3wAmzUV3mwJgxzwDAfKlBW3j82hXdD2CntQmTdL8y+wPa1yGKDup28nKhs8BfLucjwQ/iYRE9fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648569; c=relaxed/simple;
	bh=3jBklx3OV81z21pgMfCutwA9rsrppPeVwShGVq099SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8jaQcO2SjQFsWXp8/i+PLQ0NLddNmCPm22W1VY8tlO5lyJn7guFT2ME/JwuBp+4LCcXSO2etQptljCvVjA/BOdE1gQ+OzUCXYe5UdpHNl8M1r8xYQV9FX+rG53YGnYVMKOrc6DF1ZV9IN3o7vvIBC3gf4c822Ac36n/MXCLN0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee6so236803e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 05:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648559; x=1790253359;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aDhAcwvSBAcGlBOnGD+Htro9uYMnuj1oYxROHQFN0Ig=;
        b=Teu6Hd/a0e+xUMFXiXnaezUjPcY0//wsyJLDBKlBAHBk0J0pmUPe+LW7WTrKOMHiy/
         oAB97MGcHVYU1tnInsyfEiaknCe+Vrdec5u0X8kdhwBI98/+awYpqUWIlVhl7F7x7oNE
         coWNyNUVFehxvYQSG7jKVygE+aYqnbKLWWW/OMsuh3G1u57JHbPnqxEPhe8ahOlU/ouT
         7V8c2yfEor68X0o3wUeTj3CWEgG4AglIyJhIhAW7XP7Y/Mvp7nJiNquR2eCBrQiLB2Bo
         TT8JeJCbUu4NlppQFwjr36xOLftPUY4b+CfdDzGKrP29P7pZKH8EeyuT/kHaC1wxH3g8
         L6AQ==
X-Gm-Message-State: AFuF++mQFsRIadF14HRD2Gjq1Gdp3gmw5S0ZxDxHGe1vZ32+mDp2IRfo
	BoSYm08/TIsoKaZiWjNtl3fKJjUbIbzSD/GyAFYTtMXou7plMEZJFVOphuzgNmWKNp0=
X-Gm-Gg: AYBFou02oHFPQPM/ROFBOTkvFqjBIf57p2fSBVYsbwsQnJVRPiYinl7vQBftqFF3Ohn
	f5I3mZho1tEC/hPFbQCkn0ofMH3BKa6hovCx4QNIEfGIRwCOw/CCxUsxwPF7PRawui+jaASOHsj
	cvrx3hAklAxQUqyCPmJ1PoHVyPyWWNKmf7GlW2t7uqscih+ajaHd1mP8pcExap5RqDxWLu815CB
	i5LCQ602jVKY/xviKweNZ4ErZs5pAuCueklfIVjDi9qy1hgypJdz3xo4x2mnaut+BVc71DYN7Me
	a34whrDp2lHFUouE3YgZ3HcDm6loZtt/HDYC2CZ1LniJqRJFJoQYg5peLi9FDosp09GTYNYuZa6
	ctnw7CuWzwG5TSHMlgMr999xJ/7S9ZJDflYs+HHvlZOw7Pz2WMp/y7MnlwNzpA41zTyW6jM6vG8
	vowP/GOcPJZo4J7L3uWGIvURjkNP/wGh0IupPtMkA6sxxK4Az/lQXsHoF31hr2epBOtvT8y3R/E
	zfVV3msbQmo7xuAt5erXMXPDwZCEeYctgEf
X-Received: by 2002:a05:6122:1d43:b0:5c9:a60d:3277 with SMTP id 71dfb90a1353d-5c9a60d3a1cmr1996725e0c.11.1789648558991;
        Thu, 17 Sep 2026 05:35:58 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a540ef54sm2435696e0c.13.2026.09.17.05.35.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:35:58 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a03fe69236so280351137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 05:35:57 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:79f:eeb7:d643 with SMTP id
 ada2fe7eead31-7a028c6cd05mr6743315137.10.1789648557334; Thu, 17 Sep 2026
 05:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917111349.52250-1-wsa+renesas@sang-engineering.com> <20260917111349.52250-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260917111349.52250-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 14:35:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcFKZO7GA-nQ-BH-1k127ZAjtUaZqHAbu5FGTmuCmk3Q@mail.gmail.com>
X-Gm-Features: AcwNN1UeqeHi3FMvuG4r-xFK5-Yd1nEb0E4krEULSwZN0Cf2ZFOfdU8KBvHRK1E
Message-ID: <CAMuHMdVcFKZO7GA-nQ-BH-1k127ZAjtUaZqHAbu5FGTmuCmk3Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: rtc: rzn1: add R-Car X5H support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 13:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The RTC on R-Car X5H is a bit special because interrupts are not wired.
> Future R-Car Gen5 SoCs will have them wired again. So, create a
> dedicated entry for X5H without interrupts.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Change since v2:
> * handle only X5H for now and do not fall back to generic Gen5

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
