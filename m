Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f177.google.com ([209.85.161.177]:34221 "EHLO
        mail-yw0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752443AbcJXHAt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2016 03:00:49 -0400
Received: by mail-yw0-f177.google.com with SMTP id w3so172047265ywg.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2016 00:00:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b7e9b4c2-1d5d-2e76-c0f4-fcc50150dc30@jinso.co.jp>
References: <57A46D20.7040106@jinso.co.jp> <57C9764F.2070802@jinso.co.jp>
 <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp> <9d9a647b-d75f-e89a-2d4d-55e409ccabae@jinso.co.jp>
 <580620CD.50703@sang-engineering.com> <b7e9b4c2-1d5d-2e76-c0f4-fcc50150dc30@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Oct 2016 09:00:47 +0200
Message-ID: <CAMuHMdWuHZ=5ogTE9rG=hjJxVn4dADc_cXuEcO76goq8KDf9kg@mail.gmail.com>
Subject: Re: The failure summary report of GEN2 for linux stable v4.8
To: Xuan Truong Nguyen <nx-truong@jinso.co.jp>
Cc: Wolfram Sang <wsa@sang-engineering.com>,
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
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Truong,

On Wed, Oct 19, 2016 at 4:20 AM, Xuan Truong Nguyen
<nx-truong@jinso.co.jp> wrote:
> For Issue 9 (related to SCIF) we'll describe how we reproduce that as below:
> on the controller console minicom (ttySC0 on board) we execute the command
> #stty -F /dev/ttySC1 speed 38400 cs8 -cstopb;cat /dev/ttySC1
> then we send the 10M file from the host PC to ttySC1 via gtkterm program.
> the 10M file must contain a lot of lines ( \n character ) as we created by
> #< /dev/urandom tr -dc "a-zA-Z0-9\n" | head -c"$size" >  file10M.txt
> every thing runs normally for a while (after about 2/3 of data was
> transmitted), then the kernel hangs up. some time the warning message is
> output.

This is with shmobile_defconfig?
Does it work better if you enable CONFIG_SERIAL_SH_SCI_DMA?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
