Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DF53A7F5F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710959; cv=none; b=nblxRlTsxhCw+UYyoK6ElTsmd8lDbt9cIlB17BTwMPa28gYkpRnhn1tbKPdDn+kaASaxXNe4MqNvftgkh1kzB/MtNzf5XhxDf0dAtbfUoa13PNQfbMKXtRurifzTOKpKv3HHIti+8HCxLvO+YhmzQIRqsQZH8xLT/Zfaa4zVRMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710959; c=relaxed/simple;
	bh=lu59pHls0RMY/42xD43+xKttiqSoyZqgpB1FVRwNThY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ec5FncrF0X2CYPBsihWb4SYHAEjN9DVwQyY0usSQJAXUKnu9cgZLUjGgP7gtjKd7HtrKZi7icAdtjZY4KJ+plntY7Jb+1RN3+a4QObJbUkUulBeDvF32RAfAlbYfNu5np9c5Kd7sQECvdr6mQ+mRQq9aUgbo8dTmx6q0+272xnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2020421077so170932666b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710956; x=1787315756;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r7ZvHpK7CvZSqQoAUQWt0M0GRHi+RtHuH4yiUck2Ywc=;
        b=Xiu4M9qQtLDC9iBWN10t5GcAjk17hpIuTxDxcP2243YjHETU/buk7mxFhDihVvXYkU
         Ffx7zzkBQKgf+sq/+AnINOfcuCoDehZuP83+R7NLfkzknXvOY2Lch1ODshB/OgyxSCI0
         t41tIooFSvkVMG6YVma91I2KJBniz5G/sOaZKNKI7HKjUJJB4cfNFPH8nbeB3B+UDqC5
         uu4AP62um+IulMOfqzU+38oWk+GqmAOvAkVZlyaDjZQDiTzmo0Gte212XecQktt+/kbC
         A8Pe8fc7LhU4oC3ZPOAyOddP/Fxe0LmM9KdpFxzG8yiiHoGOmWiPKp+UrWYT4S5wp+h+
         rjeA==
X-Forwarded-Encrypted: i=1; AHgh+RofUA6WpIEwUzB401XXCWfA6CQITIN1TvnPhepjJRd7/JRyf+1GAkSXn626b18wooUFsjp4po34WXjq+VjInzq6ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi+BU3ZEJ8MayKQCWzEo6HvTdHnzgB0dzglKYSPMvCXRJsjUyN
	yj68hzwxw1XkBcwaDqZ9/hGbIFN1eoxzdZ39sFkkJDPTt7+zG+h+0aj0+QmOKFIHQqE=
X-Gm-Gg: AR+sD12SK7DqoO6Lo1xvLK56vNfkz6bxZd58jo4ktqokucWQIZkMfj19EvscQaHqNSN
	ncof+gtJLzT9tKp0RAaUcP2MeRh5Pzfwi5HokV1sWw/WxJ6/f9g94C0DTFciR56lezxakGnV54l
	BPDm4y+vNsFqB2E8XQd5nE3/6kFTR38dpbSAUei7+v1Ytw3ZsNBbb0iWYuO6zC1ggmafZsyhFhs
	5Mteq6PYv5AXVbrQdB4AJnQt88y0u68v3OQT5dhhQvjpk4WaTBaJjVg90AIuz3E8RopCYg+SLvn
	YxFU9l0K8/dLxJlgqdwb7IsNCREhrB7ecKNYJjnZ4V118oYbIckmtd9rLXeHxFTCdNuRS8IOZc/
	xkRWUllVhOpKGbPawnslOb57JFfysxMT4LwCqwrT0rTrelER70wq5N8XKv2MbMpZURLd68spo4I
	akTUp6c1QxwxP/XzrPqcybvl2cNPILO6f5U8ZpIzek46AJhNMck6rZzFhR3oyr/lfZpmbsp3DwG
	YX6dlxLd64+voVKdUnqKNjOwg==
X-Received: by 2002:a17:907:1b23:b0:c15:f005:63fb with SMTP id a640c23a62f3a-c2129ac26f4mr214851866b.3.1786710955737;
        Fri, 14 Aug 2026 05:35:55 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234e5bdfsm101507266b.23.2026.08.14.05.35.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:35:55 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a17f91so1361194a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 05:35:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpkISy04XOtpl5l/Yhy48Ft7SeFjkl6fY0BzhbrW9MQaP1XPCB9mI5oy4KwR4KKiZasKFsZtkALPN/qFYSugngVQg==@vger.kernel.org
X-Received: by 2002:a05:6402:a6d3:20b0:6a1:b515:d2b9 with SMTP id
 4fb4d7f45d1cf-6a38a9b3558mr1633562a12.14.1786710955204; Fri, 14 Aug 2026
 05:35:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:35:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUWPx2kiV6xjEo66UrMROapDL1di_cfQ4f09YtsZo7tA@mail.gmail.com>
X-Gm-Features: AUfX_mzM0IoPuPWInjQpRT9GjZOnzV2_6uakqg5goXrXMoc7ptiDPxj1fFBNAYk
Message-ID: <CAMuHMdVUWPx2kiV6xjEo66UrMROapDL1di_cfQ4f09YtsZo7tA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] clk: renesas: r9a08g046: Sort macro definitions alphabetically
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
> Reorder the DDIV_PACK() and SEL_PLL_PACK() macro definitions so they
> are grouped alphabetically by name, improving readability and making
> it easier to spot duplicates or gaps. No functional change.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
