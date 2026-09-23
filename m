Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69F44AB1DE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 11:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164046; cv=none; b=XeARn0RiQnuaoXTG69N8X8KrknBwFuGcNw7xe2des8XuHZRvX23ag9QdpzBCMEsHQ9F8SIcvezdrIZjeg9ZdG/zwnWJIpj6tYChj5kGdZ35aAvmh2jmHUbCKWF9eXlNIK45QVZnqTkNvxqaSap+0IvuqjecjUJn/hSLKhx/UeVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164046; c=relaxed/simple;
	bh=b4JaTkwpgWpFvEutTKRNoLeVewrcW54SZ1KMcM37Cts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUvwz8SKzDipiZj8Rdqi2lqRczDjBZbiAi16nCBVpyxXohguWhPnakTEkA18Y3ysXfnVOGWvkHf6+dbU8S97L/hGRZC6DCKsg1BxrnpObvMN3c99DPtvxJ/np8UPwd/lJB/QgFpr/hVsliiUp8AGYeN7MFr9R5VTHycCqGU6h+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-785692e5907so495892137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 04:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164029; x=1790768829;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j73mt4KTqGgT1ctt3j5CbTFsrU2/qf0J6FeV5JjO/3s=;
        b=LvrfSo9O4S4vRvYjo9R9RJX4OrwdD7UDFn7POCtyLeV3wASxYuccW3cwFyX4a5f732
         BKCCJbC3vQ7kv2Okn7AR0EY/BGk6Tk6Epn1mED1fBgWE7/IxD5sjBgvJbATlNK0ExD5f
         Sddq9gCjTooUZZaja7jKoagwoM0b47py41lSFCvVJ5MVTmDzZK8BsdAeQToxXDblvUkl
         TTnklrGDywMX+UARgpedPOrIPO03DNuH4kFGGQHCiRwGbEkbDP1/Y63H+sZ5Xp7trD7o
         aA3myzb+qLA48wLEBJL6WQvYHEVjlQ8PVNkRVcTv82RmgEuXFBIq3YhTPOQrtVL2SOwP
         p26w==
X-Forwarded-Encrypted: i=1; AKwUvBwT/+B+7tUFfYzAjSiFHIXNaz6RKalLNJAtD0sbzCU8wYrgkUyAboWngs2j85fyae4UCRN2E6EMoz6J/gVC2VbQsA==@vger.kernel.org
X-Gm-Message-State: AFuF++nPJPVVEoKenZIxKz8EqWJTkgIK6D98MCM9CjFnWeQHShQKiYps
	3bbJp924xzp5UpjKsTTE0tN+5CIZx3sJB1pVFTxoOG826DQhYeGYMjQodFd7Zu980UY=
X-Gm-Gg: AYBFou3POqmdq33QKuYlN1nghMe28jHAwK1xA59t307Ujr3gUy3gdaTI3iyv4bNym5q
	RYOgYjCTM1LliJ7zpwkHfWmFulc2GD2Zy9Cb4ARqJZOgIZG8iRcmm/jST+Nqts3rim96gNeNqOG
	7KZg9sWraN1pu9t2ALhSQzSQqAu2U4Me9/ufXwlVwHY+f30IFtXHqNVhSj9zNRnLmbNcAalnWxz
	Sac8GyPyfWDC6uxYMndzM2nqp0GbFSVmHM+sc/vTFPPu0X0xw/dGHhm78AmQ/2IurexFQsK0Xkg
	1V7dflbBN8Ec+jj+bwa3u+i0U2FtQvFSm5a7vraNq4XqhVE+xWaM/Mr804poeOZEONlb3HIaD4Z
	1d5t/rsa/FjpM30ND6dQahbMJsTQOWfCEpDm2Kx77mq4YQIfjcrFAF58qdVSruVcAbYMbaq1mKh
	rsJefHsvknPm103EfPqKlIoUVMB9IROAtxC0zKpAlmh/E5ThECV6Xwo+zbZJQbResYFoCO/D1tY
	dntBnAafD5jY5+LpUyMPcdbiIbwL9TSSXYa
X-Received: by 2002:a05:6102:2928:b0:7a3:4e75:d1f0 with SMTP id ada2fe7eead31-7ac1c7902b0mr2205677137.23.1790164029550;
        Wed, 23 Sep 2026 04:47:09 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9851a07144dsm2252256241.9.2026.09.23.04.47.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:47:08 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e53002bso554652e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 04:47:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwrYmwXCca+bDPx05CF4uQF8AR7i2CpjlrisPXgyPM444bKyV+0wA7Cc4L2dDgNg4FMZxctXn/mKtZV9AGCOtdV/g==@vger.kernel.org
X-Received: by 2002:a05:6102:808e:b0:7a0:eb9c:dcf5 with SMTP id
 ada2fe7eead31-7ac1adf33c9mr2261613137.10.1790164028588; Wed, 23 Sep 2026
 04:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-8-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-8-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:46:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMbponbT-u+b9YHUmvtssqxy0SybLF8BK4X+HXo8UcLw@mail.gmail.com>
X-Gm-Features: AclHuK_gLjg0SwxB_0NLKlTjLc_iXKtb2rGaVrXiIGYcW3acp--qIo4xNm9u0MA
Message-ID: <CAMuHMdXMbponbT-u+b9YHUmvtssqxy0SybLF8BK4X+HXo8UcLw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/G2M v3.0
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add initial Device Tree Source Include (DTSI) file for the Renesas
> RZ/G2M v3.0 (a.k.a. R8A774A3) SoC with basic support.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Updated include path to CPG, SYSC dt-bindings
> - Replaced underscores of node names with hyphens
> - Updated licensing to "GPL-2.0-only OR BSD-2-Clause"
> - Added soc: label to soc node
> - Updated register sizes for clock-controller and reset-controller nodes
>   to not use odd sizes
> - Updated register size for system-controller node to not have a leading
>   0 in the register size
> - Added Reviewed-by tag

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3.dtsi
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/*
> + * Device Tree Source for the r8a774a3 SoC
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/renesas,r8a774a3-cpg-mssr.h>
> +#include <dt-bindings/power/renesas,r8a774a3-sysc.h>

Will sort these while queuing in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
