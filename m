Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:15638 "EHLO
	relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753111AbcEWHvM (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 23 May 2016 03:51:12 -0400
Received: from relmlac3.idc.renesas.com (relmlac3.idc.renesas.com [10.200.69.23])
	by relmlir3.idc.renesas.com (Postfix) with ESMTP id D03853CE92
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2016 16:51:09 +0900 (JST)
Received: from relmlac3.idc.renesas.com (localhost [127.0.0.1])
	by relmlac3.idc.renesas.com (Postfix) with ESMTP id AADE11800A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2016 16:51:09 +0900 (JST)
Subject: Re: [PATCH v2 1/3] arm64: dts: r8a7796: Add Renesas R8A7796 SoC
 support
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Horman <horms+renesas@verge.net.au>
References: <1463966906-15129-1-git-send-email-horms+renesas@verge.net.au>
 <1463966906-15129-2-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXsu=O13rLysob1Xp+5vWcp7gq6byCffR-6hGc+W-837A@mail.gmail.com>
CC: "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Khiem Trong. Nguyen" <khiem.nguyen.xt@rvc.renesas.com>,
	Toru Oishi <toru.oishi.zj@rvc.renesas.com>
From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Message-ID: <5742B66C.7080102@rvc.renesas.com>
Date: Mon, 23 May 2016 14:51:08 +0700
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXsu=O13rLysob1Xp+5vWcp7gq6byCffR-6hGc+W-837A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon, Geert,

On 5/23/2016 2:07 PM, Geert Uytterhoeven wrote:
> On Mon, May 23, 2016 at 3:28 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
>> Basic support for the Gen 3 R-Car M3-W SoC.
>>
>> Based on work for the r8a7795 and r8a7796 SoCs by
>> Takeshi Kihara, Dirk Behme and Geert Uytterhoeven.
>>
>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
>> @@ -0,0 +1,120 @@
>> +       psci {
>> +               compatible = "arm,psci-1.0";
>
> Do we want to use 1.0 on r8a7795, too?

I think we should apply same setting as r8a7795.
i.e compatible = "arm,psci-0.2";

Using 1.0 will open Suspend-to-RAM support if secure firmware supports 
that feature.
However, we might need additional work in drivers to support 
suspend/resume handlers.
So, I suggest that we keep using 0.2 until Suspend-to-RAM feature is 
confirmed in r8a7795/r8a7796.

Best regards,
KHIEM Nguyen
