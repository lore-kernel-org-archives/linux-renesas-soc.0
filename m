Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1943441B37B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 13:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677956; cv=none; b=ZvNhfIQOplHa6RMGnALXA6KqsHm4k5D09Ie/8P7xoSNl5vyOOdNyYRiJajcz7bKgkvFR18VtbFT2FaR7BaJW56bm2t5NXNBFoGcaeLrrE4a8B0yMgU/gpi70sJuGSkDjjeDYPNpI2de6U8w2lPBdya9XenIsUW3zP1G1nXxGd10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677956; c=relaxed/simple;
	bh=dzT3V0PJ0EtYExpUBsSJdQaC/ZjisOX3JzhU9ZCaz7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCIbT2slAup/d4/wPyVMylflAjSKiaeGOZbMGE+G+GEmjtXtd2FyOfsnaaSpLSqVotSMvBcu6wt4UdMPWJSRTlRTV4/EXT/KBf9HQ+sfC2KG0zjZc2oQomvM9Rkq3WOCaExOxUijKyAe8MMOwSE+J/9bXD4m2F6KdO7rHCU4efc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-95d0476492eso2085815241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 06:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677954; x=1779282754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7kN1iIudHNJUvL4pmKJBVfs8sJZ9FSxEHa1dgQM7WA=;
        b=MXIYC+fb/Unxkr7bscbfNotQ6VJoWmY7AeJ53OwjByoWMEVVSvhB5te9k3fWPHU0ne
         eSqtDBKrST/2D8wDMUjNHtERXekJHPQZyGiKkKJMJcj1ERWRhuZsInKu9Jn1ckdVDonc
         P6kESMRdWfuPGKoBmYOJcA8Hv2HNt0JsYT/JHetEDpEHefIfg+D0U9hMlhfw6nkUHSMB
         1YkiCW7SUfn1eaW+qsWrjCTIZP7D7TA81X0d5efBjVnPqy/+slGoJh8L7vf6PKNLo14l
         lqT8YDb30u9kbRoxSuAEqBOlGOo2MjItXHMGjEMOhXHG/5wIaZ1YulPMLSG9yhuXZefw
         vKKw==
X-Forwarded-Encrypted: i=1; AFNElJ/tXygIyD52NjCi30p7AB//FYWIptlSS/TXIi2p0ujWPacugfb39mswMlIjRIBnYJNwpTHrpakGn2v+mOyvv/vI8w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz54tL7KDXvEPzGAu/eu+vAAeTwm/v/i2iNLeoQurwGiztacBaj
	vNJkqCIITvQMTD14eRax2x4iGNUX39iP8+tSEkLnuSYToZsU9hqecjpajNPKW6a5
X-Gm-Gg: Acq92OGShudNCq4/YAHu+Wqx7uM50JHVMFC36QATrOr952lhSuPgmEaKqLCOvxmE1Rr
	Qk2z67tXIipUd8f1mwQzteDksWnONnXT1dbjC6beqMXxh5VZ8pwrtSTO5zAnp4NlzQNdLu6Aofs
	KhDKwNwnLq6x6k5M/UGfTfOMyRJw4UhaB7ZrtQjnLNciARDYcez2bF3JUUY6176Yn7j1zK8w6WC
	w7SWUxsAAn+rxlDMxZZcIPZ2qfsL9Q01aNQxNAcfvevRU1D0dBDAYcMfDbcSbrjUCO/8shgNGOu
	8kZRL6xBq/dsasJXLr9ic09y1AA2sjnUGvShLZuNS0wxhEKkF+2bAN44DKPdopA0GP3fiqxu8rs
	PE1H6mPU7OKIGCppbDCTHug3CsqYLDb+rDxm83PFN5YKk+nTIIphBy+G6JnMwHe1BOkI8nym+Bn
	Bxtw+rjZ1acEyjnRMG34C4izXbq4lFPDfV8dvWuGcgXIGMQBjklO3Ej96f8aFb
X-Received: by 2002:a05:6122:21a6:b0:56e:ded3:98eb with SMTP id 71dfb90a1353d-575e86c9bb7mr1033868e0c.6.1778677954043;
        Wed, 13 May 2026 06:12:34 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5752425a19csm19618142e0c.10.2026.05.13.06.12.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:12:33 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-63270abd14fso1372388137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 06:12:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9E5jQcfJPGEKm1niMI1FG5eIyc1y0Ri54Q9798Nvj/0c+UX3h1aBuSjty/vyVYruyn7GoJzbcAlCjsaZAQwCcp6Q==@vger.kernel.org
X-Received: by 2002:a67:e703:0:b0:631:3821:2f12 with SMTP id
 ada2fe7eead31-637a90e2a7cmr951105137.16.1778677952636; Wed, 13 May 2026
 06:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org> <20260502185557.93061-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:12:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWGLtExqCcHiiixw12Yq198HV_s8ZH_cq1gazuw_2hjmA@mail.gmail.com>
X-Gm-Features: AVHnY4LeEF2c4Mc4gMH6K1pQiwZCCHRxKdP-2WPlZmXzSxqkEXKWG-8hJyRfniI
Message-ID: <CAMuHMdWGLtExqCcHiiixw12Yq198HV_s8ZH_cq1gazuw_2hjmA@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: dts: renesas: r8a73a4: Add ZT/ZTR trace clock on
 R-Mobile APE6
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 May 2026 at 20:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> These clock supply the coresight tracing modules, PTM, TPIU,
> ETB and replicator. Without these clock, the coresight tracing
> can not be operated.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
