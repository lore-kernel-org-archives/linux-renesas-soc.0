Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9796353A6D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 08:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510129; cv=none; b=BAAXMuopXrIk7/OW2dUBASPI9Pkzp3+hHNz5E//HtRKoz5Aj2G73plTYwf014eHvMOcOP6WyaWqVExncN0p+VvyVW4X3BKGAdmrd4SMUCxH+2Ze5wqTNux1AdXeUriXMnuOP8uD1uiG7PEqs2VNszTxctFHGCx44+i0GBi4FnwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510129; c=relaxed/simple;
	bh=oyDxmpF/0rXv8EzH2b2HV9ktlFAjPfgd1vY1EFEf3Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+11MSzpsKfE4mXgekyVwBfkfn9ZoscT/IZ+roUT8qieUpcGcerSD8abRMM7wRqNea37vyPcviU0/BbPGeIbbkAA9zw8K72FB287Gdo/St2RREVBuU+Gi+MLqELZG2632Vz84RYopJQPfu6+85YLgea++N8jp8u9OGQTlqb9mJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f48c750afcso644085a34.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 01:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510126; x=1789114926;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Hg5enr8UVGmoY4IFaKJm1CFD+8hJCgKWPLT+95rrjA=;
        b=gWkr9eM4YvOm1XZhov2Jvuyf80voqiI9hR1hHcle8v9wZzNVqXyAE5AwSarqeVS87Q
         lR6O3o2zarRLA27BzOXhfyBhA3YqLCsVdKIInC3LdiemY+KEDgv/XOqkFT1ubwnT+j/e
         IzjZdZeGHnv/g5Z4DwiykIgVQBNmFngXgmLWGur+YQNWlGe7FCziLW3VA4W7e+lulZqt
         u7TrD9u7XTTmxzxegkPiOoIN8M5leygnOlRbf5UYA/dwXNbDesaUj1vOCtDJ8PZFfasm
         jlCPk/aazitnSoGL6rWZ3Da5bLZMDmM1iFlgsUjv+s/FnXyqh7R0ywHs9v98zLXJwmeq
         d67g==
X-Forwarded-Encrypted: i=1; AKwUvByLbpKoJad4Xw8AIrZ0LJ4qBBjqmECLB+Se2bzK4YGsgfAYDkTDKhwjS39K2ubuWAGtlYEMynRocreGiIYc1p+YZg==@vger.kernel.org
X-Gm-Message-State: AFuF++m8jil69IZuwton58/cw94bHEyb3DEY0cwiZiHpBe+Du8rcMSOo
	MGX0e77Ku87VXjZmi3dY397lFCSwMvzYzK990lrTmCA2nSZiHCgQCXXybImSspvzQqM=
X-Gm-Gg: AYBFou0nw1ApdB7lWlT8jejt32FzC78YZfALEGOqL8kdhYXARcVqa0hkyHpcRA6gREg
	b4yWyoGjXLNDt0KKmrXrb+eIhBHR9ACsshv5dPqoEHLTV26XcEBLFAcN5+nxQxPb3oI0NmL/FMG
	LX5cE6nUTGUnqmO+XGtGysM6jZOpsqicTAOgQMRcta7P/u1q2zd180K6e30w8g/2cBbEO6CEauY
	QZxJFSTwRC1OZBvflQNlM/s+RKVkcGSrBOS3iU4+T4crgNMpTrvcQD14lYlfLKLr7jwDueYElDJ
	TcP85iKi2wal5SvTM0RGMS119BYOya3bwb9tsKurOStaESHxnXWzRsx7xtBeSQC+Ff72VGNtU0/
	XHEIPi7XFyxhlm8qTWae6Jlv6xZ4Z/rHiME8IkiSvcImzuL24tnuLYr/Vtw19Uj6FZ2AxYmGQxs
	CxjEs+RpN8P4D5sK25zlu/aNBMMoNGUzF59PLAMIJEDdS0dZddn+ONl7W0yhAfZaq+b8lAvGeD7
	7lq/uzx0yx/x5oaVziQ2Ek0MeJOUelMpn9PNF8Y
X-Received: by 2002:a05:6830:412a:b0:7e9:e85d:2f7f with SMTP id 46e09a7af769-7fa203b77d4mr4038789a34.14.1788510126079;
        Fri, 04 Sep 2026 01:22:06 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f72d437esm2335597a34.17.2026.09.04.01.22.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:22:05 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-495c49f8eccso711626b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 01:22:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDdasbSWfU1PlMMJD4F2hhHReVe5OaeFiobsWcBujkaC2VWXpYlmuHgcsFuW7ip5FdSTplWRbrQ9VHxeiy/7Yoyg==@vger.kernel.org
X-Received: by 2002:a05:6102:534e:b0:77f:fb50:8822 with SMTP id
 ada2fe7eead31-78a4a9106f4mr984477137.7.1788509665014; Fri, 04 Sep 2026
 01:14:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-23-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-23-s-vadapalli@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 10:14:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXHwWKu_oqNQBR=hytL0JQVzMsnVWyBueds5PHDJWmWg@mail.gmail.com>
X-Gm-Features: AcwNN1UYeUOEoTpTj0vmkU4IKRIpHFGa-g95RrL_FdgZr5R39yo0yU6G4UOZ8vE
Message-ID: <CAMuHMdVXHwWKu_oqNQBR=hytL0JQVzMsnVWyBueds5PHDJWmWg@mail.gmail.com>
Subject: Re: [PATCH net-next 22/33] net: dsa: rzn1_a5psw: Remove comma after
 sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, 
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com, 
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kurt@linutronix.de, hauke@hauke-m.de, chester.a.unal@arinc9.com, 
	daniel@makrotopia.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	linusw@kernel.org, luizluca@gmail.com, alvin.sipraga@analog.com, 
	clement.leger@bootlin.com, justin.chen@broadcom.com, dlan@kernel.org, 
	rogerq@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, opendmb@gmail.com, 
	andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, amadeus@jmu.edu.cn, 
	kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, horms@kernel.org, 
	vadim.fedorenko@linux.dev, daniel.zahka@gmail.com, 
	nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com, 
	haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com, 
	lgs201920130244@gmail.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 06:41, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
