Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E206E28506C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526892; cv=none; b=af+6n5rNrm+QKaIDZ49MbnT5tvSufX2s3u3YV9dn3TI7x1bqp0pLhvvr0JcV4RMPw9EWO9H9G/ColFBl/DsRODqdvsGEWGBBWKUlXSFw0iWlH2Bijg37Y6k9upPKYvIGX44k+j1ulTkUkXulQyBJqsEY/tDc5/UCMIIvgoyuxWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526892; c=relaxed/simple;
	bh=jUfy3jDPDO1gYgSYzIH9kVV64CrYvNurBewZo0IJOhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLSUmOi3mn4NQRBIFfKxvGXL4a+ZTrv1AeQySpEdm7RA/2g4giyJOD68KSmfHJbbfPntdQ49JMAOePLb1GFAWKVQp8kT8EM9T5AZaY3sY8XfSmVnuUPzAuJTeKIyhvWLPodxvjo62050ao6xglLXKMUQY7xSX8jKVCNzIrwjSwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-963f63fe025so357372241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526890; x=1789131690;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BhKln9SUSjqstm0nn2XiJI7ZCrh52DpPOYmNB+vWzdE=;
        b=EoJs+Y6DYbqgzDE9MAJM3H3gdzkFQUoZC/mdRwENdWW5K2ufOLwdDN431IxvVzJjpu
         v3rOexT1MyUQa/jXAU8HWzY93KxAHNrBNB7gu/8F4tdau9d3R14T96BvTC31yRXJqHqz
         FTnD/ld0IJJgqaIrNhx9PeGPYEoVdXDXt0tBN0JtrWLTs4CKo7qLIRMo5j6qTsrPBGFa
         36NrsskaAUQhvmEUE25FkoAef2Af34qAsy67TU0ivT/hBF9RvsIIe48fNio2dLmvGvuO
         +j95D4t6ExL3jV1w+y6U+FEyg1i2YQvKvgdXN9OSQJZGbCHWTN+dv0jky3TbNZlZctA+
         LgYg==
X-Gm-Message-State: AFuF++kBEzisCcPW2kqLxnCojWqwVHWJ7kDWh7qfYHBsachWMq+/g+q+
	BWi0U2uXJxPakckJoawvdvNNHasYn39wAaCbTwk5s6uHLD2/Zddm6D18T19VQRkhjvg=
X-Gm-Gg: AYBFou0LI6ILo3Dn1BK0YDpkgxl+pcRUVJFFI058SfjZ8JdckXwGQ5XogPjg4NTViAR
	rUdRpTBfr+ixWHOKkCAm9c3t2qK7PKhtFOTgDrJYrqfT5AZfXbDD4CDwUppnANwcD0DmllMmlNy
	8L2jbahrNpq4xTsZbYbaTpq0MM2N9ozZeYEU6zAnKZu39FbJfCYWozhNTStsUC/NK2PNGb4DHwN
	g8JbSZRQk3Lac+9o3B2E11YT/e/P8bfcV1hIgtBbuxsOH7SS45wfIv4gsVNJ+MW5hCKmV3cnUbj
	Pl9Yv8ZrfWDgqspdAY513PGYLO9K6KWl/ROmPV1yKYi9dXMmgZimAwMwTnw12ZLuSULDRKlR8+J
	jtgzMj93RqVXvhZllDgnrqPKU4XOlFAeHN9Xj03JlKhqc6hRwGb05xGN6mhKnc4eamQ19fwaIdu
	/lIKEvaC+DFGoXp27PNNUf3d9VnmVP7GniVY19XpWVK6IWWjA0CeXEsdFudokFAJHeTQNln6tx8
	hSlQMlfXM04bOzUgkUsuH65wb8zUUBTvgJb
X-Received: by 2002:a05:6102:2d04:b0:785:eb33:87a8 with SMTP id ada2fe7eead31-78a4a883885mr1516164137.4.1788526889612;
        Fri, 04 Sep 2026 06:01:29 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1d832sm1504823241.4.2026.09.04.06.01.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:01:29 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-74ab6c88052so322912137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:01:29 -0700 (PDT)
X-Received: by 2002:a05:6102:2d04:b0:785:eb33:87a8 with SMTP id
 ada2fe7eead31-78a4a883885mr1516158137.4.1788526889240; Fri, 04 Sep 2026
 06:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825141542.30901-6-wsa+renesas@sang-engineering.com> <20260825141542.30901-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260825141542.30901-10-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:01:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAL+B7RchaV+PMDT7XbQvXz1WZ82B0EZXcH8VLBEbL+w@mail.gmail.com>
X-Gm-Features: AcwNN1X59X7feyO-WMq28mmKv3eBAzn4dNno6YGSjElkpqCwSZMQqdTmBUfjuRo
Message-ID: <CAMuHMdWAL+B7RchaV+PMDT7XbQvXz1WZ82B0EZXcH8VLBEbL+w@mail.gmail.com>
Subject: Re: [PATCH 4/4] dmaengine: sh: rcar-dmac: Add support for R-Car Gen5 SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 25 Aug 2026 at 16:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Gen5 is very similar to Gen4. Of interest here is that it has a SMMU
> instead of an IPMMU, so we don't need to set the flag for a workaround.
> Make the module description more generic while here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/dma/sh/rcar-dmac.c
> +++ b/drivers/dma/sh/rcar-dmac.c
> @@ -2012,6 +2012,11 @@ static const struct rcar_dmac_of_data rcar_gen4_dmac_data = {
>         .has_ipmmu = 1,
>  };
>
> +static const struct rcar_dmac_of_data rcar_gen5_dmac_data = {
> +       .chan_offset_base = 0x0,
> +       .chan_offset_stride = 0x1000,
> +};
> +
>  static const struct of_device_id rcar_dmac_of_ids[] = {
>         {
>                 .compatible = "renesas,rcar-dmac",
> @@ -2019,6 +2024,9 @@ static const struct of_device_id rcar_dmac_of_ids[] = {
>         }, {
>                 .compatible = "renesas,rcar-gen4-dmac",
>                 .data = &rcar_gen4_dmac_data,
> +       }, {
> +               .compatible = "renesas,rcar-gen5-dmac",
> +               .data = &rcar_gen5_dmac_data,

I expect this can just point to rcar_gen4_dmac_data, once we have
confirmed the IPMMU issue does not impact R-Car Gen4.

>         }, {
>                 /*
>                  * Backward compatibility for between v5.12 - v5.19

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
