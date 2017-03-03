Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU=1O_ZZgAXWSecO=HRtZdY8s0LfEMuUkpgvr528HV+Jw@mail.gmail.com>
References: <1488547835-25229-1-git-send-email-geert+renesas@glider.be>
 <2423895.QcDWT1fsiC@avalon> <CAMuHMdU=1O_ZZgAXWSecO=HRtZdY8s0LfEMuUkpgvr528HV+Jw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Mar 2017 20:04:26 +0100
Message-ID: <CAMuHMdWd+7bgRBCG+5jHvbds1_u9j5fN3_BmgMaim2o_JP+rcw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: drm: rcar-du: Document optional reset properties
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 3, 2017 at 8:03 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>> +Optional properties:
>>> +  - resets: A list of phandles + reset-specifier pairs, one for each entry
>>> in
>>
>> s/phandlers/phandle/
>
> You're seeing typos that do not exist ;-)

Ah, you mean plural vs. singular?
You're right, but I just copied that from the "clocks" description...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
