Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <0ccd631e-691a-2b15-7680-6e0c847a6ca2@cogentembedded.com>
References: <038a791d-aa57-9c3d-eaea-09c5704ecb54@cogentembedded.com> <0ccd631e-691a-2b15-7680-6e0c847a6ca2@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2018 11:02:55 +0100
Message-ID: <CAMuHMdX3XZSwvAT74fVhWw9GoxVmpdXoqR03=u0QC3FEB==X=w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: eagle: specify EtherAVB PHY IRQ
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 13, 2018 at 12:24 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Specify  EtherAVB PHY IRQ  in the Eagle board's device tree, now that we
> have the GPIO support (previously phylib had to resort to polling).
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

You've dropped my:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
