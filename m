Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AC648FF82
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586683; cv=none; b=WfXJJxfKVgHnoVnP/Sr6JSUFYY+EADpHaAfSnWJofnoXN6jl6nCAj/v9bJyphHxhvBYGScXkRjCBwAFSlRHYbFUL5fOKQ5SKD/ZJz0mdZOXCjbnJaZtDJidoU2JNDl7o134bLd7pY9SqNZGaEwOMw9Tqo5D3FpnwxWzFACzg87w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586683; c=relaxed/simple;
	bh=3EkAw3KoUJ5vJqs5XLdwk3rugWwLtztqYVKLvXds3TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=felLDuruHNeRw5O0dpmohT+rTb2GTyjCNyL+K1rraNzD68ahkW7x8kRka3D999iPbn4yYXgkcW+VeY/X0GV4MY2k5KD2hhYscxENs7ZWMdbL6UMklCXPfUCBVQNpb0deL3GLykE9ksheevT2q7FUbYlIyi6XfHbzSIk3ZtUyS8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c62dde3so685274241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 02:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586681; x=1791191481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YQdf/IVZCveOBsVWDfZ7xYtojPo7NY7S5FZDi+enVh4=;
        b=qIEkJ1dzMFutWeFatQddWw2nFq15RTTg0VAEy+jbvZzu+TcaUCkxHrCJPS5+gG7yx2
         LUXUSj4FhOzBH096HX3IwVMP6g6qzHEH/bJbOsbzxSPm0Zey/QSkNgL2BjLlCs+fPVCD
         91yt5+5Fjg7zpgh4FwGuuHN3nvV3T2v/NlGDz2PYnV/5fZp3rJOTTg4GceLmmmy3dX6r
         IHD9IXGx4zXX5jMeyg5F912Y/8dJd10OxG0QJS8jvqapi7Ofp+NK1VQxFmrV/nnBsWXc
         KegtGHZrK/5ntxpRVszbnL5oJ9wsrEZxuoE9ahjEOwdSPWRyQa4iTRU9A1OEY81nNS/a
         Kndg==
X-Gm-Message-State: AFq9FYJk6K+ckG8e2506Jq9xuJPjqqXpd2A603GzIABedlTAX28P03rE
	VUHQjNDIi6FQQZiOyd8nWgXC4DWh/xCybB0s9L87N+GlaIMbhjIAIze7wpW+enwJ
X-Gm-Gg: AYBFou2anMc5AKYORsAQ+6ppFC8m7jFirpTgund4HSMslu7iVpvff09Ch5d6imnz0Vp
	135QzQW+7hdkDP2YbvInoH19S6L1ESVbvD75wPzx89y7qW3AkFfOQfPpss0sZZnSZQhuANJLUEr
	L0RtsVmYD5KFvELWPzt/clSm0AfEho2fsyulvyT5OpMZ0P1A1jpcNNPvgDylGUOe+lYABD48Td9
	YA3xia6xTLHbKTzbsjsb+9rtWzo+Bi90BBtiNcfMfv10FyRduoisMk+NRsE60xH7u2YgT+adkse
	0rzPd8nfxpJIpUFTyJ75m2jg7fKodyj3I29Jw9iSZMoAByuDhSrddZjN6yEL+QMfQiuBljUy00n
	uEAu24eq3wAk1qHkcEADvN4OBaI2jaoOEfae55UnFWydRHRjOvY0Ajt/Gvb7HVCSrOv7dDaW32a
	pcSrInh1/dpfunjc1pZ2ozr1R9d0ES/KH+AhVbLZAJ1CAe4GnfxZSwBjVUl18guKxHHgwR7PajQ
	xLhf52yLujAaJsHe8Y0+ivMS0YUHvjIu+jAj7RysPxbZ3c=
X-Received: by 2002:a05:6102:a1ce:20b0:7b5:1ca4:9df1 with SMTP id ada2fe7eead31-7b51ca4ab87mr411325137.5.1790586680623;
        Mon, 28 Sep 2026 02:11:20 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988a5453f79sm3401278241.12.2026.09.28.02.11.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:11:20 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a4fb331cc0so661599137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 02:11:19 -0700 (PDT)
X-Received: by 2002:a05:6102:a47:b0:7a5:4fe2:b380 with SMTP id
 ada2fe7eead31-7af1eff6903mr3975673137.26.1790586679062; Mon, 28 Sep 2026
 02:11:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927151133.45845-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260927151133.45845-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 11:11:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ6r4=hwm6KxayTsYTJ4c+O_Bf0mazi-RYN2P3AxWuLA@mail.gmail.com>
X-Gm-Features: AclHuK9waXidYdoACalWAOWf4K7OhYl7ppYO1Lo215_OVK_ZMODfGAsk8xBNjaw
Message-ID: <CAMuHMdWJ6r4=hwm6KxayTsYTJ4c+O_Bf0mazi-RYN2P3AxWuLA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Add I2C nodes
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 17:12, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add device nodes for the I2C controllers of the Renesas R-Car X5H
> (R8A78000) SoC.
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
