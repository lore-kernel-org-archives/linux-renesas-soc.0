Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B684D46DFF7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710997; cv=none; b=Ev6GzCmVOTGO6sYgJpmg+LWUye4sTSyq8+AK12KRJPyMbVxjbq5ko0A3qYn3T57cLzTJJcjVGxkYE8rOkc6iseT+nrYKUEly4dhqn515aFCsxRf2pVyR8JxIvF3umScHpVqSYnZubBEnv1mTl5lTne4YuwMSnLmGFIuUUA60pRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710997; c=relaxed/simple;
	bh=MrFHslOLHgT8fnDyLbDg++nK9hFiPwAURdyQS1Wi248=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8hE+lf8cR7ZBXJiUE8NjFce67vHuO7Ke0oqwp57yBftqryWoMt1bCOEqFxYI/FVRo5djLH6HOxfW5LNRb/lelmsC1z3B+BYy87uXEeKXwkNUgQWIX6BMVL9A0/liaJHxzjzZpgxFlnI8/m1eDuaCkVyQSFMgJTT3f8JDjVBECI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15b1da6b82so117277266b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710989; x=1787315789;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0QUNwVkihe2pSIDKt9VJtZYZJZMWuAg4EeSK/2G7bRQ=;
        b=hQZ/EzPTOPugHFYj4dQEV5VFEilgz/rpGkkUNbYPTaAVJwd405V8VyG1BnVXXbJ595
         6F7GYWy8MBrGzD+Bm8p6U75G/XNk5HGCEJsp92dZqNMBUEr2dsT9ZRhvN4ZO7JoXW9q2
         p1yQPS0ER8hjxvjnR/6MdBo25hfd6nBg8SGp6uWUfieik2mYNVdzEBhNRdXm2ZB1BcUP
         2drAJwNiZH+cGyiRxHE9I2qm7UdVsRxIQEAdpGCnpZWTlz8x/W5PzJBEIeM1qI0LRGsI
         1BKun0pzBOjATSN3GmucU7M2MMeALop+vdjI49JV7QajEnoTCpAnxAY1jEtexk3/zNXw
         N4OA==
X-Forwarded-Encrypted: i=1; AHgh+RpwB/XZi2217hCWKy5YwghJSNbtkxvaXql5H794XMYQz+WQXopzH2i3gP/f3aZ3stqpohiYUwp+F/0lCT+wbi6V/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgssR8BvZJDVUTrfXbv2PYm4IaZ4LV9AKAUsbnUCVJychtwyzF
	32dK46pe2FptkQt151zrXa6U++CLcBKfDgXjuOMJD3BBu0nTiOrurvs+s5pTakMatjU=
X-Gm-Gg: AR+sD11kbqfV6uM5Y6gAuFgSxNS4xbjNakJgafc9P0Q/EME3kiXQxtYXLl+Fway6+GP
	wbMUaXNOI30McZZMXmZVjRCVnICAKvP4GeyDpXcZIbQmN0od8+l9gjxyChGo0VUqQcjU/+LsWkf
	rnwmlQFwZSW84MexSgOcL0vW53Pvmi2e68Z+/kg0qfu2FiobL/iublV6GpzQyRvnEI2VH1oOU9K
	r29K2PvLv/u8DzBOsEnjKbQpmN/k89R7nfEI+0YjPsmIgViYSJ5xdD8NRMohblkcziEU1oQJjJV
	7NmK66VNEZDk3kak8zf7zZesiBKc/OiSfVC3cqpQeTGzpfvPqCcmVUu9PQyrjEG7xv6Pe47uq+4
	95d5y07wcItEem3aOqdlO7hrToGM/Ig3ZT5q2KRpy7ekTVWf6X7i6/xrrn2Uras7gfEkLmFoAuQ
	z24xS98gxNjJIFN1hwQ6lDvAjQwm9kOyxJFSKacB+M80tq3Qe22lKzN2d17bcWBRu/yAo+YGEOl
	wNJVAKeXSx00+K3V6lmW5qPg1GUcvOkKyOq
X-Received: by 2002:a17:907:7254:b0:c20:f95c:9088 with SMTP id a640c23a62f3a-c212a08fe7bmr237220866b.4.1786710988810;
        Fri, 14 Aug 2026 05:36:28 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21233a28c8sm101384666b.4.2026.08.14.05.36.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:36:28 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso1380249a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:36:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoQpsLpbvxI9yHz/yJ7VoTzUx5fxtzcdFSMXTydTJPPRfLO6Yt6pTg2bz/pjh9O148wACCGaHG3YllQ11jpRHduWQ==@vger.kernel.org
X-Received: by 2002:a05:6402:a0d6:b0:698:663d:d7bd with SMTP id
 4fb4d7f45d1cf-6a38a96b778mr2182799a12.11.1786710987833; Fri, 14 Aug 2026
 05:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-10-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:36:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWsEJAWZ1OYN68RVmaNgSvRQ3_Ls6cvtNq1MszH=BUHQ@mail.gmail.com>
X-Gm-Features: AUfX_mxEbv3viGA41CSDIdwwTblZHW0n_vHRycJVLugqcyZZkwxPSnR1jInQe8M
Message-ID: <CAMuHMdWWsEJAWZ1OYN68RVmaNgSvRQ3_Ls6cvtNq1MszH=BUHQ@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] clk: renesas: r9a08g046: Add clock and reset
 entries for LVDS
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for LVDS.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Collected the tag.

Thanks, will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
