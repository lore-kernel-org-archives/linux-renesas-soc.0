Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9022EA75E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 13:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527073; cv=none; b=e3oTKMpMLG0lbtBaeVkfJayqZMLAMl37YI/jzArP302EEYw8kSzw1E3G1lHSYJ3/wwlycoGdiBnIPDGw4QeTS/Ltz1lSWIZlo93/98JpG1iudoDuYVfSRa7dXbp2vzIhsNcL369gFY+Mn8aUK4nw/uP/OtScs/qKE5VeMbpiNU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527073; c=relaxed/simple;
	bh=9mJVt4xvBv9yC09DSm77QIgsToCU4Uam8KTiXBNT49E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdJJwaWx1LR0WK4QLgPrgxBuAyd4d426ruh0hgYq5R+WqyX3a9Dub27hDE6+mpUS+lpTGbddG8D3fJMUNIx8OCZLZaIb2aNCFcbvs3HlsU+csHaSwMdlNJGaW8Lz4WGmvCRzWSK9HFLXstLYJXpCmiKXsBhUiuMRocF0z71kGCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9808f46d89eso435123241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527071; x=1789131871;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xbgZlApvTu/xPQjUHtGMt43abYTF4MBtnYGRCX+MfE0=;
        b=N7daMYLPik0i5jxNHnG+/u1l1STOnfRT4b22EMs5tQK05ALjLkMgKW+vsVgAodPld3
         r4jx4F3v59E/k35SvtX47zVMNX2IfbkZ2oU4IO9LJ9GT+WPXOQxdVBoGj68bbzrUWrI8
         1xYVqeKQ08F8DDbN+nSImn3/CiqVMfigbXKFsDhUPfGt0S2mvHKxJqciclAFW9lwJFqu
         qdjsdrEekCwVyQoPtYX7J71pisrxBmrbnbvSDMzx6o9B4mFwG4p4xrf9ZRmrvGT0wvOY
         14fU4WDFDnOqZWIZfOxSg/joyTddfiPRBHHD8Y181n5yEojjrXbqS89El5k8+7dgOzaq
         iZcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1Qg/K25SxTkMdNRODx/iEjA1IEvUSFjAhn6Zm8hydAjZjFWohCPsNCujYjH5CDwqGtpEHz622kOgFvT/WlBo4jA==@vger.kernel.org
X-Gm-Message-State: AFuF++luhFPxHR1ygrseaICJ0E3zb/ZRSxtT9H25mKlGgdiL/gUKFLHT
	UV10l7YzhrXEKdmnOLBzwnU48kTTv/bzKO6yYcSXHSwyoIfrxsyUuhxg2htgE+N9iAQ=
X-Gm-Gg: AYBFou02glTNAlXrkLDEeMmTBSqQPoLCkT25mgVJtlbeYkwc0hl8xrW8TvRUJAJ5uhk
	n3wsvxTXAAb3tOlMd6DslC9bkRFtcy8z/OcEZIUslF1SkMmqexnDe63CKKIoL6XMwyf1Ocqz2AA
	kAnjnE0rmRsz24JRbBCTd9fpdgTLRu52pE2a00n8Fmm7ymonSCM0HhUseVBNDxoU6LWaM+P7O2u
	svRZAerscKh3j8kBPoOpknPuv9obqXZgduRjCuVjQQU2B8Kl5w01zDZKyZYk/SgrfrMC0saT0Z0
	ha3T8DJUln4yBBRSc/0Joa29dWAC9G4tqd0nLvtHf3NxO1t6sEN8I1/P2XjPRREDnTeDzJrGaqo
	aoKFC6M/crIN8i8afaaGPBszO2ujchddpHTMDZPGLlpEJ/MFTQ+wHfU5ZnHL24VdBA+vEuDe23G
	aimfFGuMIYMrVQBr4vNrGRu1dvSdI9LmkN9r1c5FC0iwn5U1AB3S4coWQVFZ+8LMRXZ6x2I2wla
	jTthU/fZITKob6OioSWyUlx0kSU7w==
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id 71dfb90a1353d-5c7ed81a4femr2860973e0c.7.1788527070935;
        Fri, 04 Sep 2026 06:04:30 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097e5sm2052016e0c.2.2026.09.04.06.04.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:04:29 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c65093556aso799993e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:04:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/UM/YoAkK5AjSrzLqLYBZ+g+m4IfFbvHg47hGqh9RWav00mlelOOUOBmUoT9XtjG+B99zVwhWA1mhgCitmBmTwQ==@vger.kernel.org
X-Received: by 2002:a05:6122:c8f:b0:5c6:4bab:4cb2 with SMTP id
 71dfb90a1353d-5c7ed80403dmr2539951e0c.6.1788527068555; Fri, 04 Sep 2026
 06:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:04:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtXaOxC2Ttw4EBtTY9JqUxjL9X6M4WhCOc8C69qw21aA@mail.gmail.com>
X-Gm-Features: AcwNN1UNaplc4sWg2bdo_z4KydBn92WTMZ--tFNfKKtuA-7QPoR1X6zMCgLV3PY
Message-ID: <CAMuHMdUtXaOxC2Ttw4EBtTY9JqUxjL9X6M4WhCOc8C69qw21aA@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] pinctrl: renesas: rzg2l: Drop defines present in
 struct rzg2l_hwcfg
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Drop the QSPI and OTHER_POC register defines, which are SoC specific and
> accessible through struct rzg2l_hwcfg::{qspi, other_poc}. While at it
> move the assignement of rzg2l_hwcfg->regs->qspi upper to have the
> initializations as sorted (by offsets) as possible.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
