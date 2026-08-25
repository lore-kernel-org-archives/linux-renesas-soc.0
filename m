Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FDF484238
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668944; cv=none; b=Kd+zLEiEwic7DpxfMUVrFXdFAkdW1tTB/Oa7XXOyqvzyF9M3xdg4PWoNt/z6lL3mrOuRf20Hxs0wN/LBUD8oI4anPsD+HOYGrSQdZU4Vj4zelycLCFggSZtccejiGdxO2cwltXl26O8LHi8VYHvCbMgSN23M8dWGWs8cx7r4flM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668944; c=relaxed/simple;
	bh=nPKshbbUtBrFg12ZGrFb6hUqHzYltdvYyLHCNt5+v8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QY3HWdrnjnMUBBGwZHhCUp1XmhNsAK47lu4Js2bcUS58PL6bNG1tsiBV0hrGcSQ9zho+Vka8UMjqyacDuLA2OfR9bdKOz2Gwed0rBdB/b2NfWVw1S2xQYDMoitmkiznAn0Q0OTnLgsCWEGSeUS+voJGdVt/IawY44w2mogJIt1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7542a2ee156so2744172137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 07:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668941; x=1788273741;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w6P/zDMrNIG/rjy54fcEEocHk6BsN+YxdD3SIYMCYNM=;
        b=f8YMVoeeHUiWAVwOy7liq47F+l27Hxddnes+uRmoRaIDu2TZpiVOmqQlgEvp6GX4xK
         t69TRsQWzp88fjiB7Ein3KeYK+oKOnWITI93cuIf5PBzAoEQDmcRTOem82kmTuFZbt6c
         iJ8WAqfeMYb287RfdLtHW6Zdkne2gpJY2yUP49Zr54FZKbSQSQxGy1s6tML3bG0DH7oc
         NdtWv9Udb574EGh2cRqm8Aj1nxXf4+Ot/Z8soExdDEZd2A/isJFzoejAuYK1UDJpYYYG
         QT0MrNntk+Bjrlx59SvufUFOVo2eWwA43IIkWwuK0CuGAvfWWJgyJzBSuvRzZzMWU6ae
         bw1w==
X-Forwarded-Encrypted: i=1; AHgh+RofaVAkt87DulnPWtyqrk/o6JB2qodcK58umV3wTGA8hFM0dqcciwxmZ/WnWsDh2V0DanrOgkYBSRkeHO80kMXQeQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mNf0WfciYWA053SI2NBfNOPSWRsOMWLz8V8f0onhkZkFcIiH2l
	st1kgBmbAi9FivU5VSTxr05lHglYruxxoGUZh6Lsz4z9xpQYGQCJ5dwwOsEJiD4XvJQ=
X-Gm-Gg: AR+sD11eqYCryWRXzqQx9AI5RBjm9QaVBZzxkpQIj8hoI0ewcW/Y7piOUR15az8jCHK
	obNLer4Q7LeVP98N/FD8Em+z+smEAqo0/D6T5NyikqviHa3cz1//d2LS1wOeHTTcGfZ/AZoduQX
	2k3wnKsojd43lgAd9kXbVStAM5WEz5UAp5vChggc2lto4VJz6kWiDDVDAqwSANr6vW2Tua2wE4a
	D7PP+FakkrWrqhd9ERIir8BVnbxE2zgE9/SdLEkMviqAMEeOkAW0zhlMojSgK6EFHr03uIoanqo
	GU+8NVOidzB70u6QD/q4g7vZPRjL41T4y8+fkQRGta3QWJ3h2RDU9NYx9g0ZK1xwsHcolfnOf5i
	Ne/N13ltPkZnujoXL6QqoKY6Xl6pwl1QAIwy3BtZ4y3mEnPLs+HyjEZNPV4wjtEjTK/z7IASBqF
	RLgrN5s4a9j9RBoUo/qnZ4Tb6FAC06YbhY0uQAsrz2r3zqH8b29rhssrIoGqxYFCEuy9ge2LH4p
	FSMSjOgA82pi3DBoOB8zPa+aOg=
X-Received: by 2002:a05:6102:41a5:b0:737:bfe6:3b03 with SMTP id ada2fe7eead31-77a637411b1mr12590308137.7.1787668940517;
        Tue, 25 Aug 2026 07:42:20 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-77d8357ccf6sm5699849137.4.2026.08.25.07.42.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:42:20 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97caa212bf3so558169241.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 07:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpz2+Ih7KHxyWDXv4KJauyW8+9TLb1UkYWJd6h6jMsmr3ZvPwqgbODiUOBcfBzC46o3Bm5QCGNb4hkVakGz+7PCSw==@vger.kernel.org
X-Received: by 2002:a05:6102:8682:20b0:77b:b38:6f44 with SMTP id
 ada2fe7eead31-77b0b3874afmr7018842137.5.1787668934683; Tue, 25 Aug 2026
 07:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-8-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-8-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:42:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW2BBChjGXf1LqR68EE6LfJXv+uwPm1AhB=NaasL17-WA@mail.gmail.com>
X-Gm-Features: AcwNN1XNGYc2CQ2kaWgxF0GmyyU43AxSZu87qBHq6lGDVbEDpy4b3DvqBrFpSMs
Message-ID: <CAMuHMdW2BBChjGXf1LqR68EE6LfJXv+uwPm1AhB=NaasL17-WA@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] arm64: dts: renesas: r9a08g045: Add CAN-FD node
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

On Tue, 14 Jul 2026 at 19:34, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC includes a CAN-FD controller with two channels.
> Add the corresponding device tree node.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel, pending acceptance of the bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
