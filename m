Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C360844DB7B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 15:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834074; cv=none; b=d3jHxdipZCgbHQQ3o7ArWod2vwuch/6lvJGNCqts12xNJ6PX2sB0AlzlXrC2qYc2bM4PU9HNmkceVFUv8jkuvWc0Y0iEba79yDOZIIbUDQ5wdW7i769CgFAdJefqPfiiw5xvRIIw7jBwj3b+sy4PJgSvUxHMYNZ+UQe2DULe3GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834074; c=relaxed/simple;
	bh=HECdCdoiVcKsHL9ieEZjduz0kz0EHHXfKnn7LggCP2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNoAD3becFnKNHaq/r3+tVMeyLidrNX8qBfVN7NM//WIzJJP1z6FrHKruiUbzHJAU3+/mgbnQes413Z2YBJ9mtHq2JebKciyjx3wgFXunSsfUJKET13b8ndhezLM3EjWasA1VKONp8AcajRh7A2GTMItNo8Nfeogv5OPapljgo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so1155432e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 08:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782834073; x=1783438873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FudzaGflml93J0qLROb0/HyeenVr7sqBJ6ASEnUvtg=;
        b=FyLRAnkeT+7Eg5GoN6noTp1HZi8vXZOVhzIDS/zIRnl2hbstvnHiTN6iqPDz/wILCD
         gVZbRozSKw8zkOMiT8bA9sTgAz1EO6iwuET20Qw6d2vb/U+EZjKcP72C77WK0Vkn+w5B
         QYzLGUlHY6gl1mnVUCVq/ge29MYnHQFMU1eddyLBU/rY57KMk2oKdspW9bkfduxuSfpz
         2Ut7MT+LDNFtq3UyYDdoq4IOKhvNiZq+u9H8SIFiIsYfs0/xBnpWYs9YZPzhYt6fonzt
         eU/79ZuJJck+JhL/vAbu6dBwWvKnvWaZa3qiIePwk00wppprannxQCYZrQ32miXouc9L
         LdcQ==
X-Gm-Message-State: AOJu0YySgR46Dq1vwkR/FfJXIIeSDVbtQfvLnfiMsW+1l79dDTl0LmjU
	5tWhBxKGGDHI6gRnzYc5bPzOvEGT1gien5PrA28bKpsTFG4n90gxEEGIK+BDhCv8zk4=
X-Gm-Gg: AfdE7ckwhBG8RTypwzNBe/7ekCKYF11OvlbPzOiADSTOGHQtLRPGPoP8sF2daiRbXxs
	QLqgq3OKq+yzkvwhhEiyCmmSFvAYe2gCCccZFCOPe4me+YdkGOdCByROZeQc3h34RlLFL4QDk+j
	UGn1OW1myy5CMXCpxOYjoRdYD8X8oG9rc3E5Qjfaqwed2Wye7p4gm0yOkpXiMPXQnNxuG69hFiH
	apEQNk+UYsuFsfXQOE9LQlFhZxpnc6Lm+8yGENzLJQXc/aZAwAlfUBeFmPIlzqp86vBLG9OlnwV
	Q3xVxb3xXghYrS6jKDiKjB3VZVkHNnFnBqMmZTk/TLhloJk1EfwI1DiXb31c98dqt1+T4h1Zdqo
	/s3TtbT340PQzuseNcdr4o5LOjeqwwm0siqDESBIeljVll/BM/DbzFyPC2fYwoTYjGp897luyg4
	HTH7aTuvwom5mFd4zOFPUBDaSVzfTnjty9pCIJtHBZa8pdivLkYw==
X-Received: by 2002:a05:6122:6161:b0:59e:f727:4bb4 with SMTP id 71dfb90a1353d-5bdbebd1b66mr2049388e0c.1.1782834072616;
        Tue, 30 Jun 2026 08:41:12 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc189bfc0sm1596098e0c.7.2026.06.30.08.41.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:41:12 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-738bd0b7960so1505967137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 08:41:12 -0700 (PDT)
X-Received: by 2002:a05:6102:598c:b0:737:5c42:858b with SMTP id
 ada2fe7eead31-73a36aee835mr2136553137.11.1782834071816; Tue, 30 Jun 2026
 08:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626180326.9593-1-wsa+renesas@sang-engineering.com> <20260626180326.9593-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260626180326.9593-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 17:41:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUi74DDa_xoJ8Lo=eV54w4q9Jhu-1N02vUkNGCKgEywow@mail.gmail.com>
X-Gm-Features: AVVi8CcUvJP0aecjrianzUPa4AqYvcUMhpUwuDQPV--pueaST2jff09tZFzGmBc
Message-ID: <CAMuHMdUi74DDa_xoJ8Lo=eV54w4q9Jhu-1N02vUkNGCKgEywow@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] spi: dt-bindings: snps,dw-apb-ssi: add
 'power-domains' property
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Sat, 27 Jun 2026 at 11:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This SPI controller likely belongs to a power domain for all the SoCs
> listed. For sure, it belongs to one on the Renesas RZ/N1 SoC, so
> enable the property to be able to describe its power domain in DTs.
>
> Suggested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> ---
>
> Change since v3:
> * reworded commit message to make clear other SoCs likely use a
>   power-domain, too (Krzysztof)
> * change Reported-by to Suggested-by (Krzysztof)
> * add Rev-by (Herve)

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -87,6 +87,9 @@ properties:
>        - const: ssi_clk
>        - const: pclk
>
> +  power-domains:
> +    maxItems: 1
> +
>    resets:
>      maxItems: 1
>

RZ/N1 definitely needs a power-domains property, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I don't know about the others, they don't seem to have it in their DTS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
