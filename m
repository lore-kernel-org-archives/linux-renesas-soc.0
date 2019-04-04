Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2D5C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 09:46:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17AFB206B7
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 09:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731520AbfDDJpv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 05:45:51 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:38520 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731119AbfDDJpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 05:45:51 -0400
Received: by mail-ua1-f66.google.com with SMTP id t15so674518uao.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Apr 2019 02:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5B6AziMe15QouknPhYxKYiK4mUYb2LkgICfHIK9OrWg=;
        b=is8NgNQgXdZ68JpgmLKLbw2cgFmLhRfIeDRV0uZs+6h/Tp6I8kHf9pgTbiWIdYn3u7
         Ywq+N+qZZdsfeXObKHoayAlam/njCnyVYRiXqW4CgQhEBTq2fWKQgUO3RoGhRlb48vHW
         mVU0nJR+u19iotXcjPb5HjEKAhwDDokTZTNYiKs/OVDK+BjZXY0tJP5Az2oy5skdiT8F
         ayRB4GpyAZAURI2ZVBNdvHSQQxq9lYfmR/l5XoYCUyeD67GuhrLR9XHPbjF6S8Cc7qsp
         clOWT3/zZVJ9S5Q7AK8V+rJGASseG8cwQfECHIWAa3BBN8nLXsAZbaP3qfkoWma9iLvF
         ucFA==
X-Gm-Message-State: APjAAAWKYYrZ7NmJcXGbhvEc7UNQNrfGkk8c20qb2NRBUN/meO+3EcDf
        KV5qcXpn9nk4lJS4seqtpGETottkJrEjJgnv+k/E1N3v
X-Google-Smtp-Source: APXvYqzZj6s9ipf3j72LDO8lwhlHYTR4gY9dq0ecNrca4Gm8OV5sYzAISQrKfMsEX33RRmjnmD8E/7sutdrKqryvDME=
X-Received: by 2002:ab0:2341:: with SMTP id h1mr3067446uao.127.1554371149783;
 Thu, 04 Apr 2019 02:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <1554302716-14750-1-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1554302716-14750-1-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 4 Apr 2019 11:45:37 +0200
Message-ID: <CAMuHMdW=LtfPuBP-frp5LcP0rjBDzxE8H7eE18uOzEn3xc-h5w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a77965: Add I2C{0,3,5} pins, groups
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Wed, Apr 3, 2019 at 4:45 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds I2C{0,3,5} pins, groups and functions to the R8A7796 SoC.
>
> These pins are physically muxed with other pins. Therefore, setup of
> MOD_SEL is needed for exclusive control with other pins.
>
> [takeshi.kihara.df: add blank lines after function declarations]
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [uli: use standard macros PINMUX_IPSR_PHYS and PINMUX_IPSR_PHYS_MSEL]
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> ---
> This revision has been rebased and removes the placeholder pin data.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. queuing in sh-pfc-for-v5.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
