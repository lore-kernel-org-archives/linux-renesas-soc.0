Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37689 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751888AbcIIJpl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2016 05:45:41 -0400
Received: by mail-wm0-f53.google.com with SMTP id w12so22801708wmf.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Sep 2016 02:45:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160905081823.GC1601@katana>
References: <20160824093438.2478-1-wsa+renesas@sang-engineering.com>
 <20160824093438.2478-3-wsa+renesas@sang-engineering.com> <CANqRtoTJWN52roRwJHh1cZrb2Jqf5OD-ffjKgiW4Y5jqCeVzhg@mail.gmail.com>
 <20160902052258.GA1601@katana> <CAPDyKFpVtYtL97YQskPazJPQSHkVuF5BEaaGH_HE=xfkYUq=Rg@mail.gmail.com>
 <20160905081823.GC1601@katana>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 9 Sep 2016 11:45:38 +0200
Message-ID: <CAPDyKFp5C_utY_MhVMB_fyM0QnA0Xns9_+qw5CWC3dQ-c24vug@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: host: sh_mobile_sdhi: don't populate unneeded functions
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 5 September 2016 at 10:18, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> > It can be argued that this tag could be added:
>> >
>> > Fixes: 452e5eef6d311e ("mmc: tmio: Add UHS-I mode support")
>> >
>> > I don't know how well it applies, though, because the code has been
>> > modified a lot recently. But we can try.
>>
>> Please tell me if you would like me to drop any of the changes I
>> queued up in this series.
>>
>> Of course, I can also amend the change log, just tell me.
>
> If you could add the Fixes: tag, this would be welcome. Thanks, Ulf!
>

Thanks, done!

Kind regards
Uffe
