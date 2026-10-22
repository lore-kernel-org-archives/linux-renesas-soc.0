Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660540;
	b=5t7LV3jiK3WAbOjsU/EUlfT2f0tXFSYijdvU/rdHK6vaL+GLOlH6bzf+ioREzEl4Mm0g
	 e4NUjJy6URjbeKWH6n99xnMrHv/VpgyY1340oavJvobsxzjLx2PVtsLtdzKJCy1St1ln5
	 /yHCMrNh36MsNy0PEUolW4X0lt4c6vgFDTTisEOXyTeI5K2JcIKRBieXGZAl2Vn+FqWqh
	 yH4JifW0YL5sTU6yIOrbrhxGLAnJp0hEtMua604Qr5TsJ/kOxaHEDpOAsJRF+jnQZBjmr
	 Gef3kYu3vK1xJTZM7Ev1RkKyl4I8OdUSnqjOF33/ofZC+6QQEvPivOmnhueQuA8eEjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660540;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=dAtGHKvYVTH00WDKTEZ7akrxcfMPHzXwthZt16huB4U=;
	b=CqbtQ1fSQS0Dz+29uZU2FkTHw1bl00PpY7VcK30vdSnw1jtMfKqflmUhKPv97tL1kItq
	 TIopFDAgFJN7h0zYw5NfMmJhUiOEsYPUlGJS5zSMh3J6NRRzIl2SAbfEUHSDRaQPwcYKJ
	 DtlfAWvMt+vRyf+EvigQM4u35XU+xCKj2mVIhfWCDjFl04nQ3PZqBVBp0/g/i1hs0iPzV
	 vD2LAlUKfA9WlR3rC2P7qP2fl+d3+5wn4oBi0A0nuxnxFmY5ZJDdNGOy4PjtwQf2LbgrZ
	 YIgxjm3MsqEZ5pk8+D4NWHHE9eb2z6bJqnadkAd48IT1TAbGO1xjKjnDkbRn74/8BCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA12606A33A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 09:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA12606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so1162661e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 02:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660538; x=1793265338;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dAtGHKvYVTH00WDKTEZ7akrxcfMPHzXwthZt16huB4U=;
        b=SJOVae76i/ujeg7CFPOTWBnHvMNWEqVF6HM7rKT1FiN4sibi7gB7gtN3OL/3vsp6cv
         tspk0yB7f7co0YPntUW1sIlQg2mvhvQX7EAOwEXmNjmo81Jsxz3QyVB3IGRmaTzSK9gD
         bHP5w8/SPtazW8Ksg3mTrwQm9rApYmqceuiTj9hH609+DJOgKXIdxGYbioHXLnXySRtA
         G1cnsZ4cQNoz+JEzKgZ5hJ99XO27lSiXgnxZT2gBhIzkCw9qIJuL2F8x7GFQL2EkyQfY
         a57nAkXF6K9FPdvVStRU5lDRKGqcmbqXdBSAN6Gh6/PBck+BW6gQfkuZ3TKTih5jDbIa
         EneA==
X-Forwarded-Encrypted: i=1; AKwUvBzekMWSLwI1J/dj8ireU0qAxLpRw7gu3vstl+qTnbCOBkyAEtfKrTRHqkN6XVmaO5Z3DMmnaA1CAYasYn5b0/xZbg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIyIxG+kpibwaMc3IUxfVce/cNOem3bFvt9y3hsyX5gMY69TRW7
	BD69YSbveIbrWE/5fD6zH7/r+duM+jM59o8ytNrtkl1rGeK283CgI91yHAja64fr
X-Gm-Gg: AYBFou3sBrmsSqrG56e+CjfB9iOwwGizjWgdeTmEcRHanOxl9BN30XTwpGIuKusAGEW
	C8yXDJzEq0RlezfIWWWN9+koNYJv7BpL6qvovPpjLYO+yTLs0Nt32FukL4L4ySv5+WthyHTdGvf
	vKaIhnlLedIMzhUx7pTifzKW4PcyrhUJ0w8kQE1zHPnZXgeGn0J5q865RlVKoxa/fFMAnOgz7A1
	syalC99YfOLGJ1UyBhDNAyKkIkXyngd8TXYQgCOny8U3uBZnffuooejg2lUI22u6TIC3F4iiVJe
	bvnVKFIuwrdrzwrSE+spSRMPGZTInOBSG0Pz5vf5vXcm07rX/NIq+Aq5/nhlKPKauqMIcSI2YDL
	dcdLQDMf9NiZTTOtJeYM5F6VJ7YJ7qzhlFLN2MwzQMqutKd+aGWdDebXX3AQfJwQh2bUPaQtuix
	3gu3vIDNXCt9GUxGR58UaeFfEPU897VwcF+C61BX1CEa3z7hbIp1J+irXrR8AB7noQigjnFoKAJ
	FZb+L+SXAXJCQY3K3Xiswzs9IdZndX3P69jsE8cpjGuwR7XAA3mmUwxbKra0ETT/XWb1yEDuE/n
	AlyYSTweie/nOgjlvVBSqbX3Tg81t8iXMs88GGI=
X-Received: by 2002:a05:6122:1b8e:b0:5ea:9a2c:27a8 with SMTP id 71dfb90a1353d-5eaebe4278cmr1832116e0c.14.1792660538542;
        Thu, 22 Oct 2026 02:15:38 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97df494sm6220385e0c.10.2026.10.22.02.15.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:15:36 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7c3cecbda48so242317137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 02:15:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxBCZmaF8jci9BB/tYANf1+UvjYiwgw2UD0rMv9pAPG/lgjhkqO1VetVZxOXW0ZDw/6XtcvLV9PBccT/UW2vjUi1w==@vger.kernel.org
X-Received: by 2002:a05:6102:160c:b0:7cc:1a41:20fe with SMTP id
 ada2fe7eead31-7cc926de9b8mr1860786137.25.1792660535752; Thu, 22 Oct 2026
 02:15:35 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022044135.275485-1-artem122novak@gmail.com>
In-Reply-To: <20261022044135.275485-1-artem122novak@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Oct 2026 11:15:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3dpM2D+6YTv5Db_Y+ZFa6e4nsB6mN0XjgNGBh=ZE5XA@mail.gmail.com>
X-Gm-Features: AclHuK_4BpDXw1ghhrrGwm8j_I-lCmzvQXgOFhpdarQQS7IFAgX7Ig0jOu94rnc
Message-ID: <CAMuHMdX3dpM2D+6YTv5Db_Y+ZFa6e4nsB6mN0XjgNGBh=ZE5XA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas,tmu: Add SH7305 support
To: Artem Novak <artem122novak@gmail.com>
Cc: daniel.lezcano@linaro.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Thu, 22 Oct 2026 at 06:41, Artem Novak <artem122novak@gmail.com> wrote:
> Add the SH7305 compatible string to the Renesas TMU Device Tree
> binding.
>
> Exclude SH7305 from the mandatory resets property, following
> the convention used for older SuperH TMU implementations.
>
> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
> Changes in v2:
> - Rename the compatible string to renesas,tmu-sh7305.
> - Sort the compatible string alphabetically.
> - Exempt SH7305 from the mandatory resets property.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
> @@ -51,6 +51,7 @@ properties:
>            - renesas,tmu-r8a779f0 # R-Car S4-8
>            - renesas,tmu-r8a779g0 # R-Car V4H
>            - renesas,tmu-r8a779h0 # R-Car V4M
> +          - renesas,tmu-sh7305  # SH7305

Nit: the "#" is no aligned with the other entries, please add one
more space.

>        - const: renesas,tmu
>
>    reg:

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
