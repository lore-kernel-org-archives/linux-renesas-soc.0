Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6638E3F9F3A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701032; cv=none; b=Jh/Y3VwPjDudASle2P3S6QDQjAqdW3mmLwobKSpiG5BM08+tpcOo5PS/kvV00UBaUi0o/5vJ1Sr/40ebTsrJSh5HPdpWmdPIb4Xd14748WEoiCucguPeTyh6vb2aZPvlwROEUpMKOtYVWlvLcURv+Ta1GA5L9VOMOA/QRwbJlzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701032; c=relaxed/simple;
	bh=eAJa5Z7c17TZStR9rqFEHsqcvbsjvgQzGzaVPiveyPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWkDsDifqsE7XJVnNSVx7G+6luZdyFnZn0UQ0xbtRuYjmtxVuhprQLyUtBpMb3HlQKuicTLNUvi5dRorVzNvlo4B3FdNvGlel4OJ3zdHXGIwxgOA46lUaTDkM5WGUxrZV0kQSW8rxbEOJDDstFu2zCLYEZ9t4X2jg74qzPgIfy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5a1490272bfso679723e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 05:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701026; x=1782305826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEtTfrrI/Wz6zTu9ke3mlvoO8DQaZTH3OhHIc46SAvM=;
        b=lz54USqLmx2j7uDIKV3yMqUE/9d285Z/g5ByPy0M8sMreK52I+XMOY7kRFDvJqTCa+
         LPBeTwfZnqNihJ5KMFww/3p42EmA9mOagplBaz5/ovMVUsGjWNAq5YEJLHCodKnTplq1
         4oguCJS7NrRA7VUSjiP7pWt0xMQQgpGJOXkd6OzxEWChtQCIwj0tBdDztuiwwybibXs4
         APp+7+14Oq2po702xvhbm4tcF2Ek5RbGBf7r52CjMSNOJ+45qTaZSmWqHw/48w0gUBG8
         dAfP5GlaGKyyI4XEKeaoW33IKSZ8mGReKIcrTvSvYoXbUZLJ5zyB085pc50zpb6Fu/Mu
         dOvA==
X-Forwarded-Encrypted: i=1; AFNElJ9cn1Jhlw11Mk8M2XOZhOas5AFJDofqV/8AhYW9iWWZu/YAK9idf/ARht78gef1SiiUSmS8EI+CXbYAj0SJYyO/1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcNncje/eI85VOay/cZEjwluTrBDcSkfpbOghqkFR0nZjsXEyS
	1/5SCHBQXDBKaEGKCH0rE9kKwiSpdH45wUmuKaRXX+vmVEW1y/alUZfEfQpv9b1v
X-Gm-Gg: AfdE7clgJ/M2K9epwVa5eX+A0al7X7wwr903knQKx2OGktpDkHGQWKuSYow2ApBLE7c
	8EaZQodVn1/pJuoUXBIVUnDIzpos6XqAA4pFD2BO9F2AkZsT97lXv+cE1RS1koXpca5fXenjWr9
	ib0C2NCyJ9E4+ER57aNZAGsIK0ki3ErFAYgRyxnNMeXaikzM0s/jdQW9ITOmkKuheU132dArYzL
	OdXNyULX2OlHjPbo4gf7EuZuAYKfuYaeslVmpdX2sAOEDso03idAGFhq/0z7Gkr8cpzHSjgqS+2
	DM1wnst5hK16ym8rFaMRliQq/KJ6xuTO4EEghGR8bVlNyqQJE7ujkSasJOAQsfjyc9Gg5cJ+4tg
	WkmG9Z96dLhyvJxSrzFcDY+MBXIjJEbs8f8+8I2nletFEyCZ7I19wXRvZ7skfYYVAW+GfgMLEeo
	/LZbEM0n2+NHfznl6FHnjfxbGhgO7Xb0VhToYipAhleiRU9x4pug==
X-Received: by 2002:a05:6122:6315:b0:59e:2a50:39ab with SMTP id 71dfb90a1353d-5bbc106a67fmr829963e0c.2.1781701026058;
        Wed, 17 Jun 2026 05:57:06 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb90015ef9sm8292469e0c.7.2026.06.17.05.57.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:57:05 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-72257ba51e3so785181137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 05:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8701jVghIRFkqZ9oGZVi62oIkLGs4JJREPv5x37UTQ7M/RiAY+Ima4y0r6Dk23sCuchppG3hooc+B6WjVYKLYXog==@vger.kernel.org
X-Received: by 2002:a05:6102:8641:20b0:6c8:c356:16c9 with SMTP id
 ada2fe7eead31-724f1a0615amr792991137.20.1781701025499; Wed, 17 Jun 2026
 05:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com> <20260616104459.410743-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260616104459.410743-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 14:56:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvLONcWTQTXnhgZKggeuH+AbGjGQRy-27NSsj3kahQhQ@mail.gmail.com>
X-Gm-Features: AVVi8CcSTexP1elil-Cs_kpT3RJ3HOMSGc_nsDjzYQ7yPZXpnlMWYOf0IebDQ68
Message-ID: <CAMuHMdUvLONcWTQTXnhgZKggeuH+AbGjGQRy-27NSsj3kahQhQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] clk: renesas: r9a08g046: Add USB2.0 clock and
 reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jun 2026 at 12:45, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add module clock and reset definitions for the USB2.0 interfaces on the
> RZ/G3L (r9a08g046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
