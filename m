Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B700480321
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668692; cv=none; b=j8Y2FP3craNE9GaPnrc3HLng2+vPJnO7vSJpz11J+NgK0kNliygcDwTOtvG2w9BFhaChiCnJz0Awxjpd2MWwOVO/YrOqFVu9I42X8e/4qF6n/KCPv4ajm8uLyCY8MPQ291lfVzgW5kvmWMHEryK9DwhnfkyImmCebGscT4/hMOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668692; c=relaxed/simple;
	bh=eQ34DPym1g3yHftFYjOe7131ncl6EEw6TRurmNjX1u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/aJg8QrnVEgPvEumvzI/je+IzzwczdRB3CfjOrmHldqellfwFAIWABA9wlqWOm6dDSCYdCurN2Kg0BJPropHq24KLvsM3QVVI+515lNUYrRdgb/5k+SgPCET+6ho241G6lfwGM9dTLJhRnQXoJE0FMNLLOYhj4f5qzNllR+1xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso2075044e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 07:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668686; x=1788273486;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jyAeQiEiW4UAm/NK4AK+DyXXQ3APXDKQszoA62dY7gk=;
        b=htl4WkKNM2UoFL8zRRRMOHIrul1u1NPIYMXZGCda8UFePsw6a8Ac9O7Y55UO/jXNaz
         d/48skvHTv3Voiruf8NYhfNievh/QB7bLpXriVhDcPCghtHgccfyG0ypCCSVISiRxnBL
         glKhYp5GvQ10GAisHR04w1nEYMVgPkRbNZwvXPeu+Zbrf6j8aaTYClKqerhqbU7Hm9/9
         54wp849OfR+z4sTfWIq9ZpNAi93SykwM/LhsG98dxVqryHe0hu0tuipgsMRBobFjA/la
         68TSBru5zKIMpNwRqnd1TEXYNBPWtshhibo0OeLCRnmyOtjbjwStPKcqHKVv/pESym22
         rCGw==
X-Forwarded-Encrypted: i=1; AHgh+RrWkb9VaEbjBnfj/GV2I/yippT2bAO23KCFSJUdpAoSzL9PCeNfLew552wxgtAtTiuY5kYF5wkT1hrW43vxREkp4w==@vger.kernel.org
X-Gm-Message-State: AFuF++nqRDLqACw1r7U+M7l5llz7z4jPNvmaOLBuW35svZJV8/NVqpqh
	PS0h867G6JAKLDNb3kS0cvBYu4sfGEhfjE76ybyEbE/pM9SPXkvKeqvKX3VfJQzuTkA=
X-Gm-Gg: AR+sD10339Dbz5/T8kIIKd447vIjh4uDWBd0EmxnueZIwlV4aUXgFngGkKZO3olVXoq
	T7b+weHD6EnsNLuwp8wUCbkp3LII61IqB/lunYbENePQ+fb3SN/4YJWfOgZbTAl7YaylX94a1n0
	wUOyIOF97U4xKbAMnD6QTU+PUNEx+ZIYVxskgMTJxBZ3A3Fcp9yPM6MKbyxDxWYCuzDiUEjfCpU
	+EHFclgZEfd8kR8EkvBKkyH+Xv6khKIftscOZrtaMFGDtIm7o/HRrEuoB+Uq45PEsHGDBPM1PKm
	ssdaqyDpidmssaMzORFr3hK7q3StO4WzE30fqB18ogJluEGVHRgbT61Mwjb7mH6PVj6AApGi71I
	AIh7LaMeizRw7HnAGggCMvfGt52RlFyRhcWbkziKhHKYp4TxL1gBfHATMho7aerVJ8FOI+XuTOV
	QwD+lIl8l6EZj63u5hLH47Ypj3wmytxsxnIY2h+UbxB7pD92n485+fIWHrk4SA/uSwigiewZjXG
	CMjtMsUIbghU3ZfAddzW2THlQ==
X-Received: by 2002:a05:6122:2216:b0:5bf:9f77:477a with SMTP id 71dfb90a1353d-5c5ff27c266mr15097692e0c.2.1787668686138;
        Tue, 25 Aug 2026 07:38:06 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623cf4026sm6272288e0c.3.2026.08.25.07.38.04
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:38:04 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-966eabad303so963003241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 07:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqmOF2Rhw4hskOMTTAZL/18xcNPylK9yeoOHFLkL145MmaPRSscI+lURWpDfG3YkYHKQxG1VT+oQT7/SuVhPIJ7Lg==@vger.kernel.org
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr10559459137.6.1787668683910; Tue, 25 Aug 2026
 07:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:37:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZUZgtpnEEHEP+nHJHXLQOWJbk3Pf4fzyviMB0q3wuag@mail.gmail.com>
X-Gm-Features: AcwNN1VJh8QhgMVTLLPaW32CuNebN4Cwri3VhB7TN8P_9_MXNNGof6glaJNaOtY
Message-ID: <CAMuHMdUZUZgtpnEEHEP+nHJHXLQOWJbk3Pf4fzyviMB0q3wuag@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] can: rcar_canfd: Do not set registers selecting
 the CAN mode
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
> The bits 30 (classical CAN-only mode) and 28 (FD-only enable) of the
> Channel n CAN-FD Configuration Register of the Renesas RZ/G3S SoC are not
> available. The IP supports only CAN-FD mode. RZ/G3S HW manual (revision
> 1.30) specify the bits are read as zero and the write value should always
> be zero.
>
> Add the mode_select_na flag in struct rcar_canfd_hw_info to cover RZ/G3S
> and avoid writing to unavailable bits.
>
> The existing struct rcar_canfd_hw_info instances were updated to address
> the request in the Link discussion.
>
> Commit prepares for the addition of the Renesas RZ/G3S SoC.
>
> Link: https://lore.kernel.org/all/1d9719e3-10ff-4cd8-b729-55fea93c37ce@wanadoo.fr
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -445,6 +445,7 @@ struct rcar_canfd_hw_info {
>         unsigned shared_can_regs:1;     /* Has shared classical can registers */
>         unsigned external_clk:1;        /* Has external clock */
>         unsigned fcan_pclk:1;           /* Has fcan sourced from pclk. */
> +       unsigned mode_select_na:1;      /* Has no bits for selecting the mode. */

As negative flags are harder to read, perhaps "fixed_canfd"?

>  };
>
>  /* Channel priv data */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
