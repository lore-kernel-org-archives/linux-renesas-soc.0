Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8FD51FCC2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167259; cv=none; b=GkkTzT5YXBlUY/qXT8YqP3BEofyP9aCjC5IvGMJ8g46dtae3OZQ18tj/7qlU7Iqqn4c1bryJDd9Ju0aNSNI8EF8qsTpCz9Bo4I2xgq0Olt7+lUxyFpHGiYtQn0jplxY1ulpvCeHVYONsbjQv5jadxkFajVVbzrO2e1TJMulAcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167259; c=relaxed/simple;
	bh=EfNXHDSpd8SaNyXGdUaOjzW2OpbKeUB9UNXfiskVQ6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHRu43yBzU2ZrSbr8+xrryHLt3xyamyazAFuAP1V9xMr0cvsQP9dQwtjC4Uc2avp7zXiKAZOlwEMnhfk3x28/A1sRkpRZr3qiSdgkJyK26AaAMtysZBpYuPH0Agx/5hUfdx13usjOeOcn1WhDSS16iJ/g/NZnv0BKH7jiqSkJUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c7f7cc52efso377675e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 05:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167256; x=1790772056;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5hc1TTWP/ig0ekllF54ZiQ7BuKR9C4G2lvuDy9dKjh8=;
        b=g6t8pxkF+1APAa7iaTbcsdyD+mB3Myh2vxOCxm5R1y+Hocr4JbrtIenmA/bRNaZS3v
         TjXkAeFHerNJ29pCzB0RfJrio2kpQo+V+cOjJpBpWXmZwyIFUgUJwMMPDd/QUTyZIpt2
         GQPECFukY4Hv1PVjokpYHIAyyp7PRhP1kP3Dw3ojBvLKYhioOLEQTgkWO8k1zVMTlvyI
         SJr79dj5sz+XdhnDpB5kIRHmDTDCjQpUxjhDxZULwZZfB0iaNMXtsYhZb8nde42o0rS7
         fd+4MEMAQ6OQ+rShnSFfmAbOtEgu7sOMa4vIShL0yqn80mnWICl/7F7p2itrrt+vc+3F
         DdWA==
X-Forwarded-Encrypted: i=1; AKwUvBz+gARUahj+d7dqOfqqQyqUKZ5t1LNUUmhRw/I4c9rgTqq4XxYFoUBM+2C9xDSPWKbHlr15/F0tpe+PIeIjTbqAYg==@vger.kernel.org
X-Gm-Message-State: AFuF++mw55YukifR05D9UimwdZcdLSEvl03IP4tMt493WNzkXKv5blJI
	FUyX5JYppD1qLi34q7hcCeX0gcWnaJ/UsKe8qscexzeLnWWeSzV5Z93KgkIXnNIj908=
X-Gm-Gg: AYBFou1zh+GhDWzr+gkFGaeMTZ7ovJKSuhDfdM7n3MtNNxzLrxIlgscECLO+byCUQDs
	o9ZQIfgVoozSTNeENoCKicyRFucQmzv+mKNiCWj6qePsxkkdDr/ik9uhZfAGTOCeotaAhsaSewZ
	6FIHzQwrFvkj2pmpD5J1ncPT/gUAceKvt5sMRmVNoOndStQf0iBWXZ8xakGgne7jpwllwMzD+jo
	F2nhMUYmw2jELb1Brfv4N+DRKDTKrvZU4t3KfQBnQV1BLulWP6FtjxrQ83OKU1b7vJGzJUFsw03
	Sy/L3UGiNtWXoTNcJ5686JYx3dSKzSf4P4f4J1df7fcldL0d5Q9LvAmcheNrlx/9CkdHEik6VwO
	Fvh935Ls1ZibxIZ41K6cnyxL2b9jhNgioqrTOI2vmEMkIDCD72jr0J0NwDOWciOLH5QGPUcdJeG
	2MctZfawBHiZVjpImWl6mHYSKwzlgxqHdv+Hke1xVGkln4CjEn3byYf+gvZzjq2fqedqWM/1YK2
	HkqAKujOZ0mQNidmR0ZumbUcuTqwhKCqVnc
X-Received: by 2002:a05:6102:f12:b0:79f:45dc:118e with SMTP id ada2fe7eead31-7ac1acd5debmr2142234137.5.1790167256376;
        Wed, 23 Sep 2026 05:40:56 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9851a07144dsm2428806241.9.2026.09.23.05.40.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:40:55 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-785686d2764so199083137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 05:40:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwrE13PTv07sKuuzYfXfcYaNHoRNsLtl4dynsurD/Iwm7xNYAyrUNV679BljQmhJ8jEV45xplLj6UO57i+Yj1BrMg==@vger.kernel.org
X-Received: by 2002:a05:6102:4b0a:b0:7a5:e455:1823 with SMTP id
 ada2fe7eead31-7ac1d4f39fdmr2199964137.27.1790167254685; Wed, 23 Sep 2026
 05:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-10-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-10-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 14:40:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkhnGxssjiV5+v9VizEMK6BEyYm9Eor2_b=H9VpPKLrw@mail.gmail.com>
X-Gm-Features: AclHuK85Jpqk5GFMNdOgnv-jyW7mXfscimJBoxQw6oeOM-P6bOVrQRWi9Fs-eqY
Message-ID: <CAMuHMdUkhnGxssjiV5+v9VizEMK6BEyYm9Eor2_b=H9VpPKLrw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC
 sub board support
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> The HiHope RZ/G2M sub board sits below the HiHope RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC main board.
>
> The RZ/G2M v3.0 SoC sub board is similar to the RZ/G2M v1.3 SoC sub
> board, so there are already DTSI files available in the kernel. These
> DTSI files will be included once additional support (e.g. CAN, PCIe
> and ethernet) is added for the RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> ---
> v1->v2:
> - Corrected indentation
> - Updated licensing to "GPL-2.0-only OR BSD-2-Clause"

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
