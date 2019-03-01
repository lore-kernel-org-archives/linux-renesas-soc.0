Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC212C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 10:37:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A22F20851
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 10:37:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbfCAKhq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 05:37:46 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:38349 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbfCAKhq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 05:37:46 -0500
Received: by mail-ua1-f66.google.com with SMTP id d4so10883032uap.5;
        Fri, 01 Mar 2019 02:37:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/+0DJ7N6P9vMuQi9yMilgIwoSZ6LBL6tH/qVfiC2TM8=;
        b=me4MjRNzF2bdw6rRuxxGXX6HGd+2sSthR5ezmtKZMg3JsKvtmQJvMMPzNHjWEqL+JB
         jSv70cntCnysfSyC//4rPI21oz9n5bvqknSfd0qh6laGosYaXjYviUDZbbNpriAl4DrB
         rSY1R/a+XBc3wOjkc03qnRmGpemyXgs1cOXeEISbKrLK1wg3IoTrLulqDDMBbs0Oh8QU
         bSyoUXTe9Nbz8Lp5s2J/NbxN/9f61BMYqyujmRPS9f914TCkUxK2jP4owSfp2pNDC7pV
         5t/h2URWLIuZXpe73mtQooP+/D+RtF8O2+H2WiGWHTu/kUwzLpNVjJjeEdX80IOf6LXX
         mxoQ==
X-Gm-Message-State: APjAAAWYmR60jhSWyNNahlv1mGbhAzuvp3rvzaHZNKLxNN7pF14sNPgH
        zZ3mSjEZYTbJWYsffnDUWyTWknShNPHIUe1RnJw=
X-Google-Smtp-Source: APXvYqxhdDesU1y/mLS2TxexApIPQpAQqATcTlZQkMNVimcjcYCbWXXU6x6EYrm3fdgHmrsHx13LEBxtkWXp1nEtZmU=
X-Received: by 2002:a67:8588:: with SMTP id h130mr2134591vsd.11.1551436665104;
 Fri, 01 Mar 2019 02:37:45 -0800 (PST)
MIME-Version: 1.0
References: <1550678985-1316-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1550678985-1316-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Mar 2019 11:37:32 +0100
Message-ID: <CAMuHMdX3yivFTmr3_Wm4RX1OQc5po9nmHXQwv4RX-S=-VoaDKw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: move CANFD pin groups and functions
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 20, 2019 at 5:10 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> CANFD is found also on the R8A774A1, therefore move CANFD pin
> groups and functions to "common".
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
