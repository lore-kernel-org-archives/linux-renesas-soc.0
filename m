Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EFE4AA40A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442784; cv=none; b=WzUiYA6DZ0QkEGBqBBwlBNMjxso8ZmuCnw2a4Kye+0QSagiqDCEqBD56EQo/yAJo0j8K/VKcMubEjAsLBez6dp0Rxo0FwPu9mofXY6O6ggOozOC30e75zlXecz0ZLLy/WJxAjd8FYDdd5omrH+rpK/20nTDnUuQ7OV/ALRoo4To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442784; c=relaxed/simple;
	bh=ImQDDFj9qVjPIWDEX0xwmDVNDBDG8sj0eUt9eSQ9/DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FFUIqbLFEqe2YTZT68FLIosPJB7W57/vZlzuzkirs7H/9+42P0QBhIQOBLcpT+oCdIDiGpEyDEKvjzRbSzKJhJNsLTbb65NjI8rdFXApn+TaEZA5j2NMh6hEoMtabe4V1oqANnzraYdZUjZKiNwLWgGbpbiURNHpcmWTyY8Hxvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so4024613a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 06:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442766; x=1789047566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3kI/3YoXSD5l4MUFY+JdTBHSS/S10bVdqe61ILAQItw=;
        b=Cd+YLy5JQtkZ1a2grDwmbsN3/nhcoTsRs6b/7UOXW7b6BI7qEMOkQcRDjF7KNYAUUE
         brsrAWHAkPFHI1YJKLLYz7LWA3IEza5uoQgzvBdw/fCZv0k0d056PoBLchhz+SX9w4IG
         WX360WcUsMYFcCKRlwHwTh7l74pqzDZqvq+SnOpb9Wpg9LBVnLwuGiD8B1ecZZwa4CeA
         w8wTTUlrjLLKQ9/D0kLNjQk2ICs8GC+iOrkrBXOSh7F1HfAcCJxSO9xUf+9B0STtWz9u
         I3Nxwwc8XuJw4lvt5RnVsF3SHeXiAmHh1jMhxOl+dc7s9sh5N6DHaiaBghdtRil+LEID
         9y1A==
X-Forwarded-Encrypted: i=1; AKwUvBy0crARskZv0txJ3eJ9z43krGkiEKL0v1zim+fzEp9ornzWXbvkB+npitOwLKY5xAepu7Z0YQ1p2N6bpGgxSrciXw==@vger.kernel.org
X-Gm-Message-State: AFuF++kjfY4HeVlGI7mqcFfhxLmLK3veTqGCLGrLeJZQ/dn2LOB94TAX
	nHe0NdNuQVsfjcE9+djXhBWXeiJ2uRE8A+fr6/79Q7Zi9ee1yj2QUKZz5Byv5jaaPPw=
X-Gm-Gg: AYBFou0Tj+gHgVZzEoxj4Zzx+/F2C27KXoPoPVMFB8Fsm4kTbqgAG9oedCEHvYzTgrN
	RlTdlweggKijRca1d+ufK16x/O28VGaT5GytCUf3OvThaj/BEaS2UD4GrLqGZ84mBj3h2z3WWA0
	3fAOAb5iB7CUacRxuUw6sz4qzTwq0n4MN6a+JLPS7Mmf670KgD9v5TSzE1bcMrCn6ZUwZhgO2yu
	rSVFBIQ3oeG/SbgTZM2+aKzkwXMHrTL4h4R/Yvm7sRX1Wj7Gf2XZQZtzOznelJ0jdegGG4GtJ2o
	umt03R1+O/wMsbDb3BcH8aXt1ay9jYnyxz4yUkuavCkWYMIxrMDagOeeqcLnXYMj2yAlEGYoQ+w
	NKV0O76jAW/SohtfRHx1TndeZQ5ch1rmSH8EFDttYEqg6yy+ACYB0pxVmg+B94BmGw2VGcMAhC0
	PCQyFFL54FYIJOZkhuKtns28W11us3ft+wXwFliT0+v+hF49nq491d0uMEXN/JERtyoBV9ZGl54
	LjQAog1tf57wKXKOgis+8TaBtoJYtNM3bXU
X-Received: by 2002:a05:6402:350c:b0:6a3:8652:a373 with SMTP id 4fb4d7f45d1cf-6a68234c4c8mr7776326a12.3.1788442766040;
        Thu, 03 Sep 2026 06:39:26 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895d68sm2347847a12.4.2026.09.03.06.39.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:39:22 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a5e329c0f2so3149662a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 06:39:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwh98paZtKxpHTUlHu+dkFe05/BNv6Kpg7BjXVg711DM5CxdaYFqUA9RIIweH3n67Fn2LDqshyFFtvTpyW45XogPA==@vger.kernel.org
X-Received: by 2002:a05:6402:24d7:b0:6a5:fbc6:cad1 with SMTP id
 4fb4d7f45d1cf-6a68254b68bmr7079678a12.7.1788442762167; Thu, 03 Sep 2026
 06:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902104939.25522-1-ovidiu.panait.rb@renesas.com> <20260902104939.25522-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260902104939.25522-3-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 15:39:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZrmXfpmuxQdw6phK1YGJHyhndT64vmsdzHE9FO19jJQ@mail.gmail.com>
X-Gm-Features: AcwNN1XvRbtPP7ZOjowl3YDbtGxIvYTtX57sf45BGJvcFDqDNY8G0uf9IogwGTU
Message-ID: <CAMuHMdUZrmXfpmuxQdw6phK1YGJHyhndT64vmsdzHE9FO19jJQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Convert to clk_hw based provider API
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, John Madieu <john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Wed, 2 Sept 2026 at 12:50, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> From: John Madieu <john.madieu.xa@bp.renesas.com>
>
> The driver mixes the clk consumer API with the clk_hw provider API for
> its internal clock storage and OF lookup callback. Convert it to use
> clk_hw consistently.
>
> No functional change intended.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Nice, thanks a lot for picking up John's legacy!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
