Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f173.google.com ([209.85.223.173]:45780 "EHLO
        mail-io0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752639AbeB0KNO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 05:13:14 -0500
Received: by mail-io0-f173.google.com with SMTP id m22so20598842iob.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2018 02:13:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180227090757.wvm6j4sy5nmeecf3@katana>
References: <20180213123358.13212-1-horms+renesas@verge.net.au>
 <CAPDyKFryhg=5G9G3ss3hFSAuri1-_y0uu7ZK=PNGJ0TF=-__DA@mail.gmail.com> <20180227090757.wvm6j4sy5nmeecf3@katana>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Feb 2018 11:13:13 +0100
Message-ID: <CAPDyKFqMacY1THjO+cTb6Aws3mCnbLogui9T6PjiVcoR89FiLg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] mmc: renesas_sdhi: add eMMC HS400 mode support
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 27 February 2018 at 10:07, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> Is this ready to be queued up for next? It looks good to me.
>
> Ulf, out of your head, do you have an idea why preparing HS400 during
> set_ios works but populating host->ops->prepare_hs400_tuning() does not
> (according to Simon's tests)?

Oh, that sounds weird. Obviously I didn't read the code carefully enough.

Preparing tuning (if needed, as this is optional) needs to be done
prior mmc->ios.timing is set to MMC_TIMING_MMC_HS400, because the
tuning has already been done when we reach that point.

There seems to be something fishy going on here, as there seemed to be
some kind of reset sequence being added and executed as well.

Perhaps someone need to explain in more detail what the HW controller
needs to manage tuning for HS400? I don't like that we may end up
getting it magically to work, then it's we better understand the
details and if the current sequence provided by the mmc core can't
fulfill the need for this case, we may instead consider adding an
additional pre/post host ops.

Hope this helps!

Kind regards
Uffe
