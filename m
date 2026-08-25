Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB5C480974
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 14:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668889; cv=none; b=dh5t0sakIZB7eds6vdbv2GW3yABp97wousQjoVoxneeKFmRIL5Ad/uaEtCGp0v2p0S87ldcANQuLhhWHWrAX9/2WVlQhZjOzwGfkVk95neOlZW84Mr8BieAjrcrmcJRir19HZMDo1BrRaGwiYzTUt0hCbb8g555qB1pAM7WnceQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668889; c=relaxed/simple;
	bh=nLpkCbwZynXDMfJEEM7Od0jmnvS7H38PKmlDset+WdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJRMR+NZwwouH/ZlCXPu18BTP8kdBFAcT3uK+bxvJ36J+no+/xPhITrcSR6AdZUmqnu6JL5TuQOU0txh/DuiR20by556eeGKhnu7ZGVwlqMw6FWqxSqtcCmxUhxkQ63kZpTysvkpVJ9pZU0ASXWNU2oCQfIA9FwTdlzB6ld5c68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c38565e774so1495803e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 07:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668886; x=1788273686;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U2zVX3GQV5dux+TGrNQ7XOJ1BZI/EApCvZgLsrH7Hjs=;
        b=l3HEJom9QDR/MbWvLB66kfDayr1V2POQunth5f/damEgvBUPJkt535cNA7/HJ+BwC+
         d1esANDhtjV57nQkeAYEcuXJNR/YmPsJWsbEE7GyGXKhNy2DfgwDL/1Vjlc6kjlRUvzn
         OqIFaRhNRK9ABgQu9dJn8qlVv2AS4WRTOgrgJeeZhbmdtCW1lupqYMnjp2EtRjFlLdK+
         HG4llbUQ7R2L7dBlcTDFZBmD/ofMOaiooFDhgPo3mTpyZ8gLtToYElLsbyEh3NHoZjcQ
         hvnF/V3LTMMBVbgGhUW41HhJ8fBi9Q+l4fV6GFZUrnKcs6yhanglyMQTlOPqLQAwEh7C
         p5YQ==
X-Forwarded-Encrypted: i=1; AHgh+Rprw4MOhTGio5jE+SJUWNLt27UHxebqZ9ZM4QDJZAdBtkuWJuuTDTtpSGj1piJDe4UThNeXol5Z2RLX4aOa6j3VrA==@vger.kernel.org
X-Gm-Message-State: AFuF++krkqjLUBtjP+Y8dfttv3XB1/LsUK+WCPKOqW3/8T+t4ejw8SiC
	uCKv53JrZUTdn02n7DO5vyQNkYS66nj162xdiZYvFEbsmwSiFVFHSwlD0Yc2Gp9pH0c=
X-Gm-Gg: AR+sD13j6fZ5URMRJwIojr21b+hQ1D8jKpgBJ+PrTgaK/bp5VIV8HoiL5aZT4y5zwnD
	pVR/89/fdZURTpQqBmy7GPLwMXgipnd+AW/bVoC2auZGVgl9qUlXk+FeUbrMUiPLbPyZ0mhdMu7
	NlcgdenztsvDkK/Chgda5bSTHF6+5x9RZ5yQt2QUeSiY1At+VBjtvJ/47lkuQdu9w3izkgTNt/X
	/A2r+1EPZzduFgxD9xMVHWacjUxNR4AwASRTnP8URQywLGL9+RGZo73jqcEQu/hooVCpvHXIWFb
	YL5Ty0UjS1dN+yEBdHFyEGVB5oyGhTPnUlSR2QxpxlPxoF5ZCgGxG5ispX5ti7W27yhoVoMw53F
	JmAss49b4rL34Rx25VZhgIDm5BnJifnGwWfjAC+Ux1dFrBXDTfYkGzDXonTbcXQoAK3tIM6nuhd
	hnBQAZj0jT5Xmo+iaLhqFMWrY5nTK1EW+4auKvX/L8+kKmrCh8pRPXUt6VgRfZWIXVydcWDAcNr
	mSeeeDvLXb6Wcbd1XYr8rWLNNBVKQ==
X-Received: by 2002:a05:6122:209e:b0:5bf:b500:c4f4 with SMTP id 71dfb90a1353d-5c60dd1a23fmr10180526e0c.2.1787668886130;
        Tue, 25 Aug 2026 07:41:26 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c632e87d61sm4673654e0c.1.2026.08.25.07.41.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:41:25 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c38565e774so1495789e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 07:41:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrX/al9cU1p2jJNlvoeOx391uTYx5QvHjfujn0bSW+GYSg0/Ec7Lr9ur+xsWss7XQn9paQsfkhM8RhBpQsLaqJh3Q==@vger.kernel.org
X-Received: by 2002:a05:6102:956:b0:778:9e3c:5760 with SMTP id
 ada2fe7eead31-77bd288c901mr8711759137.11.1787668885681; Tue, 25 Aug 2026
 07:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-7-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-7-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:41:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMhfr=rp9G8X-+=AR5vqW5VrJfrKwjVrHEKk_kJOh0ZQ@mail.gmail.com>
X-Gm-Features: AcwNN1XcBg5LXeoVHCFcLS1DZhjQyfJuS_scF13yf7YemR1ca_DnmJdOHtxK55I
Message-ID: <CAMuHMdXMhfr=rp9G8X-+=AR5vqW5VrJfrKwjVrHEKk_kJOh0ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add support for Renesas RZ/G3S
>
> The Renesas RZ/G3S CAN-FD controller is largely compatible with the
> variant found on the Renesas RZ/G3E. The main differences are:
> - the RZ/G3S provides 16 AFL pages
> - the RZ/G3S supports only two channels
> - the RZ/G3S supports only CAN-FD operation and does not implement the
>   bits used to select between classical CAN-only and CAN FD-only modes.
> - the RZ/G3S includes an internal divider that allows the peripheral
>   clock to be used as the CAN FD clock source.
>
> Add support for the Renesas RZ/G3S.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
