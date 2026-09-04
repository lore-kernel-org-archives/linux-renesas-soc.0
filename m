Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D0D4EA394
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534224; cv=none; b=co2Nrz83CJbyOeidko7JKEN69Lf25dk4pyE0nJejiS7zXpegtRsAm1A2KNB3nC6lncib0tQaZp0UBSiwSG2SaTnYQHQ2C+JVQDwXA55wuPmEdQooxYhA9nFqvua/gVx+L/lEomgEFAI96ib2P2qgugIiRoaE1PQC/W/QYfQn6Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534224; c=relaxed/simple;
	bh=fzOREMKstNdN+mmlGhqGbzBVxrEgv8H1fmeOK6xcw88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVmi6wk745nE8lXzYJcgyTr7v+VUfTcmt6GLaSxNMYJLRLbpRZcSWCk7bhcKw6Hus8nH+58BWZlaNpzZY4isXom5G6aT+DfZJx01pJfM1BRcvxCUjca5YdSA/s9my9iEv8MmfKSGPogg/yW6ApjfBP02iHv/owoGkgaDE5ndj5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so1541114e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534222; x=1789139022;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FwDxiYsshE/fUWnWj2Ruj2wFFXY+QnXdoCrsnnd25AU=;
        b=lpb4WvzqXCTsruozpnQIZtdck3+jTteBabmBVcq+CYIXx1/h0iiHm4N6n73SKxszbj
         UqYXZbiyDViyBb5fJcOQNeKxBquk+ppGQZdGJzSFfL5MTjg0HYpmMbun/BNDDc1FHS6d
         sYa+PMG880q9+BMvu1z85Ju4GQdCEaPfV1sc9/rjQFthMZiSAaxUNVQlTfDVM1gvY4td
         OBKQiz0eoseghlh5VFxwbBiRyXuhLozRWVNcqoZLSZQY1Vn0RkDN9woN6g+CNpWSkv6R
         F6Fmz8MCw5DMzvcv4Vu+C1yRoP/jbTX6F9okWv4r0anO9R47ZRNdHTyNW+LstKtCgGjj
         6nFQ==
X-Forwarded-Encrypted: i=1; AKwUvBygNcc+xSZ406nwdFzbFwaUknsaPyYDCdKnHUONuLTFR9foaj0G5aiw9DNeQw2KVZcS5T6NDFhw6gLu5SCQEh5Hsw==@vger.kernel.org
X-Gm-Message-State: AFuF++ks/eSxhNCKktCsFqaJHdNRnUO6QiyKSYF3pKieugPQirv35VuE
	Vn8H0Pa3Psvc11lMye4f82MTOzNhsgNQa4o3CVrBpVYbSG+h2d6b4yCpPrAOHaKw
X-Gm-Gg: AYBFou2mDutvbYFqFUtvcVsDE7Xx0D2hQYsTHrIfGb+S8XE2nUJiFs4xyoTn0iqAE67
	z1D8uxFUWNBYK73zi7FyPenT5ajRrMTGPBaYff5zYsw2uUML7pJzOrsTveFrn81EkaQIkKJAhal
	FMWVWad/p3L820dZeicnOYjToJ4tbhkV6yHGpCt9WgZue1WT8kkJJOHUyKn4QJ4kBhzuNvLfEU1
	F8DYImoj5tOx1+rzwzXHtiKE3Ef1Wq+iC09lgRL9Q9kDebk+1lh8prD2se+lP/2EGTXmVMVU7hS
	65AMfMexMCIMV0apV7aaQSma2q1OROb5FgB+bTDS/PdWtzqJBgDr2iNzXIjl2y3DVl28kSVQozB
	HDYMS0T6hy7pxBVAouttVu9wV5cQ+SCQH4PLp8+NF4gJx25hXVJXpKN5W8bEZzrY/aw/SlToSFr
	82iMpW9nksKJr6LyUz6XjqagJc2Wi2Y3mbXL1faRpce7fNGhSOlpuWJugNGhVZheyO4OsBBo5I9
	YvMxRpC9ctI56kCNaSN1bgvGA==
X-Received: by 2002:ac5:cacc:0:b0:5c2:a30a:1a08 with SMTP id 71dfb90a1353d-5c7dcdea6e8mr2880986e0c.2.1788534221719;
        Fri, 04 Sep 2026 08:03:41 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec24254fsm2242631e0c.10.2026.09.04.08.03.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:03:38 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7894670be7dso457836137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:03:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByS9jVTjADPTkWfqcGorGc73ueSWFDt8IERubXR5P4qSbApEXmpoRB/4WYS1ce+0C7teq79eEWbpGsZN/C32K6Aow==@vger.kernel.org
X-Received: by 2002:a67:ecd7:0:b0:78a:568a:616e with SMTP id
 ada2fe7eead31-78a568a7517mr457415137.5.1788534217450; Fri, 04 Sep 2026
 08:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-5-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-5-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:03:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1gcLybr06anojAeym-Y8ogRCavOOfJiiWeJRHrOePtg@mail.gmail.com>
X-Gm-Features: AcwNN1UeX_tHY_zGLACot_ynQRVuzMQ5hoKZFPwjcrfLfwgwmaAT5NZ4wqS9wQ0
Message-ID: <CAMuHMdW1gcLybr06anojAeym-Y8ogRCavOOfJiiWeJRHrOePtg@mail.gmail.com>
Subject: Re: [PATCH 04/10] soc: renesas: Enable SYSC driver for r8a774a3
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

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Select SYSC_R8A774A3 config option if ARCH_R8A774A3 is enabled
> so that System Controller driver is enabled on Renesas RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
