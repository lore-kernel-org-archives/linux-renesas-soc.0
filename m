Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f174.google.com ([209.85.221.174]:35726 "EHLO
        mail-vk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbeJ1Sgj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Oct 2018 14:36:39 -0400
Received: by mail-vk1-f174.google.com with SMTP id b207so1327567vke.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Oct 2018 02:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20181023134237.22937-1-geert+renesas@glider.be>
In-Reply-To: <20181023134237.22937-1-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 28 Oct 2018 10:52:17 +0100
Message-ID: <CAMuHMdXDTwTkHkt9EyMYsDD3fjOmwThF8oeNyhu0fm=Et+niiQ@mail.gmail.com>
Subject: Re: renesas-drivers-2018-10-23-v4.19
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 23, 2018 at 3:43 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> I have pushed renesas-drivers-2018-10-23-v4.19 to
> https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git
>
> This tree is meant to ease development of platform support and drivers
> for Renesas ARM SoCs. It is created by merging (a) the for-next branches
> of various subsystem trees and (b) branches with driver code submitted
> or planned for submission to maintainers into the development branch of
> Simon Horman's renesas.git tree.
>
> Today's version is based on renesas-devel-20181019-v4.19-rc8.
>
> Note: Due to my presence at ELC-E, this has received less testing than
>       usual.  In addition, I could not sign the tag.
>       Sorry for the inconvenience.

Replaced by a signed tag.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
