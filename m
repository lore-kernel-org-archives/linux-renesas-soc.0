Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH v3 0/11] Add R8A7743/SK-RZG1M board support
To: Simon Horman <horms@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <5be99d76-a082-129b-1aa6-b6f7402ae79b@cogentembedded.com>
 <20161012080905.GD31183@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cea44556-a578-fb54-11b8-f21f5b991caa@cogentembedded.com>
Date: Wed, 12 Oct 2016 11:29:56 +0300
MIME-Version: 1.0
In-Reply-To: <20161012080905.GD31183@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/12/2016 11:09 AM, Simon Horman wrote:

>>>   Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
>>> 'renesas-devel-20161003-v4.8' tag. I'm adding the device tree support for
>>> the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the board
>>> seems identical to the R8A7791/Porter board. The device tree patches depend on
>>> the R8A7743 CPG/MSSR driver series just posted in order to compile and work.
>>
>>    Forgot to mention that this version causes a regression with the sh_eth
>> driver (well, actually with phylib): since IRQC now gets a deferred probing,
>> PHY IRQ doesn't work anymore -- phylib falls back to polling.
>
> Is there a resolution to that problem?

    Geert has posted his IRQC driver patch recently. Not sure if it was 
intended for merging but it solves the issue.

MBR, Sergei

