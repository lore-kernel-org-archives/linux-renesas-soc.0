Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E75C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 08:04:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C023920643
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 08:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfCRIER (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 04:04:17 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:39716 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbfCRIER (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 04:04:17 -0400
Received: by mail-vs1-f66.google.com with SMTP id g127so1823329vsd.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Mar 2019 01:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H/2q3rPaU4SLqo3DbBh+kISYp+Y0KRB7bfSiEqgPEro=;
        b=A5tNSWatMup5+gmhFYS/zUab3OBVWYfMAyfxfdXT7cY45ge2XLHaJLWH5SWtbaUr7N
         art/J2pxdl1e+vE3NRhcCmrP4iFLLZef3Q7OCqimQG2k4mB+8V8DqPecN7W/Vqdl5+eH
         yFIklW5cTbWJcxrm4rLWNBNNUl0jwxQkXPx+Bwr5gh4HkvV8bVo6E7lztz/ciFZAuVwo
         okbA4PMeydK9eJFIloPVek8mrPWqfjUnjj3LQXWVdlkkD+18FExVRrW/s0p/MmAQeX+Y
         bfsQ93AypdAHKsF+lrVuVRNJMBiUM1vVGPgF2RXlpNOccIK57oWve++aRUUetohhS+oQ
         sqtw==
X-Gm-Message-State: APjAAAX8wWhFFajZEugZ+qEX4FGJKyvYasfQVD8SbxmpBxwgMJYHfgvT
        wfGmGSoqDDMvAlSSncyZFIhryy5Tj6tAwbvtDfk=
X-Google-Smtp-Source: APXvYqwoMmHvbttfh6fQtj49BRdjkXeVyX/zMjETH91h/V/dVcGamfLZDIdT6+SiVkTcLvLH5EyR3DedIKBRvnMBMtk=
X-Received: by 2002:a67:f843:: with SMTP id b3mr2885362vsp.152.1552896255914;
 Mon, 18 Mar 2019 01:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <87imwgye1k.wl-kuninori.morimoto.gx@renesas.com> <87ftrkye0f.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ftrkye0f.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Mar 2019 09:04:04 +0100
Message-ID: <CAMuHMdWiCOvToh6gZnfTeiyZbeTmrYcBDve0_L_0s5LkqSDy9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: rsnd: explain extended Audio DMAC peri peri address
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Jiada Wang <jiada_wang@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 18, 2019 at 6:11 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> If SoC has extended Audio DMAC peri peri address,
> DT needs to select it.
> Otherwise, it can select normal Audio DMAC peri peri address.
> Extended Audio DMAC peri peri address can use BUSIF4-7,
> normal address can't.
>
> Reported-by: Jiada Wang <jiada_wang@mentor.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
