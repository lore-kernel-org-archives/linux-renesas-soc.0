Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4723B42DE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613134; cv=none; b=bmOTrQU2gbcRL5B2pgYP5iKI+fhNYwLlwjYRqN4CoZOOWzFtjomZvP+EXDkCw1coqxx/lj6DC8kh5iaWBzFOJDFRxxzUzOOgG5mz9wxnpMB/T15jkY2Dkn1tAd/M/XK3SU/CEl+4/MqVjKpzO8QqWkSfnt70WQAZ9oIPGyEpMdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613134; c=relaxed/simple;
	bh=6UeQjnNQQKepCtP6jT6aFE/GGpXYwrHI1wdVI7j+YWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sjD/N9d4gA4Vsq+4pKXQmJIN02M93MgW8G+aS0U/BbrewNdaFXq0OOJwqJSYF3CAeUY3Xq3fOBY1MxvSuJg4KAb/IcnlfaPVAaXEnJQXC/8G3HhBxJwV4wuEosKnJuDsc1RoY1PdkkbWCl1TxJYPeYJe5zVXg1oXbtlUSaCHisM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso1106013241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 02:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613132; x=1787217932;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aZSWQ6egXX/M61qbKh50ws1ZJUA0MvIrSjxfVopcJmo=;
        b=TaHxgpsWrJvPSH2kmYRSwnuEo+B3KrT9jKFCNIcG97mdpr1hS17Te/34DaTcE+4bCX
         sc0RR4VKKIZWEMlD+Ah+rj9bFDdIUhA5LSG+fanI5uqmpuwmqgVQwhNIiT8RGQ+h8JSe
         T99ZIBuF71xi1/fjmCynU7VuggkWYUX+vAhm9X6ERqwga20UUfoibCE3Tr+4jR+T5DOE
         GsnmkYZ+J+nO5nbmzMqh14K3er3bdg4ptIwVGbgoaTZoLeLRCH61EEjQzvWiTiikoTj7
         6k9zJqh6M4B/G80h+uisIu++XTINNyyyJamN6/9gcCYfsJSxAX5dgq5Wq3WEEAk91JZL
         HB7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrNlGoBhkDY79gz6Z+0dmOSTcHiM6NF2klYgWum/s9HPcHmvBRe5zO9ZgRTsSIUELg9bGLUUlxJqQtzSDYJNIPLtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7XnekZskX5buRitIvr/6okvgyb6roW5vRjztyANJT6dCbCsBR
	1LZ+n6ktSd+pZqooK8V0YP/B7rvCFY4LkbG10EDdxS1acLBI6WKr3KXHJqQP1awO
X-Gm-Gg: AR+sD10JfRhcvOr1ldpZWC+FBcj0qY8WJxf/F2UNO5rLeuscddifot5LhI1L+o9Miws
	OlktnsiqxO+T4ZSScOWDOdrKi9pHWVWV5sDv7JZI29zTewxTXIvWadKhjf7Jd2d+iLZZWERrdP0
	DgiHLs3p9rvhj8pzalGEHMI4yU+8Fj+/fLVLm+RLxj1jnr8QM95X5CuSz436/X2xzUAO1g+Pnt3
	+Zt6lVsZl3EtBPl0en9bZc1FK2M9xYFCYLXi/HUaveDJxc6c3wYZ/0X+ZR+/ggbm2QyTtmrdNEf
	+FZZy2eZjidgp/HQFZodWi/zWIQEgwoDY5AH8WFvehB3DyvjK4i0HkYcQpOKORyXbKpUqNvGJWD
	ftZ27AF9MaJr7De7ldsYTh/bh+Yd3vrnLWBmkpsuqVEgrk1VTm4XYOm7RrZWZhpOPNoxAJhZJKN
	OxoGSCXLUFgkk/NpYUU3jGGHlKvHvGuRggXFommia6apRP8zAPAzBGIp1Xq4V0opkrCZ2uL6ptr
	c4Vi0StsijPljR4iLKckULc9Q==
X-Received: by 2002:a05:6102:1481:b0:650:94b2:b209 with SMTP id ada2fe7eead31-76db5784ab9mr1474590137.4.1786613132292;
        Thu, 13 Aug 2026 02:25:32 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76dd2db5136sm769242137.9.2026.08.13.02.25.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 02:25:30 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-966e7380109so1359305241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Aug 2026 02:25:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpPX/oYbbjrHgLZVsDoGMOYUxrp/bTvXVLntW5T72yWbQv/70rDMHAs8ASi4I+XolK8cUgTf4B99JwBhn1q4glHeg==@vger.kernel.org
X-Received: by 2002:a05:6102:2c86:b0:744:c068:438e with SMTP id
 ada2fe7eead31-76db517cfc6mr1399093137.2.1786613129455; Thu, 13 Aug 2026
 02:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615115455.1412098-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615115455.1412098-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2026 11:25:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFBpWyGhiEsqmQ=R7qHkysNpd5fGFN-r7GjqVXJJ5J1Q@mail.gmail.com>
X-Gm-Features: AUfX_my1XqYOgWGA0Z5ZVwVS4QZkdrhOw8AOG0maGe-AncWKxhhRcLybgvhtzKA
Message-ID: <CAMuHMdUFBpWyGhiEsqmQ=R7qHkysNpd5fGFN-r7GjqVXJJ5J1Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: renesas: r9a09g087: Add VSPD and FCPVD nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 13:55, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add VSPD and FCPVD nodes to RZ/N2H SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
