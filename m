Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: wheat: add SDHI0 support
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
References: <34968644.DhifNderY8@wasted.cogentembedded.com>
 <1659137.gEKJxNrmrk@wasted.cogentembedded.com>
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0defa744-2a9e-ee50-6212-589cee7e537f@cogentembedded.com>
Date: Sun, 4 Sep 2016 00:49:12 +0300
MIME-Version: 1.0
In-Reply-To: <1659137.gEKJxNrmrk@wasted.cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 08/31/2016 01:24 AM, Sergei Shtylyov wrote:

> Define the Wheat board dependent  part of  the SDHI0 (connected to the
> micro-SD slot)  device node along with the necessary voltage regulator.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> This patch is against the 'renesas-devel-20160830-v4.8-rc4' of Simon Horman's
> 'renesas.git' repo plus the CAN patch posted yesterday.
> Starting with this patch, SMSC LAN89218 Ethernet chip starts to misbehave on my
> board...

    Fortunately, this ill effect has been fixed by Jeremy Lintion's smsc911x 
driver patches that should hit Linus' tree soon (they're alredy in DaveM's 
net.git)...

MBR, Sergei

