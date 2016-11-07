Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33275 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751325AbcKGMTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 07:19:34 -0500
Received: by mail-wm0-f66.google.com with SMTP id u144so16153187wmu.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Nov 2016 04:19:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <58205984.4000708@jinso.co.jp>
References: <57A46D20.7040106@jinso.co.jp> <57C9764F.2070802@jinso.co.jp>
 <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp> <57D66DEC.4090607@jinso.co.jp>
 <CAMuHMdWouXw1Cen8wyoHFHEYQpOvwOg3gLGpA2VtDUerk1iqbg@mail.gmail.com>
 <57ECF4EA.4010704@jinso.co.jp> <CAMuHMdUw_k_SLUO1r5v12Cun40cfJCfA7Em4e-zupEDsxcEdhw@mail.gmail.com>
 <57EE368B.8030500@jinso.co.jp> <CAMuHMdXq6b7_sGT2OXfVYZ+SD=Agr+CfafAp2ztr3rCNE2bocw@mail.gmail.com>
 <57EE38CF.5090903@jinso.co.jp> <CAMuHMdVY41ZNypxUs487jpksdsvhzmfRC8SYVe8RA6TdFbx0VQ@mail.gmail.com>
 <58205984.4000708@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Nov 2016 13:19:32 +0100
Message-ID: <CAMuHMdUOO5ciFfRP=Vy8zeqzC6eXTPeqtrsPbw9HD8DnBsURbA@mail.gmail.com>
Subject: Re: GEN2:Lager: Only 1 core works when turning off the SW8-PIN4
To: Hiep Cao Minh <cm-hiep@jinso.co.jp>
Cc: Xuan Truong Nguyen <nx-truong@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hiep,

On Mon, Nov 7, 2016 at 11:37 AM, Hiep Cao Minh <cm-hiep@jinso.co.jp> wrote:
> On 11/07/2016 06:44 PM, Geert Uytterhoeven wrote:
>> On Fri, Sep 30, 2016 at 12:05 PM, Hiep Cao Minh <cm-hiep@jinso.co.jp>
>> wrote:
>>>>>>
>>>>>> The issue you're seeing is due to a combination of commits
>>>>>> 5f3bca0db8ac01a7
>>>>>> ("ARM: shmobile: apmu: Add APMU DT support via Enable method") and
>>>>>> dc378795156d980c ("ARM: dts: r8a7790: Add APMU nodes").
>>>>>>
>>>>>> When debug mode is enabled (SW8-4 = OFF), trying to boot secondary
>>>>>> CPUs
>>>>>> may
>>>>>> lock up the system after a cold boot, depending of boot load version.
>>>>>> Hence
>>>>>> we explicitly prohibit that. BTW, this has been the case on Koelsch
>>>>>> since
>>>>>> commit
>>>>>> 277efd30cfc72ec2 ("ARM: shmobile: Check r8a7791 MD21 at SMP boot").
>>>>>>
>>>>>> Now, does series "[PATCH/RFT 0/4] ARM: shmobile: R-Car Gen2: Allow
>>>>>> booting
>>>>>> secondary CPU cores in debug mode" (included in all renesas-drivers
>>>>>> releases
>>>>>> during September) fix it for you?
>>>>>
>>>>> Thanks for your series patches.
>>>>> I have had some problems of receiving post mail from Linux-Renesas
>>>>> Mailing
>>>>> List recently.
>>>>>
>>>>> Could you please forward these series patches to me?
>>>>
>>>> They're included in renesas-drivers.
>>>> You can also get them from gitweb at
>>>>
>>>>
>>>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rcar-secondary-booting-in-debug-mode-v1
>>>
>>> Thanks, I'll confirm these patches on my board.
>>
>> Have you tried this series on your Lager? If yes, can I add your
>> Tested-by?
>
> Sorry for the late reply!.
> I have totally forgotten my reporting test result to you.
> I have tested this series on my Lager board. The bug has been fixed.

Thanks, I will add your Tested-by.

>> Which ES version of R-Car H1 do you have? If you don't know, you can
>> tell me the result of "md.l 0xff000044 1" in U-Boot.
>
> My board information:
> LAGER SPI_LOADER V0.28 2014.09.29
> DEVICE S25FL512
>
>
> U-Boot 2016.01 (Jul 27 2016 - 15:27:42 +0900)
>
> CPU: Renesas Electronics R8A7790 rev 2.0
> -----
> => md.l 0xff000044 1
> ff000044: 00004510                               .E..

R-Car H2 ES2.0.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
