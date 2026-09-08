Received: from mail-vs2-f6.google.com (mail-vs2-f6.google.com [74.125.227.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4963A4ACC68
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Sep 2026 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869829; cv=none; b=FjIGnhnH74nuXdV5ugvztnO54X+3M7syruz3+8Qly3cRN/MqhD70/EIFK6v0u8Hux3HcBD2/r5f/6iOYFNmKmybUMnz+ahTUaUzo2oJanQGkDR5X0b2XwEYUdC8G9gAkCbK/Gz4TTa8KqGRAUtBy5mrA82JzzVX9a22JG3qMbM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869829; c=relaxed/simple;
	bh=4qfVZ/5nw4amR7KDjxEudFePppzurkPQMXOHgtElbeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnU30+UrvmbHjpeFw2b+TPaGTGxDCpOaETUs1Dv1D7LZ6XjRBdftOvYrSxcSYFjncXAQDgAtoa9JrlGRwdGnFmcmDxzi7ViXkiTZwg8qaSuRxsJG33xeNQzaw/MFbim/z+smo59lipoFkbTV+c8VUu4hLUp/jjbwwOqg1xwuqzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f6.google.com with SMTP id ada2fe7eead31-7832e0210adso888687137.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 05:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869823; x=1789474623;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1ITJx792r+ituep1jxzGor7V94Ftkp9w2SLxSuD0zdE=;
        b=cSnG0xez3SjtQ5My4vlegY/xUX/js0iSI1rg8vNuR0sGgh0TXddp9FBLx0ZZIZ6Las
         lmfI0mm4tGMhyTKd2Fz68mcS29dNBKTFsRVQSUV5HKW90Ey9XMExnDfWU7Vc6PY9dDu+
         yqlmyaD4aVethUAJUu8/MjYPh1xPZK090T9tFGSyuCiWXveCdEy763/K4HYph/YlntTq
         p50aNtLgseeMZrVh64Vhy3nWWJRrbFBngr5Pff0HLiFSbRPcLF7RxI+Fc0s094MTtF9K
         99q9pf3IftyErYV18WY9Aawz+xRleeGu2cBd1VlC0QM7q9ZWBW4gnpXNr8FrZ99JahaJ
         j/Vg==
X-Forwarded-Encrypted: i=1; AKwUvBw7vzqm6dAjhbae631MBlPmHHMFoytmDgnrQnjEV89y3l6wJyNTbhJ1sndmWTu0DLr1VFRRwDK+CHskGbokgoqHLw==@vger.kernel.org
X-Gm-Message-State: AFuF++lADVpJGypYirijaQIanjVNpfAlZ4J8lhCMHMZ+RRPhGAaFpviM
	oK1eqLEpwOW03WVIaIvjxi+58ntQ4hMS5a/yaDBuD0Xhf6OBH7d0OsVM7aLBKQVnRbU=
X-Gm-Gg: AYBFou1o+e1wNQDvzSDcM34ppyWVLHvAa8chUMnI0BaUwP8XtvtnNH3DSxxzAZ6emOR
	HpBm0DZRYZbsXoowAwm9q8GtNtnIEYQ7XYkhNmZ1q3zvp3f/KpF3WO6dTDC/X8b1hAK/+BgHZ6z
	U25KnCq8zZdNNVlZiiLCSRh7Bicm0D8LSWpucszsoz/33NnSg5nMbdwVf+8bWTmlj/Er1JlRPOK
	UYsYLiXNFvxxU2C9Fb1/6D6EHd0HPskAj7raoTw64Zg76cMbPRMvkcpaG8BLKNfbMmD0F6Nmrwe
	WeDpMsOOUni1Ntq0akLh3v5p2w4WkWrYUBNwN69cISnSKvzsrZYoG4dkPj7oQPAM3WhEM9odAwV
	lc3FkO1mIPbop/azwh6f5oE3CAOrgjtG4icsvudLx2Cr+NUH3M2/zMTWhu4wVdoY8wMo5c5gakf
	ZrvbBaUqKEbH2WNhU8EM9rOfAhmW0Ip5Aci80H2y8uZig3eVa2vab5X4uM18Px/XoMEKLI90JTL
	xLo8r4JkKfM8cqm4gIlSh3Vxgnq3KOFtmyG04UszA==
X-Received: by 2002:a05:6123:2c9:b0:5c3:b805:1106 with SMTP id 71dfb90a1353d-5c7ed05c324mr13670572e0c.0.1788869822860;
        Tue, 08 Sep 2026 05:17:02 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec35d85fsm9906681e0c.12.2026.09.08.05.17.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 05:17:02 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c79c9f7b54so2367304e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 08 Sep 2026 05:17:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXBaAzOYlEiTPQ4oR0NnMuC8IHPKhXBc5zuqR7oZ8gMxyi8NKFPn3wS8Bi8OJCG2fT6maCrS+HbvuFfesI7xhYTQ==@vger.kernel.org
X-Received: by 2002:a05:6122:4698:b0:5bf:4522:fca7 with SMTP id
 71dfb90a1353d-5c7ed3b2275mr10642726e0c.4.1788869822558; Tue, 08 Sep 2026
 05:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-rcar-du-dsc-v6-0-f8ef711a7494@ideasonboard.com> <20260907-rcar-du-dsc-v6-5-f8ef711a7494@ideasonboard.com>
In-Reply-To: <20260907-rcar-du-dsc-v6-5-f8ef711a7494@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 14:16:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpLrjtUh5pGP9ys_PSFt10vKdQCyo3UGaedcwaf8UEww@mail.gmail.com>
X-Gm-Features: AcwNN1XnePIl5mdE7u2itKH3ZKW58ZQZ46L6E5RD6lZgFL-MnDqW0nO0uTjSR8c
Message-ID: <CAMuHMdUpLrjtUh5pGP9ys_PSFt10vKdQCyo3UGaedcwaf8UEww@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] arm64: dts: renesas: sparrow-hawk: Enable
 DisplayPort by adding DSC
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

On Mon, 7 Sept 2026 at 11:30, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> DisplayPort on the Sparrow Hawk board uses sn65dsi86 bridge, which in
> turn gets the video stream from the SoC's DSI1 port. DSI1 pipeline has a
> DSC block in between the DU and the DSI1. However, there was no DSC
> driver in Linux and also the DSC was not defined in the dts files, and
> thus the DisplayPort output did not work.
>
> Now that we have DSC defined in the SoC dts file (r8a779g0.dtsi), we can
> enable DSC for sparrowhawk.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: separated the sparrow hawk changes from the soc changes]
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, pending acceptance of the
DSC DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
