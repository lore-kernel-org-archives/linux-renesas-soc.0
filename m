Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1FD47ECDF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Sep 2026 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351040; cv=none; b=A9oktP0Yk7/yMhk0c0eSSvQlqEEul4WRhoJCXReEjU97eHXE5QXLKNx6ExbHdcbUVUYvxfXvWwnhf/6xkQ2yV2JASfb5GruxmnqzC7+PJZjHWyV3lBVLZ/XZXky2HxcYFV1QJeZPaAoTsnPR9DTBTAmU+W1xiYxsCg40e9urrHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351040; c=relaxed/simple;
	bh=tr31uKUtQ3Z8RhiaqjBbUOGdtk+hYASwtD2Lm3w6q98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evIO75Cby5UT80hGl6WmZX4BMgpskz7gU4VkRxeAkX/bkbdyxJ/kiQ0RhKmuKgMEus02VGloemZlXZApjWYkbK6OvlCKhf/2buVfSr2LqutO1aY5EiPGKR/Uj0Gbq41S9ACDRzuU9KaEvmo75UzteW9F+st943nLj+gn84Pz1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c7afda4515so573626e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 05:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351034; x=1788955834;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bRRLwoLH7HDZ5nE0R4fk8oKFU/q16k7ThQy7FIH11/g=;
        b=MOcUAvNWSota8uq1HIK9Hoo5lk3p5pvPYlEAoS6IpCpbg8Rqpg/m1KaqnJz2A9Trvz
         Lvc0nckgXLcfKA1RBdLvLb9cdniFTIJMbERzaQ7RukK/TTm+Vcc1OZDUBXSnGsv6Qlh9
         vYeqOqxwJzWDG90r/FRrc9xsOEvKqMHkB8KI8z1zYy19v5PkP9rm58iGO1S38E9YyPq4
         K4ZBF3WffyTT2IC5+uzwudirl3V4PQPHEktEEJQnD4GlUt1TKb7HFw3ZUSCGJuFZANah
         +PeqqthvGFW8mmM1zuYJAfUSZgw6sMoAoD055jJacegQRCzQ4TgzhYCfnIe3/eWDzgtR
         EgOQ==
X-Gm-Message-State: AFuF++ngmNMZBwGBaSqOQuV4+U5EEVEs/lMrUx52euwSfcINel38UMuE
	TIcPTbfgEaXMoCHE6Db6LrJhJDNBrh1+o8tY6tUiqhCirsN+qPzORB135TJgs7v9
X-Gm-Gg: AYBFou1vC0z3Ynz4wzZiyQPuhiMBDGoui4d815FUAdfXkpPdtFMTWvmLQJuWGNEwCyH
	YNGS3MVb/ZTXZOOI/l528IhmXD+A/9RZ71uWxgihkqsAAUpaTlTW+EhOPJQOAC1lUeuc9xUGC9W
	XkyjoJN0Smzd18vwiwBHlNRVn8wee9op3cJdetMOAtM6E6v7mmmTOFWREC3lm8nQdMejYKHG/8F
	LKTm9le6jNS/BFCQcdJQy10G6tbvXkeFaQhBIqz4rSDLUvZAjTRoQN9qpqtPytfeYGF/KYdciLM
	qdih1LLT3cALjEsrZU9iOtrv78+CmtPZwDQ7RAZiHDkrcHbIV6SXOPNN2CxhtTeuUp7wTy2hyqj
	8VRuHCj4232GeAOEhYM1mO4srpcUhJcIKkhM31ZC6uCD6ymD3EtvR4AYQimRkSZL7mX2p7GxHFY
	lxRmRK/aLdZPlRAKq8B1FU5pa6tRy/b3v4xQmmJSE/L/Kx+Pa+5kDz+AfDxFSkqU3avXm3moNlI
	YcOmuKQVJE8ObstHrLNRq+0vg==
X-Received: by 2002:a05:6122:130a:b0:5bf:b500:c4f4 with SMTP id 71dfb90a1353d-5c7d2706059mr1556930e0c.2.1788351033844;
        Wed, 02 Sep 2026 05:10:33 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd5da30asm1880256e0c.0.2026.09.02.05.10.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:10:33 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-96723c7151eso277459241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Sep 2026 05:10:33 -0700 (PDT)
X-Received: by 2002:a05:6102:a4b:b0:778:9033:e337 with SMTP id
 ada2fe7eead31-78a1f285d17mr1164872137.7.1788351033274; Wed, 02 Sep 2026
 05:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817103255.49565-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260817103255.49565-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 14:10:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHhJHCph23S5LXUKWrhbVYvFr7K-z4nwqSz-9UmU1iGA@mail.gmail.com>
X-Gm-Features: AcwNN1XEL97nkjOEL6Wuq63EyKHR6MsJn3DWoZDk6yLd5TZrGhV4MMk1_1ayGho
Message-ID: <CAMuHMdXHhJHCph23S5LXUKWrhbVYvFr7K-z4nwqSz-9UmU1iGA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs
 on CN12
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 12:33, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> CN12 offers some GPIOs independently of switch settings. Add the nodes.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v2:
> * dropped patch 1 because Geert already queued it
> * renamed pin node to 'cn12'
> * rely on default pin-bias and drive-strength

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
