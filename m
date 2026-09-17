Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300704F55DA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 12:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648734; cv=none; b=iYxcalU8PNrPOOXRz4lnP1rXds6+onZuWc58ZBiobHaDFfCLLJpQajkgGuud+Ebys8urxSCXWnBWHN8F49gB5UH0UholhyPQTpKNjNh4LHoSVMYCQGUDO+LQypbIJXvGjwkPd4o+Py92lZp421o3HCoPigv5FrxHjFQmwEzC8JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648734; c=relaxed/simple;
	bh=pO6Tgcpo7rciPqcfm2I2qKhUQ+kRl0w7xU9/IWEOHiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e3d5XroUeL6rT2iMd0WzcUR16lwgt+7dpx3ok4NnSr7XWFhTOouU35FZH4j/qBZc9sCORYvDEB7vmWljjHB25YHCjtRwq0ZT5ZC7+Curwn1zMPRrX3MbS3RPBoh/OCzf4XVFLYoA3BJlxZ7/rmCXVbcGA7ZHGIBUrGuCEKFRmDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9832c759198so146489241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 05:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648723; x=1790253523;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RBQw87BcG/7SW7f/yhCxPa56rKVyuPomBfuHA7K6Ojw=;
        b=Bs64NGmsweOBMr74L+U9wWVgAwm/jpZpBYd8vxpml1L+YKKQIle1/JJYFviuOQEOA+
         71CbWDQhlE6f2zgeBI4/DpbgQdUasvORysnHK4I2hD36O782zqOW1NAJ7FK3LtzgBsga
         ZDWxg52+5Abwt0zq6mfvv7EZADYVHg8K0A7RQuGh60E5sbWsDbY6oxrudYHQ8HQEyCzn
         K1/+EEVEbtTSIEEfVqFLJKzQK6e+PiklXpMX14XgBQRMSwpAmhvuYEXsNvs1MyGIL9n+
         wZz2HCFC6tZW0IFjqmYaLiKcPoIYfl0CYSRbCTcKcEmnPpsX622Hxuge5pM40k4bftP3
         1wNg==
X-Gm-Message-State: AFuF++l13rDkcgOcD9qZXY8EHFgOaTNSxr5QrJto6SSqf5Tzr4iM78T0
	JhA/39tsCB1/h8AnkyTj/t4VdlmDsGg+O07wV4e6vhPXk2P5yACdfxkKkL98ZULnSuY=
X-Gm-Gg: AYBFou265Oub1yo7VgpN4/j5YHUcyf2y9i5p1dQIzykPqePVpUxlaiRyWh6ssN5QGaI
	6+bLL72PDY33Fh8dK++if9N7WA+IKLdH2C7w9PQIScMnM2fvnJ6MVn9qgi+6MFZ4GNRrnWZafac
	MFUoWJE1OQIkgBW9gFWvd18EIhZpaMnsERO7Jy274JJfM6NCP28dYjekrw3w3Pwa+KAutkiu/ea
	ZAH4yw3Z1aQcZUwiWOLLH8at2ThDlME8Mndr4y7D37IgxUUYc/W0zr8KnTwtKWtUfA8DmCHoY5n
	ANnFiTg1HvobBrV2pLlZDB5VmhrIySJoGXD/VhnyHhAlH8tg+JV6FvKdeMDRL4hiYgdSa2lzjRL
	UmJEMk8Y7LpxnMAticSuV9OpDOU1hWZ3WkIvum80qtDLAbn85/HyLbWGeD+QzQjhW4f2B0vsRXH
	jK7irFC+OI7e1XqJUo/8rb/mkF5XBAOixDet/2QB+2OX13WaYFgH4NX/k9EFwgibUj4EpsGSw3F
	eeulyGW5z+UvlKUmZT0S354GjlKsiIgtJ10dQ==
X-Received: by 2002:a05:6102:41a2:b0:79b:1b6c:4f66 with SMTP id ada2fe7eead31-7a0247f043cmr6858367137.1.1789648723536;
        Thu, 17 Sep 2026 05:38:43 -0700 (PDT)
Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com. [74.125.226.235])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7a1e292ee59sm3093976137.6.2026.09.17.05.38.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:38:43 -0700 (PDT)
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9832c759198so146483241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 05:38:43 -0700 (PDT)
X-Received: by 2002:a05:6102:951:b0:7a2:568f:815d with SMTP id
 ada2fe7eead31-7a2568fad44mr791569137.18.1789648723179; Thu, 17 Sep 2026
 05:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917111349.52250-1-wsa+renesas@sang-engineering.com> <20260917111349.52250-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260917111349.52250-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 14:38:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHirsCAOH1KOuPrr6C1AVFXniG3yqqND8hyZMAJ4R1JQ@mail.gmail.com>
X-Gm-Features: AcwNN1Uwts9bEPQ2xARX4nkO381zcIEk6hOBCmQmv_bM_450tPFHeji54wCUFmw
Message-ID: <CAMuHMdVHirsCAOH1KOuPrr6C1AVFXniG3yqqND8hyZMAJ4R1JQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rtc: rzn1: add R-Car X5H support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.csengg@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 13:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The RTC on R-Car X5H is a bit special because interrupts are not wired.
> Future R-Car Gen5 SoCs will have them wired again. So, create a
> dedicated entry for X5H without interrupts.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>
> Change since v2:
> * drop Gen5-family compatible since X5H is not compatible with it
> * added tag

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
