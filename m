Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D13C10F0B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 15:28:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59CD720880
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 15:28:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbfBTP2t (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 10:28:49 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34134 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbfBTP2s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 10:28:48 -0500
Received: by mail-vs1-f68.google.com with SMTP id e10so14202756vsp.1;
        Wed, 20 Feb 2019 07:28:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pZ1u7eACj/FY+2gWRn5pNp3X84LM8EHST706hzAYIro=;
        b=PM4dT49Z4aboB8yck6nO0g1lhiL+2nl5mIEq7GnWOUqGgh/bw9XZLzNrezoH8kM7gS
         l5XOocOuEGobEpOrjyzLgmn6jMue2Gukhn2ttppD2dSorTAxIcKjQzYEtquW18lB/VeU
         D2fb4AZdCPFwIWZjflhS/63+KrmUCKRheGBnmlPn4+1ozFOcs+alqXKlvFLkqTQQyssJ
         0bGJ1sMhYRBZ6SXUWFdzxaFTN0JabEn4hmO031SL66K6Yrk+XOrWMLpjaLbRmNoQfdI3
         I/o7fi1OkxLWVWT6by3SeSSI4wF1Fg3baLkE1rTPMQ7OA3eyUX/L6eKj/qxVlouHpp/g
         SA7Q==
X-Gm-Message-State: AHQUAubR0gd8+PkaUXZZajqqw09KjCWbrSmLMqPCfP9dgcBTsschsElR
        Tg1tBTOpwTa8WE4j//NifOLNQqAWWY8aole9E+M=
X-Google-Smtp-Source: AHgI3IYu8lwfEA/3vfRKC0sE3mj5o4/WjvXhu9Q6d2hoF61XTcvEfu8wBT2h7brBgk5tcz/Bi9w6JNpMe0MTFVi65nE=
X-Received: by 2002:a67:78ce:: with SMTP id t197mr17551596vsc.152.1550676527705;
 Wed, 20 Feb 2019 07:28:47 -0800 (PST)
MIME-Version: 1.0
References: <1550674238-10435-1-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1550674238-10435-1-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Feb 2019 16:28:35 +0100
Message-ID: <CAMuHMdXTc9-v4XcxUVn_2kmWgXfBgVxaYdYxyXyJ_FZP=ad8ng@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7779: add HSCIF0/1 pins
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Wed, Feb 20, 2019 at 3:50 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Adds HSCIF0 and HSCIF1 pins, groups and functions for R8A7779.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This revision should fix the issues found by Geert in v1.
>
> CU
> Uli
>
> Changes in v2:
> - added comments to the pin definitions
> - fixed names of hscif1_clk_b_{pins,mux}
> - added Reviewed-bys

Thanks for the update!
Will queue in sh-pfc-for-v5.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
