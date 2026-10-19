Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B71511890
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419111; cv=none; b=NHzuF1NLVe9EeGeCJQ9UitHbnp0q7arw08c+smmp0ukUBtkPl6xQ0sWuBfY0kJJrJFokkwLnfXKSYEE37PnK0KDM2H6fyNBy0PjjKJuKFRqgf6XbbVADLrZ3GNk3B6/xGRPaiTGH0lxfGIyL4vt8AukmgvxW2t729KQCuRNefcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419111; c=relaxed/simple;
	bh=OkpEifD2KWm3GsbxAZ0xxE8P5d3Del3yRNhkAe0sUgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIgYfYeKKuqpu6zW8tKWYJXWfhlTXItsMgHBSFXXt2Kyn4CvSNlMG0ump4xIUtjHNKJDnLTlf5qxidodS1RRqnnziTUAewdjkVqaa0k57AmEA6+XJv0HNoix/HP2eSNfGSZP1eNK9jeZCk5RMNrgnEtnuIQ/SCynfbwWgktyhwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7c6e6822b11so556026137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 07:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419109; x=1793023909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nUNNwLjM6Li4QaQna+9UtyB3Cj/CRAMDg2QIIEt5PZg=;
        b=lMPsOVeIpiYiLOJDRtaLy/vrg4q9EIUNOZEy2PGQ4KWl9Mco1mH8umckpeOLezfgWC
         xb1hgHCKF9mQ/XPOUq4xsmuFWao74z9tUB1oiutn3ElJ26HZj6aM0g2dzNku7NPb0Ase
         x8ljowYly1rnw2QEk1m5ujMVnxwpyCNakTD352qSdd1Z21LO5gPbytz31sI00UAaFxAG
         IV5HAJF7LSeM71ETmIFAkdJFN1lsSWhHfu/tVAi2DE1n27P/9N5lOptDRI57sEKZUTMZ
         x8phRT5ixpHPHg1S/bB8iLSzEPj24KcJmMI8cFfSqCalZUkXokABSPkHiVrDzCxiLfac
         vEOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQ1e/jgeVefuq59GXAPqLNqa+bDj9dvaeeL11aA+oYjMEA15Gtq/+RZCHqPU6DQvw9ekTKTlN2KyBCLBBaQPQeLg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKU/ZuyJEAH4A+8BhKRy+EnGJWOevWAXMI4XJntuEg4sX8qWuAs
	oOC9Q5P3PMy3Npb2o7c3xPUGfKaleQ3JWGD5aL1M87vJZ0xYeoNwH8WxI6KbGeAqgoY=
X-Gm-Gg: AYBFou2pY7u42LvDap4hvOYc4/Da72/4dCrahTWhfH17nBuGi1DX6CCRZ7cnb+sykho
	W9z1+/x0kBE4YPIOPNpGHOX2HkCdHJDWsD16PZ2CG2jZRpfKraMvezDBZwbinA1Y+44JiLjRCHe
	PQZjlKgkshC8/mZidq+xdZ5F/YXUwOYzUJ+nzF+BpL3mDUSHHsfuON3PDuI2DDivXUtBAUv4S4i
	mRq4MM8+C29fOFaXcqjdJzIwOdm6zS1vh8Xos7zDIsTlTsOZtJrq1oJ17WCCEo2N5ABw7ZcHp+k
	RALjDdkViVIy8Pck7/hdasnfR3mcom4Y6T7drDScT8Sdkymfuz4g7mjv3g1+moj1DeOUN8RDIDs
	2lFGs3ccDIdgOlpGxTVmWOh/031tMzttMjWe/dIonRzwiW9uz39FMl9Y54xadiGdjue5aoeWoNM
	KLUWCQ0VZ03FvDfrSQHAtdstGGQ/SYmM0pC2EWcFiImOSh91CQQpBPCOJI+DRxMk8Cg0YnInbMV
	SWocX1r3oAlBOtqpLuMHAntSr+zhdHHGX5C
X-Received: by 2002:a05:6102:3749:b0:7c9:624:86e1 with SMTP id ada2fe7eead31-7cc36b021c9mr1767883137.35.1792419108731;
        Mon, 19 Oct 2026 07:11:48 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb392504sm250180241.11.2026.10.19.07.11.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:11:48 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7c03744ef27so564339137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 07:11:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzT762mmkrdxQekAOr2nKQHoVAH3rFosbjKDCOU0WDYZ+DqS1Dnp1fM6tNJFVAWRU7RS55JdN2pAThNywR6iTgeCA==@vger.kernel.org
X-Received: by 2002:a05:6102:3749:b0:7c9:624:86e1 with SMTP id
 ada2fe7eead31-7cc36b021c9mr1767854137.35.1792419105797; Mon, 19 Oct 2026
 07:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003083200.459705-1-yaojiale02@163.com> <20261003083200.459705-3-yaojiale02@163.com>
In-Reply-To: <20261003083200.459705-3-yaojiale02@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:11:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpVv2=GHJK49ykUiOcgKuOrW9_0UbQ_nfx2R-MGuhV7w@mail.gmail.com>
X-Gm-Features: AclHuK-whmRf2m21YwZdvIAowJDZUbKGaSptoysY-titwCbr4PasDFMX4zXs_ms
Message-ID: <CAMuHMdXpVv2=GHJK49ykUiOcgKuOrW9_0UbQ_nfx2R-MGuhV7w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: renesas: rzn1: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 Oct 2026 at 10:32, Jiale Yao <yaojiale02@163.com> wrote:
> rzn1_dt_node_to_map_one() appends mappings for each DT node.  If a
> node fails after map storage has been reserved, the top-level callback
> returns without releasing mappings built for the current and previous
> nodes.
>
> Free the accumulated map on every error path.  The caller ignores the
> output parameters when the mapping callback returns an error, so they do
> not need to be reset after freeing the map.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
