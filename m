Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AA9C1B0D8
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Dec 2020 12:50:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7689723F2A
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Dec 2020 12:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405906AbgLKMto (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Dec 2020 07:49:44 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41263 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436548AbgLKMtd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:49:33 -0500
Received: by mail-ot1-f65.google.com with SMTP id x13so8077793oto.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Dec 2020 04:49:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XODk7vx/kezVA+uqz3mqm8tv6+XzVcvTimopyR1Prng=;
        b=UqPm+4Hj2Tzp7VKpznbQQOyrSAjR5xoAK0bcV9vSshvWvyJkpOzcr70Gm++qYv5QsD
         Qp6Zzi6hrFkdHiLmMiWdWvFXYuwqBNwageXMXKIE6dT4VhWnHxuL6a3T6D9h2n47lBBn
         8UIlfOkfzTUQTTz2zt8sUnX2pChESOrQZHH+XctdM54n1eKSzHHdXvSuwB8KZid2ep3u
         3FW1TAfY359xszN/nYb6aEmwXweR1lmAPTYK9bTog/DIn/yvEstOcl8Atx0eE6En21Ms
         3w30AfGLBElHAye8eEpMEDfNzfM0ScDx7eSUTRBT5cO/oMWoblX7AQwvoxIfNrTXB505
         1MbQ==
X-Gm-Message-State: AOAM532QXVwfWm6YCkw8GX+4tJUhY1sI6yzwY2o+/UqvPm0hMBQT+a1t
        JgJUsCO54CQ86LEfmA2Q6oy73EuAWApzVxtYoBnta99W8Ns=
X-Google-Smtp-Source: ABdhPJwBBlfTZ1UEbXzXQ+72kaFaol+fBwUuLj1Xxgx8PA1n8l7ykFJccTpeBEyFl6u3EWkptYxxcfIBYIvgyjKw0O4=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr9686705oth.250.1607690931393;
 Fri, 11 Dec 2020 04:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20201210142021.163182-1-julien.massot@iot.bzh> <20201210142021.163182-2-julien.massot@iot.bzh>
In-Reply-To: <20201210142021.163182-2-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:48:40 +0100
Message-ID: <CAMuHMdWM6MzmOaS-VAmzgsFwOTrtePDLJ_NK0JL=_snVjQxvdg@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r8a7795: Add MFIS clock
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 10, 2020 at 3:55 PM Julien Massot <julien.massot@iot.bzh> wrote:
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
