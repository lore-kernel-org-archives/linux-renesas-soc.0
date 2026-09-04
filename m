Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B82423160
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 15:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534080; cv=none; b=VJBjoh5Ki7zdYhFKXoH4mq8VnK5f29aR7pNridIM0wYm2f6wMuOEet0jSW0poxLZS8wNrUtYBCXKn0IYOUj9A98mY+tgyonTxzvhaXTJuDkOWxb1vPGUIm5SfQsBr8dh8jM0Vrkk5GF3iD6bJcD0ExR3hP1ZFd2X5p1LatCcDto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534080; c=relaxed/simple;
	bh=90rHthjt/yGjs8ruJ73s4ajxZDBI6dnx8TaoyliYuBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDDCu6agUrKqM2v31oR3v8bZXU0Lt36NB2t4QDRCoffw/f9sX/pz4qofB/ad92mlrB64F/TOshSKkfFd1QeytGAtCZhoqmF00DnljRZAl9/8sevawz/p+JUWP5IImvtEcgpy0fRdZdMe1kg8tZz0h30l7XKLANBj2E5MDFaphkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97c940ef65cso769583241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534075; x=1789138875;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hlQwu8m1wQp2ta11biuk/tG/NCV6kSdttoO7IfG7LVw=;
        b=fYWv/af92+Jeta8ADt2RjWwhXrKO8+OASJ0h/hn20f+DDyP8RLmqbN8Nl1AR5HSn3U
         RXyJ3fvDrwqAf7i2dQip9OqpT1Wq0/1yRmktw0CNf6NrqXHOdJoprBx0AaTs0s3Rab0t
         VkH5GB9+wCF8Lun7aHjOmhLZwr9h0vi/5UwxqqQcggAMG4LULIZlDZryTb/YdkzJIYNi
         axjxAyHY4b1OHR/i6BLyuavpMdoelVJN0cc/DY7MtptBod/7XPmCpb062IwZreRx9QQz
         xKq2qLumbFPLK4sH4wIH8ihJcDq/inT/M4sSRIVrfGK9EM6P0CoC+OuE5BgWcg6vvCL8
         OPTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVMh+BCsbrkO121LzG5qlyrKircT4FmS4KkDroqXpguS2/Zht5s2pXoiQW7dlOt7q74Cc4j3H0jBfyCFdEZAvaGA==@vger.kernel.org
X-Gm-Message-State: AFuF++k2e4XJ2BzVAGhmGgODtS+Ztt8u1KPwB65880XcKKAV2xofY5zg
	/PBlHKA3JMlmSSATiqtx+BB1syB9f06yyE0AgiuZ2fH/VpSsZ5gETQgx9zMVueDY
X-Gm-Gg: AYBFou33mroE2NZb6oTyq8jmVQBDQwqrOt7OjCW9Uj9H7iw+t31ktxN7t3mgvlOjQTx
	hyLzgBPMw6ScXMoDyDWTPc6MkKgNuQOswtNClj00Bh8ESTCIeXf+XyeIgVZJU3c5piOFCOEaq01
	L3u7sQ1egacPe25Wn6JXOpxK4bHv0YfdoC6tkIuAT/RRl3Z+C40aEwXJiY6c2Su4iEnSYhoCo6q
	unji8VvdOWppjfxPKmZ9E1aNXbeIGBCfBGoofZd/htlAM56tffppu5kTZIrj7GUvA2GI3EeLuiD
	cT7YsLZ3ZcOG9NrOs28siPEBvrv9aA7toQj5NJ2jjgzGQBJRKnpF9eQLIAL+aiK0ibRe/InuBC0
	9iqquq3kai5giKgXbfICEqB1Flg2rsX18NhWc2diqhRW3/4GGWZ6ESfc/pk4Cf4JPMEZX81nJ7O
	jaUI+VPvBEoAu0RWTnzS9q+IWW8fJGAGg3+IDCayUmTVWwpOrYN3RZUhw8pRmVxV0xS/yUSI53u
	kbVnYcXaMyMNFEpbQGJ/8qWkQ==
X-Received: by 2002:a05:6102:512b:b0:789:100e:3d0c with SMTP id ada2fe7eead31-78a4aa134ebmr2129654137.8.1788534068949;
        Fri, 04 Sep 2026 08:01:08 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1dc86sm1710845241.5.2026.09.04.08.01.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:01:08 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-746d77537f8so690909137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:01:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw3I3Qp4g9lSUoLYF1oFWA275ajPsAqHqmShZ6ZQckMmQPZI8knxAUg2WfVbmuuIM/G7UWXaN3BH5KlNFYc9rPwrw==@vger.kernel.org
X-Received: by 2002:a05:6102:570f:b0:785:e444:15de with SMTP id
 ada2fe7eead31-78a4a8b86c6mr2573960137.6.1788534062781; Fri, 04 Sep 2026
 08:01:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-2-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-2-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:00:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuyEXPJpCaE+MGwWN1qJVyzePA5--wsRTZRtFP8woCZw@mail.gmail.com>
X-Gm-Features: AcwNN1We_3fExHm_K1_nUZIVYeTkuFzPE8r5pnBYIyrcPLEEf_cM8LoiXO9Ji0A
Message-ID: <CAMuHMdVuyEXPJpCaE+MGwWN1qJVyzePA5--wsRTZRtFP8woCZw@mail.gmail.com>
Subject: Re: [PATCH 01/10] soc: renesas: Identify RZ/G2M v3.0 SoC
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support to identify the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC.
> The RZ/G2M v3.0 is assigned the same Product ID Number in the Product
> Register as the Renesas RZ/G2M v1.3 (a.k.a. R8A774A1), so use the same
> SoC data.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
