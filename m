Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:41188 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932373AbdK2RA4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 12:00:56 -0500
Received: by mail-lf0-f66.google.com with SMTP id f18so4672135lfg.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Nov 2017 09:00:55 -0800 (PST)
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77970: use CPG core clock
 macros
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <20171128202105.552196002@cogentembedded.com>
 <20171129095558.wvvcvfctwfmtrkq4@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d904863e-e8c9-76ad-9d12-fd36ed68c3b4@cogentembedded.com>
Date: Wed, 29 Nov 2017 20:00:52 +0300
MIME-Version: 1.0
In-Reply-To: <20171129095558.wvvcvfctwfmtrkq4@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/29/2017 12:55 PM, Simon Horman wrote:

>> Now that the commit ecadea00f588 ("dt-bindings: clock: Add R8A77970 CPG
>> core clock definitions") has hit Linus' tree, we  can replace the bare
>> numbers (we had to use to avoid a cross tree dependency) with these macro
>> definitions...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks, applied.

    Not seeing these 2 patches in the today's devel branch tho...

MBR, Sergei
