Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E543A453A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Aug 2026 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817578; cv=none; b=crshRUB0gvUPzmO8ypL057Z3V1kHxtlF4+7/F6Dga4F+u4ke/AcvQ7plOw3wtcLSJrOU6dTRoef3tmPFppy4qYVoe0nEoTjxKwge9SyMJtqK4gQyo4Cjty7FfI0DUQGphe7/WMVOgKt9kEWwpb+7TmkJoUESH5om4oGJc6+qb2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817578; c=relaxed/simple;
	bh=AhF4RXSyKUiCoAAAkiY5QzzA273/YmWbFz5K0WcWd3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1SghiAgpNytik/b3SF+4otAeiXC2fAIYUUmGB0zqPv51acR67Ou+vkCVY8PCbgzCRmJN6joPw4FVjJfvDwY5cpMeuOkR9D4sshv/fTDiNPUxP2XrFqS90S0OG0fxIbcK4sX0cimsvRLb/pVVAsZm4kKFZ4SpjWcrvQHgQ3npjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-977258a75d9so1116521241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Aug 2026 00:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817574; x=1788422374;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=veOq8nn5oPUxcnaWxlmevqsZxizj+SHbK8Mk08fVSFc=;
        b=SxWpe/dWefUsBVDlD2EsYUpcrsVH0VK7GQqGHv9ub6OpTeTy5X+XjjpYUeDO838VKA
         4MS2MXcRAQrQJSyAkQiCqtb4vZU9q9ijrTgKGyuXQO3O3tBDfKk1v0bnITGmRqwPoiB6
         zPy7BD3tFeWkC5FoqJfEwZZGUXcatPu99prFMkEkJF52sqAZxTchNfLh1tJ2/1x+Z7n3
         haTrspFn0jvjclii1ERBHO1VqZ5YarTuKOsb1cooMbX1/6eWymOS4oPq7+jgDMn3B1JA
         BhXjcbviCkMsyYz0DDdXzzGfYjNV1FW3239HPtbZ4PYPP69Eo1o/PoP6QxBDhh5FNDnd
         IhRw==
X-Gm-Message-State: AFuF++l2Z5aBFIEN22EeBKTSidvHdI45qF8g1zYQe3wTBVQlYojkfrKg
	DKUGTc3Z0w/KcByQ1i0BfSmDPCeYpgLcYIM9g4Ee6b3OsYV8TOwR1WVtpB5G/tWt
X-Gm-Gg: AR+sD11uDs7B90Lvxw+ULaSeStVL1vydGAMZT1LzFNv8pETFuCl64U1dm6+uDUuOMfD
	mhuCPY5bB+6/u3ugxvJWXO4sAZB35PbeDQiFxzM56+avYsPAjk+HaIfVZiR2Ezco3M0gqN6VGNh
	KeHn1gJh2PnvTac2RHC22IVKiggE/ei6ujQggUWDvMtbkPsrifoWiT9EmqdYN2l4l1qJlrEenGZ
	IWLgneanA0lwkUxidLJJ809rPhhFowa/sAwWl3ggSTkbkYj/6vvpbXV6uW72vaWNcRGRLtOfnvk
	vXTB+HpSEyMeF3yHCB487qAtQDaOvehT0N+aR+5jxwpCN04XWi6ezVxphBF4xM6j72mTr+jlnmq
	4KI/+g5hnw9AbEwrLjfDz53avz3cSt4WCC4uMoNt/fmrFJjVgDDxP75bH5tq0CSfucmFu54cDxY
	mm/0Os+P2ua0HkO7IsmWpcUWKadoyB558/NJp+ULr6O/oXCWkx/05t/qxOtQQ+/UfRw/a1YCmcd
	KnPxccRzCS3YzIoZszizIvU2aBDrz58Gfefjg==
X-Received: by 2002:a05:6102:80a4:b0:782:a526:30a3 with SMTP id ada2fe7eead31-782c22fa487mr5225687137.11.1787817574250;
        Thu, 27 Aug 2026 00:59:34 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78302d75909sm3965086137.0.2026.08.27.00.59.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:59:33 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-973b676e5f5so1230149241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Aug 2026 00:59:33 -0700 (PDT)
X-Received: by 2002:a05:6102:162b:b0:778:459:f215 with SMTP id
 ada2fe7eead31-782bf9a8e38mr5448748137.3.1787817573651; Thu, 27 Aug 2026
 00:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826083524.6056-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260826083524.6056-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Aug 2026 09:59:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXj04QoxituCF3wRcyzN7qZrVBn7-ukNkKDd0OfhB8zOQ@mail.gmail.com>
X-Gm-Features: AcwNN1WaiSSDv-J3T2K0-5_UW8SuowFlCQq_EI49heAklJYMtVZ13OyYfT4lCnw
Message-ID: <CAMuHMdXj04QoxituCF3wRcyzN7qZrVBn7-ukNkKDd0OfhB8zOQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: i2c: renesas,rcar-i2c: allow 6 DMA channels
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 26 Aug 2026 at 10:35, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> R-Car Gen5 can make use of it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
> @@ -83,14 +83,14 @@ properties:
>
>    dmas:
>      minItems: 2
> -    maxItems: 4
> +    maxItems: 6

Shouldn't this be 8, as there are 4 SYS-DMAC instances, and I couldn't
find a limitation w.r.t. I2C and specific SYS-DMAC instances?

>      description:
>        Must contain a list of pairs of references to DMA specifiers, one for
>        transmission, and one for reception.
>
>    dma-names:
>      minItems: 2
> -    maxItems: 4
> +    maxItems: 6
>      items:
>        enum:
>          - tx
> @@ -137,6 +137,20 @@ allOf:
>          dmas: false
>          dma-names: false
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,rcar-gen3-i2c
> +              - renesas,rcar-gen4-i2c
> +    then:
> +      properties:
> +        dmas:
> +          maxItems: 4
> +        dma-names:
> +          maxItems: 4
> +

I wouldn't bother adding further restrictions, as these are not related
to the actual I2C block, but to on-SoC wiring.  DMARQ is just a single
signal going from the I2C block to one or more DMAC instances.
The number also differs among I2C instances on an SoC.

BTW, all I2C instances on R-Car V3U have one DMA pair ;-)

>    - if:
>        properties:
>          compatible:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
