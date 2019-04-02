Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3897CC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:51:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0815620883
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 14:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732200AbfDBOvj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 10:51:39 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:43780 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726458AbfDBOvj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 10:51:39 -0400
Received: by mail-vs1-f66.google.com with SMTP id i207so7926448vsd.10;
        Tue, 02 Apr 2019 07:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xRaVu1OQJTiVamt2mNl3zMaNLk/eantMHQIaK+nzywQ=;
        b=bHSjOPMuxDlYgfu8mlrGZAdzI+yBAwoEJITzzdnGmg7f+CpRNZyHEuxXLssYv1+fVn
         lcWlICi3NB8lkT+etihNQtqdIrorM6MJUIPxPNaWrJZg0WLrOuu5MwtEzKPfO+tXudxq
         WM2Q8U3ewmmrO5s/XYDElG/3Zfxu7HcZdD66lbexHxQGS1Zax/s8Cpr2l+snqfbxUfNO
         hmvzU1RSxxJKkpXqYFSt9iq+MBpogBztXRFstd8diwqH5dgf5CuSNiuR63hTdWdHeVQP
         c4HMdNyNxZsAotYnsPr4wnvd2EHmH6IUl0JhiKeH+DJCVVgU+/noIOHhMmCU9NWPcIqt
         fFEw==
X-Gm-Message-State: APjAAAV/0ZusUNHCTmW/ouVNhynmQ89AanJ9RcAX5FYK/IlgUhHxj5Q2
        ZspvR4vpLqgEpf5cecjdn1QX+Z6F3uCqcUtgxiI=
X-Google-Smtp-Source: APXvYqz0MLszFdnAFXRYBSS15gf8FQhuUU3479xP4sEulZ2MannQcFhHDQQ8TV/E4/Al+5HcyXfLE5dyK+7yABAa258=
X-Received: by 2002:a67:ec8a:: with SMTP id h10mr19898864vsp.126.1554216698487;
 Tue, 02 Apr 2019 07:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190402144023.27422-1-geert+renesas@glider.be> <20190402144753.GC5389@kunai>
In-Reply-To: <20190402144753.GC5389@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 2 Apr 2019 16:51:26 +0200
Message-ID: <CAMuHMdWBysr7uBv=U8WoLmT=2XYJQf=JKJwiR6n27JAx+m8gEQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] spi: sh-msiof: Add reset of registers before
 starting transfer
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-spi <linux-spi@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Apr 2, 2019 at 4:47 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> >   - New patches 1 and 2, in response to review comments on v1
> >     (although sh_msiof_modify_ctr_wait() didn't turn out to be suitable
> >     for calling by sh_msiof_spi_reset_regs()),
>
> Well, the overhead of readl_poll_timeout_atomic() is low enough to
> ignore reusing sh_msiof_modify_ctr_wait IMO. Thanks for doing it!

sh_msiof_modify_ctr_wait() cannot be used because it checks when the
change just made to the register becomes visible (i.e. new state can
be read back).
For reset the check is different: the write sets the bit, the check
must wait until
the hardware has cleared the bit again.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
