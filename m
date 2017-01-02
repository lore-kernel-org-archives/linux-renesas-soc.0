Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:36334 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755410AbdABNaG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jan 2017 08:30:06 -0500
Received: by mail-io0-f195.google.com with SMTP id m204so21758026ioe.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Jan 2017 05:30:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <0b71715d-aeaa-e4e6-0b85-8633cfdbeb70@jinso.co.jp>
References: <1482814415969201000053a8@nat.cybozu.com> <adc3b16c-b663-ce65-b06f-e9ff76eb5dd5@jinso.co.jp>
 <CAMuHMdUXqU=O7Q=omkWC3KkgGA06LqFRWejObgvt9jY47sybEA@mail.gmail.com> <0b71715d-aeaa-e4e6-0b85-8633cfdbeb70@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Jan 2017 14:30:05 +0100
Message-ID: <CAMuHMdVRQNvpFJ=wk_i1dnVz_xXGK++voK0hGOV0qSHcFc+jsg@mail.gmail.com>
Subject: Re: The failure summary report of GEN3 for linux stable v4.9
To: Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc: =?UTF-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>, Wolfram Sang <wsa@sang-engineering.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Xuan Truong Nguyen <nx-truong@jinso.co.jp>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hoan,

On Wed, Dec 28, 2016 at 2:40 AM, Hoan Nguyen An <na-hoan@jinso.co.jp> wrote:
> I have retested PM, recheck the PM test procedures.
> I am using board H3 ES1.1,  procedures involving i2cset is right.
>
> With the same test procedures and setting for this version and previous
> version(v4.9-rc2), but the results are different.
>
> (Only U-boot versions are different for two version)
>
> I am using U-boot version(U-Boot 2015.04 (Sep 13 2016 - 11:32:36)).
>
> I attach the test log file of PM. Please have a look at the log.
>
> On 27/12/16 22:02, Geert Uytterhoeven wrote:
>> On Tue, Dec 27, 2016 at 11:35 AM, Hoan Nguyen An <na-hoan@jinso.co.jp>
>>> My name is Hoan from Jinzai Solution.
>>> We have tested the linux stable v4.9 for Gen3 Salvator-X (H3)
>>>
>>> So we would like to report the summary of the failure.
>>> 1 PM: It is not working, can't return to the system. NG New issue
>>> root@linaro-nano:~# echo mem > /sys/power/state
>>> [  221.280712] PM: Syncing filesystems ... done.
>>> [  221.286474] Freezing user space processes ... (elapsed 0.001 seconds)
>>> done.
>>> [  221.295013] Freezing remaining freezable tasks ... (elapsed 0.001
>>> seconds) done.
>>> [  221.303691] Suspending console(s) (use no_console_suspend to debug)
>>
>> Are you using R-Car H3 ES1.0?
>> AFAIK, tbe newer firmware supports system suspend/resume on H3 ES1.1 only,
>> and only when following the right procedure involving i2cset.
>
> I only set the following command for test.
> root@linaro-nano:~# echo enabled >
> /sys/devices/platform/soc/e6e68000.serial/tty/ttySC1/power/wakeup
> root@linaro-nano:~# echo enabled >
> /sys/devices/platform/soc/e6e88000.serial/tty/ttySC0/power/wakeup

Wake-up through any other wake-up source than SW23 is not yet supported
on Salvator-X boards, as the PSCI firmware doesn't know about those wake-up
sources, and powers down the whole SoC during suspend to RAM.

It may start to work once kernel support for suspend-to-idle has been added.

> root@linaro-nano:~# echo mem > /sys/power/state
>
> Could you please tell me more details for using i2cset?.

The official (cumbersome) procedure goes like this:

    - Set to PMIC to backup mode via i2c-tools command

          # i2cset -f -y 7 0x30 0x20 0x0F

  - (Suspend) Change SW23 to OFF
  - Request System Suspend to RAM

        # echo mem > /sys/power/state

  - (Resume) Change SW23 to ON

Note that this doesn't  work with current upstream, as the upstream DTS
doesn't have a device node for i2c7 yet...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
