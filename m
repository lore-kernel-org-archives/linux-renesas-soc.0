Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9F636F41C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911096; cv=none; b=IeuNyj6Q64nT+aBENjVOUUwUcKfpvrezZtYTf88qyHjx1ZuYepVn8dvPeR+IXLa5rPTQhkvzsSyS288R1WHYsze1NCBzXayT6iT5vJO8UOLYrIiaiKN6fsFn6fFirDJDOPpUlaH7GXTSKqrhymhRavML8O02e2eIx/6FnZenecM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911096; c=relaxed/simple;
	bh=wxAIUgRjGbXKrAa5cwitqSQUjhFgKERFwqnogoq6uds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ya1yUsSntzPIYA9ebrDLVhcsFlmBj4UWmNBEuzNacW5PXio30adblX54LB2hJ5vKRN9usx8U/p0EhImBrSLHmt1cg9MGkRGQo5VQgxZfGofm1TNPeFkp5cjenBRrmISFU/4YNVQicbWhLQ1IDiyh+GVFDus5QFgTf1m1a1WHzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5fff18d44fbso260244137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 02:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911094; x=1774515894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU1vlNwfncJsQjzGdPyk2n6LDlvXFD35aR83pXBnxYc=;
        b=M2KXsxDr85NpVZ5t3usLNJySB49bjmwzAoZg/Gq4znwDeSTnVfWnlUOAd5AbN+nS3X
         r23mSdwcaTgW2ShVhn0r3IpdnGQC2n+nTogRi9fTjfSRlULqFx8GWG78t16eZlViIddQ
         HKP60PV8SbBGxsh9YQHUzCAHPuNQj9nYVwZ0k4nfG6po/fnWTU2ctJK2R1Oj0ciE00op
         y0U2drwkVfKEj449F0V6/88uyaS2tRt5zbUx1YfjPPgEY/uIfQAPy7GOEpAq7f6r1Znz
         q9NxYz3jzzJIlvaOTd2akPybDbg9p/+kbsatXTFaTa13tYZCKKf8m+u8pO5RdnWRErH6
         ilPQ==
X-Gm-Message-State: AOJu0YwrakECXh9/4XXDS2kCSHuZJ+bz5BZ34q8R7WQMnPjEdVdXsK1p
	lT6JDkrzaNLsH8M2y1rmiAFmLuI6FOisnFV8zCHgOXhtv/BR5zewiDHmgc9yWus3
X-Gm-Gg: ATEYQzxkaZeE7kYr7rtB2AEvDJhZycNJgSjiO5Zme3rE4ZSIYTy3QV+7rJ1H+jKG3UG
	mB7teB/Cn8Rm2oVEXMvZOwyPGMDu3WdE+7u/eEMHAT0/8K1vayuhJIVxRftjMqDvCJZ/HlU+22P
	hU1Dmf04868BHLZXJrcQlBGZ+O58fkjQHaMzYlSWkhAeQ5wwr6XwbAgTXJucaH2yQ8N1Wg9q/xt
	4H/YQ12REZm/AKWD+aSZbCU4tluHlySCNXXUJonW2Gq0tY3qGSlbJQmUJSN7P26oVOiD+5rBclh
	nXJo7Pn5ciA20BH0vldBwwQidCXSbi4whgQCihYXRuUjoYpBNcK3RGXJbT9UG8QDPpAs1ip5Fdr
	OLmO05kM2wiGEawTswsWGutGg5pBXcJAQ5SW07Ei+wq7tP9yQFaytYfa/0o/oCkrUZ4vBDy10lE
	KX4pUamFD0muyhPXaIOZk+Jq9bIQhcV58ailCw8Ji/sUe0pUiBg0oXxDdz7flryi/7
X-Received: by 2002:a05:6102:5091:b0:5ff:1d94:b746 with SMTP id ada2fe7eead31-6027d39c846mr3268876137.27.1773911094269;
        Thu, 19 Mar 2026 02:04:54 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9510328ff0csm2568265241.5.2026.03.19.02.04.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:04:53 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56b65ffbda3so392575e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 02:04:53 -0700 (PDT)
X-Received: by 2002:a05:6102:20dd:b0:602:8fef:d734 with SMTP id
 ada2fe7eead31-6028fefec58mr1664811137.15.1773911093236; Thu, 19 Mar 2026
 02:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com> <20260317130638.2804-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260317130638.2804-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 10:04:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUauKW=EuEgO4y3H2s770d2dv2Fiw3Oakto0cSgx6efyQ@mail.gmail.com>
X-Gm-Features: AaiRm53660wbzpGwq8jppltV0Ed_oVqUNAk3jOPzlGAHe7bKiqgrhKHzKURY0Sc
Message-ID: <CAMuHMdUauKW=EuEgO4y3H2s770d2dv2Fiw3Oakto0cSgx6efyQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: renesas: add X5H PRR support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Mar 2026 at 14:06, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On this SoC, PRR is now inside the MFIS memory block, so we need to
> access it similar to e.g. RZ/G2L.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel, pending acceptance of the DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
