Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D07423160
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 15:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534063; cv=none; b=W0Hbug09s2b8XnleI7OpjOKVuIBflg5d+58+xHIQ+0R4YoIW8XUrX98oi3wRGBJKe0Wr8cAfRmxz0rZz4QbyA15GHlAiARMs1f9nVow05zqCPkciPk7lY5owcfgCPr/QIj2z3nTaBKxAIhifLeIW7Kaum8VlOqEYPoMivhYrlFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534063; c=relaxed/simple;
	bh=dxuiJN3F+W/TTKG8/DBhxTqg4U9X29/XkWqF1QF1YkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohaOEJpZCoiBx9cfbUQOdvCN7erDutpQxjRp++M26bVM/kUS9nK/31+g6gi22v3LL6bwTkMspqg/fFxlOOp1azVQTjGhGgEHZZZS0fYKI3SY1oXUN/c9QEgGgCWEqiKg6mehHgyurmLG0TTiwApETd509fCwadavNmfJtCzIxFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9773c6ea885so398623241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534061; x=1789138861;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bIoiHSllQkJNgmmben61gMxsX8BWtDH0S9evEzpoUUA=;
        b=RI+YddShzyyRc6D/+92Mtb0Jxxyq1XlHz6uo4ZBDyho0vPLg8y6Bqrl60XF5XO60ZN
         LgniYkiSeY8k5W8+s1RGkId7KHybFDsI+d1TZMEpaOwLzsM7hzZFxtCQpAyp2woM+W99
         vVkPYOBWbiVUXWDL3gTX9IZBl0ztHywoeeNfPQLguue6MYvShTYZJ5SrSDUN65d+Hp0h
         FKVaeFAng3hlg5AsR/K6LNJqUufELWfekaWj2Toz2cKgj6eJpjCfPrew4ynIwxEsmG65
         ahTqDloZwjoOFsgopgclJ6FKyHk0c0yj8MCPSnIcuKYtebCM9wqMUCirKpYCXUkPCSMt
         bV8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz+ReQnYWMehGnWk4SkDg6NrS+YM0kBr4I+Sh9TzF2tRMXdNt7MXfUe/oSesoFSdbpWCKcqA3sfcsp/L4mSu1bgNA==@vger.kernel.org
X-Gm-Message-State: AFuF++nR4vOnluuUqElMXww1ELQct+dgo2UeSKBPf4ke3/hpqBg5EZgr
	nLvIa976zdev17i4ngTZpbie8GXUFjtQh7UipQwd9VO6CxGggIjF7qSmz9LcVRFD
X-Gm-Gg: AYBFou1L8q7oAUexevRaPNfM166WpZykxuByL8VeF67YpkwJNbl7rrdk7U61U/qlSZr
	q1lIfRjhAUMgdHBoUZ0uwyILxh7Lt0IJ+pmlsQocMJmI2NdXXH4f/btZbKPwpZHsB6X7T+u7I08
	izBke9IrJqCsnh/1t52ZFHT0/aBGKKC5k8l1rGpH2Tv481S5zlIPubRXSNyDXazwXas/CRu9aUa
	gRowudqe4vno+c1EMEZp/jns8OrCfcWKHi5lBNuL+ZQDkdCJYvzkD4eojUNVX3egE8dG7Hr74gR
	5X9glHAYfXWimyoquVrFpXCrskUrht2fVeLDwtpgzrqGCHdrzLJ1utAmnmXqR6VfP38n93JptUb
	I1wOZIjyKocxVyIQHQkUhOIO8qSy+c8DfS3ahvUXKwKNywvD0pbhgc5JJWxKMcyHhoE2S0wNYhx
	1ymYC4l26+NXknL3K2M1ZChB5uIGo0xY4oTWA28ItvtuR8WvX13eQDl60938RJ8AffI75I60Mf4
	W/tEhuyTt8UMIaiyul3K8DlSRYTqw==
X-Received: by 2002:a05:6102:a53:b0:789:1216:bb8d with SMTP id ada2fe7eead31-78a4a871937mr1901812137.6.1788534060691;
        Fri, 04 Sep 2026 08:01:00 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed7018fsm1768861241.6.2026.09.04.08.01.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:01:00 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso512500e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxJ/e/C75eNOszlRQOsLaaZLkcu4wKhEeam+ra6bIDLSgaNTRXSneRGXMlCwkONsdqxP3WkR6vSekjjHWeoYi1Nhg==@vger.kernel.org
X-Received: by 2002:a05:6122:8f8d:b0:5c3:61c2:9ec6 with SMTP id
 71dfb90a1353d-5c7ed456d8bmr2814332e0c.7.1788534054755; Fri, 04 Sep 2026
 08:00:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-3-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-3-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkkKnEsCKTcNMyr-WMvp7o5++Yg3rPR2f4wao=-weRoQ@mail.gmail.com>
X-Gm-Features: AcwNN1XGMcfTKgzVCocL_OQ77Hbdu56w54bgvUPYdeBOHMixmFG2F9qVHqoWoGg
Message-ID: <CAMuHMdWkkKnEsCKTcNMyr-WMvp7o5++Yg3rPR2f4wao=-weRoQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: power: Add r8a774a3 SYSC power domain definitions
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

Hi Ayman,

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> This patch adds power domain indices for the Renesas RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/power/r8a774a3-sysc.h

renesas,r8a774a3-sysc.h

> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_POWER_R8A774A3_SYSC_H__
> +#define __DT_BINDINGS_POWER_R8A774A3_SYSC_H__

[...]

> +#endif /* __DT_BINDINGS_POWER_R8A774A3_SYSC_H__ */

__DT_BINDINGS_POWER_RENESAS_R8A774A3_SYSC_H__

With the vendor prefixes added:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
