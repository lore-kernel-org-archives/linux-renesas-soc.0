Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F463F99F4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 09:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725558; cv=none; b=Sgzww0LfxzbF4L/uOue+lrXgfxlmmbiKf/RLEGt1Lzyq1Pn8jMZj9/mTqSxbDz4uQSfvLIFPsjLgWbVFwbKUgR2ICOXp3m7lkBCYVJX2A46fRZ9y0QJxznRIpZ0dp7FQuHTLyD9CjdHtllzMACy7WAX5fdPk+wUHy3zP6m4MzKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725558; c=relaxed/simple;
	bh=av/M3ZtUQavT/hkBofKRoJGx6fD4OmsKWIzK5NQPTGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYO5r9JbJiTODyisODtF41V+P53Atkb729U+8teOFn0Pwlgp/fnelzhCkZzWCozQcJiMwYzxsBfhoszPlqFuG+gwaXPypNO19n6LLH+rQskSqKZNMNrIUIC44NtedfGvZhBxlVQgGcBLGgMKHuHI8eT+u6ovX+3W6dM3lf5z+tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-73915ff1d64so134167137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 02:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725554; x=1783330354;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPgpCbYo3dOS6VSWtqh+ogyk9l9INK3PsDaC/Z8QySY=;
        b=jj9iUm9oh1vo7N3SBkqwKss+cX9qmo8Y5IL4GNQoez4FgG/7RjUB4k6jqlXIC3o4o4
         H7Otf9TMuG24q24LSAc9OLhu1yIbJGdnmCOUYse3p+QnPCC5R4LKzKZMrFCHTYgjoizM
         OHn/E5egwWr76Dqc6zFSHlKEGT5fo53fJhBuEpSU7R54cHJs1azRz6WvsgMVrAjobPpI
         FhQh6t42nxJdfbpkf5GKldnsLSSXdHUgEgEwBvqe4qG2tU5M/CdaCjBNB4rN2qjGUeLm
         ivDlfYxUGyBcUirYfpHoUPhWvtmnzPmOsuu1Of/fG++fpgMvzI2dx3sZbLPRiuVkIV1p
         i+Eg==
X-Gm-Message-State: AOJu0Yzlcl67G/ELS9XoD6ZNo636rWzEsHqBw7qD26hXQZ4Vc8uSdwz5
	poqfLPD5zOakpx//QfxRTNC8vPffRI3dlbLNodyQ0PEoAz5wVCpxA4pfQ1e11tRx
X-Gm-Gg: AfdE7cmU9u/1o9hG1w+d1Jl88M4LpI+yeS4ihFJCEY411skzKULSUqxmHPp3bvn1u1E
	a7+Qa2hcALBt/n/rTgriVe8TlZLgGXlAIKdfZSHI0pmWeYWzQy2P1u7AmNFRDSWSOXcOZHefts/
	c/Tr/hXD7pzdDRz29uBZRjy/ji9CcyYXAwWaGP6fgPNWxnKLhNq5ViQ1FawNGFHhAUgtqUqgZLK
	ciUk3R4uQFnh8epI4Eh09YcFyRxU3yOjAGQTrg+6ocPm2S0SMK2/muOE+TSjQCQciHWGzHHsPYP
	/7cq+0yKWxhgBJ2u0UcmMolxbUWVderOqhx6p55ML0SNOUFwnpb2gGRg/P+du4Pq568Ae6T4d54
	/UtOT5DM3rNlggP3nyLt7oTuqnM/wG+8Z5aNRl4jjS3tr7sBSpVOsyRRuf4DTPcIxKBYIB8GqdO
	XkqTSXQPQahz3d4PERdyeYLTfnP7wKlR6V2ZPtSkxBUvR76PsYNA==
X-Received: by 2002:a05:6102:4b0b:b0:726:ec78:9513 with SMTP id ada2fe7eead31-73433f321d3mr5946313137.4.1782725553981;
        Mon, 29 Jun 2026 02:32:33 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-739dbbb409asm54099137.8.2026.06.29.02.32.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:32:33 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-738f3419eedso160060137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 02:32:32 -0700 (PDT)
X-Received: by 2002:a67:cd95:0:b0:737:b586:6386 with SMTP id
 ada2fe7eead31-737b58665f3mr1404074137.16.1782725551832; Mon, 29 Jun 2026
 02:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626180326.9593-1-wsa+renesas@sang-engineering.com> <20260626180326.9593-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260626180326.9593-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 11:32:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu15fJ=bGcGCNBY+jYFrfqP6VOj4Lh1Xp0Vu39Zzj3kg@mail.gmail.com>
X-Gm-Features: AVVi8Cd5PLW0VbQV3bpvy1FRMcV0RmFmKlx0lEhwlZ3tFnN8kqtg2CHL7DRXdtE
Message-ID: <CAMuHMdVu15fJ=bGcGCNBY+jYFrfqP6VOj4Lh1Xp0Vu39Zzj3kg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] spi: dt-bindings: snps,dw-apb-ssi: drop
 superfluous RZ/N1 entry
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 26 Jun 2026 at 20:03, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Commit 164c05f03ffa ("spi: Convert DW SPI binding to DT schema") added
> an RZ/N1 entry which was not in the original txt-file. It doesn't follow
> the usual "<soc entry>, <soc family entry>" style for Renesas SoCs which
> was properly added later with commit 029d32a892a8 ("spi: dw-apb-ssi:
> Integrate Renesas RZ/N1 SPI controller"). In that commit, removing the
> bogus entry was overlooked and is finally done now.

Nice catch! I must have looked for renesas,r9a06g032-spi omly...

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
