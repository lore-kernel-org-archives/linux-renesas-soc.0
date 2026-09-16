Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA975A0AB4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573211; cv=none; b=kShZ0UwnyqDMs58wrPbBuoMvH8nsQvz0p2NYK4eGC0GdwbAp4x9CVjLcxIIIjRTJkTcGD4VSP+lcq+70+HaozRP/gt3n564XFpH/8V13e9XCCSMDXcIdKFFJXapOgDE3HXL+zu3A7E9A2Xjke6hozUCzerefwLUTvc784NaYYlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573211; c=relaxed/simple;
	bh=nsD3d3D+5c7/Om+L8FPkT4+USyqxePFCkhItvrjajDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYxj+QCqzGKsmDCLG7gyVvfAHnwvoHjzU/D14Ul7rv1lGUqXstiaYp0Yb0HQ1zr7hWwMVgJGtPw5p3O0oTJMP24SSlSrTBQavV9sbdT+QSYhk8USvv1GjtO0ppIYNT8C0jt0sLlG/FFueGDHaaYgWPSjkMv1kVmycLZ1jygnT4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5292fdso313539e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 08:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573208; x=1790178008;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8P+cjQzFKZxfl0S843XHvfKqcg28uU12LMzUav/YWFI=;
        b=rsi8ZEp6eudokXtSZGq3hukklArp5q8fHc0ckLMJnJ8jEY39+fs4JHOiENa4ke0sHg
         dtBjsGSskKDfASkgPu/ka7h+NrtQGtPEXeF/VSQun6BPc/ySxIs5sdvI9X4eyt+ZCE1C
         WgYHhKbukvQbLbJZA7TGommu1pGBWEo+hHqvDLTZE7azO4L8SVpsDUhRngFVX3BI8euC
         Xqr0UbxX8y+mYZqR7fZ8HIos15NvACLk57ftJw6vUfAZiTEJTEtO4P10G0HpaW7PCUSC
         J3Zpa32LKjp0wzkfJ/OPzfKzBNcxV/uP788e576D1pHUu3WD0Gr7xm3W5AL3kuc2HpHF
         AQPA==
X-Forwarded-Encrypted: i=1; AKwUvBxCNhSy47ILTIz1OkZJT+BHJk4t6rQQMIuzRz4krTbugvRpQRQMNCEN5kHFN2GsDgKfOsAt9DuyaDlT6zLrvBfTkQ==@vger.kernel.org
X-Gm-Message-State: AFuF++myxmTVyw1OJYeXl1bCRc8wMab5WYSt5+b4AR/o26htGQ1agHfb
	6ArC80vP+CQoMCP0m32v3c2vv/6Fv+mUkpI5oggYZ7kS3RAbdMk0Ze4EAGrF+ktEtlU=
X-Gm-Gg: AYBFou3moawC98phpyRBxKT6AetFjgS75UUITA+YisVVWXXDUbhnApb4afUd0xYogi4
	VNo8n5ze2TTz3nw9RzCXxMLBa5+MgTNzLgPTtrPyvE3eDWqmCZ6YSY3jilFQQkPyI0vozYBkrWE
	ol4cRo/TZ0snt2fDvk+b/btftsrTFos1RllPc6rf4uAK9O/Q1VTOOyGIzG7LvRr5Ugy1qrbRr+O
	vK70IW4MLudixEZzDk+JGHN41GE0imeWzs+BC1/cmLccrcjAkACK5uGNC0gZvbJXMZDasF2nTE/
	iMOHqfZUx6jpDS9qAUFMioX5469tJSQzOOmAIlIOAWokDTYdZMl/ijxceDr9RBmUvZkXb2CAfmH
	z0BZ93iWt+E55W3IHfjlAr9FvPBvTNrENWGn8NZ/niffiTP4+Ovx7+n2SkpBdjubd9eacVQAZQJ
	ENXH5c5adTdvGfwomUx1bfUJhNUhgMGjGmfQ2//P2ph3BweM7JicahSo85I9A9MjwO2Yvdpv6Pw
	/hMxvw7+5M1Iw0H7IjEmuibaGioklp6nJfv5g==
X-Received: by 2002:a05:6122:83c3:b0:5bf:8955:a8ce with SMTP id 71dfb90a1353d-5c99ab84045mr1993871e0c.1.1789573207620;
        Wed, 16 Sep 2026 08:40:07 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a5361498sm71969e0c.4.2026.09.16.08.40.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:40:07 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-980b6159d30so271641241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 08:40:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwCrh/ofJ+aNd8shcAC5z91X7pysBJbMutPqlT2VfcARIMmuuV2JgS3hIpXIjJk918tJW3iuVFq4EDXCWZcMI41WA==@vger.kernel.org
X-Received: by 2002:a05:6102:510d:b0:799:e1cb:d690 with SMTP id
 ada2fe7eead31-7a024dcd2f1mr1607011137.1.1789573207075; Wed, 16 Sep 2026
 08:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87bj9yvu5a.wl-kuninori.morimoto.gx@renesas.com> <87a4pivu4v.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a4pivu4v.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Sep 2026 17:39:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8M140zTk5pnJJsMHabPJJH79rnDPejOsrA8dFTwCkmQ@mail.gmail.com>
X-Gm-Features: AcwNN1WSIcDa7jrqBhnNKIhdkDurAFwSACvv2xsCElsJCeZ9W-7yrLs0MaT2Zus
Message-ID: <CAMuHMdU8M140zTk5pnJJsMHabPJJH79rnDPejOsrA8dFTwCkmQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] clk: renesas: tidyup DEF_GEN4_Z()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Anh Nguyen <anh.nguyen.pv@renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Sept 2026 at 03:54, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Current DEF_GEN4_Z() is using .offset to get "reg" and "pos", but the
> offset positions and calculations differ from intuition (the register
> is located in the order B -> C0 -> C1, but it is using C0 -> C1 -> B).
> Tidyup them.
>
> And let's include CLK_TYPE_GEN4_Z in DEF_GEN4_Z(), it is duplicated.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
