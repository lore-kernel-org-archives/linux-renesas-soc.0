Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:38425 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751056AbeAYIBi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jan 2018 03:01:38 -0500
MIME-Version: 1.0
In-Reply-To: <4cc627c4-1aaf-b8d5-5a26-eea7e596743f@gmail.com>
References: <20180121143117.19805-1-wsa+renesas@sang-engineering.com>
 <20180121143117.19805-2-wsa+renesas@sang-engineering.com> <4cc627c4-1aaf-b8d5-5a26-eea7e596743f@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Jan 2018 09:01:37 +0100
Message-ID: <CAMuHMdVuN5iRLqWuPH_UVR1zDJK-rPHZ6guU-ssPuoZ=UWTAFw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/1] of: introduce event tracepoints for dynamic
 device_node lifecyle
To: Frank Rowand <frowand.list@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Tyrel Datwyler <tyreld@linux.vnet.ibm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Frank,

On Thu, Jan 25, 2018 at 7:48 AM, Frank Rowand <frowand.list@gmail.com> wrote:
>>  create mode 100644 include/trace/events/of.h
>
> mode looks incorrect.  Existing files in include/trace/events/ are -rw-rw----

Not in my git clone ;-) 644 should be fine.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
