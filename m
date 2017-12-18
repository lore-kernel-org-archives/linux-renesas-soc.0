Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:42809 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759441AbdLRNB0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Dec 2017 08:01:26 -0500
Received: by mail-it0-f43.google.com with SMTP id p139so28260108itb.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Dec 2017 05:01:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171218000021.16655-1-wsa+renesas@sang-engineering.com>
References: <20171218000021.16655-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 Dec 2017 14:01:24 +0100
Message-ID: <CAPDyKFr5A7Qma_Ef5JMjvG1f_Er+f9K-tnj39_q0Wg2aQ7nY5w@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: tmio: use ioread* for repeated access to a register
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 18 December 2017 at 01:00, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Not all archs define reads* and writes*. Switch to ioread*_rep and
> friends which is defined everywhere, so we can enable COMPILE_TEST after
> that.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for next!

I put the patch in front of Yamada-san's patch that made it possible
to use COMPILE_TEST. Thus avoiding breaking bisecting.

> ---
>
> So, I pushed this to buildbot on top of Yamada-san's patch series and there
> were no complaints, even with COMPILE_TEST enabled. I also did some tests on
> HW and checksuming huge files on SD cards still works.
>
> However, I am not sure about this mixture of read* and ioread* functions. Shall
> we convert maybe all of those?

Yes, seems like a good idea.

[...]

Kind regards
Uffe
