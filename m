Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53014503F0
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439361; cv=none; b=gyeTXRoZliiXftgUS98DAbwNO70gtAmQQDp1yaS4aI791+jgjbrjsAkqiM8I79YBfFFIY39qa4PQN+YjWcDir6m1424RSmdoAcvrXSiBEWiB1NTA1ntfedNsIiG3XCzCIp0cQksFGMkDhpOvS28op618papIQNyU2rAuue+WPy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439361; c=relaxed/simple;
	bh=qBY/ZVj6ldHQ7SGOT/ev/wk35ZQLrgQzNtpOY5WeOOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcmFnp1Ezj+QQhA2BUPe0YCfGM5o4+aZOhVSsPMSRlOxOya0Zzt5KyNnIuz5Bv0qa0Qxvd5IhVdn6DQF6NEubXttWyE9Itv5UoAKa4MH/zX9sGv/mU9x2Roc6si7at5I2IXC8K8Dq41OPMzoTLwzwuIgv6svNSll2uCIGEZYKDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so2004902e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 05:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439358; x=1789044158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EaPjeR7aztkudYOj6lZEtq7c15pwwZNcBINmpVVqLi4=;
        b=AjJOVDilZqOD2fGo71p+1s5inMBL2z1yvSWYP7KF0IsRGBolmareMEdJUc3pPcDgsA
         4a/fIukJqJZBikBzxo9sYeEJyqJ3Vlt0ycM85kCOQMd8wG3IgkI0dNE5XJaRD/rgdjX5
         5l4QGNFRttdqzRvvUR3GgzPKmwgjfsG6faUnHVivHWKUe/MZ3IMNdjoMTPia1mOKr2Q5
         hfcWDDvfELYH5cA6qzJKOMuWMKETx2+ZETPO6Lf/brIUfALFsghx0gLkAoOYgx+unmMS
         656ynsZrNvUma4OW7MYO1Vf74zW4MilGiRiYkCg04qL+IV1ea/AJjEj59Jfa1VsBTi2a
         Zxrg==
X-Forwarded-Encrypted: i=1; AKwUvBxxbbHJvIJ0nSMfl4i22qABcfHtUE2RnIIJHU5UvHln6ORqzNvx9d3lTzyoZnMOFMpqPBlxk7AwaM9qmzdFzGDr2A==@vger.kernel.org
X-Gm-Message-State: AFuF++nQp9nwDjc+CRR82lY2Qe1i8WExMlbpwZDtKHZr1B0mPJpDP23D
	uSe/zSQXfAK9b4gO2fCWPEW2lVohR0IDaxaV9DWDR4xs2qsVJuO+NSdKcCqI9cBfJhg=
X-Gm-Gg: AYBFou01buhCvpuj9D/6LCUTEWBfEPO6ylVD57DiXL4Ex70ppmtKjL6rHypCYn+kCRL
	FIeeTW5sE/RmzylerFgYvDtk37LsJuz6tHAJTtzXO6FLYJTQ853Co5APJyvRDRh5k77zaD86a1O
	jkUBGVU1v+89AOr2E8Q8HsfOPUdfZV12KcCtquCNRlNOBdG7AD5RHcX0wEzCH9CEdK0O0sxBumH
	CbGP2yT8pBIOCzFRjtHInwDwzaQuI6s9YT12+r/i/CkhkZlHjzp64zjmpPmc/iNX+V9w/7e9zNd
	bn5kR36ggGPy9tWsCUIzB2kZCoDlk8UWrM9nJg3j3mxzj8W4n6vABgbAjnONPtKabWQX+O0jN02
	1tg87fjDQtj1Agt06ZmUmXOShE2oLoZCf1BnzpgDUjfwCCQn1OrtngPfyVN8CC4FtiwwbonNx6z
	ZnXxNYt+KFjcb0YQpqCEYnUoki0kWmyR0buij2SI88FsnkFxoQtzLLuviDrvhgzMZbsoLFFgzOw
	jVoan8PszbIxoGKCUxQiV5TTw==
X-Received: by 2002:a05:6122:8b17:b0:5c1:47db:cfcb with SMTP id 71dfb90a1353d-5c7d276ec2cmr5477410e0c.4.1788439358427;
        Thu, 03 Sep 2026 05:42:38 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd73a477sm4186671e0c.1.2026.09.03.05.42.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:42:38 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-783d429d0cfso1733456137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 05:42:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBygbiAUnWJQMF6YAijBXXn0QgP47QnBZffGzU62yaYb1a8B+QEOgq+5CbrE1sba2oMSeF+j8ez5hGkVwwoKmwmBog==@vger.kernel.org
X-Received: by 2002:a05:6102:f86:b0:786:dfc0:2ece with SMTP id
 ada2fe7eead31-78a1f3b9b05mr5106487137.11.1788439357897; Thu, 03 Sep 2026
 05:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com> <20260825095047.9971-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260825095047.9971-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 14:42:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXH8ouMnu6Ey=GfMKFwbU2N_nWFSNM-AcYv2ngAcJK_pg@mail.gmail.com>
X-Gm-Features: AcwNN1UULql7__dDtfLgJSgkoosulVVoZxCW8pWB1eO0ZbqrsKHQCSZJ81CuyNM
Message-ID: <CAMuHMdXH8ouMnu6Ey=GfMKFwbU2N_nWFSNM-AcYv2ngAcJK_pg@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r9a08g046: Add PCIe clocks and reset
To: Biju <biju.das.au@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 11:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the PCIe module clocks (ACLK, CLKL1PM, CLK_PMU) and the PCIe
> reset signal for the RZ/G3L (R9A08G046) SoC, along with the P8
> fixed clock required as the parent for CLKL1PM.
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
