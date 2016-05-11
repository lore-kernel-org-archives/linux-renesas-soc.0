Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34277 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751296AbcEKHmU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 03:42:20 -0400
Received: by mail-io0-f193.google.com with SMTP id d62so4695718iof.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 00:42:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87mvnxrtw1.wl%kuninori.morimoto.gx@renesas.com>
References: <1462877412-10954-1-git-send-email-geert+renesas@glider.be>
	<87mvnxrtw1.wl%kuninori.morimoto.gx@renesas.com>
Date: Wed, 11 May 2016 09:42:19 +0200
Message-ID: <CAMuHMdVX8weYzUHdh00TH3ywk9-jzo9kpyS9tWoV3oEayVcDYw@mail.gmail.com>
Subject: Re: renesas-drivers-2016-05-10-v4.6-rc7
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Wed, May 11, 2016 at 8:34 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> I have pushed renesas-drivers-2016-05-10-v4.6-rc7 to
>> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git
>>
>> This tree is meant to ease development of platform support and drivers
>> for Renesas ARM SoCs. It is created by merging (a) the for-next branches
>> of various subsystem trees and (b) branches with driver code submitted
>> or planned for submission to maintainers into the development branch of
>> Simon Horman's renesas.git tree.
>>
>> Today's version is based on renesas-devel-20160509-v4.6-rc7.
>
> I couldn't compile code ?
>
>         > git checkout renesas-drivers-2016-05-10-v4.6-rc7
>         > make defconfig
>         > make64 Image
>   CHK     include/config/kernel.release
>   Using /opt/home/morimoto/WORK/linux as source for kernel
>   GEN     ./Makefile
>   CHK     include/generated/uapi/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CHK     include/generated/bounds.h
>   CHK     include/generated/timeconst.h
>   CHK     include/generated/asm-offsets.h
>   CALL    /opt/home/morimoto/WORK/linux/scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   (snip)
>   CC      arch/arm64/kvm/../../../arch/arm/kvm/arm.o
> /opt/home/morimoto/WORK/linux/arch/arm64/kvm/../../../arch/arm/kvm/arm.c: In function 'teardown_hyp_mode':
> /opt/home/morimoto/WORK/linux/arch/arm64/kvm/../../../arch/arm/kvm/arm.c:1236:27: error: 'hyp_init_cpu_nb' undeclared (first use in this function)
>   unregister_cpu_notifier(&hyp_init_cpu_nb);
>                            ^
> /opt/home/morimoto/WORK/linux/arch/arm64/kvm/../../../arch/arm/kvm/arm.c:1236:27: note: each undeclared identifier is reported only once for each function it appears in
> make[3]: *** [arch/arm64/kvm/../../../arch/arm/kvm/arm.o] エラー 1

Sorry, I forgot to compile arm64_defconfig, my Salvator-X config doesn't have
KVM enabled, and even the zero-day build bot didn't tell me...

It's due to a bad merge conflict resolution on my side. Please delete the
offending line:

        unregister_cpu_notifier(&hyp_init_cpu_nb);

Sorry for the inconvenience.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
