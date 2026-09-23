Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1E543B3EF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156466; cv=none; b=b90tByRhofq7CwsgI52HLMiF+O4uFpz10Xv2xuwo89C2zE9nEaXyHemc6Yiqz027TduG6XKnN+k3C50J5/CwE/rI6583053tBeLCRCmshthiHUphucvs9wKhb2sTvpBwy25ghCUaGM6yLROEwk44VIbx1qHSEWeyPH+nhMymGiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156466; c=relaxed/simple;
	bh=wHIiCEgdZtfqmIfAflpfV641BfeO9lzUS6fjDGeRjIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fEnb7RdWQnYFJzPxwceVjTXL+xqINqoA7O0sjMbCvjCYjAShAoMUfts8WIHy0fLNiDK770pWVAOSCYp9qZZTbKkZ6bvhSzqj12haSV4FNzJrs9UJAVDQMgaaKw3bM62LUocLqeRqC/hes4KPoH5iJRgT4DSqVXNph/x+SOr52B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78564424e49so117581137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156463; x=1790761263;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nr90W5Fnz0vjayQ2rPJMI4dvvs1Oph2WPp0m5lztwRY=;
        b=EsJ1M/W/r/WErLyTXlCH6bGrkcNOSvskVVD1sztUi7AYDfP4TFCaJXKATyanOWNv20
         buYVocC4Tru0KQi929T/msCSRESjPmkBOBKu6sEbn8aOOBR6e0+1hRDRXpTAv8cwE6zX
         cW8M7C4Tp/LJ0MwR5HLbFlTfAE9Yvye9Ba/lgP3BA5VMMhQymJjbw/KMqKziPvSxs2mM
         yOy620d0sa6bZDRSvDVpvKBB9X7dUb5L5TFolKLlDZ3BymcH1tuUdo+aYNSd8yYQ/fWy
         r46WbFpjWmt5oGn6SGmZNGxexKV6VTQqQH3B3Fo2tGJXH2ycI8tIA6eQXGr4TElln6Jf
         vb9g==
X-Forwarded-Encrypted: i=1; AKwUvBwZSSXfbLIUd4P3Wb5KRpBK44XA5ut/NlYRxPwIH8rKCF+Y68i4EoQjMQoY3wce7s6EardDCOHAjNs+Y87gXk29eA==@vger.kernel.org
X-Gm-Message-State: AFuF++lem7znmd8ezGLG4rHEflQHb/l8Z6A86rGi9xv50sIVuBznpU8k
	3VgB8wkL9hSBQIQfji8q3UE0zwhRUgQ6kbAOjiYTZFmjTFfsJvYcqGSbFgPI86l65Og=
X-Gm-Gg: AYBFou3Y7s9/yz2nI2EqtODHf8r6xVn87RX962N+598PK4K79X6M0uBV3O3VmNOtrEY
	T8RkycGVEfNzvTjftGgAqMSDLKSI7XWgEFyefS6KSuyIkGmEIt5FWKM58kpy+ocEEsCRzKjym26
	4sfz2zZ8yLvcyP8buGMFIf4F3/3/PE+IWnv5iuyHpivsLwrG5lYLmVZqUCwbYrb3pkFs/hJye+E
	QwhXJJgbYkd+S7LAxtWR0uNQeRxCPO1Ag8t5rQ3DriRXXbZcfbV3rEc8zGtQGkjH2R1GO84hGcy
	p0vjKUu28Mm/o7yMgxlWqYWOYBb8Wix5JohrTul2GgdNQ5jp7083R4Gw0J2iLLRo/CG0gce/RWQ
	8q7dhukxmWnIdn1uV8WaiId6k/7E6oyTJvpnZ8zFB1kJhwpxc+bi45lXokCoVkV+Ns2WTZoDvyN
	fdAzjZudYp3XsPDV2ogwEWuhwoI34pI/MuZUZ5EYRhOm+O14B7EEfsYes4fA+dK5euCALudcP3x
	boasHWi0d+I0kJldHhSc/y6TQizsne50AFjLd2eQBplBWk=
X-Received: by 2002:a05:6102:2c0f:b0:79e:df6b:d2b6 with SMTP id ada2fe7eead31-7ac0a68545emr2000525137.2.1790156463385;
        Wed, 23 Sep 2026 02:41:03 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf61931c3sm2833075137.11.2026.09.23.02.41.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:41:03 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1628311137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:41:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwyTR2+04RURoIHAR9qONcsf3TWJq7/pLZZMxvmKCF7Dk5va5hiz1bD4ORGbGk/Gz4QGvWKepa7EaFufjIicSKiNA==@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:7a7:69a1:add2 with SMTP id
 ada2fe7eead31-7aaa0708f72mr5644581137.30.1790156462933; Wed, 23 Sep 2026
 02:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com> <15cfcb44c2d6b6e03b5c3d0d5af8ed997c4d179a.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <15cfcb44c2d6b6e03b5c3d0d5af8ed997c4d179a.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:40:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw3vsV+rs0wuYbDmLpA_EXWZAKtpoP1ZXTY6Xt_FPLsA@mail.gmail.com>
X-Gm-Features: AclHuK-4kOrbGKvyDLh28vAfMHGiFQCwXQMIlG3sAkDSk9boruM0x-6nSZuHeBU
Message-ID: <CAMuHMdUw3vsV+rs0wuYbDmLpA_EXWZAKtpoP1ZXTY6Xt_FPLsA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm64: dts: renesas: r9a08g046: Add USB2.0
 placeholder nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:27, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The USB2.0 wiring on the RZ SMARC Carrier-II board is the same for the
> RZ/G3E and RZ/G3L SoMs, so the nodes belong in the shared
> renesas-smarc2.dtsi. Enabling them there breaks the RZ/G3L SMARC EVK
> build, as the r9a08g046 (RZ/G3L) SoC DTSI describes neither the USB2.0
> host (OHCI/EHCI) nor function (HSUSB) instances:
>
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:94.1-7 Label or path ehci0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:99.1-7 Label or path ehci1 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:104.1-8 Label or path hsusb0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:114.1-7 Label or path ohci0 not found
> Error: arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi:119.1-7 Label or path ohci1 not found
>
> Add minimal placeholder nodes carrying only the reg property.
> The remaining properties will be filled in once USB2.0 support for
> RZ/G3L is complete.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
