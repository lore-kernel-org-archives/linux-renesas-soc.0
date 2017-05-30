Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:34502 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750965AbdE3J0i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2017 05:26:38 -0400
Received: by mail-qt0-f178.google.com with SMTP id c13so65495197qtc.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2017 02:26:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170530071609.p4wrpqywrfllgy4z@dell>
References: <20170528093051.11816-1-wsa+renesas@sang-engineering.com>
 <20170528093051.11816-5-wsa+renesas@sang-engineering.com> <CAPDyKFoyer03ukhHEGBsQ+Ua639E4dvPp_RJCmYW1Ymap90Pnw@mail.gmail.com>
 <20170530071609.p4wrpqywrfllgy4z@dell>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 May 2017 11:26:37 +0200
Message-ID: <CAPDyKFox8n3AHUtswLYjyPcTqbxEYiQTDdX6udvWEhx5D+wNNg@mail.gmail.com>
Subject: Re: [PATCH 4/7] mmc: use proper name for the R-Car SoC
To: Lee Jones <lee.jones@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30 May 2017 at 09:16, Lee Jones <lee.jones@linaro.org> wrote:
> On Mon, 29 May 2017, Ulf Hansson wrote:
>
>> On 28 May 2017 at 11:30, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
>> > It is 'R-Car', not 'RCar'. No code or binding changes, only descriptive text.
>> >
>> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>> Thanks, applied for next!
>>
>> For mfd, Lee, please tell if you have any issues me picking this via
>> my mmc tree.
>
> I don't, but it is normal procedure to wait for an Ack from all
> Maintainers involved before applying. ;)

Yeah! However this was that trivial so I went ahead. :-)

Kind regards
Uffe
