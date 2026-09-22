Received: from mail-vs2-f15.google.com (mail-vs2-f15.google.com [74.125.227.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D99A54EEC8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083150; cv=none; b=jGCu+E/nXTvvYySeyI0UBANgp4v9Hu/+odCH86GfudPgd2VSyts9Fg8ZyNwuZqzqoTzAfqbMo4jHqLeKOcXKgXMBZbOg5g1VBLTyFhn0/wRcJTYs7Ij4cpS7tD5J+OtB8WDcWunlhYCEd22kaaWl/uMBR4XVH/rHiT0V8Wm4kzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083150; c=relaxed/simple;
	bh=cL+fI7yP1z+214KskulSw5sR9ItYHUC3I/G1UL4DIWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmUdlrI3i3Mpy+JkCIFKyyqi8CZLL2GKaR2oR0vc1gNiSUa8EtOvUOGoWghMtt9BWx37Xdzfg7NCSpCm5HqN7cQdTwnTLziNiaFEqQFXoLzfoSxSYS/Z0x8voILCHouaKkMkRcP6fzWVFJLODEoNj/RDSN6yDhcDB1R6zFUteo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f15.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso2602285e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 06:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083148; x=1790687948;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1bNH0lrL2XpOj9M8wxgD6IqfQ0UbYYfZkklr2oZ0W2I=;
        b=uoplAv6hpUmd/CRfU098LJfHivdxMcUuCWBg+8UwyCCtN+oYMbT62OK4z6vFqmvDAC
         1HDj4zszBzYaedwT13ctm3nGAJ1gJezKBl1yaCM/f8GlNwefNa2MA0QsY+xMAGawXK/l
         yCsXNvZf56abgmQTdvWTUrW+bK0L3nSgF5FsRRnbKl9HPxmu+FIZFS6Zmryiy11dGxqs
         YU0w2JAtxgCc+60CdW2m10IwkRuGGcFR3wd3aOQBQsCRVea8NjUcM1uoxY3knoMSqFc4
         yV/2a7DfQVwHiXvXWH8olBCkfVpbjCKJ53dr9tqwaXtg4o+Zxv/g9XihYAtxH6p6OCAv
         8h/g==
X-Forwarded-Encrypted: i=1; AKwUvBxQuDOjCaO3jh2y3IhCQcU6QN1J4gAM81LQZOFPatsz0nHTyRUYuySQ6146vBPqRzTKOkWl4qvbb6bz8RpXt3fu9A==@vger.kernel.org
X-Gm-Message-State: AFuF++kuqVPHlqBgt1OchYy81ENTFz0ryXrv37iy3zg5yW3Z85N6rysy
	pmpPd1VOurKgbWH76RzyTh+xn4XhzHsVvVh8UlGI8kZbHtn/EWi/MxnnhU0Q/W2m
X-Gm-Gg: AYBFou1Vo88V2u13zJHP4oT2+o1lIvxWiKRtIVUFmlcDxsMC9JNg6ZQEidyMa/hBIzq
	XrFITgFlkXm1ajUwVNCgdXk0REvdkYMs/K7UokAS6yHLVD+uSiqOyzFhA2mYFdnNMbO7gkTdTbS
	ElBLJdP1+aY/prRAuosA6jz0YNPlzfFsVrkLbPzqfo+83ShzCVjLAxVoNQPBDXzI7MhqTqHzYHD
	S2vGwJIOTyEw32OyNdBO8BqNtfoujwACH8Yr/cBOROs5yx3yxjMkXQo4tvRtmPUlLJ/OT6DQ9aR
	qfgpEWeJoCawQ/F8EehSXFuJTN2EICgg7VnJNyljabGj1wgzgFHSPrkQqOZFUGDdAoi4H37QLfM
	uBjvqilEOH3KAg+zGIZe0R/QfmASauw4WTzAlGSOUmJusnDdNxlcZVe0p0akFmZC5D6uqGXJdRS
	mXApXOPZgBffj3KGRoIscmkHNGRDPNyL6jXbD0oh4ND4HyTbmoJ+B+BgAzn4jF7uYyt6LewkCaP
	e/Mh0P4LJsXgN1XsWter2JYMjssKkW+zOEj
X-Received: by 2002:a05:6122:468e:b0:5c7:9445:f468 with SMTP id 71dfb90a1353d-5c9b58a57a9mr8627022e0c.6.1790083148057;
        Tue, 22 Sep 2026 06:19:08 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9850f2256d0sm1358083241.4.2026.09.22.06.19.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:19:06 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9d8b323d9so1313542e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 06:19:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/DWBsNefYNJJyeAx3C/OVd36/2UWeVML/7WUWU7J9leIzX/QPU72vj5BT1BB3Ic3/xg87fS04Mw5ggKOW/pQcnQ==@vger.kernel.org
X-Received: by 2002:a05:6122:468e:b0:5c7:9445:f468 with SMTP id
 71dfb90a1353d-5c9b58a57a9mr8626707e0c.6.1790083145505; Tue, 22 Sep 2026
 06:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921232551.3129244-1-robh@kernel.org>
In-Reply-To: <20260921232551.3129244-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 15:18:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
X-Gm-Features: AclHuK8ei4T-jqiTZlN6RJORisuwZufxDS4cn_ittDTbFNHhpoPmq30pEuWosgI
Message-ID: <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

Thanks for your patch!

On Tue, 22 Sept 2026 at 01:26, Rob Herring (Arm) <robh@kernel.org> wrote:
> RZ/V2M pin configuration nodes describe the I/O voltage with
> power-source. Add the property and allow the 1800 mV and 3300 mV
> values used by the DTS.
>
> Assisted-by: LLM

Dear LLM: please consider the actual driver source code, too.

> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> @@ -73,6 +73,9 @@ additionalProperties:
>          bias-disable: true
>          bias-pull-down: true
>          bias-pull-up: true
> +        power-source:
> +          description: I/O voltage in millivolts.
> +          enum: [ 1800, 3300 ]
>          drive-strength-microamp:
>            # Superset of supported values
>            enum: [ 1600, 1800, 2000, 3200, 3800, 4000, 6400, 7800, 8000,

drivers/pinctrl/renesas/pinctrl-rzv2m.c does not implement support
for PIN_CONFIG_POWER_SOURCE yet.  So I'd rather not advertise the
power-source property in the DT bindings until the driver is fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
