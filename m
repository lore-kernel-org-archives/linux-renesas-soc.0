Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:41358 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751962AbeBSIQJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 03:16:09 -0500
MIME-Version: 1.0
In-Reply-To: <CAO3366xcbP5hdLC_fgFfDtNJcqE5vfkVZBjAqk6VN8mAk2wYCA@mail.gmail.com>
References: <1518696147-23790-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20180215131237.4yi42wq4duic7uaq@katana> <CAO3366xcbP5hdLC_fgFfDtNJcqE5vfkVZBjAqk6VN8mAk2wYCA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Feb 2018 09:16:08 +0100
Message-ID: <CAMuHMdViZYjHxYXBBnHdm-=7zhbeVS-r1OJ_yXz5xKGNucLqiQ@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: prevent lockup on full TTY buffers
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-serial@vger.kernel.org,
        shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Fri, Feb 16, 2018 at 3:27 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> On Thu, Feb 15, 2018 at 2:12 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>>> This can be prevented by doing a dummy read of the RX data register.
>>
>> Just so I understand the issue correctly: We are reading the register to
>> throw the content away to prevent it being used in the TTY buffers?
>
> Not quite. The problem was that if the buffers are full,
> sci_receive_chars() returned immediately without reading anything from
> the data register, and that led to a lockup. I am not fully sure why
> that is so (I arrived at the fix by examining how the different code
> paths look from the serial controller's perspective), but dropping
> data here fixes it. At this point buffers are full, so any data
> received will have to be discarded anyway.

Do you get an interrupt storm, from the receive or overrun interrupt?

Anyway, the patch makes sense to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
