Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F822DB78B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 13:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527130; cv=none; b=jnIeiK911XelSu6LKjR3K4JsVYmuyC4qwHKu8pvfYswMZbDkZuA6uVWso+b9Ovgk62VM2Ru6YeLechc/dUB0tJMf8ehOnfT93RLLBbdYqqdTxOMdNX8+E6ERSKZUFeF//q9HXqnZ1e5BBTlZqFQNALnhth7O84bRBZHQMSbiXbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527130; c=relaxed/simple;
	bh=2pDxHO8wpZZL1aVsWi+EAA7ecsGJLacrfFeBli+WCFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZkVagUSUXNt2jPG68OLj0Dzilsf2FqhlEI4R8VBzG89E1Yo1UoDpzdQxhGKL7h+weUsfzKbFxbz9qtVh/CrdM6Nq9+MB26qjn7eDJ/SGO35Uz+uayN83Yuej6pDYZ3ovL7+wRnWEOBR65ZXvQ4UBbq/EG/GbThoS2mlkCK/bPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c67175d176so453547e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527127; x=1789131927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CgqnNAj6IteboRwdvP7GVLALXi8ReI521PLZ9Y7Kkfw=;
        b=nA6ptoFHXuWCLF/dP5AFhOR76vJPN1pT+OEys1htibFB37U6OO7pLXv7LC+cY8f+mZ
         snPgr3jVTYk/dJPUxKHG9D1QgICtQdJh4JuSQO+u1y2EfrJoCpyAMUfhy6WpEZ7/pe1h
         PsYWnxMk+6YFX+f6AoFxuAngpxigAeQUIdT1u5BdHxrOvSP7a3PBrwAGbJ2nklZzrFsP
         cRsSwNZkDKc0jSZQjiR8myAhiQwaZyDP+TCrF15EoEIUZOS5dEvts8IQzZrQ1/0p/eLg
         AQDoGScEkDOAzPQvHrqC+UBvlB2/FeKQcsNeKFunCTzUgpflvpv+rcCNDKDbbHBYQk6h
         zvuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOQB/hUef2oCuC75IDhlo3/tTk3+NASqfCacWd8hwR/alAYdUP+IUInLcZg/2cXr0jRQd1UYhtFTGqHzLUieyv1g==@vger.kernel.org
X-Gm-Message-State: AFuF++mhsztZFLBOq3yigDLq6f5jv6ocvlL8jH3VEyyQN0twiOlvWUdr
	SFgfxhbxxCR4V6NRNWL5PEJpaTGYWU/bjixxFE5l8GVai1X5ETIR/ph5yjXPt53AfP8=
X-Gm-Gg: AYBFou0jJZSuYeZBAnjx0I8Y23vQqa3ftzmf0zIZiu291sz5M8LZxgNqcU3qtSRbobH
	5R1f+I52WPuOwDAmGn5nHMVJqN/dGB7c2peU7VwiDU+774gYx1z2W3actv5l5kxeKkh7rUXgr6K
	YhBZTlz/gHTALOYF0HmgyxepGYSavqNGMXvyAyMB2er6izh1AAL5kp5SKq5DqV5vSulKFdJx6Ga
	1+9UYX7BqWHUUZO5GsxBAve+cwEjLgRytcl9qTfBYspkcOznB9maMHIgTxOSkqc6q5iNZN0ZwNN
	kouulcnlv8Svo0WdQsK2ITLp7hzmIZSeaIJmL2WZssKk69PYA6Lwcw3m1UVe9pe9XcPwvtJ1W+J
	5fSMfRViNAZ0HUdt5Wvc+Ro1YkrJMHXROzc5f7hi+d4OaPk0qcyVurFuWJiYGjSkVPiQFd859mu
	1PJaQ5uM1YMOrZLxUSJES9LJj149JlO+wG8dbjmSQA/oRQMSN6WCFEn6XUK8AZ/Tp/4SJb1KX2w
	Qsa8mlNcEq9NiYJbOwEc73qe9TKEg==
X-Received: by 2002:a05:6123:67:b0:5bf:b500:c4f4 with SMTP id 71dfb90a1353d-5c7ed285aefmr2496322e0c.2.1788527127504;
        Fri, 04 Sep 2026 06:05:27 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec35d85fsm2006477e0c.12.2026.09.04.06.05.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:05:27 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c67175d176so453531e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:05:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwqd4YWPbnfAhTVLResiKlYlYNb2pBiH9WmDcqy52tfqZqRl039OuWMz79OntQBdwIq/vyao5Yxhp+EqIKLtC5nJw==@vger.kernel.org
X-Received: by 2002:a05:6123:67:b0:5bf:b500:c4f4 with SMTP id
 71dfb90a1353d-5c7ed285aefmr2496181e0c.2.1788527126515; Fri, 04 Sep 2026
 06:05:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-5-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-5-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:05:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWPd16C-AazzCHJ+Rz2_qMrTwOp1e=u793LimvW99b8Mw@mail.gmail.com>
X-Gm-Features: AcwNN1WKYIgtG8pquOg-3QDCj5oIF82tVACq3CFfADEbuvkkdmux6vPLdOD-FKA
Message-ID: <CAMuHMdWPd16C-AazzCHJ+Rz2_qMrTwOp1e=u793LimvW99b8Mw@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Document the missing I3C power source option
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
> 1.8V. Document the missing 1.2V power source option.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
