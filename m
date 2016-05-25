Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: R8A7795 FDP1 clock parentage
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <57456546.5020104@bingham.xyz>
 <87k2iile8n.wl%kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
From: Kieran Bingham <kieran@bingham.xyz>
Message-ID: <5745DC91.6010205@bingham.xyz>
Date: Wed, 25 May 2016 18:10:41 +0100
MIME-Version: 1.0
In-Reply-To: <87k2iile8n.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

On 25/05/16 09:49, Kuninori Morimoto wrote:
> 
> Hi Kieran
> 
>> I have added an initial patch to support the FDP1 in the clock
>> framework, but I have not been able to correctly identify the actual
>> clock parent.
>>
>> For now I have assumed that it is R8A7795_CLK_S2D1.
>>
>> Could you please confirm this selection, or help identify the true
>> parent please?
> 
> OK, please wait

Thanks,

Just to add to this request, could you ask the HW engineers to confirm
the clock parents for the FCPF (0,1,2) as well please?

They too are currently listed as R8A7795_CLK_S2D1, however now that I am
trying to enable the FCPF and read registers from it - the VCR is
returning as 0x00 (I expect 0x0101) and then I'm getting
 "Bad mode in Error handler detected, code 0xbf000002 -- SError"

My suspicion is that my clock has not been enabled correctly :)

Thanks again for your help
-- 
Regards

Kieran Bingham
