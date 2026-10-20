Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499233;
	b=PI5R1GbZb2mLGkWxmmFVQbU1JzmtJ50XT0rdVOlAC3uHDDBD0OCBW6KVK9GO+ptFB56I
	 392dgmwsdVXZ6/k+KU/szvip17ia8ABDsoDK0paDNQbyGgD7Y5oxaHZoJ+19CYiX6/N14
	 GCeJQ6IZrejhhAWwLSc1YaKn0SGa40KfqThOLcHfEMNN3bYkE7NoebArf/r+GUqp0/Kl2
	 ryTuMdoHkcX/COho/28W0xSIPQwptBwbAAE12uTECowMThQj/nijvD2LQKewIq/8HIRr4
	 1oMcXah3Hd++5CRofA0TVbITKCQB98vs8SMovWFnZ4TQW+gzaROXoy3czuEnqiuECoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499233;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=w8ekeggAdWyBqH97gBi+p9TPg4z/iYMBplVI65cJ2lQ=;
	b=R9tMrZPC2C4m1TBbLn8Pz/dO5QSS6d7QhX4yv7+JvMqxjCaIFn46dEjIDCxbdyGN1mNr
	 /VfbHxZvi9wRuZYZi3+HAaNDoNwYVYusyzDYTzajf6q1Ra+vFQApTer+uL7AcJfxb6qSK
	 Tvb84Y0VVpEh2stHlpXypdsLc0+1CqaXnZUtl1YA6eo+KcvQjVKEnynscDLpwZYOcHBOT
	 5lgP7DFCF23cZVaPX5CnRVK2LHgj5Cm1z0MFCCb6gyoVkkhwWgivVxc6WUwbdOzQmr05V
	 6GejqndjmMciLS0kgN6QXaSH+Dc6ub5Qw4sfhRwpV6bNm6FU4SNQIHk2orsA+XBphig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58AB606A327
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 12:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A58AB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd633ef819bso1201958a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 05:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499232; x=1793104032;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w8ekeggAdWyBqH97gBi+p9TPg4z/iYMBplVI65cJ2lQ=;
        b=oKjD8TJduBaZvFzvaxfjcV3NmlWk7FKv7ZWeTnMzs4uM9nnFfCxAzgLD9MAnhWAaXn
         zqPoVFi+X5O0NDrv9x5P/fwUwvwKfWi0wZbO9N/frq+OUsagxYyXFkQvmS7d+/jifHMp
         Us7f/IOVIMtMdE424r9V8jsL+TJUYpZkclU5RjiFhq/Migm8jHr9HM9Yxg8Hb3HvPe+B
         cD2dOP7KWBlmtJCvbEhVgjbTh9iESIrHz14aE6laTR5e0Qxrwv5AXudVCBxp68xJV31V
         O80hvl9GpilKxvpzwz6WkuegAFuUMLoqWDn2J8RCfrQ4Ced4G6Zz3OCeLD4XZpVPoHEq
         i2nQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4HGgY73+g8o1xennMMy2i0vLZEP09riy9UhVajRUUOcvx0+/uHcrfW8h3gB6PRahQK420tFmCBlFNpke1iUtVNg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIHiqFjtlUpmUHbB5ynN54efFiKvJPfofJIz17k9hUUbkRADNjz
	MSjyg62KzVcpGIxZjR1uVTAv3njSntR0eDtXJKFG8oPCouXmF/pxZh46v51+BTx+iIU=
X-Gm-Gg: AYBFou0guTwr3of4d1mnfHJnmRcukv7822s1CXpo9xDnHIbKJgvD4gOFak3sRBWBmBn
	1Bt1H+vV/FyRCuNaOiKYeZUyFBo/+hdMNfNgYZG1NkPh95UQ3D/vj6lXhePMf5NGZ6sgiT+vTtO
	Ea1EQBm1DXprfvvfTO7rq3oKaULEacxqucQiH/Tg89DPMGOTlEtr0x/NWy6XcjWUnWY7lddO+b1
	q8RNYMQB27pCZl7/bJnWOQdwEuQm17ROm4qWk0iYSI0KJt5MoUVS026PeDY0WlGT0wUqEWDemtm
	20rs7TnUSwsmPZPSfqRxE+r544pBVvV9/S0wncj4Cm4pNelRRJyWV33tgv5dhL0LWoDqBQTiTIP
	t7pJ2maoJaMrYiqgyuXdqVCNn2L5AKKqayDXjxXS9LeakWcUW+2ISFzHNg/+tdU60XLKZvZfwj9
	1eu1FtpzKDpxu750GcTdZYNXfG6eC1poGEzZdKwB7CdGLn5QoZw8+Cj04HVbvy2P0f7YB6xLB+P
	JydF3QayX8LWS7odZmbQ7Aph9qRBtTXcfb0PGdHZ6J6Zxu4kQ==
X-Received: by 2002:a17:90a:1c17:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3ad25f621b1mr3517975a91.11.1792499231943;
        Tue, 20 Oct 2026 05:27:11 -0700 (PDT)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9d266d6sm9943953a91.1.2026.10.20.05.27.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:27:11 -0700 (PDT)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso862736eec.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 05:27:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz42ug0NTA0gbsFjNomSLteq1dH6zFFJbNsSKoZzz3O839znz7ZL9362cHLJi1MRnnixvurGvnz/G9jFfHwNnihZw==@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:7b8:1a1b:8e79 with SMTP id
 ada2fe7eead31-7cc36495eeamr2517275137.0.1792498854605; Tue, 20 Oct 2026
 05:20:54 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-0-e052903a3832@ideasonboard.com>
 <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
In-Reply-To: <20261015-epaul-v7-3-rc1-x5h-vsp-fcp-v3-15-e052903a3832@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 14:20:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLC7Zw9x6=iz2WMeuPr=rhqKMVPpRdVqFcHJxmAYC79w@mail.gmail.com>
X-Gm-Features: AclHuK8ponr4NJ0lS94fhAlbo48BEUWSxi4Wc_0ZZ5rhhDlLA3L5w0smnHDD8jQ
Message-ID: <CAMuHMdXLC7Zw9x6=iz2WMeuPr=rhqKMVPpRdVqFcHJxmAYC79w@mail.gmail.com>
Subject: Re: [PATCH DNI v3 15/15] media: rcar-fcp: Check device revision at
 probe time
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Thu, 15 Oct 2026 at 09:53, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Verify that the device revision register reports a valid value,
> otherwise reject the device.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/media/platform/renesas/rcar-fcp.c
> +++ b/drivers/media/platform/renesas/rcar-fcp.c

> +
> +static const struct of_device_id rcar_fcp_of_match[] = {
> +       { .compatible = "renesas,fcpf", .data = (void *)RCAR_FCPF },
> +       { .compatible = "renesas,fcpv", .data = (void *)RCAR_FCPV },
> +       { },
> +};
> +MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);

I don't see a good reason for moving this around?

> +
>  static int rcar_fcp_probe(struct platform_device *pdev)
>  {
>         struct rcar_fcp_device *fcp;
> +       int ret;
>
>         fcp = devm_kzalloc(&pdev->dev, sizeof(*fcp), GFP_KERNEL);
>         if (fcp == NULL)
>                 return -ENOMEM;
>
>         fcp->dev = &pdev->dev;
> +       fcp->type = (enum rcar_fcp_type)device_get_match_data(&pdev->dev);

s/rcar_fcp_type/uintptr_t/, although this no longer seems to trigger
a conversion between pointer and integer of different sizes warning?

>
>         platform_set_drvdata(pdev, fcp);
>

> @@ -215,13 +332,6 @@ static const struct dev_pm_ops fcp_pm_ops = {
>         RUNTIME_PM_OPS(fcp_pm_runtime_suspend, fcp_pm_runtime_resume, NULL)
>  };
>
> -static const struct of_device_id rcar_fcp_of_match[] = {
> -       { .compatible = "renesas,fcpf" },
> -       { .compatible = "renesas,fcpv" },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(of, rcar_fcp_of_match);
> -
>  static struct platform_driver rcar_fcp_platform_driver = {
>         .probe          = rcar_fcp_probe,
>         .remove         = rcar_fcp_remove,
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
