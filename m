Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: R8A7795 FDP1 clock parentage
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <57456546.5020104@bingham.xyz>
 <87k2iile8n.wl%kuninori.morimoto.gx@renesas.com>
 <5745DC91.6010205@bingham.xyz>
 <87r3cpbsmr.wl%kuninori.morimoto.gx@renesas.com>
 <87y46s9i4i.wl%kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
From: Kieran Bingham <kieran@bingham.xyz>
Message-ID: <574C0EDD.4050101@bingham.xyz>
Date: Mon, 30 May 2016 10:58:53 +0100
MIME-Version: 1.0
In-Reply-To: <87y46s9i4i.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On 30/05/16 07:32, Kuninori Morimoto wrote:
>>> Just to add to this request, could you ask the HW engineers to confirm
>>> the clock parents for the FCPF (0,1,2) as well please?
>>>
>>> They too are currently listed as R8A7795_CLK_S2D1, however now that I am
>>> trying to enable the FCPF and read registers from it - the VCR is
>>> returning as 0x00 (I expect 0x0101) and then I'm getting
>>>  "Bad mode in Error handler detected, code 0xbf000002 -- SError"
>>>
>>> My suspicion is that my clock has not been enabled correctly :)
>>
>> About FCP, I had same request from Laurent, and its answer was this thread.
>>
>> http://thread.gmane.org/gmane.linux.kernel.renesas-soc/662/focus=1304

Thank you for that reference. It was helpful!

>> # I think this "parent clock" settings itself is not super critical
>> # (= it works anyway with wrong settings)
>> # it seems other issues ?

You were right :) - It was the power-domain. It's resolved now and
working. Thank you for your help.

> I got information from HW team.
> About H3 ES1 FDP1 parent clock is "S2D1"

Perfect, thanks for confirming this. Now the patch is unblocked from
submission.

-- 
Regards

Kieran Bingham
