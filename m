Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add R8A7743/SK-RZG1M PFC support
To: Simon Horman <horms@verge.net.au>
References: <20170420185132.258111787@cogentembedded.com>
 <20170424061217.GC14843@verge.net.au> <20170705103308.GA29876@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1ef81381-d558-7cad-0df4-bbd63d7055e1@cogentembedded.com>
Date: Wed, 5 Jul 2017 15:06:59 +0300
MIME-Version: 1.0
In-Reply-To: <20170705103308.GA29876@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/05/2017 01:33 PM, Simon Horman wrote:

>>>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
>>> 'renesas-devel-20170420-v4.11-rc7' tag.  We're adding the R8A7743 PFC node
>>> and then describing the pins for SCIF0 and Ether devices declared earlier.
>>> These patches depend on the R8A7743 PFC suport in order to work properly.
>>
>> Thanks. I have marked these as deferred pending acceptance of the PFC
>> driver changes. Please repost or otherwise let me know when dependency
>> is satisfied.
>
> It appears that the driver changes have been acceptedi[1] so
> I have queued these up for v4.14.
>
> [1] https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg15744.html

    This points to Biju Das' patch acceptance, not mine. :-)

MBR, Sergei

