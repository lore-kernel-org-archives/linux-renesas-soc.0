Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33756 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752788AbdAZOkE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 09:40:04 -0500
Received: by mail-io0-f194.google.com with SMTP id 101so5087206iom.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 06:40:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170126141656.GD2718@katana>
References: <CAMuHMdVQVX9T7kxo-akbJQdcTwV2hA4188T57KBMGVdCFYw3jA@mail.gmail.com>
 <20170126135453.GB2718@katana> <20170126140643.GA11104@verge.net.au> <20170126141656.GD2718@katana>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jan 2017 15:40:02 +0100
Message-ID: <CAMuHMdWL0qg2dF0R1Xy6wKSNR9Mk70YMY-4XHpgh_Dgi7vNiFA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Thu, Jan 26, 2017 at 3:16 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> I have tested with "the new mmc/next" and things seem better.
>
> Good. The issue you saw is expected when you have not the enablement
> patches in place.
>
>> I am still of a mind to drop the M3-W patch of this series because unless
>> we can control the order that things are merged into Linus's tree
>> there will be a temporary regression there. Moreover I'm not very excited
>> about renesas-next having regressed.
>
> I have not heard of a regression. Geert, did you report that? Did I miss
> that? As you can see, I did test the patches with M3 as well:
>
> http://elinux.org/Tests:eMMC-HS
>
> and Jinso test team (Duc-san) confirmed it works for them with H3 and
> M3-W. In private communication, though.

The issue happened with renesas-devel, i.e. without those patches.
It was mentioned during last core meeting, so have a look at that log.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
