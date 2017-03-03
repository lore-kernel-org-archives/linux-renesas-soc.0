Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2423895.QcDWT1fsiC@avalon>
References: <1488547835-25229-1-git-send-email-geert+renesas@glider.be> <2423895.QcDWT1fsiC@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Mar 2017 20:03:09 +0100
Message-ID: <CAMuHMdU=1O_ZZgAXWSecO=HRtZdY8s0LfEMuUkpgvr528HV+Jw@mail.gmail.com>
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

On Fri, Mar 3, 2017 at 3:41 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Friday 03 Mar 2017 14:30:35 Geert Uytterhoeven wrote:
>> Document the optional properties for describing module resets, to
>> support resetting display channels and LVDS encoders on R-Car Gen2 and
>> Gen3.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  Documentation/devicetree/bindings/display/renesas,du.txt | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt
>> b/Documentation/devicetree/bindings/display/renesas,du.txt index
>> 1a02f099a0ff0a3a..7873d53764a297c2 100644
>> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
>> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
>> @@ -36,6 +36,16 @@ Required Properties:
>>        When supplied they must be named "dclkin.x" with "x" being the input
>>        clock numerical index.
>>
>> +Optional properties:
>> +  - resets: A list of phandles + reset-specifier pairs, one for each entry
>> in
>
> s/phandlers/phandle/

You're seeing typos that do not exist ;-)

>> +    the reset-names property.
>
> What's in the reset specifier ?

That depends on the reset provider.

See "[v2,1/4] dt-bindings: clock: renesas: cpg-mssr: Document reset control
support" (https://patchwork.kernel.org/patch/9536627/) for the Renesas
CPG/MSSR case.

E.g. "resets = <&cpg 310>;"

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
