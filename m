Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f171.google.com ([209.85.217.171]:35893 "EHLO
        mail-ua0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751693AbdBMOdz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 09:33:55 -0500
Received: by mail-ua0-f171.google.com with SMTP id 96so66400720uaq.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2017 06:33:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWWDxznf-ZWYL3qxqXV7LwC-y+yRcQWrdq8TSwGqvc=aw@mail.gmail.com>
References: <20170212112740.4dq5uqkmgeodmbsy@ninjato> <CAMuHMdWWDxznf-ZWYL3qxqXV7LwC-y+yRcQWrdq8TSwGqvc=aw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 13 Feb 2017 15:33:54 +0100
Message-ID: <CAPDyKFpvm9ODxBxEM8+8jHJUMJ03--SUCXnDUrq7dfHxOMuMUw@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/sdhi-autocmd12-resp for renesas drivers
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 13 February 2017 at 11:04, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Wolfram,
>
> On Sun, Feb 12, 2017 at 12:27 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> here is a topic branch for renesas-drivers to report back autocmd12
>> responses for SDHI. It is based on mmc/next. Please pull.
>>
>> Kind regards,
>>
>>    Wolfram

Hi Wolfram,

I don't get it, why did you send this pull request to Geert and not me?

I rather pick all mmc changes via my mmc tree, to avoid conflicts etc
- unless there are some specific reasons to not. Are there?

Kind regards
Uffe

>>
>>
>> The following changes since commit 0c3630150c9af658e7375c509c670fadf052cca8:
>>
>>   mmc: core: start to break apart mmc_start_areq() (2017-02-03 10:50:23 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-autocmd12-resp
>>
>> for you to fetch changes up to 22b13c28ac6b92f3acf7a5a91575b9da004c853a:
>>
>>   mmc: host: tmio: fill in response from auto cmd12 (2017-02-07 11:47:26 +0100)
>
> Thank you, scheduled for inclusion in next renesas-drivers release
> (probably renesas-drivers-2017-02-21-v4.10).
>
> BTW, it still merges cleanly into today's linux-next, despite Ulf rebasing
> his mmc/next branch almost on a daily basis.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
