Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:63124 "EHLO
        www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932413AbcI3KFI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2016 06:05:08 -0400
Message-ID: <57EE38CF.5090903@jinso.co.jp>
Date: Fri, 30 Sep 2016 19:05:03 +0900
From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Xuan Truong Nguyen <nx-truong@jinso.co.jp>,
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
Subject: Re: GEN2:Lager: Only 1 core works when turning off the SW8-PIN4
References: <57A46D20.7040106@jinso.co.jp> <57C9764F.2070802@jinso.co.jp> <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp> <57D66DEC.4090607@jinso.co.jp> <CAMuHMdWouXw1Cen8wyoHFHEYQpOvwOg3gLGpA2VtDUerk1iqbg@mail.gmail.com> <57ECF4EA.4010704@jinso.co.jp> <CAMuHMdUw_k_SLUO1r5v12Cun40cfJCfA7Em4e-zupEDsxcEdhw@mail.gmail.com> <57EE368B.8030500@jinso.co.jp> <CAMuHMdXq6b7_sGT2OXfVYZ+SD=Agr+CfafAp2ztr3rCNE2bocw@mail.gmail.com>
In-Reply-To: <CAMuHMdXq6b7_sGT2OXfVYZ+SD=Agr+CfafAp2ztr3rCNE2bocw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,


>>> The issue you're seeing is due to a combination of commits
>>> 5f3bca0db8ac01a7
>>> ("ARM: shmobile: apmu: Add APMU DT support via Enable method") and
>>> dc378795156d980c ("ARM: dts: r8a7790: Add APMU nodes").
>>>
>>> When debug mode is enabled (SW8-4 = OFF), trying to boot secondary CPUs
>>> may
>>> lock up the system after a cold boot, depending of boot load version.
>>> Hence
>>> we explicitly prohibit that. BTW, this has been the case on Koelsch since
>>> commit
>>> 277efd30cfc72ec2 ("ARM: shmobile: Check r8a7791 MD21 at SMP boot").
>>>
>>> Now, does series "[PATCH/RFT 0/4] ARM: shmobile: R-Car Gen2: Allow booting
>>> secondary CPU cores in debug mode" (included in all renesas-drivers
>>> releases
>>> during September) fix it for you?
>> Thanks for your series patches.
>> I have had some problems of receiving post mail from Linux-Renesas Mailing
>> List recently.
>>
>> Could you please forward these series patches to me?
> They're included in renesas-drivers.
> You can also get them from gitweb at
> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rcar-secondary-booting-in-debug-mode-v1
Thanks, I'll confirm these patches on my board.


Thank you.
Hiep.
