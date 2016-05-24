Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:50779 "EHLO
	relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751937AbcEXH3c (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 24 May 2016 03:29:32 -0400
Received: from relmlac4.idc.renesas.com (relmlac4.idc.renesas.com [10.200.69.24])
	by relmlir3.idc.renesas.com (Postfix) with ESMTP id 1B4364774D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 May 2016 16:29:30 +0900 (JST)
Received: from relmlac4.idc.renesas.com (localhost [127.0.0.1])
	by relmlac4.idc.renesas.com (Postfix) with ESMTP id DECA0480A3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 May 2016 16:29:29 +0900 (JST)
Subject: Re: [PATCH v2 1/3] arm64: dts: r8a7796: Add Renesas R8A7796 SoC
 support
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1463966906-15129-1-git-send-email-horms+renesas@verge.net.au>
 <1463966906-15129-2-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXsu=O13rLysob1Xp+5vWcp7gq6byCffR-6hGc+W-837A@mail.gmail.com>
 <5742B66C.7080102@rvc.renesas.com>
 <CAMuHMdV+atFKJjxcH7RkBCdabsBqk5Y3TTHCPN+sprDaM1xj_w@mail.gmail.com>
CC: Simon Horman <horms+renesas@verge.net.au>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Toru Oishi <toru.oishi.zj@rvc.renesas.com>,
	"Khiem Trong. Nguyen" <khiem.nguyen.xt@rvc.renesas.com>
From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Message-ID: <574402D8.6030400@rvc.renesas.com>
Date: Tue, 24 May 2016 14:29:28 +0700
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV+atFKJjxcH7RkBCdabsBqk5Y3TTHCPN+sprDaM1xj_w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 5/24/2016 1:35 PM, Geert Uytterhoeven wrote:
> Hi Khiem,
>
> On Mon, May 23, 2016 at 9:51 AM, Khiem Nguyen
> <khiem.nguyen.xt@rvc.renesas.com> wrote:
>> Using 1.0 will open Suspend-to-RAM support if secure firmware supports that
>> feature.
>> However, we might need additional work in drivers to support suspend/resume
>> handlers.
>> So, I suggest that we keep using 0.2 until Suspend-to-RAM feature is
>> confirmed in r8a7795/r8a7796.
>
> Note that we do have suspend/resume support on R-Car Gen2, albeit some
> drivers may lack code to save/restore state when their devices are powered
> down, as R-Car Gen2 doesn't have power domains for devices.
>
> So I'd expect everything to work fine, as long as no R-Car Gen3-specific
> drivers or devices residing in multimedia power domains are involved.

In my test environment using latest integration branch in 
renesas-drivers (v4.6), it failed to resume due to operation inside 
rcar_du_pm_resume().
Probably, it should be fixed soon.

FYI, your secure firmware will have Suspend-to-RAM support if below log 
is output.
    psci: PSCIv1.0 detected in firmware.

Thanks.

Best regards,
KHIEM Nguyen
