Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2876C3DEACE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367452; cv=none; b=sUBUMarrxG517JH1h9NGKQYCLMRZWmRqbZ1MdIEYgjZgUBw2xoRj/Yk6Me+li/O8vEmYVrzAFnxepSvQ/CjbremxaQA7r5mFao/s05RWol3PEYr4IpZe9XLrZCbkaShWRxxzK4UKBtMwqG+84UwRszMNxcRNUv0kyKEM82DTF5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367452; c=relaxed/simple;
	bh=2r7bq6KL02axoZE6CT8IKT3dwmXpJ4hSMNS66xkXyNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDqMyLhWl7aGAEUMAvdJky/MYjjc/miIXcTMJsojCfEV80cd7rP+KjImCsAFYUkdU1usC1L9PwKwXt0Yr/+OwawFCvds8C/w6CjvO6pTw3NabAsJi41ZpGj/F8nDUt8CJUUySpps1sb48hz8wkCDn9R8RRD2ob4VkkVUiT1uNm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso576028e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367450; x=1786972250;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8/+iWq3CnWCpUvZjLzYfFVfgHXscPUpSCMFbxB55MUg=;
        b=G3XmovPEfnaAPfYPLTg/8zdlISKqlrvyIz1BvuM/XrB3ivQ7ODSwrf91S6P8RPYbQW
         aTiuaTZ0hy+Ihk8GpcvdrgSq1N+zxaG7fvAMSLjzCHo6OmOc3fhgv81UmYVUgRZdlaeB
         LgLpvtMxxXUgPpH+qeW4i/jUhKxmk2aQLijRYUEo+rB+gLvLypZ9+Y/ejnJjye71gbo7
         K7KcM1zg7xY8WFy9GK0B9nTip8yAbvr5J3gTAJiA2/lNHe7sAZATGfIxZ23Ca/mh6xU5
         TaaEzpIYD3M2A8yiEO5Ey/uFb4vbLkoT4j2ZwsbNLrhEDABVrXyh9+9wvDW5Nvbw86oA
         IF3A==
X-Gm-Message-State: AOJu0YyqFwoseScgF4TVyDmKBwvQv/QxiFdZ5+gg7zY6wAyhRw2CgX2A
	GPQjbw9aTou+ZVZXN5fYtAhhb8zgIcxDr+3fWGKgI6EI9s6WMfA6SnBKCwsQUeOq
X-Gm-Gg: AR+sD10w41PSlZVnPoXE1mSoO9CYk5LehoP8rbX8ibDLBWgNBy0yVK6C23WGx76FW2n
	Ye7y/UrROzGatP+TuUW03SDwFvNVQZGKCNYWXyXqhEv7/hvcnR/6Tnkl2LeVDvI87ngVI+ddV+y
	gwvR7K2et9gQtGjnDaBnsXfeza0E6rzYLD50ixsn3FXGh1ch4dZYW0D51p+ZxB+bp0PtsiWiNuC
	35LSX7/3Zt1jNpRaLnIsDN3ijuOmsfeV0dFr0fM9L1RiFxtfj0GoNXkmi3tVv9O4tR8uPYMfxyO
	lgDDD/z1I3YqM3JtcABcEuaUe+nTbsppSBJgE1m3usti/Wg3xvwjcEB98vy60e0+Il/XtLfp1/B
	TOntdNYORMmfaTu480RKUBW/UUDJ7IaOgnNRbTz6E/8HiF6ug3EWcsWvyExzCHTUSHW0f8ek9G2
	IDT75dZLyuwPGeXTdACVPeQl7PkuF2g0330cEfSElRxxyk2jXu3JvmwPuFbjAMM08R6I7taHqx7
	k1CzOsKBi/WAvUhvHxkDp7wxswtiCQmHj7Q
X-Received: by 2002:a05:6122:ca0:b0:56f:6cc0:681e with SMTP id 71dfb90a1353d-5c44184d8a2mr190991e0c.1.1786367450031;
        Mon, 10 Aug 2026 06:10:50 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b1a8f75sm4088352e0c.10.2026.08.10.06.10.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:10:49 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-966eabad303so294622241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:10:49 -0700 (PDT)
X-Received: by 2002:a05:6102:4426:b0:738:cdc6:f59a with SMTP id
 ada2fe7eead31-768e8119a58mr269915137.9.1786367448880; Mon, 10 Aug 2026
 06:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715105306.25147-4-wsa+renesas@sang-engineering.com> <20260715105306.25147-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260715105306.25147-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:10:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEn1GAOdvPRDmE2ggKMTzVc6ev68AsLtVf+=in3oG0Xw@mail.gmail.com>
X-Gm-Features: AUfX_mxn_8ZKs3vTmsJga6rdas_YJzmUEfjEtxmDZON3NmbE2TI0KK5PUwUGLsQ
Message-ID: <CAMuHMdXEn1GAOdvPRDmE2ggKMTzVc6ev68AsLtVf+=in3oG0Xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: renesas: lager: specify correct connector
 for i2cexio0 bus
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 at 12:53, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> It is located on EXIO connector C, not A.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
