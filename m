Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBCA42E8C1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611207; cv=none; b=dKnGNkipFqmebtbxu6hkTsyPT66dWsuoOuh98pTWKVoSU32yH/IOi1eOWkQWXcc1p5snZtauNvtyVb105MBTqYhaNMPnFmX5O/2GxW8jGDo8+5kLYqivFv9eSY/dpdRB3Pt8hXzdnAiML+QY6Htg7xG8Qk92ElRu20BzahUYRAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611207; c=relaxed/simple;
	bh=R3n/DrlSp03RqjHgGJKI9hAF8mRDHpDvu06ToIv1xVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=phqw4qYXRXajRto/ls/nYuBVhhD4kkC2WK9o2K13uwy9QpZCoNjalcqd2E2eygt3tWo8p9nZbL0Zi/ochljniIO3qRscJ3YcZdbQwLI6Bp92/e4sF0CNC+n94qFTWmGkJxMv7k+gPwQf6dHWK0l8x45Mb7G/aANv63ggYxGZOXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7564b7a9490so497218137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 01:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611201; x=1787216001;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jo7EGcjbRu+iSuq+kLMqw8b4MED/CzllCFiLFlmmj1o=;
        b=XmgOjqMZ13F0upXlTKOJNyXk6+efVa2+bi9QybobP6oS0iaIqM/7zjFZgb11feFzBU
         LRx+hR6qbyPDdwaLuyKXfcz1j57pUgLAMLGfcY6MY7OGaN9GuYbvpaz5LQ7R0zTvXooS
         Gg+nDpGo7zTNYufIclau7xFzLSq5l3eGu09eP89aRSYMNyeByzWqAF5ZgwXoxhHqEAI9
         v+ahhvmFgCO7OAHWcFBz1G2gt29yLSLSMqgcki6P9Vz+5aP4QY4GfcSlSkYR1MmnkdBB
         14uATZ/VDLYLyxu8DFvSJlmfOWAsEfB2t90D6Dlr8vIV1cd9M2D+wjdl0AO+TrjSEWlF
         ry+w==
X-Forwarded-Encrypted: i=1; AHgh+Rr2vyQbJTqTp7WGZt5s37qQI5tlREovh2tlaWo7fx96rR4mXxgG23rwBaIY/WGtRUedU2f3GkIjLkZwgda9GUzqOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6akdKlWTiJrVadMYF5rqYHADwh0Id8/0PSs5vZ1Lq2grvMRHe
	vmAgBVBEzNyB5BzMyQoP8tY2fTXrPPtWl867Amyi0hctkeKUSd+80LgDgw5cpG5L
X-Gm-Gg: AR+sD13Lmn8lRxdBu6713dLXmlGFGYmnVwUPwrbQEFfQeUuKnEUCSRhyl9cKl3eEFWt
	tj/U/rszeJXp6qNQ1/CeDPCdlv/I/266VpDUCsIcuPWlqfm368ry14EzjgWClCfHd4DfzuQESom
	MJ2ON0vudOPImJ23BcKmfTtOABPTZkgC0rQHktFASEYUufcJgNYdVAU+nT0v4LxVVFkmyw2OJfV
	a4yw+yS7FE9UcRzXxKEk3AcNrvaeA9w3LGYfitgTs4ELNIsIp773wV+oQMrweym1gL1GeZ/ea8C
	ikXExh80Zho52RywLvx+TZQc6h8zfcXeCazAOvdCaA59G7ozmh0KI0KnuILQHaBnOovw0NuB7vh
	Qt9w02tCtOIsF2FWHd0TAvx/OXHDEM+8MNpwoV7coPPUzV9zZbnbkr3+sfz5ImQu1IBpRrjyKsj
	cBrTqtxYwrHx9Mifo/YG9l67EFEJcKqjPhgph5+SItc/OiXMQAw3jjog6XRE5JVFeNt+HzgSDhO
	HuncRGSLdbsU+rmuPMo7TbnyQ==
X-Received: by 2002:a67:ef90:0:b0:74c:9d7b:8daa with SMTP id ada2fe7eead31-76dd40bdfdbmr404722137.19.1786611201008;
        Thu, 13 Aug 2026 01:53:21 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76dd0e734ebsm811070137.6.2026.08.13.01.53.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 01:53:20 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso527176241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 01:53:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrnjLiefE3a+BuB5ynZOm7KiNE1emQwTZYYZocjZmLfgWRX+vlfTy7P2sPc0lNI6alhf1srLH97puuq65mGAQ33rg==@vger.kernel.org
X-Received: by 2002:a05:6102:222b:b0:760:d86:a64a with SMTP id
 ada2fe7eead31-76dd156e2eamr407635137.4.1786611200686; Thu, 13 Aug 2026
 01:53:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604151855.307772-1-biju.das.jz@bp.renesas.com> <20260604151855.307772-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260604151855.307772-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 10:53:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXp_hPXGVH1ijiYGQ8gxhP8CBYt_T0-ixbFH7eNXRSjiA@mail.gmail.com>
X-Gm-Features: AUfX_mzGTfwgWLWA-7ELC6UmHJrg7VZ1gOYWOwDD70xY-8p9DWArpZ3fHYq9ckw
Message-ID: <CAMuHMdXp_hPXGVH1ijiYGQ8gxhP8CBYt_T0-ixbFH7eNXRSjiA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg3l-smarc-som: Enable Mali-G31
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Jun 2026 at 17:26, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable the Mali-G31 (GPU) node on the RZ/G3L SMARC SoM board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
