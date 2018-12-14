Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453F8C6786C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 09:38:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04EBD20672
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 09:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04EBD20672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbeLNJi4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 04:38:56 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:46379 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbeLNJi4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 04:38:56 -0500
Received: by mail-ua1-f65.google.com with SMTP id v24so1759021uap.13;
        Fri, 14 Dec 2018 01:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cdYTB40LOKAKpXqsapmAITxdRvBck/EgbC9mkOzlrwE=;
        b=or/rAozb8tucS6PCjD86lq7MfK/zXZkUtUFdPQMTQXLlsjnXb6+ojygTklqx/0Hks9
         hlhnwWSXShFZ0tPn2vy3OdK++OI6OCWg5BBigijOUEszv1g6O1Xz0RJSWDy09vDMyEia
         WtwCbOOOZqeixkvmE208mHZ0hotLsCk97oSdd0H71Nc6mo/hm4uBCOTK1uj3lalZZXRo
         +9LAr7VVMgq/4a4zZ++TIOfm2M4W/jmT/hf9wsSfCyll5vK2YiI/3GzLRM5vlIh+FnrZ
         8cK08McBwBqcB+aVJqnz8/8pFB49tJUOB14bjyy4Dgqdg4+eNZwugUZVYyNlRFUf85VU
         08Jw==
X-Gm-Message-State: AA+aEWaM9rZdUeBeTAnoxXnjto2l1isk4y0v302qZdTALxWE0q5RQF+l
        d9iGOg1HL4jdBj3H+CPhorBAV8HOGraWdVXb2zQ=
X-Google-Smtp-Source: AFSGD/Vsj78heE2MDDsmBbL0GYIFaKu/tzUUnhAXnC2x5Ftl5wYmTbEqzh0K+pVa5kG4TFae0npUttKSz/E0o0F67zI=
X-Received: by 2002:ab0:7251:: with SMTP id d17mr1029096uap.0.1544780335103;
 Fri, 14 Dec 2018 01:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-2-geert+renesas@glider.be> <b327b5a0-5d14-447d-629a-a8f89e29dd9c@cogentembedded.com>
In-Reply-To: <b327b5a0-5d14-447d-629a-a8f89e29dd9c@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 14 Dec 2018 10:38:42 +0100
Message-ID: <CAMuHMdWD7c=dvmH+Yaz+ji1YU1LnqbwzvbUVrkAhwDyiJUp=0g@mail.gmail.com>
Subject: Re: [PATCH 01/15] pinctrl: sh-pfc: r8a77994: Remove bogus IPSR9 field
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Fri, Dec 14, 2018 at 9:00 AM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>     like I told you on IRC, the subjects of this and next 2 patches has
> duplicate 9 in the model #s...

Thanks, already fixed locally, as I told you on IRC ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
