Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:26875 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725736AbeHUGQB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 02:16:01 -0400
MIME-Version: 1.0
In-Reply-To: <20180820190709.qilhem7bjqnvgtt2@ninjato>
References: <1534403799-10594-1-git-send-email-yamada.masahiro@socionext.com> <20180820190709.qilhem7bjqnvgtt2@ninjato>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 21 Aug 2018 11:57:00 +0900
Message-ID: <CAK7LNARxJro1wL5RJ92XFykSfcC0jdgr+xvvqgLTtE=VBARekg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] mmc: tmio: refactor TMIO core a bit and add
 UniPhier SD/eMMC controller support
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,


2018-08-21 4:07 GMT+09:00 Wolfram Sang <wsa@the-dreams.de>:
>
> So, today I did test these patches successfully on a Gen3 board (M3-N)
> and reviewed half of the patches. I will continue tomorrow with
> reviewing and testing more boards.
>
> In a nutshell, things look good so far.
>


Thanks for the review!

But, this version is not applicable to Linus' tree
due to commit db924bba47c80.

Resolving the conflict is not trivial.


I will rebase and send v3,
but I do not understand the quirks
Renesas is adding to the TMIO core code.


-- 
Best Regards
Masahiro Yamada
