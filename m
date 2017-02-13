Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35313 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751878AbdBMPB4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2017 10:01:56 -0500
Received: by mail-it0-f68.google.com with SMTP id 203so13902882ith.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2017 07:01:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpvm9ODxBxEM8+8jHJUMJ03--SUCXnDUrq7dfHxOMuMUw@mail.gmail.com>
References: <20170212112740.4dq5uqkmgeodmbsy@ninjato> <CAMuHMdWWDxznf-ZWYL3qxqXV7LwC-y+yRcQWrdq8TSwGqvc=aw@mail.gmail.com>
 <CAPDyKFpvm9ODxBxEM8+8jHJUMJ03--SUCXnDUrq7dfHxOMuMUw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Feb 2017 16:01:54 +0100
Message-ID: <CAMuHMdU6Xe6MTqYdkW9skaoEkOvMk=N487moKSNu32VrpnvneQ@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/sdhi-autocmd12-resp for renesas drivers
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulf,

On Mon, Feb 13, 2017 at 3:33 PM, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On 13 February 2017 at 11:04, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> Hi Wolfram,
>>
>> On Sun, Feb 12, 2017 at 12:27 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>>> here is a topic branch for renesas-drivers to report back autocmd12
>>> responses for SDHI. It is based on mmc/next. Please pull.
>>>
>>> Kind regards,
>>>
>>>    Wolfram
>
> Hi Wolfram,
>
> I don't get it, why did you send this pull request to Geert and not me?
>
> I rather pick all mmc changes via my mmc tree, to avoid conflicts etc
> - unless there are some specific reasons to not. Are there?

Sorry for confusing you. Wolfram sent a pull request to me, as I maintain the
renesas-drivers tree, which is an integration tree for kernel work related to
Renesas SoCs. It was not intended to be pulled by you as-is.

I've just put you in CC because of your rebasing activity.

I hope this makes it clearer.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
