Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw1-f66.google.com ([209.85.161.66]:41477 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbeKZJDo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 04:03:44 -0500
MIME-Version: 1.0
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFotAvkLzpAeDvvv0GB=_nJsJPkRbRc657=o3ftoxdXZDA@mail.gmail.com>
 <20181121023540.GB2445@kunai> <CAJiuCcf1Fq2jmvfzer9hX14pTpuuL+TcmweYGnC6YHCXbR51jw@mail.gmail.com>
 <CAJiuCcfWVvYkYGmekzFY4KR33qGkghpdEt6YAnDYoaN3JOowUg@mail.gmail.com> <20181124213704.GA1044@kunai>
In-Reply-To: <20181124213704.GA1044@kunai>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 25 Nov 2018 23:11:25 +0100
Message-ID: <CAJiuCcdLwC7OBLK5hEm6d07QkO6Z4Z_kOm70vXT8bZKs6QfXWQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] mmc: refactor RPMB block count handling
To: wsa@the-dreams.de
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Avri Altman <avri.altman@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, 24 Nov 2018 at 22:37, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > Tested fine with SDHCI Iproc controller on 4.9.137 and 4.19.2 with
> > Auto-CMD12 enable.
> > But there is something, it's not working not introduce with this patch on 4.14
>
> I didn't get the last sentence. Could you explain in more detail?

Just want to point that RPMB with Iproc controller don't work on 4.14
but it's not due to your patch.

But it's fix the issue on 4.9 and 4.19.

Regards,
Clement
