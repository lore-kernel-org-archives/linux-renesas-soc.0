Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2768D43E9FD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662843; cv=none; b=qyFJ0diUg262B1NKA8H9OG2+6IbU9riY6Q18QYf4fzcwYrdDowWVmFy+BIW20Ixti7yIqYZ8srT1vGHNugU6BFOSFMLYpZtL4RfhHcPACT4gRVdeLeWpAshSchsyhWzSvairUpWmKHavcjSZ93S1WpPoHSWRnd7iwxnizGiCUkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662843; c=relaxed/simple;
	bh=VO1GZ4gCp/y9o2rb+D3PA8tXGec2JaV9n1iCQ0jrsiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmT0sHx+bX7Tn6j6zkg6KYiAOBegHd4BU8iuK7f1GvYUy5VVFYuHhfTgYRdR1I9jSsA2oRvL6Kdhrg9RkCIufGPlc+V0o4RlOi32si+ZjnEXv4u3I4Tju5dySmftpKdVn7DqWv5GBwL5qjt7gpk8rOJs/7/xEaPj64EnkaaR/Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c1c26d7e951so711612766b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787662840; x=1788267640;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f/VL+GrO3wM2oN8yF9pczuQ0vsJ4YOEv+mk062nltpg=;
        b=m4D7cAXm3zBG6C6xAeq+k1NMR63iL8Qke+CFp5NGmlYrpJhHIHVUBlBap4DTP3d5Os
         yNf+oD0ungDqncLUA6XlLoYmP/ByOZl3g6FjHS7BAYI6shiYj1cxaNJc0VGtrTrJ5M/N
         nir6gDffNzD8tGU5iYNXpfJsIkvWBDh8nT6+IyB5JjLpkuYeF1aCu0v+mNIngIt8J0ib
         PMqZNNIKzPTlR+uglczd4vQE8jtrtywu4neN2hCaoDC6iD6ggEX8aSIp07X5bOyl9P89
         Mgv7ecKITjf4qy8twQuEKZdek4SkSCqgzfB548nZz5HSYS/EjVy8to9ocxauXmBcJ/et
         Dmaw==
X-Forwarded-Encrypted: i=1; AHgh+RokTXIjQQIdn8+ElW9+LyZpAelFwLCKBAfqj/jE7exdcV0bPZldnwScCR9koPh+IR142ArhTTjLy6hmxqYIeILxNA==@vger.kernel.org
X-Gm-Message-State: AFuF++np0FFh/ivQHXoVUeHo0jGmHRrRHew1mSl98iicFYKcLrw/yHCf
	MiAN9XhPND4MNGV/zLxwQxJ+l5LBudIB5COAvohScAC2LDoaMxlOf55OM2XemAgnyUM=
X-Gm-Gg: AR+sD139yVeujQz0ChSJp+558du0Oy/t3TDIbm+cM0CxGFjmHy/OrYiYSl/sHOi2HDL
	qrBBR0snJY9cDspxg/FHW6/m9eK1Vchqp1uIF+pwDKCwbQ8N0IDaEx9WdulAFp73Z1//KML7CnC
	kU+Ttsghe78P96SIsb5A7w42QPAMRD3j4nJqTTlw7qbrq33eSfYl1dVUUokN0J6RYFYPHzBnmRu
	zqMrvfw7naVO5g/KwixI620o5d60cm7OSC1B6QEAHfBCTWq6OuEBdo7gF2Nw+htNOX8x0+gYleH
	M0EzmcBXEMxa7X//Pt2zS2/ZOIMGgf2cwpoUXh9/MgpZ0W6Ptg2U/Oobwwi+edfLZpR/fIBv2Lm
	Dz5aKv7s9X/+h8Qpd4EeLVe4E0LUHz/M8K51odqnBBgOGJjhYY7zFEpxUNNYg8phFsOmqjo7UMx
	Gn4kRpXWwe9KwGaLYFJn6PQ0rCcoJDKspTiLSM4z/Vtwcy7+a8zo5BsgduCwMQRLlBlGjmdppGa
	Xk3CPjO3nNXYqX4uYD+UWr80AxWOoctaGAp
X-Received: by 2002:a17:907:ea8f:b0:c20:ff26:336e with SMTP id a640c23a62f3a-c246a605cb7mr3591334266b.14.1787662839450;
        Tue, 25 Aug 2026 06:00:39 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f99basm1687240866b.37.2026.08.25.06.00.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:00:39 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c207cb16cf5so745212466b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:00:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqNcCKO84Wu2Gfka67lktn4ZBvn8fOzg6MynwrP63Ct8L3Hs6MTGy4yErI37WnrkTlWWRtIA9cicy6uqnvMVafM5g==@vger.kernel.org
X-Received: by 2002:a17:907:60cd:b0:c24:c22c:6372 with SMTP id
 a640c23a62f3a-c24c22c6490mr1589458466b.5.1787662838829; Tue, 25 Aug 2026
 06:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev> <20260819143553.2478984-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260819143553.2478984-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 15:00:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSDg2EUhnzVtcrLaL3kyZK-wJ8UfZzcFXmS=O1RZE3MQ@mail.gmail.com>
X-Gm-Features: AcwNN1VEuaPMxcxWs3RbjdyN-p7dmv63o4Gq5Re74moLFekdRIJP2iC2c_m_pgo
Message-ID: <CAMuHMdVSDg2EUhnzVtcrLaL3kyZK-wJ8UfZzcFXmS=O1RZE3MQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 19 Aug 2026 at 16:36, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v5:
> - due to patch 3 from this series:
> -- dropped the definitions for PVDD_I3C_1200, PVDD_I3C_1800
> -- dropped available_i3c_ps[] array and fill everything in available_ps[]
> -- dropped the adjustments from rzg2l_pwr_reg_val_to_ps() and
>    rzg2l_ps_to_pwr_reg_val(), rzg2l_ps_is_supported() and
>    rzg2l_pinctrl_pinconf_set()
> -- dropped the tags

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -69,6 +69,7 @@
>  #define PIN_CFG_PVDD1833_OTH_AWO_POC   BIT(19) /* known on RZ/G3L only */
>  #define PIN_CFG_PVDD1833_OTH_ISO_POC   BIT(20) /* known on RZ/G3L only */
>  #define PIN_CFG_WDTOVF_N_POC           BIT(21) /* known on RZ/G3L only */
> +#define PIN_CFG_IO_VMC_I3C             BIT(22)

BIT(22) is already taken, please rebase to renesas-pinctrl-for-v7.4.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
