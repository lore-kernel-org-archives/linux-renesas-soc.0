Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE05440A15
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668588; cv=none; b=HN0Xv0OaUvv3eniIVN40OBCRoVRyCipD5npqqwAsYaC58mnoDbKw9Otnr76CMCOhpVIF25+M5k3sQlEDUYAz4Mv0O1CjiOFA90ofwq4I4wQAb1wnTF9SpZdRkrP2MbQ2yK4Ctwt3i9n+Y4sqEs8PAToZQQ9OR/k5hdy0F/S+C7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668588; c=relaxed/simple;
	bh=NtDNnAxS9JCqoYNY9CXizA3YxkktQlBKy/wbas23ZKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdnmzgTx4pHzSN5i2jbu7yjDIs/O2YzrPGvn32qgO1dAInCj56yk7s6ddNI0q6h4z9BYgg/TIu2m4BFuXmNAIEG9YCzCD5MiF8UQ+07jEiGcRl5b9JpyaiX/GbDfhS8NCXhqWJtF5PuZNtVzkaVqYZxmrISr1fSeEGY5ohiUH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c276bd3692so4598070e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 07:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668586; x=1788273386;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ScdPB/HWXKyLnSzbxD6GH9YFmqF5SuqSigLbQv0OKqA=;
        b=YzEe5LErA1P3KulR2RIEaDXgguL9tjG3cQ4e/jQY8HM9FxnP+QtZA/ThSzry00Rawi
         qDkDBvQJu99RLWM+j01gJs6Hjpgwn8969Fp29iIDPwGs+yK+sNb5iKre6CGVdf0a45r4
         vvMKWtY+ekYY8LUy5/hsbHDeIYgn8ccid45lTJeXHONfRWRzE61Cnmqsa4CdF2OUJdq+
         4pmawL2ehWA6aAX62V/aYzwh0taWNDQ+3h/hNCRM8YEGEfWiowohiHITuMAA2GU6DZy1
         eAjzM/kU4uPz3GPA76Yjfui1Jsfgeu9oouBmxZwH36ipoLyFmO3RfPQOdQ6YpuudmLrp
         3bJg==
X-Forwarded-Encrypted: i=1; AHgh+RqeA6bFGwL50/US9u1wLEDIHKDfSZtpLZfh+73qvCdjgIEh2ZwyCC1GMbkQ2VJjyLofGtr4w9cgSm4Bl9MZi39Ekw==@vger.kernel.org
X-Gm-Message-State: AFuF++mXOS8TUas8i/buisSrZFglQ+JIuvV1to0c+ZLlwg0ZJ/GoxUkf
	LGbuHXloqINLXAuuACDnY/92V0lyRZvR1a3qkXY/H/0IiqBNwjNJWot/15aVm8yHE10=
X-Gm-Gg: AR+sD12v2woa3XBGs8fPdcTmOR0iNRvWc3RNaTk2fuSgeNCAArjMNx9wNzLVxfSSE3w
	h0uPYEnkQbnTdTEowEVPWVc9Fd6nDh6Ny9caTLH/wwpK3i2JU+un6bSvBToXFbpdQ01/OeE50pq
	LojXiHzX27K89YuDfBXsk1tewQPwJJephbOwiyNtSiSuWEDbfFbBnthBda3XeU6m1Gfm7/hQ3jk
	k/ihtd57Lrlh3mMziFxt1m6+ao2wCQlKAlYR3Hysz7E7iuv5e9PPIuBN7+o8JVIDGx/ndYvzHWi
	Gp6tfT2Q5Aw4KzXZ33sqJJgvBW6f2j663hilf0nbwZMt0F4AFshwFIWTKuMxQI8cQJvyk8NNzRw
	bT1+E1Ju00PROZCOk6qcgF5SpOu+HV0d3/0Qb9HR1bhg/blGBY98l1aarYXfZKQEooNHXL3w5Zw
	5YNUKWKtNl+FzCtouHfTf00yBGvZa1fie2meM6PtS1oungXKz69rKOJzjAvrRPv7EOgi1WEpqID
	P2aXVffwNAUsaoS64NgWTmitA==
X-Received: by 2002:a05:6122:1827:b0:5bf:d3cd:3d64 with SMTP id 71dfb90a1353d-5c642a06486mr2888457e0c.0.1787668585887;
        Tue, 25 Aug 2026 07:36:25 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623f22e85sm6187690e0c.17.2026.08.25.07.36.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:36:25 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-74d55dac06eso2765171137.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 07:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoC4fTbUnPVA1CTsg+MKT9agNjdto3fPEM+RTjtXbFu9tsifT1jwL4lttszKMVl+1bpmvzbXOzlFEE650Wp/oA3Qg==@vger.kernel.org
X-Received: by 2002:a05:6102:148f:b0:77b:4bee:6a8f with SMTP id
 ada2fe7eead31-77fe84dcf5dmr2940768137.9.1787668585576; Tue, 25 Aug 2026
 07:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-5-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-5-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:36:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ2MsMKQj6gA_4pPwdn2VmyGgzTUXHF02=3hVCdRWC+g@mail.gmail.com>
X-Gm-Features: AcwNN1W_bbmZVeZ40Fyz6-5WTX8tm1gBDARO4xiKfvf6z8u1u_UqEYooprtkdMM
Message-ID: <CAMuHMdXQ2MsMKQj6gA_4pPwdn2VmyGgzTUXHF02=3hVCdRWC+g@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] can: rcar_canfd: Allow the CAN FD clock to be
 sourced from fck
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On the Renesas RZ/G3S, the CAN FD clock can be sourced either from fck
> (the peripheral clock) or from an external clock (can_clk). When fck is
> used, it is divided internally by the CAN FD controller.
>
> Adjust the existing canfd clock handling code to support the RZ/G3S CAN.
>
> The existing struct rcar_canfd_hw_info instances were updated to address
> the request in the Link discussion.
>
> Link: https://lore.kernel.org/all/1d9719e3-10ff-4cd8-b729-55fea93c37ce@wanadoo.fr
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
