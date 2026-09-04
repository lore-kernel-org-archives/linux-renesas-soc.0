Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1F74F55B5
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535778; cv=none; b=mS+ViFrl1EbKzR98tAGOjmnQT4fkDMEHUM/iKg5xqNN0YfHHgzNWBtdyUFkHAgLUbBfxsqXZWlZuYu7VrmswSOfg3ZuwbmU7fK8rrJqlqbl7DbtWQp4oZGTjV4zPPWr5K9OiGvrIWv29Rh0plg5JY6XLa+85iUaI508jb/NLRcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535778; c=relaxed/simple;
	bh=xuRqAUdvHsG4BxcDdfuXSf+SI6WrEN2MF8ZgZw7jyWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdZ7EMWu3FDJENYZ6P1ROlcJIk3riIB1RlAXxtyivja0T6JuUWa862CP2dLn2lXqeZfv715OCsEAmvQgWObX/IhsqqwOA1PykYEzUkRIkJ5jWZP5TsrjBP2cGLr46JIYByzclfeDNCiPKeEWqvyAKgAtM5rAWr75mLo714eTpwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c675e64ffcso2193386e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535776; x=1789140576;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qKx60bz5SuKi9YOnfZ7Xh4JH5NN7Tn78TsaIHZikv3k=;
        b=kUR7h9BSprfl3ZFvVE8ZFUlyXvLE9bvj43sD3r0YBos1U7WlazOZ9qLMW1kog2UiLU
         9rApXOgAV9InBA6p5qLVR4a+3IaF6h2qrou55qv81MQPvVNFpgqjx6pA2m+IkIqaSQ4p
         kRKDsnruv8jv51PDaSFgIoiIf+JCRjbxeNVuWgJJB+54cqYZkU+Uoj/MtUxLY0nNx1Uh
         sUpNIaeVPcY9xattXYO+jIOdNSvDnwkU3gDLzXvGDz9Tm5WHIGZ/iVsgviwwMCFeLgyA
         p/Tk+cKBH6w8M/IMlITNX+y9Al1UheNbC2ZhcndBWM9XqLUmKEgBnmgaJeQivwnA2JYC
         1p+g==
X-Forwarded-Encrypted: i=1; AKwUvBzu0weCVdBCK0pcABvqXnK4RdwExAUDmi7eH8tGV/WqV0XpqoRI6cHd8YnJGxkCJGy+LFb7aTLG6uSZTnjASBAqlw==@vger.kernel.org
X-Gm-Message-State: AFuF++mkT8x//q3RA9Z3WQIE1LmtcmA78G2sW+kAqrorZ78CJn49REEj
	FUdwgayaglavSXzbE3gpsRYRBM5nDGEEvkTX+41yLzRCLAJNjbh+M+PgAXWBlhzI
X-Gm-Gg: AYBFou39WUlmvHPUHS3O9ZQcpK9O7wOX8XtP7z0zQKykCRgPDu4nO5S/lxBdJbTZ6Nb
	qxQ57OiFw37f3JQq+QiggnqRGEuHm27Rrm0L8FRwByaqwSCsDZrQFHVHHD0TMkMuGagno29oudU
	6T2Cixcnpic6+ZV4HmEdWkQk52B+fxJt7fWJ36buIx2B3RC+HzAZBUEaG53hdwHl9HwZxLS+r66
	t1S8gSvFVIiwAETidzGxV2Et0zFHKRew4sYTYNruRzth2sHTsfwbXbYxhPh3/tf48irMauhb3bx
	UEJJWsXOOYCaPEd7Va80ynq+9RRZgatBsIZYIMi35vqPdA6cNBYCGdamYzG/fGdGvIWjz23O70s
	9ZMYRgDXTsKvXrhIhPk1lz3dfMxfbllQi5i4bEHl9sBRS/ScLx0yoqzxbWumbDKUL8tD3nJijx+
	KwRpwoX8WxVbP1Zte5wpPDyuM21SQDyB+QuA8HAaoH9POp0lxSBlDbndGthGEBHSh/C4fKPVMjr
	e4ET8gbvEKwYrwZSdykBeBiSQ==
X-Received: by 2002:ac5:cacc:0:b0:5c2:a30a:1a08 with SMTP id 71dfb90a1353d-5c7dcdea6e8mr2920877e0c.2.1788535775853;
        Fri, 04 Sep 2026 08:29:35 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec366bb5sm2316649e0c.13.2026.09.04.08.29.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:29:35 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97cb310ae18so799945241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:29:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxjj5bCDWLnes+4yTfF8wVb5c1vABlVSu4BKUHZ+V/9wjqOxnZ24gFnhQHOBard/o4HAu1zbt2XOHHF9n+KdIH/+A==@vger.kernel.org
X-Received: by 2002:a67:f906:0:b0:744:d517:b0b0 with SMTP id
 ada2fe7eead31-78a2ef8049fmr2629622137.10.1788535775319; Fri, 04 Sep 2026
 08:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-9-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:29:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWn3BaY3EHeThFo34Z=69OaZb0FQ7Z7Ui9MczDGS4nBGg@mail.gmail.com>
X-Gm-Features: AcwNN1ViLT-nOz1SKiDYeBMSJtbLrC_K6YnJyCHi1MudTORPs1tGe-hfANcJPSI
Message-ID: <CAMuHMdWn3BaY3EHeThFo34Z=69OaZb0FQ7Z7Ui9MczDGS4nBGg@mail.gmail.com>
Subject: Re: [PATCH 08/10] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/G2M v3.0
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

On Fri, 21 Aug 2026 at 17:06, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial Device Tree Source Include (DTSI) file for the Renesas
> RZ/G2M v3.0 (a.k.a. R8A774A3) SoC with basic support.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3.dtsi
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: GPL-2.0

Any change we can get "GPL-2.0-only OR BSD-2-Clause"?

> +       soc {
> +               compatible = "simple-bus";
> +               bootph-all;
> +
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               cpg: clock-controller@e6150000 {
> +                       compatible = "renesas,r8a774a3-cpg-mssr";
> +                       reg = <0 0xe6150000 0 0x0bb0>;

No need for odd sizes: 0x1000.

> +                       clocks = <&extal_clk>, <&extalr_clk>;
> +                       clock-names = "extal", "extalr";
> +                       #clock-cells = <2>;
> +                       #power-domain-cells = <0>;
> +                       #reset-cells = <1>;
> +                       bootph-all;
> +               };
> +
> +               rst: reset-controller@e6160000 {
> +                       compatible = "renesas,r8a774a3-rst";
> +                       reg = <0 0xe6160000 0 0x018c>;

0x200

> +                       bootph-all;
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
