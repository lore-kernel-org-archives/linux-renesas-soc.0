Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F264DF4CE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 15:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449640; cv=none; b=hJ/49vJGsATvwGnKnUZC9YhEpxts3C2fKIElPAmqJmBPu/RYz0n+BcRqeWmR1gL54uSm87LsXw6StX9eT+FocHmNowAtrKY7+W7vVugpdB9Qm5p580P6v807vxLFJ+KRkslNedFHwLrLlnfp5isvRUoGn0c5iual5aRkv98kYss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449640; c=relaxed/simple;
	bh=4ISs0p4OZ8p6JtAb2NqQCn3Ms3bwI1uZBinFoY6Hif8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Up/FeIr8OBTGgVLBqT29lYniekjRER/rSFSopcdJz6xGirSK6WpxF2NIWN+0b0c+xA0X27WBs2Ye0CXX/LdXGUqG5AX54IAWldPh8xY00apL80XruU9dSOIPJ8Yx2TJTlg06GDluzkGV2OJxh/hKW4a6ZK645nJTnafKaXBTo5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c671456e25so1141327e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 08:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449637; x=1789054437;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q4co215V8cCcryKl+ePptL3AZAP9ssa33MB98SUpHXE=;
        b=I5qY+Aq7vzez8Yh+/4UVHFaK+WnHM/RuWFFDKvQPDHMgY7dauraU0Ea2zYepChvoCr
         Y4lsTB5eSNqYing5eamoCW4gL70aicXZ4/DZwMsNhMGWH7dpfxJu5fkaUkLXR5PDN/EI
         n4P9/SKgpBkNyT/ctFGjBkm4Dw8THnFWasPeIb+ZpjsJj7ikPFRP2AQi6Kc8kq5Sq/6o
         1lvBey9F4aHi3AUkTMOUY+Q5sidg/4RTDccuV0AN99aRn7c/oib61TmT/wibLzWqSvxx
         peJFUBt6+TVbe6W9vDo8N4i9vkPoK7bZM2pyQ334TlO+o7PUp8ex/dR3bQTsfnXgLXpk
         /Srg==
X-Forwarded-Encrypted: i=1; AKwUvBxo/yJP2C21+UXQ64wUCQavTfviQ0NaDlO5UsIlm5adQRFyDzuQGPdRvhqgzBRg6K5HG+co3DET9M84+D2VOUqPeg==@vger.kernel.org
X-Gm-Message-State: AFuF++lHPcmAI7mu4OWsUI5JHfwoq09qY9mfeSekkz4wDpLdQqBR04hX
	T7AE4sqrFoRwXpEDk2JlGbU4HMjHICgwMYiROdGPXgMVsgtkJJ8PPae9apsQpe44x0w=
X-Gm-Gg: AYBFou3czpDOGZIX+XbAKHUUAWMQqPZWJzAHr26TkM/Iliqu1tUxucerbvUk36o69rX
	VdU3bPOHYLklEDDyvctJb46niJiOXLAntMfJEUGRyV7R3PF5UkT8ARe7wFVnNtKmNR74HP5SNUk
	aos1MVJQS4tr1zWaeEbKZR690PhIbBrxzcXjB16xKbz84kgoF15klqk23+xJQtkuvtmhxU0RnhK
	5FkOaCgcwm+PXlRhjOM6Vyc4aeKHkoqs7pCgTMJohFKcqorIfh7y/Y3nP3WzzD9P0PzSNokVUWJ
	879nK794oIPgW7Xmh+nWHqMZnnsA9pKvI2COqi1GTZp0Hn/2zE0URrI+xMsyeUp042CmM2G76wS
	nBfK7nwMm7Y3uNuOl1M8lM7iu75GHgdik8vSiSE/XG2Jyw4FgJ4he28jY9730I2g9fqCalULZ20
	/mwVQALLCwjvJ5t/g8p1+CZVIJUSJ3fS8EDjFT8nuwmYt/G9I6GafT8O6oehuXnkWf/j8Z5nmSj
	fpcT0piTcl4pIhIszBfQnhBNwaiuoEFis3I
X-Received: by 2002:a05:6122:6d1a:b0:5c6:6587:a600 with SMTP id 71dfb90a1353d-5c7dcf06fddmr1917974e0c.6.1788449636882;
        Thu, 03 Sep 2026 08:33:56 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec23d459sm3666e0c.9.2026.09.03.08.33.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:33:55 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-78a220b5778so1099168137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 08:33:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwR4OE8w73vpUFbFAStERaA/Z6cjxM+3YZ5+GxThI3Xu22iPYV/0NGSYvDY8a8byTE9nVbJPuADR/DtuJKe0EYhsQ==@vger.kernel.org
X-Received: by 2002:a05:6102:8345:20b0:777:2e1b:1e2e with SMTP id
 ada2fe7eead31-78a2ed7ca4fmr1596359137.3.1788449635039; Thu, 03 Sep 2026
 08:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev> <20260903113327.1217457-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260903113327.1217457-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 17:33:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGCdFH4-+-0Cws402jvHO7YBAELUeobp1BbDpeAZguZw@mail.gmail.com>
X-Gm-Features: AcwNN1VsYZsO5o2pygHZnaCq-bQizs6Zsc1Hfv4_iBmyRo69jsaq1nCLJ4t6av0
Message-ID: <CAMuHMdWGCdFH4-+-0Cws402jvHO7YBAELUeobp1BbDpeAZguZw@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 13:41, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v6:
> - used bit 23 to define PIN_CFG_IO_VMC_I3C
> - described the I3C power sources according to the new method; due
>   to this didn't collect the Wolfram's Tb tag.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
