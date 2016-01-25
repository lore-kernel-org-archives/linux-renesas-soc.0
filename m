Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20160125000845.GC774@verge.net.au>
References: <1453457003-7720-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<20160125000845.GC774@verge.net.au>
Date: Mon, 25 Jan 2016 09:25:01 +0100
Message-ID: <CAMuHMdUor3YxMAjL=YWgmG+7p-6+=h=C5vZAr4NkgroermgshA@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: r8a7795: Add USB3.0 host
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms@verge.net.au>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Mon, Jan 25, 2016 at 1:08 AM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Jan 22, 2016 at 07:03:21PM +0900, Yoshihiro Shimoda wrote:
>> This patch set is based on the latest renesas.git / renesas-devel-20160121-v4.4
>> tag. (commit id = 3740ade0617955c76e1767b6d49347d5446eed74)
>>
>> This patch needs r8a7795-cpg-mssr.c update for usb3.0 clocks.
>
> Thanks. Please let me know if I should wait for that change before
> queuing up these patches.

I think you can queue it up fine. It should start working in next
renesas-drivers
release.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
