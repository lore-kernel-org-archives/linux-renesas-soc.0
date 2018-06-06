Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:35590 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932116AbeFFHEd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 03:04:33 -0400
MIME-Version: 1.0
In-Reply-To: <4427404.jlkXCGIJ77@avalon>
References: <2a775652-604c-6379-b807-19979f164f84@cogentembedded.com>
 <3434502.pBJZTsWR88@avalon> <50730759-dfda-12c5-a7f3-4e8a9b7b1eb9@cogentembedded.com>
 <4427404.jlkXCGIJ77@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jun 2018 09:04:32 +0200
Message-ID: <CAMuHMdW=qy6+2iXz6arSfcoXjbgrySxutCKqgT5_6oyCL_XugA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas: du: document R8A77980 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Jun 5, 2018 at 10:24 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tuesday, 5 June 2018 22:49:57 EEST Sergei Shtylyov wrote:
>> On 06/05/2018 10:16 PM, Laurent Pinchart wrote:
>> >>>> Document the R-Car V3H (R8A77980) SoC in the R-Car DU bindings; the DU
>> >>>> hardware seems the same as in the R-Car V3M (R8A77970).
>> >>>
>> >>> How about "the DU hardware has the same topology as in the R-Car V3M
>> >>> (R8A77970)" ? "seems" sounds like we're very unsure :-)
>> >>
>> >> That's probably better, indeed.
>> >>
>> >>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> >>>>
>> >>>> ---
>> >>>> The patch is against the 'drm-next' branch of David Airlie's
>> >>>> 'linux.git' repo.
>> >>>
>> >>> Then you might want to switch to git://anongit.freedesktop.org/drm/drm
>> >>> :-)
>> >>
>> >> No, the corresponding MAINTAINERS records don't include
>> >> drivers/gpu/drm/rcar-du/ or worse yet, the DU bindings. :-)
>>
>> Well, there is still no corresponding record, actually...
>>
>> > My point is that Dave's tree has moved.
>>
>> How am I supposed to learn about it, from gossips? :-)
>
> I learnt it the hard way when a pull request I had prepared against the old
> tree conflicted (at compile time) with patches merged in the new tree. This
> broke the build, and I learnt about the new tree from a kbuild bot report.

Updated repo list for renesas-drivers.
Thanks for letting me know!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
