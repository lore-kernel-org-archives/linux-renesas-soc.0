Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAFA41C2F6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 13:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779889267; cv=none; b=ZXegw7tAiTMzllB54O3Dxy9H4PPM8EhpJon17OePWIxZn2Lx9Ctiv+feOXuTM+mOplN3bw0Q38vfMh3LleJPOZcyIKV0Bny+kUDbo+bsAxUx+KospC3MFjLSnVUONb4/x9erEPi7FYaQMdeXfv4WLPv4seZWa2mf2XvPEYaj+b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779889267; c=relaxed/simple;
	bh=mEcrfUMvusxTikKtH8K1dnfTNnQJfa+aFYGiWe/y/NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFDd+4Cz7iWY/11JYlOoFy7ekLD093SzKIlGHjyLI/rSvje88hvqslcSxZ2BHNZkD04tq1aanAVl5s9EMiax4yDfBnzn/1OguBNVfw2VIrkVO8prqknhv/oixMTfbw+XAhkZSSwCfzk8ooqteJYoJywLJlXGQZgzs1p7s+GNPUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57746f02da7so7727812e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 06:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779889260; x=1780494060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNs9y+loQ3B7k+4+DTGFYd+r0HnydJFAxPOIKSPX9Cg=;
        b=cT9TzYTI3HtdznNkQwvHAaeu+eQDsnuSrK44wQXeScvzWFpUbk9vXkiHivWhJnJ7UR
         lyo2mjPeJdH6R8PTxro2yW7QgYJ6kafu8t/dHee78Ss3ukwfmuAe3e0G4YD6yJm2fLB9
         jSmVzVUkvYWWMGFTOhSIAu/+0yXfvWpj8yTTTM9wUQhpWBvpP9KZ/xKF2yFaIPGatbGB
         7Fw9sFZ9SHQBDuc/6UTmxweth3icvaImUmuvXiArJfBazrjK8yJx3D1czOLk6rIYkg/G
         K7TIMGNdv8MKJVq6vjPwLA4fGWqkJKgsXdQbmI/rsN8xVuYieHYgfx3HiS/kxePGo6BZ
         xqjw==
X-Forwarded-Encrypted: i=1; AFNElJ+n6eJVvDb4WwUGjAkytb0z3xcUlMnIYmpAE7x2uqCA0SCbvTBm/dNjdzh/TRuvOs8jkeAx3xTmC6jbOJlkCu7QPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0nSuki2+CcJR0e1d6PsRoBsHjc4NaoXcXkdPEhJWQV3AMfLZ
	jz4iRM05zXI/JZJlQbzGVRT+qzHjpxz0AhTh9/jBVNKHm1yBcxJCphlgghFUI55grAw=
X-Gm-Gg: Acq92OF0YZx3OgWtCUdoOUHaApGVkS5cwBTDU9c/MBR2R0J+KFAz5y7lwJ/eNpu/HXF
	tYdA1heP7rFevuogULd8dVgm6MGINy1ovOQ3u3hgI+loK/V2n/sdTuh+SqzJ7urZofnEec658Dm
	Ecg62S5yOZRdVHklVs486phehMm/+Nydsp2SMulcLoK3Oq7JCeu6tlP8dvRZDrpr20Pd8jBr2QS
	AVILjHyYnUo1ELdwmKv6SpXzrEB08deTDXBCKF9TGWdpIsbWsAfUtau3RrleF3ddaOzZ2jnpkPY
	L39qFsJNWKwlbFwDGLgleyKbGW/2/peGHsJstYSmV1R0Tpv7VD89clfjiUnwwuO4r36Btpkbofh
	Zbs/zkDo8mhf02kriO60MwIiaRiabE6u/ZqXj2FleX1A0AAsf8A9b6rPIuARVIUmFvZPFdIS0De
	e/ZtxDhSWr8cChbDyclFRTDBXG81HeFc05BFeHt7I6RMIanMmqeDdhcKIfG76h9cOM7vQVo3A=
X-Received: by 2002:a05:6122:4a53:10b0:593:1a32:f4b1 with SMTP id 71dfb90a1353d-5931a32f5bbmr2214428e0c.0.1779889260154;
        Wed, 27 May 2026 06:41:00 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-58d6412d8cbsm12036811e0c.4.2026.05.27.06.40.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 06:40:59 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-631311d876cso8460342137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 06:40:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ89wNKZ24+gA4M2X1B5bfI4h6Lf5XPuTQ2Na/WBXxoir78yYRc23yN06hJF7O0mJoX+RfM1kegbmjoMFYyPQYMoHg==@vger.kernel.org
X-Received: by 2002:a05:6122:32c5:b0:575:2ac3:4166 with SMTP id
 71dfb90a1353d-5865fdf6488mr11991906e0c.6.1779888899429; Wed, 27 May 2026
 06:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-rcar-du-dsc-v3-0-164157820498@ideasonboard.com> <20260515-rcar-du-dsc-v3-1-164157820498@ideasonboard.com>
In-Reply-To: <20260515-rcar-du-dsc-v3-1-164157820498@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 15:34:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQ5TDEx1Qj+3_LAGLrgNkiYxADkDox70pApZUtbam9Jw@mail.gmail.com>
X-Gm-Features: AVHnY4JU-pRdfRlPcY6GhkzF7rJsa1sewBAKfT1mHVG-dL_G2g5Q1LYyK6-SKY8
Message-ID: <CAMuHMdXQ5TDEx1Qj+3_LAGLrgNkiYxADkDox70pApZUtbam9Jw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] clk: renesas: r8a779g0: Add DSC clock
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 May 2026 at 11:10, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Add the DSC module clock for Renesas R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
