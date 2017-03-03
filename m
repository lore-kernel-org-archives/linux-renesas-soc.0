Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <5304812.zzcGWdqkpi@avalon>
References: <1488547835-25229-1-git-send-email-geert+renesas@glider.be>
 <2423895.QcDWT1fsiC@avalon> <CAMuHMdU=1O_ZZgAXWSecO=HRtZdY8s0LfEMuUkpgvr528HV+Jw@mail.gmail.com>
 <5304812.zzcGWdqkpi@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Mar 2017 20:23:34 +0100
Message-ID: <CAMuHMdXgow=oF3e52MHANKywzFSeV8hzBUSY4GSxCOiti-EaJQ@mail.gmail.com>
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

Hi Laurent,

On Fri, Mar 3, 2017 at 8:17 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Friday 03 Mar 2017 20:03:09 Geert Uytterhoeven wrote:
>> On Fri, Mar 3, 2017 at 3:41 PM, Laurent Pinchart wrote:
>> > What's in the reset specifier ?
>>
>> That depends on the reset provider.
>>
>> See "[v2,1/4] dt-bindings: clock: renesas: cpg-mssr: Document reset control
>> support" (https://patchwork.kernel.org/patch/9536627/) for the Renesas
>> CPG/MSSR case.
>>
>> E.g. "resets = <&cpg 310>;"
>
> Thanks. I never know whether the specified is the combination of phandle +
> data, or is only the cells following the phandle.

Trick to remember: the #<foo>-cells property tells how many cells there
are in the specifier.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
