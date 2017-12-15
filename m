Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:36164 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755735AbdLONe1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 08:34:27 -0500
Received: by mail-it0-f48.google.com with SMTP id d16so19033613itj.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 05:34:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171215111225.ekrau5e27xknb3jf@ninjato>
References: <1511540697-27387-1-git-send-email-yamada.masahiro@socionext.com>
 <CAPDyKFqE7Pg8fJFyOtihdRnma+dFQd3+YPWGn6pXbpzhpERK9Q@mail.gmail.com>
 <CAK7LNASQfsnQY6henk5RvAysQUh3=cPXV1GPNeWeXgBxZvadAw@mail.gmail.com> <20171215111225.ekrau5e27xknb3jf@ninjato>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 15 Dec 2017 14:34:26 +0100
Message-ID: <CAPDyKFopKm2psU19vGQfGL6WizXQA0vvzQubqsypvytbpRtyAA@mail.gmail.com>
Subject: Re: [PATCH v2 00/22] mmc: tmio: various fixes and cleanups
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <simon.horman@netronome.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 15 December 2017 at 12:12, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> After 2, COMPILE_TEST will work correctly.
>>
>> Then, Wolfram mentioned we would need to include <linux/io.h> from tmio_mmc.h
>>
>> https://patchwork.kernel.org/patch/10074333/
>>
>>
>> I was waiting for a patch from him.
>
> Yes, I am sorry. I am currently swamped with I2C work, not so much time
> for SDHI. However, I did this patch now and pushed the branch out to see
> if buildbot is happy.

Great!

>
> Ulf, this patch then in deed should ideally be applied before 1-8 here.

Okay, once you post it to linux-mmc I will pick it up, and put it in front.

Kind regards
Uffe
