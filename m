Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BEB2E8897
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527052; cv=none; b=g34yF+koFIpazT643efwbgaW6bDpDTl3xwVlYEF1/5eo6cdFIS4WVm3/iOXFGsWVM6qca+J+sJael4ALmhFKod21G2s/fITJonJeloNcLx+gffi0Nn/xt4lgTEl/31CX8ylLovrt/oN6iicEYqCbqDbP4ipw74HUpR71vX1CVHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527052; c=relaxed/simple;
	bh=vJr1h7hsBUyy3vHTeoyngtmQwphQ3WIBheDjPnoTJn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBreSZN+cBBtw9FGzESOkwhWRuy4i8T/QXoXSdrmKUnxp5Wwuotv1NyY5WlYXFUxD71UGBiuynqN5g6rA1D9M5ezw1bP9dIDX6viutAa4P9p4tlAHo06P7zQhqWCnTQC8uLfuFd/8dQgnLNhzrqDSzPrMfIdb4kcLK3lgpq2fAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so715551241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527050; x=1789131850;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1FFew0xvwxDBPdHzvarflCtGZCHXcWoG7HxiLXHltg=;
        b=ZMfM6fRNElh2zLDQ9un3UUWLmiet0fcaJPwr4ys6fiKalzbBXIhBw1+VhM7jGslLPX
         Nqk+2kTIBrzJJCc739xGMgN1HPCxfToC+yzQdXPnn3NvToIC424jmX2jQOmftNcODtod
         /MOhMWuxGrwsGKkH/AfdBJnr0bUkxiD6Boldr08nGWzkSaDbes1XalTit97idmmEL0k3
         goun3YYpl62zPIiIXaF9bmgsZYebVlkO2TYI9agEUakxyRLBcvCbrABB9aMAWuXBEzGm
         0ZUrwDz6RHKA+GhqQOtiT4w559gD3oQUeS3PpU80f4CDrh2RnmUd1a3uiZA1WoJJ8JmZ
         WkvA==
X-Forwarded-Encrypted: i=1; AKwUvBzvNmtGmPBkzNYawjgtFMfSzwa9NjVhzs3EzlGJx3j993fRFJWyC2ZhCUqdYNweRJglxHMxj0vhgSqzbZOzjpEIJw==@vger.kernel.org
X-Gm-Message-State: AFuF++lMNyHoQ/UNuly0IL4bMesabUEpdTL6+pw1b93mfUoZL0DuMlUr
	uIqR1YCYMJozsB+etOSyN22x6t4DavOr9nk9YuGAjCXiytrODiZkYQ4vSZQPxX4jp04=
X-Gm-Gg: AYBFou25QKv02yQDvbwGMQN0tcUk5ddQRpXB7Tqz1TVZjmGthTOg7JjGz1WvbADdXLW
	ZdYbel/uEiivbBCnJOoGnoSZUmhJpnw0jukGo1Ovy+zd2CGK8WfFLeqU1PIr+DyUABz/a4OtMGC
	VJQ8UkRP7sFld4E6JPo7VdrNrjLwnnBAEWxmbIBvMigHlBCVlWaSJKu+68EOfGEZoIS9/oJbvcd
	hpS2lJzrA0n9/leR9ngx860N1hJ4RzOIVrt1oZ0diG1+IMobFKx93rCXceSrEIHTGepkMHdPf5z
	FwJn4tNoZTG00mO73c/+gb5kZFcUwFkf5Wy+oHfOp7FoCntvagN2V7DfjMDqxiCf6T70zMEW7gg
	RmoxjNbi0iygvrujs0jRsyLh42IpwNNYIZTya+hsKDcQJtGBiE5R5jzuiHvpI1A78Rgq3eO7w1M
	+RkkQlpeSsPL9cT/MFZGcQmHrRIsoeWADpiz1yE6u7i7mHPL6ZmZFfAtDmwNyQESKVBa0El3oii
	RKawn8UwT3EoPOgP8qxCNfpzQ==
X-Received: by 2002:a05:6102:3f51:b0:785:b85f:2aa with SMTP id ada2fe7eead31-78a4a648a46mr2072551137.2.1788527048155;
        Fri, 04 Sep 2026 06:04:08 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1d832sm1510901241.4.2026.09.04.06.04.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:04:06 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so566987241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:04:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxOpN4TPKdqRKAnBKWcK4VeKNc6Ki4e2cRWW7kXJH3j0a/zMhfpOTAnzn1DoO5YrUBNKBnMSs+gaD+HHljiJhT1VA==@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:785:d308:cc2e with SMTP id
 ada2fe7eead31-78a4a91b269mr2076023137.9.1788527046144; Fri, 04 Sep 2026
 06:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-2-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-2-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:03:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX83jRBFjArNajU6Mq8NhUV4e0gN3Bn1K7WxHoRQUVb5g@mail.gmail.com>
X-Gm-Features: AcwNN1WMbKpO1qteekuyL9lk6vgBhGsq_Kk0QAeK938uUXzN8wBaXb1U6d7AMAM
Message-ID: <CAMuHMdX83jRBFjArNajU6Mq8NhUV4e0gN3Bn1K7WxHoRQUVb5g@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] pinctrl: renesas: rzg2l: Generalize the power
 source code
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
> The current functions used to get/set the pin power source check the
> OTHER_POC register, which is specific to the RZ/G3L SoC only. To allow the
> code to be extended for other power source functionalities (e.g. I3C on
> RZ/G3S), generalize the functions used to get/set the pin power source.
>
> For this, introduce the struct rzg2l_register_masks data structure whose
> purpose is to store SoC specific register bit masks. The members of this
> structure are then used in rzg2l_caps_to_pwr_reg() to retrieve the bitmask
> corresponding to a SoC specific power source capability.
>
> The conversion between HW specific power source values and SW specific
> power source values is now handled through rzg2l_pwr_reg_val_to_ps() and
> rzg2l_ps_to_pwr_reg_val().
>
> Finally, to keep the code generic, the register update in
> rzg2l_set_power_source() was changed to a read-modify-write approach to
> cover all cases.
>
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
