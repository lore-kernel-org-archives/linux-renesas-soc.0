Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io1-f65.google.com ([209.85.166.65]:44772 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729208AbeKSXdG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 18:33:06 -0500
Received: by mail-io1-f65.google.com with SMTP id r200so16651925iod.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Nov 2018 05:09:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20181119121411.dqoxwuweqhhjpaqj@ninjato>
References: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
 <CAPDyKFoRDvGht0GB-QJHcOAQzU8rZ0G-af+OeyuSyP+GufsQMA@mail.gmail.com> <20181119121411.dqoxwuweqhhjpaqj@ninjato>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 Nov 2018 14:08:50 +0100
Message-ID: <CAPDyKFrQ4+Y1bjQ=Gng8GJhzz2dnm9SUD-LkJuVQXPBug+VHeg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] mmc: tmio: fix reset operation
To: Wolfram Sang <wsa@the-dreams.de>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 19 November 2018 at 13:14, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> I noticed there were a minor comment from Yamada-san, however I
>> decided to pick this as is and leave further improvements to be made
>> on top.
>
> Can I vote for waiting until Niklas comes back from Plumbers and have a
> proper V2 applied instead? Makes backporting easier.
>

Sure, no problem. I drop this and the other series then.

Kind regards
Uffe
