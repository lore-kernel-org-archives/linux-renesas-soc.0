Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f195.google.com ([209.85.213.195]:34664 "EHLO
	mail-ig0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754690AbcEQJLf (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 17 May 2016 05:11:35 -0400
Received: by mail-ig0-f195.google.com with SMTP id kj7so1068403igb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2016 02:11:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160513221726.GA1720@katana>
References: <20160513123045.GA12309@katana>
	<CAMuHMdW13P=EbkukgNCt+OENqpH0LJY3L-F9N=y5zEhiyjhfpw@mail.gmail.com>
	<20160513221726.GA1720@katana>
Date: Tue, 17 May 2016 11:11:34 +0200
Message-ID: <CAMuHMdU_zxTCA-jY3H3=Q2_=9ZM1BoUhPnn7BiLn9kWdrWd0Jw@mail.gmail.com>
Subject: Re: [PULL REQUEST] renesas/topic/gen3-sdio for renesas-drivers
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Sat, May 14, 2016 at 12:17 AM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> BTW, for renesas-drivers, please don't base pull requests on the previous
>> version, as that may cause massive conflicts when creating the next version
>> (many for-next trees may be rebased).
>
> Rebased for-next trees? Uhhh...

That's why the concept of "request a stable branch" was introduced.
Typically only maintainers for subsystems with sublieutenants avoid rebasing
for-next branches.

>> I'd rather merge your staging/ks7010 branch (which is based on non-changing
>> v4.6-rc7) and a branch containing the two mmc commits (based on a stable
>> commit, too, or Ulf's mmc/next if everything else fails).

And as the two mmc commits are now in Ulf's tree, I just had to merge
staging/ks7010...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
