Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F59C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:12:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 289F72133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733239AbeLQOMl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:12:41 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:42864 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726965AbeLQOMl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:12:41 -0500
Received: by mail-ua1-f67.google.com with SMTP id d21so4454846uap.9;
        Mon, 17 Dec 2018 06:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lfj1z/roYN5cAbBocFLNtuKbHWy/egNRmDdAyCjMc0A=;
        b=ohzr6M8cAM6cxJSQ8w08n+6wLxgcr3BWcGGP5P9ifIai94T0g3W7wscqkhaiwnmj8b
         gWip4duInJX3BDCYfMvG0hBWn2zPhMn2qcbJAtVDmJqx4bPUguNQlvONOXlvsmdqaTV/
         7b8Z+HpxZKC8Msi1dRFs8Hg4uQ57G3tPHzzGcbzKtMXZIzaJOq0cGUxGluyqyTvSRVLK
         BINOp1ySr+MB+ihd8BZh0SrYLAGq69rMLXNuYhoUP2n2CC+dnv7U2/rk8FJznKun6DCI
         xtUNzR0HDE+pqX+kGjiOxifm1wMJdqPLQ4/bf3FG+1CN/Ru6qoyn9I+k/mrfEMb/4MOt
         IG/g==
X-Gm-Message-State: AA+aEWbQuXhlY5UOx8aZeg0DvApC6/wQmCVlC49aNm9rQVjH81A9haBf
        tJ7nxM+IvbwM4fBhhPTVQXFLe/ev+Cg8IaUjRm4=
X-Google-Smtp-Source: AFSGD/X8TaGmsl+NONZ1Q6OhnfIs4Hjw8+qeyVw5VNO0WhC6Zm7o8bi6mJLYD5/7dZfvS4pYSUmvqkYzekt3jHppd5Q=
X-Received: by 2002:a9f:364a:: with SMTP id s10mr5828364uad.78.1545055960151;
 Mon, 17 Dec 2018 06:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-7-geert+renesas@glider.be> <20181217140723.l76nsznmu7exzqha@verge.net.au>
In-Reply-To: <20181217140723.l76nsznmu7exzqha@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Dec 2018 15:12:27 +0100
Message-ID: <CAMuHMdUjvVUd52hco_kmNVs2hscfr4vXhd1rZvSegGz7kTYCTg@mail.gmail.com>
Subject: Re: [PATCH 06/15] pinctrl: sh-pfc: r8a77995: Remove bogus
 SEL_PWM[0-3]_3 configurations
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Dec 17, 2018 at 3:07 PM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Dec 13, 2018 at 07:27:05PM +0100, Geert Uytterhoeven wrote:
> > While the SEL_PWM[0-3] fields in the Module Select Register 0 support 4
>
> s/support/supports

"fields" is plural, hence "support".

> > possible configurations per PWM pin, only the first 3 are valid.
> >
> > Replace the invalid and unused configurations for SEL_PWM[0-3]_3 by
> > dummies.
> >
> > Fixes: 794a6711764658a1 ("pinctrl: sh-pfc: Initial R8A77995 PFC support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
