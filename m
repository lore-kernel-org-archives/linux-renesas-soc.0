Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172454;
	b=Ni/bM+iyeQooW/XE4sUgI+XiANF97qXVYOfcMv8d8newHHye70WmVlDT9B5Mu7zhsMqN
	 Jda3klQ45TDpDWZAkr1IJEjU+pTuccVBKwAItDZ+IgN0sfM0bUZsK3iBmok7vh1CFjpI9
	 L9gyOupPqtTEsuA4YL0APLQQ2ifsByuEyjOYbR0Pdl/JyFSFHks510EKvmXxtH/akKw3a
	 mMA3Ghwzoj2qKDL+awHNALEaBmLLXkrmG1gn05F6MUwKCJ3g3b6L0ywNteg8yVLFkm8uf
	 RQRkIda+JMk5HEVrAJzvZuOuvTDL/TyvL+Ws1WZvVRFp8jO5Mz/b1FG2qZytijWlY4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172454;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=XC0FYvI7J7PY7eGnEaiuIuCRfsjCJPAQuXRpzV9YviU=;
	b=aUwwmf5n6vvrWDwQxCZGUHddm1zzgvTl/1YMkiKoDxXXa9Yp4fu3PNNEe7bEHYuE6pxV
	 FAxsNKibjDeUl8neM07SVxub80djC0FNYzkSdDXykg6HCpGJhQnkbuTaaS8aOdEVz6ko7
	 q6Jg/NgFgOS2Fg555RvL/H396bwrmRp3cH43aWCydzmUWCL8Ro1NR7eivRV9NLKm8Z0HS
	 A7TOFiuNYr9c/5sZXl6fuOdBQntkeQdLJvt9y39afQbouad0q6Nm18tqbi0VXv/QpzVFP
	 +nEyom2ucq97AmvqD8jC+fJ1jYUu7ig89qbzPsrc1cc9nYe18b3YJxx3mO9founwNnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC455606A320
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 11:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC455606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so271041e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 03:00:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172453; x=1795777253;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XC0FYvI7J7PY7eGnEaiuIuCRfsjCJPAQuXRpzV9YviU=;
        b=sWu12R7pA1gvjbPYsLeiuHoimmFRavsG+qCx0GLJ/tveg37A2u5uVW0DUP4AjTz/e2
         O7sQGifVwOJHhRigx6L1gQnp//dhL8NvSQ1K+p50/Ivi7uDHUj6Vcv7q6hsBAAaDZ4Jj
         oWg9UYE8JapNEVBkiJxnXm6tf9h6Ayw/yFndotgrT14gECo2QQLASF7nVz57vJI8HTJT
         rFosYJl6iKF2Pn8z0ovFLHNB6P9xnHtX8NlHYeoC/rlpP3RvHYKnT5VWPgvCG9BQoLOI
         5ZhPgvLmfQ4r56DQWs0S8A1YMCDoUsu7h1YMs+Le1q+zHfBkBK3JP44yLz9N9GUtmsIk
         UcRA==
X-Forwarded-Encrypted: i=1; AL+hErFdW3rXdhQtdX37Tet94KzDCo9RBNbw58iMQBJXA4XIBZF4TViyZNfvIFYQ/h3LuLg5FEPGtAZAiHDwV5roJ5/+yg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/V2OEhs79MFK2ZYBGC5unI58odNNaeebUCMdR9VwlQvFw7XrhP
	xuMbiF0Nt+gSxZGlLRp25Pf+lAQmHxVn+28BCPTAHH1xeXS2VfxUOVxiVj+hWG0/
X-Gm-Gg: AZFdTZciAEUwoGsCnXiTHwlo3z6PDMO94tZWiItWTPdOIAT+LT+RvpcwMmmI4RuhQZ7
	n9wKwPGxYWjvC1ZoesNQjZgvIj69y5r7zucWkZN6Xjxwjx8hFbFFPxkd3iK/9r1muThcq6Kzjls
	q+7HPX/xjiCyM3NmulvIpgIy+HWprxcitmCMp23uMgktn85IjhJlYPHeWcYrlJUuarOKYV5d149
	hf/dMrvQEfqNyUl7WIfGr3v/aw7TcgY1JUykF9GNxpzVkXz6pdoCm9NMhwiL46mRjgdc4OnsAuT
	Gg1ie6sznOk6DfOaqqZUVuSHBdUCneqAYzI8s06ygIBpWUY16LpJ9dD75Nop+9tjhvnxW0og3V2
	RW1Hi0sMHkiZKfG3G1lqCZfOMsJ8ETy9ONRSB1QJ0DoD+Ix+Vo6l19pGP7N2jhd1E0h4t9VHwOV
	muDki0U4jgfRJGzwCo+sZU6pEt7aU2JXaznqyeK5HJdF5+iVSNUkMjF513Df4x8cQ5JjWnYm4nH
	zaCA33eoekH+7WjvJDiAV4gwAtRfKXKqaAPjo6JfOSja2BuLEl02ZJm4jvOgNfLGT2GCONE0xOL
	qYy3yDa0AwJRTQfESgkpj5OKtYd5Xlf86I3z78Hs6BzVzwGVAD/5rWVIxBDpHlzsFnc=
X-Received: by 2002:a05:6122:1816:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5ee8af1ada5mr1274845e0c.14.1795172452785;
        Fri, 20 Nov 2026 03:00:52 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b653081sm2164391e0c.16.2026.11.20.03.00.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:00:52 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso209665241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 03:00:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEOJoOWoLOgnahLgV4lv05P/JoWgwIENZCjEUQO7UyPGx1QEukWnBcgzPN7r37Rx9yxg84lbtaX3CPd23uFx+kZQA==@vger.kernel.org
X-Received: by 2002:a05:6102:6055:b0:7cc:95ed:3147 with SMTP id
 ada2fe7eead31-7d739689235mr857768137.34.1795172452194; Fri, 20 Nov 2026
 03:00:52 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com> <20261116-canfd_rzg3l-v2-2-89e06c46f40b@bp.renesas.com>
In-Reply-To: <20261116-canfd_rzg3l-v2-2-89e06c46f40b@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 12:00:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVe5agtLEH=EhD1Jfok8h19Or42u0GAkbxoK1juaJj2Xw@mail.gmail.com>
X-Gm-Features: Aa3M54rO1S0UF9YXcKOSJOhVHRxGaMtumaKHweYg3txlmV2R4gs_ta_WfKp8DhI
Message-ID: <CAMuHMdVe5agtLEH=EhD1Jfok8h19Or42u0GAkbxoK1juaJj2Xw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable CANFD
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 16:33, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable CANFD channel0 and channel1 on the SMARC carrier board.
>
> Channel0 is always enabled, while channel1 is guarded by SW_DPI_EN
> since it shares pins with the DPI interface. The CAN transceiver's
> standby GPIOs are conditionally wired up based on the carrier-board
> switch settings (SW_GPIO8_CAN0_STB, SW_GPIO9_CAN1_STB).
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Reverted the order of the SW_DPI_EN and SW_SD2_EN, to match the
>    signal flow order.
>  * Added missing check for !SW_DPI_EN in standby-gpios.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
