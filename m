Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD21322B72
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535325; cv=none; b=AND08RxzkvZSf6CaKkC0myYH6GWxaaJYXTBrGYTJr4EU9x4YpReVTzWu5MrvlygRmFuaGkT4QOhlQfOWXXcpRvuLWoM5VkXJixavs9DU7ucYAj6IyBUMCUZPrrcTi/8Hz0hh0M5oJgB42XefXmwjSyUjISU3Tj6Ut4XHprk0eKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535325; c=relaxed/simple;
	bh=K6kz1YIg2Cx1fYJe70AD6r3Z3wt0vQ0W44s/a7Fmbc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivtnEEuZx6FvUryf96CjhpBmeu8l7s67/Vg0HFH9J1CWnNQAVmpouTE6/qASOu9DffFsgVRouSbmZQapTsBdr1lTFt8aTULTr1SFg7n9NFET4Vt+WCB6qKzxLH/anwpIIcVe6CLUZiK/OrtB3/gqGDqhdUJEEkxhWg4sUIFnhyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso961919e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535323; x=1775140123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kHn11aQstirwFpTzbetT2TMWUY8x1eBCRaGSrwNilg=;
        b=qFYiWGT0rDlFwwixOnx7eQTf3pXMeMgHXLJFvAmR2RQnIZJKmael2ryWcJFh88rlL1
         CqXSt2EDMP8KMnRc7e5dIn/Xb6xx/FuFn0WsD92ij2SMDUc1D/AOpBO4SbNFl1cL5VVa
         y9l4Y/QtPKXtKi+VbYfwZdvH3UzXtQghF5rPUn+Q0rxLUWra7+sosz6cpI36l0o0FAMP
         8c6ppLc2rNcKeio+FTESWmvzzHtuX98JlAUtoCMGAila7AO1onkiopmz4BUfPb9KB7/b
         t6QtZD00iNJiCDqa7iAk8ZsxFiYrU6ybpnURdp19d/ZUCQH8XBZsd8Nnskbw1uMjo86w
         5Aug==
X-Forwarded-Encrypted: i=1; AJvYcCV7yc2wcuK8Brk9Un9D8mOeHlbPWkAJIYRcK1ni5AkL6lMS80hBWOURblNvD0lLhhoabhoiOk1NYB6/WfFm3/MtPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxx+5VTxl0MK5UEjbZ5A+0LY8qHkxb+MwSp1CAD2hjNCKNjGU+
	qiXtvb37nP2f27eoiC5tZW5etLrj1p4phhMhhGcT3Ak+jDHQw5wwOPDaiUwrR87iIq8=
X-Gm-Gg: ATEYQzyg0KBaxnKoqSF2UoOBPHCpbVdtU2uKgbQfN8E8saHMtlexIcuR8DXXbG42RGP
	41oZL6PcvxsDJs30h9Xd0gCVY+12ZoVg9zzU+rJ/26DQnAM1AkVolG6kkRnu8qniIS/TJ7Nt81s
	BZbD5ovK+iJWjV/POX0aBHREYGlct7TeSiQSP2KuQwGe62jCOP0UQMX3WUQ46gjTXYBXRGyM0Q5
	bqedMaKiZmY8NqA7o94hyfW9xiLyIvvSoey3rZVc6L9c1eBSmN6e3Wjg/6TFe5mPoZzzzQnKtJM
	4kClsds6WLoIO/EJhg8J9E9jAiD3vTDi8TPMn7foQidhauNjJ3vWneT+r1xSXxYsMsy7ihNBDVI
	P/VSwhfplehgB2doOd6q8vUXY2CQuciorONLUkqg8A31WH1bm5ce4/IGmNnroJ4EM7r2H15Rlii
	JEt+mGVeGGeNaJ5L5pQHfgFOdIM674VBCtNx/bspUfuLVpG+UAeCwARfYmQo6C
X-Received: by 2002:a05:6122:340e:b0:56c:860b:c34e with SMTP id 71dfb90a1353d-56d21f67619mr4290341e0c.8.1774535323194;
        Thu, 26 Mar 2026 07:28:43 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31da7eddsm4947801e0c.18.2026.03.26.07.28.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:28:42 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-602b7085a52so707641137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:28:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVu7SC86IWCB3kisEJsggXneSoGnVqkULpCWIZbDfQ0g5DIBqxL0fx8Is4//OYXY0Xs+528X8MiIrxevcDPYQho5g==@vger.kernel.org
X-Received: by 2002:a05:6102:3f08:b0:602:6c8b:4b8 with SMTP id
 ada2fe7eead31-6037900e0d1mr4124976137.5.1774535322084; Thu, 26 Mar 2026
 07:28:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com> <20260304074907.9697-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260304074907.9697-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 15:28:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX3THUiRMs=BgacxODUseTghD5MQ0QaZU9XENnKSaTkaw@mail.gmail.com>
X-Gm-Features: AQROBzBEchn4QJ4qz_JtpT4KXa5zrbIIxxx3S5ycozOPElDORQcj3XdPqrFveXM
Message-ID: <CAMuHMdX3THUiRMs=BgacxODUseTghD5MQ0QaZU9XENnKSaTkaw@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: rzv2h-rspi: Add support for RZ/G3L (R9A08G046)
To: Biju <biju.das.au@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 08:49, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for RZ/G3L RSPI. The RZ/G3L variant requires only
> 2 clocks (pclk + tclk), unlike the RZ/V2H which needs 3.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
