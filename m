Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:39050 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752352AbdLLKUL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 05:20:11 -0500
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Dec 2017 11:20:09 +0100
Message-ID: <CAMuHMdXh_6FaV-SFGWxcBb1-NNGYngDrYnnWA=9Y6xmRAkcxqg@mail.gmail.com>
Subject: arm64: unhandled level 0 translation fault
To: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Catalin, Will, et al,

During userspace (Debian jessie NFS root) boot on arm64:

rpcbind[1083]: unhandled level 0 translation fault (11) at 0x00000008,
esr 0x92000004, in dash[aaaaadf77000+1a000]
CPU: 0 PID: 1083 Comm: rpcbind Not tainted
4.15.0-rc3-arm64-renesas-02176-g14f9a1826e48e355 #51
Hardware name: Renesas Salvator-X 2nd version board based on r8a7795 ES2.0+ (DT)
pstate: 80000000 (Nzcv daif -PAN -UAO)
pc : 0xaaaaadf8a51c
lr : 0xaaaaadf8ac08
sp : 0000ffffcffeac00
x29: 0000ffffcffeac00 x28: 0000aaaaadfa1000
x27: 0000ffffcffebf7c x26: 0000ffffcffead20
x25: 0000aaaacea1c5f0 x24: 0000000000000000
x23: 0000aaaaadfa1000 x22: 0000aaaaadfa1000
x21: 0000000000000000 x20: 0000000000000008
x19: 0000000000000000 x18: 0000ffffcffeb500
x17: 0000ffffa22babfc x16: 0000aaaaadfa1ae8
x15: 0000ffffa2363588 x14: ffffffffffffffff
x13: 0000000000000020 x12: 0000000000000010
x11: 0101010101010101 x10: 0000aaaaadfa1000
x9 : 00000000ffffff81 x8 : 0000aaaaadfa2000
x7 : 0000000000000000 x6 : 0000000000000000
x5 : 0000aaaaadfa2338 x4 : 0000aaaaadfa2000
x3 : 0000aaaaadfa2338 x2 : 0000000000000000
x1 : 0000aaaaadfa28b0 x0 : 0000aaaaadfa4c30

Sometimes it happens with other processes, but the main address, esr, and
pstate values are always the same.

I regularly run arm64/for-next/core (through bi-weekly renesas-drivers
releases, so the last time was two weeks ago), but never saw the issue
before until today, so probably v4.15-rc1 is OK.
Unfortunately it doesn't happen during every boot, which makes it
cumbersome to bisect.

My first guess was UNMAP_KERNEL_AT_EL0, but even after disabling that,
and even without today's arm64/for-next/core merged in, I still managed to
reproduce the issue, so I believe it was introduced in v4.15-rc2 or
v4.15-rc3.

Once, when the kernel message above wasn't shown, I got an error from
userspace, which may be related:
*** Error in `/bin/sh': free(): invalid pointer: 0x0000aaaadd970988 ***

Do you have a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
