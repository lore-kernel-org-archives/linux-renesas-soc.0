Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65044C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 09:44:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 350FE20820
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 09:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730819AbfDDJog (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 05:44:36 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:38878 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730482AbfDDJof (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 05:44:35 -0400
Received: by mail-vs1-f67.google.com with SMTP id s2so967950vsi.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Apr 2019 02:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hy8/xRxZJ1ei/wffY6G0H/arsnesF1k/OfBCvbpkrWI=;
        b=qVBFhCttP9QJkL1h3WF2M36pnHVqvBKI1VHG7Hc/3Mboz3PQ93yg2p5Z9YZQ0iBizN
         U2H54oqnKQE1PRhF3SmAQZYl0X489+avCiIGkJyE9235mf1gjLg/y8+1OkW++6uDDKaC
         7i/tM4j7H8h5na3zaGKjwfpN+0iS6KuPshLYk5ylJv8Y4aRdr7LIpiEz33pxSf7GcvKr
         XVoQTTaXxjPx3civVYn9WFvVaRpKieMGgkaTGCSIVvWfrZI0J0XKQSnY87hQnLHXwP7P
         A2dHzjq7nX9aj4W3qJC2mt+FITzggbMrbHtXD35MUH+lvxE1ly6qxnH45lS6lJe70WV7
         1MVw==
X-Gm-Message-State: APjAAAVr0N1nBjnsJ3Cnw6Osb5PeKvDiTSguUd9OSD3xcDZTIw31EwuY
        pQqE8Zbm9affGdu5sceAQWrJGFVpqCf3qLOIuwQnR51s
X-Google-Smtp-Source: APXvYqwTVmBekEQgHS/s8APXajcgQ8l6HblyEwqX6qZAxA9rW2+ob4sznWtNsJO3c7qePOCy5Lvy4QIpTSYSIqsC5ds=
X-Received: by 2002:a67:fbcc:: with SMTP id o12mr3560031vsr.60.1554371074810;
 Thu, 04 Apr 2019 02:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <1554302716-14750-1-git-send-email-uli+renesas@fpond.eu> <1554302716-14750-2-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1554302716-14750-2-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 4 Apr 2019 11:44:23 +0200
Message-ID: <CAMuHMdWL+0UYJzpqN84VXWDuFwY+pPRHjHd5Saq-2hvBeqngAQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Remove placeholder I2C pin data
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 3, 2019 at 4:45 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Pin data for I2C controllers 0, 3 and 5 is properly defined already.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. queuing in sh-pfc-for-v5.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
