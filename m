Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add RWDT support
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
References: <2368353.xfo5beGC5E@wasted.cogentembedded.com>
 <175a491f-a827-4a92-1884-2f1490d38a52@cogentembedded.com>
 <20180723160827.ziuivshq2mtagexq@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4eb91e29-9c2f-6f7c-2b3c-983e41430e26@cogentembedded.com>
Date: Mon, 23 Jul 2018 19:14:28 +0300
MIME-Version: 1.0
In-Reply-To: <20180723160827.ziuivshq2mtagexq@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/23/2018 07:08 PM, Simon Horman wrote:

>> Describe RWDT in the R8A77980 SoC device tree.
>>
>> Enable RWDT on the Condor and V3H Starter Kit boards.
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> The patch is against the 'renesas-devel-20180720-v4.18-rc5' of Simon Horman's
>> 'renesas.git' repo.  It depends on Geert Uytterhoeven's clock driver patches
>> (adding the RWDT clock) in order to work...
> 
> But it is safe to apply without those patches, right?

   The RWDT driver should just fail to probe with -ENOENT. 

> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

   TY!

MBR, Sergei
