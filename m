Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:43079 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752109AbeBSIUM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 03:20:12 -0500
MIME-Version: 1.0
In-Reply-To: <20180216184406.GA9286@kroah.com>
References: <1518696147-23790-1-git-send-email-ulrich.hecht+renesas@gmail.com> <20180216184406.GA9286@kroah.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Feb 2018 09:20:10 +0100
Message-ID: <CAMuHMdVT1zL3UTbRZjErvxGC21HVV-zAmsqBZgvZA5a5Y=S7bw@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: prevent lockup on full TTY buffers
To: Greg KH <greg@kroah.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-serial@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Greg,

On Fri, Feb 16, 2018 at 7:44 PM, Greg KH <greg@kroah.com> wrote:
> On Thu, Feb 15, 2018 at 01:02:27PM +0100, Ulrich Hecht wrote:
>> When the TTY buffers fill up to the configured maximum, a system lockup
>> occurs:
>>
>> [  598.820128] INFO: rcu_preempt detected stalls on CPUs/tasks:
>> [  598.825796]  0-...!: (1 GPs behind) idle=5a6/2/0 softirq=1974/1974 fqs=1
>> [  598.832577]  (detected by 3, t=62517 jiffies, g=296, c=295, q=126)
>> [  598.838755] Task dump for CPU 0:
>> [  598.841977] swapper/0       R  running task        0     0      0 0x00000022
>> [  598.849023] Call trace:
>> [  598.851476]  __switch_to+0x98/0xb0
>> [  598.854870]            (null)
>>
>> This can be prevented by doing a dummy read of the RX data register.
>>
>> This issue affects both HSCIF and SCIF ports. Reported for R-Car H3 ES2.0;
>> reproduced and fixed on H3 ES1.1. Probably affects other R-Car platforms
>> as well.
>>
>> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>
> Should this go to older kernel versions as well?
> If so, how far back?

This code path dates back to full-history-linux commit 2898a0e08c6ffb63
("[PATCH] SH Merge") in 2.6.2, back in 2004.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
