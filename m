Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46000 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbeGUW4G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jul 2018 18:56:06 -0400
Received: by mail-lj1-f195.google.com with SMTP id q5-v6so13852660ljh.12
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Jul 2018 15:01:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3b6f71da-8d63-1a63-dc61-05c12d52a2db@gmail.com>
References: <20180530101130.3566-1-marek.vasut+renesas@gmail.com>
 <CAOesGMjmz41p5sF_xnC7gdSRNLaowXPW7Sk8HBZww_QSTvXV7g@mail.gmail.com> <3b6f71da-8d63-1a63-dc61-05c12d52a2db@gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Sat, 21 Jul 2018 15:01:48 -0700
Message-ID: <CAOesGMhVbSGmkkF-Va6zwOB4xXxj=HpccKeFYgVLO4D86Vo4ow@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: rmobile: Drop MTD partitioning from DT
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jul 21, 2018 at 2:54 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 07/21/2018 11:47 PM, Olof Johansson wrote:
>> Hi,
>
> Hi,
>
>> On Wed, May 30, 2018 at 3:11 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>> Drop the MTD partitioning from DT, since it does not describe HW
>>> and to give way to a more flexible kernel command line partition
>>> passing.
>>>
>>> To retain the original partitioning, assure you have enabled
>>> CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
>>> following to your kernel command line:
>>>
>>> lager:   mtdparts=spi0.0:256k(loader),4m(user),-(flash)
>>> stout:   mtdparts=spi0.0:512k(loader),256k(uboot),256k(uboot-env),-(flash)
>>> koelsch: mtdparts=spi0.0:512k(loader),5632k(user),-(flash)
>>> porter:  mtdparts=spi0.0:256k(loader_prg),4m(user_prg),-(flash_fs)
>>> wheat:   mtdparts=spi0.0:256k(loader),4m(user),-(flash)
>>> gose:    mtdparts=spi0.0:256k(loader),4m(user),-(flash)
>>> alt:     mtdparts=spi0.0:256k(loader),256k(system),-(user)
>>> silk:    mtdparts=spi0.0:256k(loader),4m(user),-(flash)
>>
>> Having to specify on command line is such a nasty hack. I wish we
>> could remove that, and at the very least not add it for anything new.
>
> Do you have a better suggestion ?

Yes, keep it in DT.

>> You end up with user space tools trying to parse the kernel command
>> line to figure out what's on the flash, and other really bad habits.
>> :(
>
> You should just read /proc/mtd , see
> http://www.linux-mtd.infradead.org/doc/general.html

Sure, I know that but not everybody does, and they do it in bad ways
if given the opportunity.


>> I'd strongly advice you to keep this in the board files, unless you
>> have an actual real motivation for changing it. This patch does not
>> provide one.
>
> Partitioning is not hardware description, it should not be in DT.

Read my reply again. It's part of _platform_ description, and belongs in DT.


-Olof
