Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3FB3DFC78
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 16:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779898006; cv=none; b=Vfpw7yliONkYKpF1y/iptagvhEfMQ8IJqCk7jJVQv+01ZmjL7wfhmVQjO2UhD9eQ6RrOYO/zmPDxdXOTC/Mz2SfUcQPi4vigh0u2YvLBqZT2TTnz4q8TqHpBW+K/mEmz7mqTDG6skjnJvCZKpR1Y9yAKFvUSzd+O5CeS5eAl0Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779898006; c=relaxed/simple;
	bh=ObrvBFWeqclDYasl+tmaJKbnDxhvBFySewWW+htBTnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyJ4nTYpeMxpN2trU00j3VmQ3YUySqYp5E0NQUD5aBa8h3PDxB5hCs7NVQvXFXX4eC0XycL4N68MrXeyRz6fIgC2jttvH3nk6qgbUEbCk1RCf8xOOvPHPBtSk9FMQp888YTARwu+qJ8c37Yc13VtrH9aJ75KK0Q392s8m8YGpcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-577500ac0e4so3782550e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 09:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779898003; x=1780502803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtSK9PEjPKljQj8hPBO/zK16lMhTU24eNaBdLDJg+P8=;
        b=p0QE9Vr1zxj4qETDCaXeYqzFylEVL6aVn6N3zXQsIEVt9SfeCyjSzTj8XTHdw1rzTY
         U4BDoe9bhDOuqHLXsWCbSVBoXSnIKjchkEGrGxkX7fkqwOcWdWKcwWvawoqKeN190PE2
         D3NNd71aTukzSSQN3a7+BpGRQTrTwWpSX9Xbf2nQi0cMLzjzpcpMHbRJcNLSu9wIdwz6
         Tqf5b8jURdMg0RNM/FCyWcEW0xgQ0U9IKWhwpnr+/xcSI28H7V71xiyCaI2Pgf9bsrAI
         VYwc7KqIi7NI0iEs2kTAp8YThJdIZ1pXkSZHIJMEvvUv4+ytiaLwyVC7tP0rSeJ0eSHv
         mnLA==
X-Forwarded-Encrypted: i=1; AFNElJ/WFxWhKzdi6PmGOWR5RwYCxa3vdIeJV3kDgBKhPzhrAlmhfWY7vT+YF8H2lkYAMri7xfiVWuDN/m2wzIfv7x8MeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0A/GYb6XIRaeku70oTT+zJ04t7wiOaNJtKmqsfFVP/k/0mznJ
	0C6sRqOwU9TYx8V1UfWNlqky8qC2Otmmn5XKxThTis5ZHevCZ62Dm+Z9v+ezjNP5FYQ=
X-Gm-Gg: Acq92OFGm5YqaXr9VThVSlEX94I5n1D3xCns39QsvOQBaiWFk6pNIrOxrjSvUy58hXF
	eOGaEkg/yFBgMkeZvEwlFoWqC5tF97YVgPuKOlEpkYFcbYRRVaLx2NeD0+nPN7pmCUrBLMFiqew
	GDbLiGGI7PohvUe7kz9V8/lELjN9p76uD04ACkYBwJpPQ/1HvFN4GKO//V6Qgx28mN+so2tKwUI
	tZMNoW28sDylolTOanYRp+L1Lt6iAlJmxfXLGh3R6jQ389e26hWaXcoFZgPrqvoOEXqgp+lQs0j
	uUi984XKXSteWjRbjufWvQbfYljmFVJFKhuFaRv3V/HN/olHsg/ApUjwG/rk28Q9g3IpnMohswH
	TILZ+MoVlE0X0yhWiOIUM3qlHFPYi/v/IJVXlvIOvFJFE0zYwAPHOR3wbu15q+I+JkJMojB2D0Y
	BuNCwv2UOf6S9ksKiXuEbr2cAl29Kg7lD5VijKzseekTuvyH0yboZHv+YjwQZirBoCZ2krPkHMq
	yg=
X-Received: by 2002:a05:6122:2094:b0:56e:e7b5:17d3 with SMTP id 71dfb90a1353d-5865f71f029mr5522487e0c.8.1779898002551;
        Wed, 27 May 2026 09:06:42 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f23ee3adsm20729532e0c.2.2026.05.27.09.06.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 09:06:42 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-58d2174a2b4so1723884e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 09:06:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ88RJUsOCOzS/L4P2OcYWgTEIC9M/VRcd/cMzF2Re80I/crRAFXYy8D+UnhDjHDBF1WEC/UswlDvbOv+i45f11Spw==@vger.kernel.org
X-Received: by 2002:a05:6122:168b:b0:575:29ef:7e13 with SMTP id
 71dfb90a1353d-5865d70e96dmr10995354e0c.3.1779898002106; Wed, 27 May 2026
 09:06:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com> <20260505123708.134069-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505123708.134069-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 18:06:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUu-wzfCXFtDxsJmvjkAN49DqFJYJxn4iA8gWGopzkXuA@mail.gmail.com>
X-Gm-Features: AVHnY4LqSGvvqOc1ewHl9xuhnSFb-Wd7ncAEKHhvJSt7cL6CXvH6eBl1eAcES8c
Message-ID: <CAMuHMdUu-wzfCXFtDxsJmvjkAN49DqFJYJxn4iA8gWGopzkXuA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r9a08g046: Add audio clock nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 5 May 2026 at 14:37, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add audio_clk1 and audio_clk2 fixed-clock nodes to the RZ/G3L (r9a08g046)
> SoC DTSI. These clocks are external to the SoC and their frequencies are
> board-dependent, so they are defined with clock-frequency = <0> as
> placeholders that must be overridden in board-level DTS files.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -14,6 +14,20 @@ / {
>         #size-cells = <2>;
>         interrupt-parent = <&gic>;
>
> +       audio_clk1: audio-clk1 {

audio1-clk to follow node name recommendations

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by boards that provide it. */
> +               clock-frequency = <0>;
> +       };
> +
> +       audio_clk2: audio-clk2 {

audio2-clk

> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               /* This value must be overridden by boards that provide it. */
> +               clock-frequency = <0>;
> +       };
> +
>         cluster0_opp: opp-table-0 {
>                 compatible = "operating-points-v2";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
