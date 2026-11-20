Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172735;
	b=r7GL+x7kuXylj9v7q7qtjw9etrwAJlZgT31PxR3wq2Hs71waiyqu60qNaue0R+SaH/ZB
	 2Ww3uT3zC1kJI5ZF9WoC4QzhWVkXOz7aMWrGkJV/IiL7lZ1RDaP6Nl94bpkytCjb+X9wW
	 qeVERJrzjilj7oTodwgWszuxgTT0IJqtyD7XqsUqQTV2g1a2xPEaEoGPRuvXaN4euxRBQ
	 mcLK0r+65598cP0ek6CmuOCxfqzYteEuGRA7fhZzqRyEmeIkHRFi/O88U3uXP0sn0YkyZ
	 ZffUAD623CrUFx7EQxf6OJLgU6BUJLPskutdaftun/K92AO5U4BPhk7eZ8puWm9XExw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172735;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7Fsqs1iX5umt9C6HSg0iQYMwk7igmLmbTGhkL3PvPnc=;
	b=I2l7Edto5kBjRGF2FQJ63x5fHn53hoAjp5VWuMvTdT2XbMBHohliSHailYetO4nNaL5h
	 ffXjHJ7jCUcXcXBKbQbGwyQleo8GvcWtICsc6FsgF3TqRHnyzEdn7+4tUHmaz8c5Xuqw7
	 1HG+KIgAtj/89ONhgY9UAS8Xs0iLDOHbkecGIOZZb3WYXsEJfoBqNbyL49UoaqV0ycE0w
	 D5AU2BW8vtnFqEZgMdIBCcO7cpgBjOVy576+C6c/DLtvRNadMxNlIbeyqJK2ImWLDF/0K
	 h4Xb1W3+NbYiHe6ittEZbVxJfQIoaBODGMWhcS1L8I2YDTEQkLLDD2bDA7nMX1tpJUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820D606A336
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 11:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5820D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso235869241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 03:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172734; x=1795777534;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Fsqs1iX5umt9C6HSg0iQYMwk7igmLmbTGhkL3PvPnc=;
        b=WAVNhfh+hINK4AmubmjDc5brEGTtIu6ORFtZIpkGV+fjr5b0XnQgXINUu/v9EuNEWa
         i/vSnBjGCoL3N+uhad4uztDIVcSb1mH+PUEwFsJ+l0V27B2QZAuPy9NhzWJZG2nCJxCA
         g4JErLjvSimXM6c6djYcHjwG/jJv4rTToWZeAdr+fQhfffb6q9aGSXll3Dr+Cpoii7jm
         GBeObF8ECwAhmltVUWOkqtxnn4p/ppVT/IIQ5si4L7w8xWHzgzYH34nv7P30c9qJiRc5
         iBMa+4xDrzx0949W6UlicIkiTcJogfIxD02+GWg/BUlJS1L4600iZkEh+3Iaz7ySGZs9
         F57w==
X-Forwarded-Encrypted: i=1; AL+hErGiI2RGvugePN/IpC14qZiNUBJFFlF0stz2vo4S3N5Ovgn3Muo0hZyB1bV1wAz05MauWOCninzUHOeip6esM6NY/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sb/DEZApMpqpZcwsVI1rQzaGiX0kVAk1QlXx1+b+pZD7GJqNy
	wOqRaO+FIPl3+a9G12FeSBt9sDWVOgRSIIY4dif/ynkZdPq+ihuDVvwlqZDCFvD2
X-Gm-Gg: AZFdTZdgy0uvl8IahBoxhDLqhJZyGghdMt2BoZtQ5TQpUgNg86vHk6XXQS5fPfFGTAE
	CSNPvGjV7SXqYTsr2hvBbWHLaBTSESrvRheYVm8Qe7+DRTcD/YqslxU2GvBa3pU0ondigVYH6ki
	5tIloo+UShWa82YJjgnf2LiPR5o9P/82wkwlGzgofejCDOKj8cljBezVIsbLLuj7FHDVNZWYCL1
	silxUiE5MJkInjWRprI8gDzv2+O0CQQ55gP3X3nbFNqLpFg1MF3DuDYaksGzVFyNzWic0wu53FN
	fV658WKUts/InPsEHUPvBbYt5rC7yLfpV02kmQ8hDpnKbI2xAz3g8geG8KQI67eQmmOqYd2Yojn
	xNiTk4FdCAkADJauyIoY8DUgfXqDF7PpMVwOi7IR8yPSRWqQ8O6Iz1c7qv4oY//KmP74bsuvrCY
	H+eajyM2jnUScnzRRhlKrZMDkSbZsCRZDW/oPXCHsX7QzXurBxFMRLIl2Dp8fP5QsV1T1LzoD4B
	EFlguuK3uE2k722Hh6BYyF3dtb+kGY2T9VK7cV5nejz8HE18qhougDqOcsrDrGdIeWr14qrkI8c
	htnq6OJ/1gRU2JmVuhJMaWYeFrGIoS4YLYPkNUsM0ABgEPy1mlEg8981Z8yizxcIhVk=
X-Received: by 2002:a05:6122:d91:b0:5ea:b1f5:a657 with SMTP id 71dfb90a1353d-5ee8aeb4a46mr1223092e0c.7.1795172734273;
        Fri, 20 Nov 2026 03:05:34 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b59844csm2148409e0c.7.2026.11.20.03.05.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:05:33 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99e145569c6so149534241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 03:05:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFJic+C84uJQkwm6UxK9VylGF/IPsYYUa4zrEYo2QqrJeI81oeK156B/tVN03aKX+MEqGZ1A3n9xs6777fcr6Rgyw==@vger.kernel.org
X-Received: by 2002:a05:6102:2926:b0:7cc:9d47:9c9 with SMTP id
 ada2fe7eead31-7d73963f00dmr849125137.35.1795172732962; Fri, 20 Nov 2026
 03:05:32 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev> <20260902141544.565763-8-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260902141544.565763-8-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 12:05:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXhBKV8zoi_95WsB3qSC2tm-nX9opurqFPO8n3mn3L=UA@mail.gmail.com>
X-Gm-Features: Aa3M54qJy6m08CrK20MF4Bh-SEahYYaIemU7d5t_ENxV4MsT0OIrWbFwbx-tam8
Message-ID: <CAMuHMdXhBKV8zoi_95WsB3qSC2tm-nX9opurqFPO8n3mn3L=UA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 16:16, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The two CAN FD channels available on the Renesas RZ/G3S SoC are routed
> through the Renesas SMARC Carrier II board when used with the Renesas
> RZ/G3S SMARC Module.
>
> The CAN transceiver on the Carrier II board has its standby pins connected
> to GPIOs that are selected through the SW_GPIO_CAN_PMOD switches. By
> default, these switches route the GPIOs to the PMOD interfaces.
>
> Enable the CAN FD controller and its two available channels.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - collected tags
> - used ti,tcan1046 compatible
> - adjusted the standby-gpio property along with CAN PHY node name and label
> - adjusted the CAN channels phy phandles

Thanks, will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
