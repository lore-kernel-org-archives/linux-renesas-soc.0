Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:42804 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753354AbeBSRtv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 12:49:51 -0500
Received: by mail-qk0-f194.google.com with SMTP id b130so13213733qkg.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2018 09:49:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180219174745.gxvdpgceejctbwei@verge.net.au>
References: <201802200054.GAzdclOv%fengguang.wu@intel.com> <20180219174745.gxvdpgceejctbwei@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Feb 2018 18:49:50 +0100
Message-ID: <CAMuHMdX19gVGfST98Rs+smys7+NrWW1N+Lc=9UBERiEQfU+i0Q@mail.gmail.com>
Subject: Re: [renesas:soc-for-v4.17 6/6] drivers/soc/renesas/r8a77980-sysc.c:12:10:
 fatal error: dt-bindings/power/r8a77980-sysc.h: No such file or directory
To: Simon Horman <horms@verge.net.au>
Cc: kbuild test robot <fengguang.wu@intel.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        kbuild-all@01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Feb 19, 2018 at 6:47 PM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Feb 20, 2018 at 12:02:58AM +0800, kbuild test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git soc-for-v4.17
>> head:   8b49a80541c565d5d8482f15350ab861f60455a1
>> commit: 8b49a80541c565d5d8482f15350ab861f60455a1 [6/6] soc: renesas: rcar-sysc: add R8A77980 support
>> config: i386-allmodconfig (attached as .config)
>> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
>> reproduce:
>>         git checkout 8b49a80541c565d5d8482f15350ab861f60455a1
>>         # save the attached .config to linux build tree
>>         make ARCH=i386
>>
>> All errors (new ones prefixed by >>):
>>
>> >> drivers/soc/renesas/r8a77980-sysc.c:12:10: fatal error: dt-bindings/power/r8a77980-sysc.h: No such file or directory
>>     #include <dt-bindings/power/r8a77980-sysc.h>
>>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    compilation terminated.
>>
>> vim +12 drivers/soc/renesas/r8a77980-sysc.c
>>
>>     11
>>   > 12        #include <dt-bindings/power/r8a77980-sysc.h>
>>     13
>
> Ooops. I missed that
>
> 8b49a80541c5 ("soc: renesas: rcar-sysc: add R8A77980 support")
>
> depends on
>
> eaf8509d3d97 ("dt-bindings: power: add R8A77980 SYSC power domain definitions")
>
> Perhaps I should just squash the latter into the former.
>
> Sergei, Geert, any thoughts?

Just queue them up in the same branch, like you did before for other SoCs?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
