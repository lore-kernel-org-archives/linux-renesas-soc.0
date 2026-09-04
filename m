Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812152DB78B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 13:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527103; cv=none; b=ea1DEX24aarhoechJDQAMiXjRs+9cZALf3X34Ol0NbsrDuIgl9MN9uUzB+CEmjV8+W7u1FFZCM+kaKL/6OJOZmF7CSEsl51lnh8c3uYU3xLzdXDEWOT+ISBPWFKvOkWPMoxpFSN44/6TFcIDZYXqMdDszm6NAbEt3aYfXuuqbcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527103; c=relaxed/simple;
	bh=9xSOtnR0JMeRis+2A9+69QPm6YPp5GCesQOz8P1BqIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=spSpJiCMsWjbp1JK1s70Luhpjq5+YEujbu5ALqPoybl2peOY0mK3H+HT7WByaYxjJeL9j5UwYX7nQIlPz74/ogOgYh+WhX030ffM+cKNKmB4RaACwsWyJolD5CEHZJ/Dt+gIDI1S3nHA3zTYaFJ6f6R+8wpeHMzgH6zpygV//WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7868ca1f0d2so339851137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527101; x=1789131901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RX5/AQcrp5g9z3JYNb5ynUUaEFHGVwH0550eIwcyIWE=;
        b=h9t98xyxnqN9t+4PYB0M8Buueu3sdYXReYmRHKFyuWC3M1pJuBUx8SAbh9tj80HP7v
         egfr01u5t5g7nuQoOYpEtHiyFAGkZoynh3y2zHhf8101T4et3/EH8oH/nJtriCm3hJmE
         Q8SshWDnZ26GGb5fj/SR2QqWQIpBc94tGKJH/CxOzYkIzQtrG3C74SjKTk4shlPHmSJl
         9Trvsq4kLjrHbKdPDHO5qTH2Cpj5CBQczX3187RA1GBxfqhAKyru/tnNEGea5b5XP5hV
         RIQIbSrbaleyx8hXOzAwpiOIbAKpHm/hPyWuieTOWkIrmvFVUxy07OcXW1SYpUhPzl7L
         dCxg==
X-Forwarded-Encrypted: i=1; AKwUvByNKZ0RtuJZgt5ChpaGW0WulANwWb+Av6lJ7AookJARsWjCj7D2wrz80nlWCcmZGX5TIM09Kg6ujjL33/asIMtftg==@vger.kernel.org
X-Gm-Message-State: AFuF++n9q52WMPRbej1E/d+/pD2ieavx0Z9RhQzA+SV50aG/6vzRwZjr
	j5RbkGI9NpoDYuwV5MaPr5o2KPCDlkgFQ9vZugfVstFBWFBC4ZQnXdB318oXc6hsbAA=
X-Gm-Gg: AYBFou0Yva5OV1zvJV/BbRkp4ZkVhwioc6y0r0u8vPNX/BS5+eQnDN39MNYXxPeoSMW
	kWGdUvdQH56YH7u0PBRP3p+wtb6Hu8pITF1BsLpwaFeDrnk09m2ex8/iaJ/KJKDL28k235HnnDT
	UKUWmB5O2mn12/9uFtg1ERpufy6KLuu5nq1Uo4bWLNtFTNSauSVAN1WcKaBC+seXYp/VMYCwglG
	i9WqJcGe6v5zReWHMyDzyxljJ79HpRvNd1jRF0q6VfX1S6LY9RsuNJyL3KxRCE8OtdTUkZHDVq1
	+1Vih26jsrMmfidpgxwaLd1wBgYKONL2/iZ2Wv93BpxjEo259SxnSpEs7zpkEhT+j2y/4kOSaRt
	1eDHJigG9oCMqXLOxtaik81RtkvgiRDyveXXVPTnD4cVyqP48T/W3gkMKrZJGMBwBN/OYqFw9NX
	RDRyhbs0C4CLlgwp2hXyJJ1hVjihqYRmFjay6bnsygy1OQ69jmYyVok/eEzLFo7cNk/7k8t7jk+
	GX1e8Y7UJ6Zm4QODxwxggYPCI7BZw==
X-Received: by 2002:a05:6102:c10:b0:785:bfc7:26f5 with SMTP id ada2fe7eead31-78a4a90fcd5mr1504596137.12.1788527101106;
        Fri, 04 Sep 2026 06:05:01 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b19369sm1702329137.9.2026.09.04.06.05.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:05:00 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c7c57e637eso463861e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 06:05:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxy2caqbLtTq+noOn+v5XBg8HcHEOsrBQfhxwZgljmQ2KptwypkNmA4KFLjTxDRHIdslm0A0t0UMa7JpYtw61Kw8Q==@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr1610149137.10.1788527100013; Fri, 04 Sep 2026
 06:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:04:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMyNqkuLbRuxjmAfx3K9uY2v4Bi3E55Oi83ty3183diQ@mail.gmail.com>
X-Gm-Features: AcwNN1WoMZ_PTeRAOvmLdFtKHfL1Mzb06YSXX-uH--FGhySrvI3MRJ8Z9p2r4tY
Message-ID: <CAMuHMdXMyNqkuLbRuxjmAfx3K9uY2v4Bi3E55Oi83ty3183diQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] pinctrl: renesas: rzg2l: Unify the power source handling
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
> The previous code handled power sources using a mixture of power
> source specific definitions and lookups in the available_ps[] array.
> Unify the power source handling by introducing
> struct rzg2l_pinctrl_ps_desc, whose purpose is to describe a power
> source through its power source value, associated register value,
> associated capabilities (e.g. Ethernet), and associated IOLH index.
>
> Introduce two new functions, rzg2l_ps_to_desc() and
> rzg2l_pwr_reg_val_to_desc(), using the
> RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC() macro, as their
> implementations are similar.
>
> These functions retrieve a power source descriptor based on either a
> power source value or a power source register value. Other functions
> that need to perform power source specific operations can call them to
> retrieve the corresponding power source descriptor.
>
> The register values for the soft power sources were kept to zero since
> they are not used across the driver's code.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v7:
> - collected tags
> - dropped 2.5V voltage domains for SDHI and QSPI

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
