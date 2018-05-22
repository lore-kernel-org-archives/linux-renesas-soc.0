Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180522085430.eqhan4njajnp5hkk@verge.net.au>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
 <ec4c6905-23d1-8600-a1cc-4297fbd1ddaa@cogentembedded.com> <CAMuHMdU9JXvN2GLFGLZGeNOpZ9AdJYokbpTqt-Wy97-Z0tXaCA@mail.gmail.com>
 <ec73ce6d-f062-6c4f-d6fa-b99ef6c6bc67@cogentembedded.com> <20180522085430.eqhan4njajnp5hkk@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 May 2018 11:49:36 +0200
Message-ID: <CAMuHMdWepA=YbjtVN2iw7uXrWu62LRx1ymix_AUgp6NrOTUgpw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add SMP support
To: Simon Horman <horms@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 22, 2018 at 10:54 AM, Simon Horman <horms@verge.net.au> wrote:
> On Sat, May 19, 2018 at 08:38:13PM +0300, Sergei Shtylyov wrote:
>> On 05/17/2018 11:23 PM, Geert Uytterhoeven wrote:
>>
>> >> Add the device nodes for 3 more Cortex-A53 CPU cores; adjust the interrupt
>> >> delivery masks for the ARM GIC and Architectured Timer.
>> >>
>> >> Based on the original (and large) patch by Vladimir Barinov.
>> >>
>> >> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> >
>> > Thanks for your patch!
>> >
>> >> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> >> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> >> @@ -30,6 +30,36 @@
>> >>                         enable-method = "psci";
>> >>                 };
>> >>
>> >> +               a53_1: cpu@1 {
>> >> +                       device_type = "cpu";
>> >> +                       compatible = "arm,cortex-a53","arm,armv8";
>> >
>> > Please stop copying spaceless lists ;-)
>>
>>    Oops! Simon, do I need to re-post?
>
> No, but Geert, are you otherwise ok with this patch?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
